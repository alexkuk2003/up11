/* 
   SQL-скрипт для реализации БД BobbyHost в SQLite.
   Соответствует заданию 1 из УП.11
*/

-- 1. Реализация структуры (20 баллов)
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS sites (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    domain TEXT NOT NULL UNIQUE,
    site_name TEXT NOT NULL,
    label_1 TEXT, label_2 TEXT, label_3 TEXT, label_4 TEXT,
    text_main TEXT, text_about TEXT, text_portfolio TEXT, text_services TEXT,
    phone TEXT, email_contact TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS site_pages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    site_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    slug TEXT NOT NULL,
    content TEXT,
    FOREIGN KEY (site_id) REFERENCES sites(id) ON DELETE CASCADE
);

-- 2. Заполнение данными (Seed)
INSERT INTO users (email, password) VALUES ('student@bobbyhost.ru', 'pass123');

INSERT INTO sites (user_id, domain, site_name, label_1, label_2, label_3, label_4, text_main, text_about, phone, email_contact)
VALUES (1, 'my-portfolio', 'Ivanov Design', 'О нас', 'Работы', 'Цены', 'Связь', 'Добро пожаловать', 'Мы лучшие', '+7900', 'ivan@mail.ru');

INSERT INTO site_pages (site_id, title, slug, content) VALUES 
(1, 'Отзывы', 'reviews', 'Клиенты довольны.');

-- 3. Выполнение обязательных запросов (25 баллов)

-- Запрос 1: SELECT с условием
SELECT domain FROM sites WHERE user_id = 1;

-- Запрос 2: INSERT
INSERT INTO users (email, password) VALUES ('new_user@mail.ru', 'safe_pass');

-- Запрос 3: UPDATE
UPDATE sites SET site_name = 'New Business Name' WHERE id = 1;

-- Запрос 4: DELETE
DELETE FROM site_pages WHERE slug = 'reviews';

-- Запрос 5: SELECT с JOIN
SELECT s.domain, p.title 
FROM sites s
JOIN site_pages p ON s.id = p.site_id;
