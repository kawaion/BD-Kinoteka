USE pet_project

GO

CREATE PROCEDURE show_number_films_purchased AS
SELECT c.name AS nickname, 
	   COUNT(l.film_id) AS film_count,
	   SUM (f.price) AS waste
FROM client_library AS l
JOIN client AS c ON l.email=c.email
JOIN film_info AS f ON l.film_id = f.film_id
GROUP BY c.name

GO

CREATE PROCEDURE show_clients AS
SELECT *
FROM client

GO 

CREATE PROCEDURE show_film_info AS
SELECT f.name,
	   f.release_date,
	   d.full_name AS director,
	   fi.price,
	   fi.viewing_tally AS view_count
FROM film_info AS fi
JOIN film AS f ON fi.film_id = f.id
JOIN director AS d ON fi.director_id = d.id