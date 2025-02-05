CREATE DATABASE IF NOT EXISTS gifs_db;

USE gifs_db;

CREATE TABLE IF NOT EXISTS gifs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    url VARCHAR(255) NOT NULL
);

INSERT INTO gifs (url) VALUES
('https://media.giphy.com/media/3o7TKU8RvQuomFfUUU/giphy.gif'),
('https://media.giphy.com/media/26AHONQ79FdWZhAI0/giphy.gif'),
('https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExYzBwOGM5YmQydWkxNmt5dDlrNWY0Mm5jd2F6bHZ3YWJrbWY3a3ZxNCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/CjmvTCZf2U3p09Cn0h/giphy.gif'),
('https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExeWU5aXZueXQ4dWRmc2d4dWI1bWtzbXd6OG9nZXpoYm4wdmVrYThwZyZlcD12MV9naWZzX3NlYXJjaCZjdD1n/26gssIytJvy1b1THO/giphy.gif'),
('https://media.giphy.com/media/pT1dcZcJfhQZy/giphy.gif?cid=790b7611ye9ivnyt8udfsgxub5mksmwz8ogezhbn0veka8pg&ep=v1_gifs_search&rid=giphy.gif&ct=g'),
('https://media.giphy.com/media/yoJC2GnSClbPOkV0eA/giphy.gif?cid=790b7611p98ac172f00twkphwh0sv9ot05n9dsnmohj8remq&ep=v1_gifs_trending&rid=giphy.gif&ct=g'),
('https://media.giphy.com/media/Z5xk7fGO5FjjTElnpT/giphy.gif?cid=790b7611ew5r5sg9hvp9k0ngqjn4f1ncq1hfmqjy9t0ecbq7&ep=v1_gifs_search&rid=giphy.gif&ct=g'),
('https://media.giphy.com/media/l0Exk8EUzSLsrErEQ/giphy.gif');
