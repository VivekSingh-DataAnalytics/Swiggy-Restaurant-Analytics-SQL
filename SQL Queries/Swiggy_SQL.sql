--SQl project on swiggy analysis
create database Swiggy_Analysis
use Swiggy_Analysis
---import the data from csv file to sql server
select * from swiggy
----nvarchar to varchar(max)
---samllint to int(conversion)
select count(distinct (city)) as city_count
from swiggy
----how many restaurants are registered for city
select count(distinct (restaurant)) as restaurant_count from swiggy
----avg price overall
select round(avg(price),2) as avg_price from swiggy
----avg price for each restaurant
select restaurant, avg(price) as avg_price from swiggy group by restaurant
--------top 20 highest avg_priced restaurant
select top(20) * from (select restaurant, avg(price) as avg_price from swiggy group by restaurant) a order by avg_price desc
--------count of restaurants in each city
select city, count(distinct restaurant) as citywise_count from swiggy group by city order by citywise_count desc
-----top 5 cities with highest number of restaurants
select top(5) * from(select city, count(restaurant) as citywise_count from swiggy group by city)a order by citywise_count desc
----which city has the highest avg restaurant rating
select top(1) * from(select city, round(avg(avg_ratings),2) as citywise_rating from swiggy group by city)a order by citywise_rating desc
-----top restaurant in each city based on ratings
select city,restaurant,
round(avg(avg_ratings),2) as citywise_rating
from swiggy
group by city, restaurant
order by city, citywise_rating desc
-----top 5 restaurants in each city based on avg ratings
---dense rank/partition by
with cte as
(select
city,
restaurant,
avg_ratings as citywise_rating,
DENSE_RANK() OVER (PARTITION BY city ORDER BY avg_ratings) as dr
from swiggy)
select * from cte where dr<=5
----------which city has the highest avg delivery time
--------top 10 highest rated restaurant with at least 1000 ratings
SELECT restaurant,
avg_ratings,total_ratings from swiggy 
where total_ratings>=1000 
order by total_ratings desc
------top 10 most expensive restaurant 
------top 5 most expensive restaurant in each city
with cte1 as( select restaurant,price, Dense_Rank() over (order by price desc) as dr 
from swiggy),
cte2 as (select restaurant,price, Dense_Rank() over (partition by city order by price desc) as dr from swiggy)
----select * from cte1 where dr<=10
select * from cte2 where dr<=5
------restaurant with highest popularity
------popularity score = (avg_ratings*total_ratings)/1000
select restaurant, 
(avg_ratings*total_ratings)/1000 as popularity_score 
from swiggy 
order by popularity_score desc
-----top 10 most popular restaurant
select top(10)* from(select restaurant, 
(avg_ratings*total_ratings)/1000 as popularity_score 
from swiggy)a
order by popularity_score desc
-----overrated restaurant 
-----high ratings but very low review counts
----avg_ratings>=4 and total_ratings<=100
select restaurant, avg_ratings, total_ratings from swiggy 
where avg_ratings>=4 and total_ratings<=100
---restaurant with highest above avg rating but below avg review count
select restaurant, avg_ratings, total_ratings
from swiggy 
where
avg_ratings>= (select avg(avg_ratings) from swiggy) 
and 
total_ratings< (select avg(total_ratings) from swiggy)
-----underrated above avg rating and above avg review count
select restaurant, avg_ratings, total_ratings from swiggy 
where 
avg_ratings>= (select avg(avg_ratings) from swiggy) 
and 
total_ratings>= (select avg(total_ratings) from swiggy)
----price bands
---<200- budget|200-500 mid-range|>500 premium
select
case when price<=200 then 'budget'
when price <=500 then 'mid range'
else 'premium'
end as price_band,
round(avg(avg_ratings),2) as avg_ratings,
count(*) as restaurant_count
from swiggy
group by
case when price<=200 then 'budget'
when price <=500 then 'mid range'
else 'premium'
end
order by avg_ratings desc
----premium restaurants with poor ratings 
----high priced not meeting expectations
----price>avg price and avg ratings> overall avg ratings
----high demand areas
select city,area, 
sum(total_ratings) as total_review from swiggy
group by city,area 
order by city, total_review desc
-----city contribution to total reviews
with cityview as(
select city, 
sum(total_ratings) reviews from swiggy 
group by city)
select city, reviews,
round(reviews*1.0/sum(reviews) over (),2) as per_con 
from cityview
-----top 20% restaurants by popularity 
with cte1 as(
select *,
NTILE(5) OVER (ORDER BY total_ratings desc) as popularity_group
from swiggy
)select * from cte1 where popularity_group=1