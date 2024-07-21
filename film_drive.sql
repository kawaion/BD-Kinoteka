USE pet_project

GO

DECLARE @film_name NVARCHAR(100) = 'Драйв'
DECLARE @date DATE = '2011-05-20'
EXEC Add_profile_film @film_name, @date
EXEC Add_price_to_film @film_name, @date, 300

EXEC Add_profile_genre 'криминал'
EXEC Add_profile_genre 'драма'
EXEC Add_profile_genre 'триллер'

EXEC Add_profile_director 'Николас Виндинг Рефн'

EXEC Add_profile_actor 'Райан Гослинг'
EXEC Add_profile_actor 'Кэри Маллиган'
EXEC Add_profile_actor 'Брайан Крэнстон'
EXEC Add_profile_actor 'Альберт Брукс'
EXEC Add_profile_actor 'Оскар Айзек'

EXEC Add_genre_to_film @film_name, @date, 'криминал'
EXEC Add_genre_to_film @film_name, @date, 'драма'
EXEC Add_genre_to_film @film_name, @date, 'триллер'

EXEC Add_director_to_film @film_name, @date, 'Николас Виндинг Рефн'

EXEC Add_actor_to_film @film_name, @date, 'Райан Гослинг'
EXEC Add_actor_to_film @film_name, @date, 'Кэри Маллиган'
EXEC Add_actor_to_film @film_name, @date, 'Брайан Крэнстон'
EXEC Add_actor_to_film @film_name, @date, 'Альберт Брукс'
EXEC Add_actor_to_film @film_name, @date, 'Оскар Айзек'