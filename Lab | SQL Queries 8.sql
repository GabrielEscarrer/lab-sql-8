#1 Rank films by length.
select length, title, dense_rank() over (order by length desc) as 'Rank'
from sakila.film;

#2 Rank films by length within the rating category.
select length, rating, title, dense_rank() over (partition by rating order by length desc) as 'Rank'
from sakila.film;

#3 Rank languages by the number of films (as original language). XXXXXXXXXX
select title, language_id, dense_rank() over (partition by title, order by original_language_id desc) as 'Rank'
from sakila.film;
select original_language_id from sakila.film;

#4 Rank categories by the number of films. ## join category table with film_category and count
select fc.category_id, count(f.film_id) as "number of films" from sakila.film_category as fc
join sakila.film as f
on fc.film_id = f.film_id
group by fc.category_id;

#5 Which actor has appeared in the most films?
select actor_id, rank() over (order as actor_id) as 'Rank'
from sakila.film_actor
group by actor_id;
