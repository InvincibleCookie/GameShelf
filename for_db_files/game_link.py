import psycopg2


def update_game_links():
    conn = psycopg2.connect(
        host='localhost',
        port='5432',
        database='Games',
        user='postgres',
        password=''
    )  # Подключение к базе данных PostgreSQL
    cursor = conn.cursor()

    # Выбор всех записей из таблицы games
    cursor.execute("SELECT name FROM games")
    rows = cursor.fetchall()

    for row in rows:
        name = row[0]
        game_link = name.lower().replace(' ', '_')

        # Обновление столбца game_link для каждой записи
        cursor.execute("UPDATE games SET game_link = %s WHERE name = %s", (game_link, name))

    conn.commit()  # Применение изменений
    conn.close()  # Закрытие соединения с базой данных


update_game_links()
