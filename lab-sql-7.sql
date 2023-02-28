-- LAB-SQL-7


-- 1. In the table actor, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
-- These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

USE sakila;

SELECT last_name, count(first_name) AS name_repetition
FROM actor
GROUP BY last_name
HAVING name_repetition = 1;


-- 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once

SELECT last_name, count(first_name) AS name_repetition
FROM actor
GROUP BY last_name
HAVING name_repetition > 1;

-- 3.  Using the rental table, find out how many rentals were processed by each employee.

SELECT staff_id, count(rental_id) as total_rentals
FROM rental
GROUP BY staff_id;

-- OR

SELECT DISTINCT(staff_id), COUNT(rental_id) OVER (PARTITION BY staff_id) AS total_rentings
FROM rental;

-- 4. Using the film table, find out how many films were released each year.

SELECT release_year, count(film_id) as total_films_per_year
FROM film
GROUP by release_year;


-- 5. Using the film table, find out for each rating how many films were there.

SELECT rating, count(film_id) as films_per_rating
FROM film
GROUP by rating;


-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT rating, ROUND(AVG(length), 2) AS mean_length_per_rating
FROM film
GROUP BY rating;


-- 7. Which kind of movies (rating) have a mean duration of more than two hours?

SELECT rating, ROUND(AVG(length), 2) AS mean_length_per_rating
FROM film
GROUP BY rating
HAVING mean_length_per_rating > 120;

-- PG-12 MOVIES have mean duration of more than 2 hours.