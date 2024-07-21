USE pet_project

GO

DECLARE @film_name NVARCHAR(100) = 'Одержимость'
DECLARE @date DATE = '2014-01-16'
EXEC Add_profile_film @film_name, @date
EXEC Add_price_to_film @film_name, @date, 300

EXEC Add_profile_genre 'драма'
EXEC Add_profile_genre 'музыка'

EXEC Add_profile_director 'Дэмьен Шазелл'

EXEC Add_profile_actor 'Майлз Теллер'
EXEC Add_profile_actor 'Дж.К. Симмонс'
EXEC Add_profile_actor 'Пол Райзер'
EXEC Add_profile_actor 'Мелисса Бенойст'
EXEC Add_profile_actor 'Остин Стоуэлл'

EXEC Add_genre_to_film @film_name, @date, 'драма'
EXEC Add_genre_to_film @film_name, @date, 'музыка'

EXEC Add_director_to_film @film_name, @date, 'Дэмьен Шазелл'

EXEC Add_actor_to_film @film_name, @date, 'Майлз Теллер'
EXEC Add_actor_to_film @film_name, @date, 'Дж.К. Симмонс'
EXEC Add_actor_to_film @film_name, @date, 'Пол Райзер'
EXEC Add_actor_to_film @film_name, @date, 'Мелисса Бенойст'
EXEC Add_actor_to_film @film_name, @date, 'Остин Стоуэлл'