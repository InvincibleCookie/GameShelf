import requests
url = "https://rawg-video-games-database.p.rapidapi.com/creators/marcin-przybylowicz?key=a4d33c937e414d4aa79a114fb182499d"
headers = {
'x-rapidapi-key': "d03fbd285amsh51cd71d6e415a94p18df93jsn05c82ea2898d",
'x-rapidapi-host': "rawg-video-games-database.p.rapidapi.com"
}
response = requests.request("GET", url, headers=headers)
print(response.text)

# import requests
#
# # Введите ваш API ключ здесь
# API_KEY = "a4d33c937e414d4aa79a114fb182499d"
#
# ## URL для запроса информации о The Witcher 3: Wild Hunt
# url = f"https://api.rawg.io/api/games/the-witcher-3-wild-hunt?platforms=18&key={API_KEY}"
#
# # Отправка GET-запроса к API RAWG
# response = requests.get(url)
#
# # Проверяем, что ответ сервера успешный (код 200)
# if response.status_code == 200:
#     # Получаем информацию о игре в формате JSON
#     data = response.json()
#
#     # Получаем ссылку на страницу игры
#     game_url = data["reddit_url"]
#     # Извлекаем ID игры из ссылки
#     game_id = game_url.split("/")[-1]
#
#     # URL для запроса информации о разработчиках игры
#     developers_url = f"https://api.rawg.io/api/games/{game_id}/development-team?key={API_KEY}"
#
#     # Отправка GET-запроса к API RAWG
#     developers_response = requests.get(developers_url)
#
#     # Проверяем, что ответ сервера успешный (код 200)
#     if developers_response.status_code == 200:
#         # Получаем информацию о разработчиках игры в формате JSON
#         developers_data = developers_response.json()
#
#         # Получаем список имен разработчиков
#         developers = [dev["name"] for dev in developers_data]
#
#         # Выводим имена разработчиков
#         print("Имена разработчиков:")
#         for developer in developers:
#             print(developer)
#     else:
#         # Если ответ сервера не успешный, выводим сообщение об ошибке
#         print("Ошибка при запросе к API RAWG:", developers_response.status_code)
# else:
#     # Если ответ сервера не успешный, выводим сообщение об ошибке
#     print("Ошибка при запросе к API RAWG:", response.status_code)