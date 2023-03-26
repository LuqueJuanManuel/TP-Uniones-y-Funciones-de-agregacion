/* TP - Uniones y funciones de Agregacion */
/* Micro Desafio 1 */

/* Nombre de las series y titulo de los generos */
select series.title, genres.name 
from series 
left join genres on series.genre_id = genres.id;

/* Titulos de los Episodios y nombre y apellido de los actores que trabajan en cada episodio */
select episodes.title, concat(actors.first_name, ' ', actors.last_name) as 'Nombre y Apellido'
from actor_episode 
left join actors on actor_episode.actor_id  = actors.id 
left join episodes on actor_episode.episode_id  = episodes.id;

/* Micro Desafio 2 */

/* Nombre y Apellido de los actores que trabajaron el la guerra de las galxias
 * pero que se muestre una sola vez cada actor
 */ 
select title  from movies;

select distinct concat(actors.first_name, ' ', actors.last_name) as 'Nombre y Apellido', movies.title 
from actors
inner join actor_movie on actor_movie.actor_id = actors.id 
inner join movies on movies.id = actor_movie.movie_id 
where movies.title like '%Guerra de las galaxias%';

/* Micro desafio 3 */
 /* Listar los titulos de cada pelicula con su genero correspondiente
  * en caso de no tener genero mostrar: 'No tiene genero' */

select movies.title, coalesce(genres.name, 'No tiene genero' )  from movies
left join genres on movies.genre_id = genres.id;

/* Micro desafio 4 */
/* Listar las Series y la cantidad de dias desde su estreno hasta su fin 
 * mostrando en la columna de dias el nombre: 'Duracion' */

select title, datediff(end_date, release_date) as 'Duracion'  from series;

/* Micro Desafio 5 */

/* Listar los actores ordenados alfabéticamente cuyo nombre sea mayor a 6 caracteres. */
select first_name  from actors 
where length(first_name) > 6
order by first_name;


/* Debemos mostrar la cantidad total de los episodios guardados en la base de datos. */
select count(id) from movies_db.episodes;

/* obtengamos el título de todas las series y el total de temporadas que tiene cada una de ellas. */
select series.title, count(seasons.title) from series
inner join seasons on seasons.serie_id = series.id
group by title;


/* Mostrar, por cada género, la cantidad total de películas que posee, siempre que sea mayor
o igual a 3. */
select name, count(movies.title) from genres
inner join movies on movies.genre_id = genres.id 
group by genres.name
having count(movies.title) > 3;




 