import requests
import json

api_key = 'n3ponsdx31m3qn7vwfcox8ncoy204f'
client_id = 'hcmni147w7rxmn1h1amot481zmeitv'


def get_cover(game_id, api_key, client_id):
    url = 'https://api.igdb.com/v4/covers'
    payload = f"fields url; where game={game_id};"
    headers = {
        "Client-ID": f'{client_id}',
        "Authorization": f"Bearer {api_key}"
    }

    responce = requests.post(url, data=payload, headers=headers)
    return json.loads(responce.text)[0]['url']


def get_game_id(game_name, api_key, client_id):
    # Задаем параметры для запроса
    headers = {
        "Client-ID": f'{client_id}',
        "Authorization": f"Bearer {api_key}"
    }
    params = {
        "search": game_name,
        "fields": "id",
        "limit": 1
    }
    # Отправляем запрос на сервер
    response = requests.get("https://api.igdb.com/v4/games", headers=headers, params=params)
    # Обрабатываем ответ сервера
    if response.status_code == 200:
        data = response.json()
        if len(data) > 0:
            game_id = data[0]["id"]
            return game_id
    return None

print(get_game_id("the-witcher-3-wild-hunt", api_key, client_id))