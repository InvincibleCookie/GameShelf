import requests

# задаем параметры запроса
base_url = "https://api.rawg.io/api/games"
query_params = {
    "key": "a4d33c937e414d4aa79a114fb182499d",
    "dates": "2012-01-01,2014-12-31",  # диапазон дат от 2015 до 2020 года
    "ordering": "-metacritic",  # сортировка по убыванию рейтинга
    "page_size": 40  # количество игр на странице
}

headers = {
    'x-rapidapi-key': "d03fbd285amsh51cd71d6e415a94p18df93jsn05c82ea2898d",
    'x-rapidapi-host': "rawg-video-games-database.p.rapidapi.com"

}
# отправляем запрос и получаем ответ
response = requests.get(base_url, params=query_params)


# проверяем, что запрос успешен

def get_games():
    games_list = []
    if response.status_code == 200:
        # получаем данные об играх из ответа
        games_data = response.json().get("results", [])

        # выводим информацию об играх
        for game_data in games_data:
            try:
                name = game_data['name']
                year = game_data['released'][:4]
                platforms = ', '.join(platform['platform']['name'] for platform in game_data['platforms'])
                genres = ', '.join(genre['name'] for genre in game_data['genres'])
                developers = ', '.join(developer['name'] for developer in requests.request("GET",
                                                                                           f"https://api.rawg.io/api/games/{game_data['slug']}?key=a4d33c937e414d4aa79a114fb182499d",
                                                                                           headers=headers).json()[
                    "developers"])
                publishers = ', '.join(publisher['name'] for publisher in requests.request("GET",
                                                                                           f"https://api.rawg.io/api/games/{game_data['slug']}?key=a4d33c937e414d4aa79a114fb182499d",
                                                                                           headers=headers).json()[
                    "publishers"])
                metascore = game_data['metacritic']
                games_list.append({'name': name, 'year': year, 'platform': platforms, 'genre': genres,
                                   'developer': developers, 'publisher': publishers, 'metacritic_score': metascore})
            except:
                pass
        return games_list
    else:
        return None
