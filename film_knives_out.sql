USE pet_project

GO

DECLARE @film_name NVARCHAR(100) = 'Достать ножи'
DECLARE @date DATE = '2019-09-07'
EXEC Add_profile_film @film_name, @date
EXEC Add_price_to_film @film_name, @date, 0

EXEC Add_profile_genre 'детектив'
EXEC Add_profile_genre 'комедия'
EXEC Add_profile_genre 'драма'
EXEC Add_profile_genre 'криминал'

EXEC Add_profile_director 'Райан Джонсон'

EXEC Add_profile_actor 'Дэниэл Крэйг'
EXEC Add_profile_actor 'Ана де Армас'
EXEC Add_profile_actor 'Крис Эванс'
EXEC Add_profile_actor 'Джейми Ли Кёртис'
EXEC Add_profile_actor 'Майкл Шеннон'

EXEC Add_genre_to_film @film_name, @date, 'детектив'
EXEC Add_genre_to_film @film_name, @date, 'комедия'
EXEC Add_genre_to_film @film_name, @date, 'драма'
EXEC Add_genre_to_film @film_name, @date, 'криминал'

EXEC Add_director_to_film @film_name, @date, 'Райан Джонсон'

EXEC Add_actor_to_film @film_name, @date, 'Дэниэл Крэйг'
EXEC Add_actor_to_film @film_name, @date, 'Ана де Армас'
EXEC Add_actor_to_film @film_name, @date, 'Крис Эванс'
EXEC Add_actor_to_film @film_name, @date, 'Джейми Ли Кёртис'
EXEC Add_actor_to_film @film_name, @date, 'Майкл Шеннон'