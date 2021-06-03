use sakila;

-- 1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312?
-- Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

select c.first_name, c.last_name, c.email, ad.address from customer c
join address ad on  c.address_id = ad.address_id
where ad.city_id =312;


-- 2. ¿Qué consulta harías para obtener todas las películas de comedia? 
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, 
-- la calificación, las características especiales y el género (categoría).

-- select * from category where category_id =5;
-- select * from film_category where category_id=5;

select f.title, f.description, f.release_year, f.rating, f.special_features, c.name genero
from film_category fc
join film f on fc.film_id = f.film_id
join category c on c.category_id = fc.category_id
where c.category_id =5;

-- 3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5?
-- Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película,
-- la descripción y el año de lanzamiento.

-- select * from actor where actor_id =5;
-- select * from film_actor where actor_id=5;

select a.actor_id, a.first_name nombre_actor, f.title, f.description,f.release_year
from film_actor fa
join actor a on fa.actor_id = a.actor_id
join film f on fa.film_id = f.film_id
where a.actor_id =5;

-- 4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y
-- dentro de estas ciudades (1, 42, 312 y 459)? Su consulta debe devolver el nombre,
-- apellido, correo electrónico y dirección del cliente.

-- select * from store where store_id =1;
-- select * from city where city_id in (1, 42, 312, 459);

select cu.first_name, cu.last_name, cu.email, a.address
from address a
join city c on a.city_id = c.city_id
join customer cu on a.address_id = cu.address_id
join store s on cu.store_id = s.store_id
where s.store_id =1 and c.city_id in (1, 42, 312, 459);

-- 5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica
-- especial = detrás de escena", unidas por actor_id = 15?
-- Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento,
-- la calificación y la función especial. Sugerencia: puede usar la función LIKE para obtener la parte
-- 'detrás de escena'.

-- select * from film where rating ='G' and special_features Like'%Behind the Scenes%';
-- select * from actor where actor_id = 15;

select f.title, f.description, f.release_year, f.rating, f.special_features
from film f
join film_actor fa on f.film_id = fa.film_id
join actor a on fa.actor_id = a.actor_id
where rating ='G' and special_features Like'%Behind the Scenes%' and a.actor_id = 15;

-- 6 ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? 
-- Su consulta debe devolver film_id, title, actor_id y actor_name.

select f.film_id, f.title, a.actor_id, concat(a.first_name, ' ', a.last_name) name_actor
from film f
join film_actor fa on f.film_id = fa.film_id
join actor a on fa.actor_id = a.actor_id
where f.film_id = 369;

-- 7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler sales_by_storede 2.99?
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación,
-- las características especiales y el género (categoría).

-- select * from film where rental_rate = 2.99;

select f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, c.name, f.rental_rate
from film_category fc
join film f on fc.film_id = f.film_id
join category c on c.category_id = fc.category_id
where f.rental_rate = 2.99 and c.name = 'Drama';
    
-- 8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER?
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación,
-- las características especiales, el género (categoría) y el nombre y apellido del actor.
-- select * from actor where first_name Like'%SANDRA' and last_name Like'%KILMER';

select f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, c.name genero, concat(a.first_name, ' ', a.last_name) name_actor
from category c
join film_category fc on c.category_id = fc.category_id
join film f on fc.film_id = f.film_id
join film_actor fa on f.film_id = fa.film_id
join actor a on fa.actor_id = a.actor_id
where a.first_name Like'%SANDRA' and a.last_name Like'%KILMER' and c.name = 'action';
