USE pet_project

GO

CREATE TABLE film
(
	id INT PRIMARY KEY IDENTITY,
	name NVARCHAR(50) NOT NULL,
	release_date DATE NOT NULL
		CHECK(release_date > '1900-01-01')
)

GO

CREATE TABLE genre
(
	id INT PRIMARY KEY IDENTITY,
	name NVARCHAR(50) NOT NULL
)

GO

CREATE TABLE actor
(
	   id INT PRIMARY KEY IDENTITY,
	   full_name NVARCHAR(100) NOT NULL
)

GO

CREATE TABLE director
(
	id INT PRIMARY KEY IDENTITY,
	full_name NVARCHAR(100) NOT NULL
)

GO

CREATE TABLE genre_film
(
	film_id INT,
		FOREIGN KEY (film_id) REFERENCES film (id),
	genre_id INT
	    FOREIGN KEY (genre_id) REFERENCES genre (id),
		PRIMARY KEY(film_id,genre_id)
)

GO

CREATE TABLE actor_film
(
	film_id INT
		FOREIGN KEY (film_id) REFERENCES film (id),
	actor_id INT,
	    FOREIGN KEY (actor_id) REFERENCES actor (id),
		PRIMARY KEY(actor_id,film_id)
)

GO

CREATE TABLE film_info
(
	film_id INT PRIMARY KEY,
		FOREIGN KEY (film_id) REFERENCES film (id),
	director_id INT,
		FOREIGN KEY (director_id) REFERENCES director (id),
	price NUMERIC DEFAULT 0 NOT NULL,
	viewing_tally INT DEFAULT 0 NOT NULL
)

GO

CREATE TABLE client
(
	email NVARCHAR(50) PRIMARY KEY,
	name NVARCHAR(50) UNIQUE NOT NULL,
	amount NUMERIC DEFAULT 0 NOT NULL
)

GO

CREATE TABLE client_library
(
	email NVARCHAR(50) NOT NULL,
		FOREIGN KEY (email) REFERENCES client (email),
	film_id INT NOT NULL,
	    FOREIGN KEY (film_id) REFERENCES film (id),
		PRIMARY KEY(email, film_id),
	viewing_status BIT DEFAULT 0 NOT NULL,
		CHECK(viewing_status IN(0, 1))
)