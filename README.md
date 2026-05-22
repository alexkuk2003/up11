Проектирование структуры БД «BobbyHost»
Соответствует работающему проекту BobbyHost задания 3 в дипломной работе: https://github.com/alexkuk2003/up02

1. Таблица users: Хранит данные для авторизации.
  •  id (INTEGER, PK): Уникальный идентификатор.
  •  email (TEXT, UNIQUE): Логин.
  •  password (TEXT): Пароль.
2. Таблица sites: Хранит параметры конструктора (соответствует полям generator.html).
  •  id (INTEGER, PK): Уникальный идентификатор сайта.
  •  user_id (INTEGER, FK): Ссылка на владельца.
  •  domain (TEXT, UNIQUE): Имя проекта.
  •  site_name, label_1...text_services, phone, email_contact (TEXT): Данные контента.
3. Таблица site_pages: Хранит дополнительные страницы, созданные динамически.
  •  id (INTEGER, PK): Идентификатор страницы.
  •  site_id (INTEGER, FK): Ссылка на родительский сайт.
  •  title, slug, content (TEXT): Данные страницы.

Описание связей:
users — sites: Связь 1:M (Один-ко-многим). Один пользователь может создать множество сайтов. При удалении пользователя удаляются все его сайты (ON DELETE CASCADE).
sites — site_pages: Связь 1:M (Один-ко-многим). Один сайт может содержать несколько дополнительных страниц.

ER-диаграмма (Mermaid):
erDiagram
    USERS ||--o{ SITES : "1:M (manages)"
    SITES ||--o{ SITE_PAGES : "1:M (contains)"
