from wikidata import client

def get_developer_info(company_name):
    # Создание клиента Wikidata
    wikidata_client = client.Client()

    # Поиск сущностей студий разработчиков по названию
    results = wikidata_client.search(company_name)

    if results:
        entity = results[0]
        description = entity.description
        country = entity.country_of_origin[0].name if entity.country_of_origin else None
        year_founded = entity.inception[0].date.year if entity.inception else None

        if country and year_founded:
            return f"Студия: {description}, Страна: {country}, Год основания: {year_founded}"
        else:
            return "Не удалось получить информацию о стране и годе основания компании."
    else:
        return "Студия разработчика не найдена."

# Пример использования
company_name = input("Введите название студии разработчика: ")
info = get_developer_info(company_name)
print(info)
