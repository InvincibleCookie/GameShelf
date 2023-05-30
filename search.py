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
    cursor.execute(
        "SELECT ru_name, year, user_score FROM games WHERE name ILIKE %s AND name ILIKE %s LIMIT 10",
        (keyword + '%', '%' + keyword + '%',))

    results = cursor.fetchall()  # Получение всех совпадающих имен

    conn.close()  # Закрытие соединения с базой данных

    return results


while True:
    user_input = input("Введите начальные символы: ")
    search_results = search_names(user_input)

    if search_results:
        print("Совпадения:")
        for result in search_results:
            ru_name, year, user_score = result
            print(f"Название (RU): {ru_name}")
            print(f"Год выпуска: {year}")
            print(f"Рейтинг пользователей: {user_score}")
            print()  # Пустая строка для разделения результатов
    else:
        print("Нет совпадений.")
