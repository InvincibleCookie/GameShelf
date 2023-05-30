const http = require('http');
const url = require('url');
const axios = require('axios');
const fs = require('fs');

// Создание HTTP-сервера
const server = http.createServer(async (req, res) => {
  // Парсинг URL-адреса запроса
  const parsedUrl = url.parse(req.url, true);
  const pathName = parsedUrl.pathname;
  const gamePath = '/game/';

  // Проверка, является ли путь запроса началом "/game/"
  if (pathName.startsWith(gamePath)) {
    // Получение названия игры из пути запроса
    const gameName = pathName.slice(gamePath.length);

    // Вызов функции для получения данных игры
    await getGamePage(gameName, res);
  } else if (pathName.startsWith('/styles/')) {
    // Обработчик запросов для файлов стилей
    const styleFilePath = pathName.slice(1); // Удаляем первый символ '/'
    const styleFile = await new Promise((resolve, reject) => {
      fs.readFile(`src/${styleFilePath}`, 'utf8', (err, data) => {
        if (err) {
          reject(err);
        } else {
          resolve(data);
        }
      });
    });

    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/css');
    res.end(styleFile);
  } else if (pathName.startsWith('/img/')) {
    // Обработчик запросов для изображений
    const imageFilePath = pathName.slice(1); // Удаляем первый символ '/'
    const imageFile = await new Promise((resolve, reject) => {
      fs.readFile(`src/${imageFilePath}`, (err, data) => {
        if (err) {
          reject(err);
        } else {
          resolve(data);
        }
      });
    });

    res.statusCode = 200;
    res.setHeader('Content-Type', 'image/jpeg'); // Предполагая, что изображения имеют формат JPEG
    res.end(imageFile);
  } else {
    // Отправка ответа с кодом 404 (страница не найдена)
    res.statusCode = 404;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Page not found');
  }
});

// Функция для получения данных игры
async function getGamePage(game, res) {
  try {
    // Отправка POST-запроса на сервер игры и получение ответа
    const response = await axios.post(`http://127.0.0.1:8000/game/${game}`);

    if (response.status === 200) {
      const data = response.data;
      // Используйте полученные данные
      const { name, ru_name, year, platform, genre, country, developer, publisher, director, designer, writer, composer, budget, sells, user_score, metacritic_score, cover, description, game_link } = data;

      // Вывод каждого элемента данных в консоль
      console.log('Название игры:', name);
      console.log('Русское название игры:', ru_name);
      console.log('Год:', year);
      console.log('Платформа:', platform);
      console.log('Жанр:', genre);
      console.log('Страна:', country);
      console.log('Разработчик:', developer);
      console.log('Издатель:', publisher);
      console.log('Режиссер:', director);
      console.log('Дизайнер:', designer);
      console.log('Сценарист:', writer);
      console.log('Композитор:', composer);
      console.log('Бюджет:', budget);
      console.log('Продажи:', sells);
      console.log('Рейтинг пользователей:', user_score);
      console.log('Рейтинг Metacritic:', metacritic_score);
      console.log('Обложка:', cover);
      console.log('Описание:', description);
      console.log('Ссылка на игру:', game_link);

      // Чтение содержимого файла game.html
      const html = await new Promise((resolve, reject) => {
        fs.readFile('src/html/game.html', 'utf8', (err, data) => {
          if (err) {
            reject(err);
          } else {
            resolve(data);
          }
        });
      });

      // Замена переменных в HTML-странице
      const modifiedHtml = html
        .replace('{{ru_name}}', ru_name)
        .replace('{{cover}}', cover); // Вставляем переменную cover

      // Отправка HTML-страницы в ответе
      res.statusCode = 200;
      res.setHeader('Content-Type', 'text/html');
      res.end(modifiedHtml);

      // Дополнительный код для работы с данными
    } else {
      console.log('Ошибка при получении данных');
    }
  } catch (error) {
    console.log('Произошла ошибка:', error.message);
  }
}

const port = 3000;
// Запуск сервера на заданном порту
server.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
