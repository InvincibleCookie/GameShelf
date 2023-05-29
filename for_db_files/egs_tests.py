from bs4 import BeautifulSoup
import requests

url = "https://www.epicgames.com/store/ru/p/battlefield-v"
response = requests.get(url)
soup = BeautifulSoup(response.content, "html.parser")

title = soup.find("h1", class_="css-zy6vdl-Heading1__hed1i3-0").text.strip()
price = soup.find("span", class_="css-2mb1pt-Text-ex__price-amount").text.strip()

print(f"Название игры: {title}")
print(f"Цена игры: {price}")