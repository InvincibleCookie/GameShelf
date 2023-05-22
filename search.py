import psycopg2


def search_names(keyword):
    conn = psycopg2.connect(
        host='localhost',
        port='5432',
        database='Games',
        user='postgres',
        password=''
    )  # Подключение к базе данных PostgreSQL
    cursor = conn.cursor()

    # Выполнение SQL-запроса для поиска совпадающих имен
    cursor.execute("SELECT name FROM games WHERE name ILIKE %s", ('%' + keyword + '%',))

    results = cursor.fetchall()  # Получение всех совпадающих имен

    conn.close()  # Закрытие соединения с базой данных

    return (results)


while True:
    user_input = input("Введите ключевое слово: ")
    search_results = search_names(user_input)

    if search_results:
        print("Совпадения:")
        for result in search_results:
            print(result[0])
    else:
        print("Нет совпадений.")
