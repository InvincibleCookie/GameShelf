import psycopg2
from fastapi import FastAPI
import json

app = FastAPI()
conn = psycopg2.connect(database="Games",
                        user="postgres",
                        password="",
                        host="localhost",
                        port="5432")
cursor = conn.cursor()


@app.get('/game/{game}')
async def get_game_page(game):
    cursor.execute("SELECT * FROM games WHERE name=%s", (game,))
    records = cursor.fetchall()

    data = {
        'name': records[0][0],
        'ru_name': records[0][1],
        'year': records[0][2],
        'platform': records[0][3],
        'genre': records[0][4],
        'country': records[0][5],
        'developer': records[0][6],
        'publisher': records[0][7],
        'director': records[0][8],
        'designer': records[0][9],
        'writer': records[0][10],
        'composer': records[0][11],
        'budget': records[0][12],
        'sells': records[0][13],
        'user_score': records[0][14],
        'metacritic_score': records[0][15],
        'cover': records[0][16],
        'description': records[0][17],
        'game_link': records[0][18]
    }

    json_data = json.dumps(data)
    return json_data
