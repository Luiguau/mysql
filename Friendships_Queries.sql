-- Consultas
-- 1. Escribe una consulta SQL que devuelva una lista de usuarios junto con los nombres de sus amigos.
SELECT users.first_name, users.last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name 
FROM users
LEFT JOIN friendships ON users.id=friendships.user_id
JOIN users AS user2 ON friendships.friend_id=user2.id;

-- 2. Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.
SELECT user2.first_name, user2.last_name, users.first_name AS friend_first_name, users.last_name AS friend_last_name 
FROM users
LEFT JOIN friendships ON users.id=friendships.user_id
JOIN users AS user2 ON friendships.friend_id=user2.id
WHERE user2.first_name='Kermit';

-- 3. Devuelve el recuento de todas las amistades.
SELECT COUNT(*) AS cant_amistades FROM friendships;

-- 4. Descubre quién tiene más amigos y devuelve el recuento de sus amigos.
SELECT users.first_name, users.last_name, COUNT(user2.first_name) AS count_friends
FROM users
LEFT JOIN friendships ON users.id=friendships.user_id
JOIN users AS user2 ON friendships.friend_id=user2.id
GROUP BY users.first_name
ORDER BY count_friends DESC;

-- 5. Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.
INSERT INTO users (first_name, last_name, created_at) VALUES ('Pepe', 'Toño', NOW());
INSERT INTO friendships (user_id, friend_id, created_at) VALUES (6, 2, NOW()),(6, 4, NOW()),(6, 5, NOW());

-- 6. Devuelve a los amigos de Eli en orden alfabético.
SELECT users.first_name, users.last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name 
FROM users
LEFT JOIN friendships ON users.id=friendships.user_id
JOIN users AS user2 ON friendships.friend_id=user2.id
WHERE users.first_name='Eli'
ORDER BY user2.first_name;

-- 7. Eliminar a Marky Mark de los amigos de Eli.
DELETE FROM friendships WHERE user_id=2 AND friend_id=5;

-- 8. Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos
SELECT CONCAT(users.first_name," ",users.last_name) as "User", CONCAT(user2.first_name, " ", user2.last_name) as "Friend" 
FROM users
LEFT JOIN friendships ON users.id=friendships.user_id
JOIN users AS user2 ON friendships.friend_id=user2.id;