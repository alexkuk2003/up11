Отчет:
Проектирование структуры БД «BobbyHost»
Соответствует работающему проекту BobbyHost задания 3 в дипломной работе: https://github.com/alexkuk2003/up02

1. Таблица users: хранит данные для авторизации.

id (INTEGER, PK): уникальный идентификатор.
 
  email (TEXT, UNIQUE): логин.
 
  password (TEXT): пароль.
  
2. Таблица sites: хранит параметры конструктора (соответствует полям generator.html).

  id (INTEGER, PK): уникальный идентификатор сайта.
  
  user_id (INTEGER, FK): ссылка на владельца.
  
  domain (TEXT, UNIQUE): имя проекта.
  
  site_name, label_1...text_services, phone, email_contact (TEXT): данные контента.
  
3. Таблица site_pages: хранит дополнительные страницы, созданные динамически.

  id (INTEGER, PK): идентификатор страницы.
  
  site_id (INTEGER, FK): ссылка на родительский сайт.
  
  title, slug, content (TEXT): данные страницы.

Описание связей:

users — sites: связь 1:M (один-ко-многим). 

Один пользователь может создать множество сайтов. При удалении пользователя удаляются все его сайты (ON DELETE CASCADE).

sites — site_pages: связь 1:M (Один-ко-многим). Один сайт может содержать несколько дополнительных страниц.

ER-диаграмма (Mermaid):

erDiagram

    USERS ||--o{ SITES : "1:M (manages)"
	
    SITES ||--o{ SITE_PAGES : "1:M (contains)"
