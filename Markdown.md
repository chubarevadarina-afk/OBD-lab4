SELECT COUNT(*) AS total_players FROM players;
Цей запит рахує загальну кількість гравців, які збережені в базі даних за допомогою функції COUNT.
SELECT AVG(rating) AS average_rating FROM players;
А цей запит обчислює середній рейтинг серед усіх тенісистів у таблиці players за допомогою функції AVG.
SELECT MIN(rating) AS min_rating, MAX(rating) AS max_rating FROM players;
Тут я знайшла мінімальний та максимальний показники рейтингу серед усіх гравців.
SELECT category, COUNT(*) AS referees_count 
FROM referees 
GROUP BY category 
HAVING COUNT(*) = 1;
Тут я згрупувала суддів за категоріями і за допомогою HAVING відфільтрувала лише ті категорії, де є рівно один зареєстрований суддя.
SELECT r.first_name, r.last_name, COUNT(m.match_id) AS total_matches
FROM referees r
INNER JOIN matches m ON r.referee_id = m.referee_id
GROUP BY r.first_name, r.last_name;
Тут я об'єднала таблиці суддів та матчів за допомогою INNER JOIN, а потім згрупувала результати за іменем та прізвищем судді. Завдяки агрегатній функції COUNT запит рахує, скільки саме матчів обслуговував кожен суддя в системі. Це приклад багатотабличної агрегації.
SELECT p.first_name, p.last_name, tr.payment_status
FROM players p
LEFT JOIN tournament_registrations tr ON p.player_id = tr.player_id;
Він показує імена всіх гравців з бази та їхній статус оплати турніру. Навіть якщо гравець ще нікуди не зареєструвався, він все одно виведеться в результатах, так сталось з Карлосом.
SELECT t.table_number, t.brand, m.stage
FROM matches m
RIGHT JOIN tennis_tables t ON m.table_id = t.table_id;
А цей виводить номер столу, його бренд та етап матчу. Завдяки RIGHT JOIN ми точно побачимо в списку всі наявні столи, навіть ті, на яких ще не проводилися ігри.
SELECT first_name, last_name, rating
FROM players
WHERE rating > (SELECT AVG(rating) FROM players);
Запит виводить імена та рейтинг тих гравців, у яких рейтинг вищий за середній показник по всій базі, за допомогою WHERE.
SELECT name
FROM tournaments
WHERE tournament_id IN (SELECT tournament_id FROM matches WHERE stage = 'Фінал');
Тут шукає назви турнірів, у яких проводився етап "Фінал". Спочатку підзапит знаходить ID таких турнірів у таблиці матчів, а потім основний запит виводить їхні назви за допомогою оператора IN.
SELECT first_name, last_name, (SELECT COUNT(*) FROM tournament_registrations) AS total_system_registrations
FROM players;
Виводяться імена та прізвища всіх гравців, а поруч у додатковому стовпці показує загальну кількість реєстрацій на турніри в усій системі, за допомогою підзапиту прямо в блоці SELECT.
