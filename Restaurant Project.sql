select * from restaurant limit 10;
-- 1)HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?
select count(distinct(restaurant_name)) as "rating > 4.5" from restaurant where rating >4.5;
-- 2)WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
select city,count(distinct restaurant_name) as no_restaurants from restaurant
group by city order by no_restaurants desc limit 1;
-- 3)HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?
select count(distinct restaurant_name) Restaurant_with_name_pizza from restaurant where restaurant_name like "%pizza%";
-- 4)WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?
select distinct(cuisine),count(*) as most from restaurant
group by cuisine order by most desc limit 1;
-- 5)WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?
select city,avg(rating) as avg_rating from restaurant
group by city;
-- 6)WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU CATEGORY FOR EACH RESTAURANT?
select restaurant_name,max(price) as highest_price from restaurant 
where menu_category = "RECOMMENDED"group by restaurant_name order by highest_price desc ;
-- 7)FIND TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE
select distinct restaurant_name,cost_per_person from restaurant 
where cuisine <> "indian"
order by cost_per_person desc limit 5;
-- 8)FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER.
select distinct restaurant_name,cost_per_person from restaurant where cost_per_person>
(select avg(cost_per_person) from restaurant);

-- 9)RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARE LOCATED IN DIFFERENT CITIES.
select distinct t1.restaurant_name,t1.city,t2.city from restaurant t1 join restaurant t2
on t1.restaurant_name = t2.restaurant_name and t1.city<>t2.city;
-- 10) WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' CATEGORY?
select distinct restaurant_name,count(item) as main_course from restaurant
where menu_category = "main course"
group by restaurant_name order by main_course desc limit 1;
-- 11) LIST THE NAMES OF RESTAURANTS THAT ARE 100% VEGEATARIAN IN ALPHABETICAL ORDER OF RESTAURANT NAME.
select distinct restaurant_name, (COUNT(CASE WHEN veg_or_nonveg = 'veg' THEN 1 END) * 100.0) / COUNT(*) as percentage from restaurant
 group by  restaurant_name having percentage = 100.00 order by restaurant_name ;
 -- or 
 select distinct restaurant_name from restaurant where veg_or_nonveg = 'veg' order by restaurant_name;

-- 12)WHICH IS THE RESTAURANT PROVIDING THE LOWEST AVERAGE PRICE FOR ALL ITEMS? 
select restaurant_name,round(avg(price),2) as avg_price from restaurant
group by restaurant_name order by avg_price asc limit 1; 

-- 13) WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?
select restaurant_name,count(distinct menu_category) as main_course from restaurant
group by restaurant_name order by main_course desc limit 5;

-- 14) WHICH RESTAURANT PROVIDES THE HIGHEST PERCENTAGE OF NON-VEGEATARIAN FOOD?
select restaurant_name, (COUNT(CASE WHEN veg_or_nonveg = 'non-veg' THEN 1 END) * 100.0) / COUNT(*) as percentage from restaurant
 group by  restaurant_name  order by percentage desc limit 1;
