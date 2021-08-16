-- major datetime fucntionalities of postgresql 
-- example date timestamp column 
select rental_date from rental;

-- age - determines the difference between two timestamps 
select age(rental_date) from rental;

-- curent date 
select current_date;

-- extracting differnt elements from timestamp  using extract() function 
select extract(DAY from  rental_date) from rental;

-- similarly we can extract many other elements from a timestamp data 
    -- century 
    -- decade 
    -- dow ( day of the week where sumday represents 0)
    -- doy (day of the year start from 0 to 365) 
    -- hour 
    -- minute 
    -- week 
    -- month 
    -- second 
    -- year 
    -- 

-- postgres provides a number of functions that returns values related to the current date and time 
    -- current_date
    -- current_time 
    -- current_timestamp 
    -- current_time
    -- localtime 
    -- local timestamp 

select localtime;
select current_time;
select CURRENT_TIMESTAMP;


