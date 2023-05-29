import requests
from bs4 import BeautifulSoup
import re

def get_developer_name(soup, role, role_mn):
    try:
        # Нахождение блока с информацией о разработчике (В role мы передаем его роль) игры
        block = soup.find("th", string=role).parent

        # Нахождение списка разработчиков игры (Компизоторов/сценаристов и т.д, зависит от role)
        return ", ".join(block.find("td").text.strip().split("\n"))
    except:
        try:

            block = soup.find("th", string=role_mn).parent
            return ", ".join(block.find("td").text.strip().split("\n"))
        except:
            return ''

def get_creators(game_name):
    url = f"https://ru.wikipedia.org/wiki/{game_name}"

    # Запрос HTML-страницы
    response = requests.get(url)
    if response.status_code == 200:

        # Извлечение HTML-кода страницы
        html = response.text

        # Создание объекта BeautifulSoup для парсинга HTML-страницы
        soup = BeautifulSoup(html, "html.parser")

        # Нахождение блока с информацией о руководителе игры

        title = soup.find("title").text.strip().split("-")[0].strip().strip().replace(" — Википедия", "")
        composer_list = get_developer_name(soup, 'Композитор', "Композиторы")
        director_list = get_developer_name(soup, 'Руководитель', "Руководители")
        writer_list = get_developer_name(soup, 'Сценарист', "Сценаристы")
        game_designer = get_developer_name(soup, 'Геймдизайнер', "Геймдизайнеры")

        if composer_list == '' or director_list == '' or writer_list == '' or game_designer == '':

            url = f"https://en.wikipedia.org/wiki/{game_name}"
            response = requests.get(url)
            html = response.text
            soup = BeautifulSoup(html, "html.parser")

            if composer_list == '':
                composer_list = get_developer_name(soup, 'Composer(s)', "Composer")
            if director_list == '':
                director_list = get_developer_name(soup, 'Director(s)', "Director")
            if writer_list == '':
                writer_list = get_developer_name(soup, 'Writer(s)', "Writer")
            if game_designer == '':
                game_designer = get_developer_name(soup, 'Designer(s)', "Designer")

        composer_list = re.sub(r'\[[^\]]*\]', '', composer_list)
        composer_list = re.sub(r'(?<=\w)(?=[A-Z])', ', ', composer_list)

        director_list = re.sub(r'\[[^\]]*\]', '', director_list)
        director_list = re.sub(r'(?<=\w)(?=[A-Z])', ', ', director_list)

        writer_list = re.sub(r'\[[^\]]*\]', '', writer_list)
        writer_list = re.sub(r'(?<=\w)(?=[A-Z])', ', ', writer_list)

        game_designer = re.sub(r'\[[^\]]*\]', '', game_designer)
        game_designer = re.sub(r'(?<=\w)(?=[A-Z])', ', ', game_designer)

        poster_block = soup.find("a", {"class": "image"}).find("img")

        # Нахождение ссылки на постер игры
        poster_url = "https:" + poster_block["src"]

        # Вывод информации о названии игры и ссылке на ее постер
        print(f"Название игры: {title}")
        print(f"Ссылка на постер: {poster_url}")

        # Вывод информации об авторах игры
        # print(f"Название игры: {title}")
        print(composer_list)
        # print(director_list)
        # print(writer_list)
        # print(game_designer)

        return [title, composer_list, director_list, writer_list, game_designer]

    else:
        return ("Ошибка при получении страницы с Википедии")
print(get_creators('Fortnite'))
# import requests
# from bs4 import BeautifulSoup
#
# url = 'https://en.wikipedia.org/wiki/List_of_video_games_considered_the_best'
#
# response = requests.get(url)
# soup = BeautifulSoup(response.text, 'html.parser')
#
# def get_game_list():
#     games_list = []
#     table = soup.find('table', {'class': 'wikitable sortable'})
#     rows = table.find_all('tr')
#     for row in rows:
#         cells = row.find_all('td')
#         if len(cells) > 0:
#             game = cells[0].text.strip()
#             games_list.append(game)
#     return games_list
# print(get_game_list())


# composer_list = re.sub(r'\[[^\]]*\]', '', composer_list)
    # director_list = re.sub(r'\[[^\]]*\]', '', director_list)
    # writer_list = re.sub(r'\[[^\]]*\]', '', writer_list)
    # game_designer = re.sub(r'\[[^\]]*\]', '', game_designer)