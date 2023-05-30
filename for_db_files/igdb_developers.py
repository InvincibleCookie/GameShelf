import requests
import json
import pycountry

api_key = 'n3ponsdx31m3qn7vwfcox8ncoy204f'
client_id = 'glk5vevk79idti452c9wbufdwrxqac'


def get_company_info(company_id, api_key, client_id):
    url = f'https://api.igdb.com/v4/companies/{company_id}'
    headers = {
        "Client-ID": f'{client_id}',
        "Authorization": f"Bearer {api_key}"
    }
    params = {
        "fields": "*"
    }

    response = requests.get(url, headers=headers, params=params)
    data = response.json()
    print(data)

    if response.status_code == 200 and data:
        company_info = data[0]
        return company_info

    return None

def get_country_name(country_code):
    try:
        country = pycountry.countries.get(alpha_2=country_code)
        if country:
            return country.name
    except LookupError:
        pass
    return None


# def get_company_id(company_name, api_key, client_id):
#     url = 'https://api.igdb.com/v4/companies'
#     headers = {
#         "Client-ID": f'{client_id}',
#         "Authorization": f"Bearer {api_key}"
#     }
#     params = {
#         "fields": "id",
#         "search": company_name
#     }
#
#     response = requests.get(url, headers=headers, params=params)
#     data = response.json()
#     print(data)
#
# get_company_id('Nintendo', api_key, client_id)

company_info = get_company_info(2, api_key, client_id)

if company_info:
    print("Информация о компании:")
    print("Название:", company_info.get("name"))
    print("Описание:", company_info.get("description"))
    print("Страна:",  company_info.get("country"))
    print("Дата основания:", company_info.get("start_date"))
    print("Сайт:", company_info.get("url"))
    # Другие поля, которые требуются, могут быть добавлены здесь
else:
    print("Информация о компании не найдена.")
