SELECT COUNT(*) AS total_players FROM players;
SELECT AVG(rating) AS average_rating FROM players;
SELECT MIN(rating) AS min_rating, MAX(rating) AS max_rating FROM players;
SELECT category, COUNT(*) AS referees_count FROM referees GROUP BY category;
SELECT m.match_id, m.stage, r.first_name, r.last_name
FROM matches m
INNER JOIN referees r ON m.referee_id = r.referee_id;
SELECT p.first_name, p.last_name, tr.payment_status
FROM players p
LEFT JOIN tournament_registrations tr ON p.player_id = tr.player_id;
SELECT t.table_number, t.brand, m.stage
FROM matches m
RIGHT JOIN tennis_tables t ON m.table_id = t.table_id;
SELECT first_name, last_name, rating
FROM players
WHERE rating > (SELECT AVG(rating) FROM players);
SELECT name
FROM tournaments
WHERE tournament_id IN (SELECT tournament_id FROM matches WHERE stage = 'Фінал');
SELECT first_name, last_name, (SELECT COUNT(*) FROM tournament_registrations) AS total_system_registrations
FROM players;