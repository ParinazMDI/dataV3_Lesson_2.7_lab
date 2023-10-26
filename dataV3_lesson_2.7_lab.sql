-- 1
USE sakila;
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT c.name AS category, COUNT(f.film_id) AS film_number
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

-- 2
SELECT staff.staff_id,sum(payment.amount)
FROM staff
JOIN payment
where payment.payment_date LIKE "2005-08%"
Group by payment.staff_id ;

-- 3
SELECT a.actor_id,
CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
COUNT(fa.film_id) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, actor_name
ORDER BY film_count DESC
LIMIT 1;

-- 4
SELECT customer.customer_id , COUNT(rental.rental_id) 
FROM customer 
JOIN rental 
USING(customer_id)
GROUP BY customer_id
ORDER BY COUNT(rental.rental_id)  DESC
LIMIT 1;

-- 5
SELECT concat(s.first_name,' ',s.last_name) AS staff_name , address
FROM staff s
JOIN address a
USING(address_id)
GROUP BY staff_name;

-- 6
SELECT film.title , COUNT(film_actor.actor_id) 
FROM film
JOIN film_actor 
USING(film_id)
GROUP BY film.film_id
ORDER BY film.title;

-- 7
SELECT concat(customer.first_name,' ',customer.last_name) AS customer_name , SUM(payment.amount)
FROM customer
JOIN payment
USING (customer_id)
GROUP BY customer_name
ORDER BY customer.last_name ASC;

-- 8 
SELECT film.title , film_category.category_id
FROM film
JOIN film_category
USING (film_id)
GROUP BY film.title;



