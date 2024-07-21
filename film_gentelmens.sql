USE pet_project

GO

DECLARE @film_name NVARCHAR(100) = 'Джентльмены'
DECLARE @date DATE = '2019-12-03'
EXEC Add_profile_film @film_name, @date
EXEC Add_price_to_film @film_name, @date, 200

EXEC Add_profile_genre 'криминал'
EXEC Add_profile_genre 'комедия'
EXEC Add_profile_genre 'боевик'

EXEC Add_profile_director 'Гай Ричи'

EXEC Add_profile_actor 'Мэттью Макконахи'
EXEC Add_profile_actor 'Чарли Ханнэм'
EXEC Add_profile_actor 'Генри Голдинг'
EXEC Add_profile_actor 'Хью Грант'
EXEC Add_profile_actor 'Мишель Докери'

EXEC Add_genre_to_film @film_name, @date, 'криминал'
EXEC Add_genre_to_film @film_name, @date, 'комедия'
EXEC Add_genre_to_film @film_name, @date, 'боевик'

EXEC Add_director_to_film @film_name, @date, 'Гай Ричи'

EXEC Add_actor_to_film @film_name, @date, 'Мэттью Макконахи'
EXEC Add_actor_to_film @film_name, @date, 'Чарли Ханнэм'
EXEC Add_actor_to_film @film_name, @date, 'Генри Голдинг'
EXEC Add_actor_to_film @film_name, @date, 'Хью Грант'
EXEC Add_actor_to_film @film_name, @date, 'Мишель Докери'




