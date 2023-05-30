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
    cursor.execute("SELECT developer FROM games")
    rows = cursor.fetchall()

    for row in rows:
        name = row[0]
        for e in name.split(', '):
            try:
                cursor.execute("INSERT INTO studio (name, st_pu) VALUES (%s, %s)", (e, 'Студия'))
            except:
                pass
        conn.commit()  # Применение изменений
    conn.close()  # Закрытие соединения с базой данных


update_game_links()
