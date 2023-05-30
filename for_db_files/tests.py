from bs4 import BeautifulSoup
import requests

def get_game_id(game_name):
    search_url = f"https://store.steampowered.com/search/?term={game_name}"
    response = requests.get(search_url)
    soup = BeautifulSoup(response.text, "html.parser")
    search_result = soup.find("a", class_="search_result_row")

    if search_result:
        game_id = search_result["data-ds-appid"]
        return game_id
    else:
        return None

def get_game_description(game_id):
    game_url = f"https://store.steampowered.com/app/{game_id}?l=russian"
    response = requests.get(game_url)
    soup = BeautifulSoup(response.text, "html.parser")
    game_description = soup.find("div", class_="game_description_snippet")

    if game_description:
        return game_description.text.strip()
    else:
        return None

api_key = "51028B36C0D6D5554A082698806B5C0B"
game_name = "Deus ex human revolution"
print(get_game_description(get_game_id(game_name)))
# description = get_game_description(get_game_id(game_name))
# print(get_game_id(game_name))
# if description:
#     print(description)
# else:
#     print("Ошибка при получении описания игры")

# import requests
# from bs4 import BeautifulSoup
# import difflib
#
# def get_descryption(url):
#     url = 'https://store.steampowered.com/app/374320/?&l=russian'
#     response = requests.get(url)
#     html = response.content
#     soup = BeautifulSoup(html, 'html.parser', from_encoding='utf-8')
#     description = soup.find('div', {'class': 'game_description_snippet'}).text.strip()
#
#     return description
#
#
# api_key = '51028B36C0D6D5554A082698806B5C0B'
#
# game_name = 'Dark Souls III'
#
# # Получение списка всех игр на Steam с их ID и названием
# url = f'http://api.steampowered.com/ISteamApps/GetAppList/v0002/?key={api_key}'
# response = requests.get(url)
# games_list = response.json()['applist']['apps']
#
# # Поиск самого похожего названия игры
# closest_match = difflib.get_close_matches(game_name, [game['name'] for game in games_list], n=1)
# if closest_match:
#     closest_match = closest_match[0]
# else:
#     print(f'Игра "{game_name}" не найдена на Steam.')
#     exit()
#
# # Получение ID игры по её названию
# game_id = None
# for game in games_list:
#     if game['name'] == closest_match:
#         game_id = game['appid']
#         break
#
# # Формирование ссылки на страницу игры
# if game_id:
#     game_url = f'https://store.steampowered.com/app/{game_id}/'
#     print(f'Ссылка на страницу игры "{closest_match}": {game_url}')
# else:
#     print(f'Игра "{closest_match}" не найдена на Steam.')
#
#
#


# game_name = 'Dark Souls III'
#
# url = f'http://api.steampowered.com/ISteamApps/GetAppList/v0002/?key={api_key}'
# response = requests.get(url)
# games_list = response.json()['applist']['apps']
# # Поиск ID игры по её названию
# game_id = None
# for game in games_list:
#     if game['name'] == game_name:
#         game_id = game['appid']
#         break
#
# if game_id:
#     # Получение страницы игры по её ID
#     url = f'https://store.steampowered.com/api/appdetails?appids={game_id}&key={api_key}'
#     response = requests.get(url)
#     game_data = response.json()[str(game_id)]['data']
#     print(f"https://store.steampowered.com/app/{game_id}/")
#     # Вывод страницы игры на экран
