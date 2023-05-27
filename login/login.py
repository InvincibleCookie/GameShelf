import psycopg2
from fastapi import FastAPI, Request, Form
from fastapi.templating import Jinja2Templates
from fastapi.responses import RedirectResponse

app = FastAPI()
templates = Jinja2Templates(directory="templates")

conn = psycopg2.connect(database="Games",
                        user="postgres",
                        password="",
                        host="localhost",
                        port="5432")

cursor = conn.cursor()


@app.get('/')
async def home(request: Request):
    return templates.TemplateResponse("login.html", {"request": request})


@app.post('/login/')
async def login(request: Request, username: str = Form(...), password: str = Form(...)):
    if not username:
        return templates.TemplateResponse("login.html", {"request": request, "empty_username": True})
    if not password:
        return templates.TemplateResponse("login.html", {"request": request, "empty_password": True})

    cursor.execute("SELECT * FROM users WHERE username=%s", (username,))
    record = cursor.fetchone()
    if not record:
        return templates.TemplateResponse("login.html", {"request": request, "empty_data": True})
    if record[2] != password:
        return templates.TemplateResponse("login.html", {"request": request, "wrong_password": True})

    return templates.TemplateResponse("account.html", {"request": request, "username": record[1],
                                                       "mail": record[3], "password": record[2]})


@app.get('/registration/')
async def registration(request: Request):
    return templates.TemplateResponse("registration.html", {"request": request})


@app.post('/registration/')
async def process_registration(request: Request, username: str = Form(...), mail: str = Form(...),
                              password: str = Form(...)):
    if not username or not mail or not password:
        return templates.TemplateResponse("registration.html", {"request": request, empty_fields:True})

    cursor.execute('SELECT * FROM users where username = %s', (username,))
    if cursor.fetchone():
        return templates.TemplateResponse("registration.html", {"request": request, existing_user:True})

    cursor.execute('INSERT INTO users (username, mail, password) VALUES (%s, %s, %s);',
                   (username, mail, password))
    conn.commit()

    return RedirectResponse(url='/')


if __name__ == '__main__':
    import uvicorn

    uvicorn.run(app, host='localhost', port=8000)
