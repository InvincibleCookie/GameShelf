from sqlalchemy import create_engine, Column, Integer, String, Boolean, BigInteger, Float
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from RAWG import get_games
from wikipedia_parsing import get_creators
engine = create_engine('postgresql+psycopg2://postgres:qewrytuoip@localhost/Games')

Base = declarative_base()


class Users(Base):
    __tablename__ = 'users'
    username = Column(String, primary_key=True)
    password = Column(String)


class Score(Base):
    __tablename__ = 'score'
    game = Column(String, primary_key=True)
    username = Column(String, primary_key=True)
    score = Column(Integer)
    platform = Column(String)


class Reviews(Base):
    __tablename__ = 'reviews'
    game = Column(String, primary_key=True)
    username = Column(String, primary_key=True)
    review = Column(String)


class Awards(Base):
    __tablename__ = 'awards'
    id = Column(BigInteger, primary_key=True)
    game = Column(String)
    award_name = Column(String)
    category = Column(String)
    person = Column(String)
    win_lose = Column(Boolean)


class Games(Base):
    __tablename__ = 'games'
    name = Column(String, primary_key=True)
    ru_name = Column(String)
    year = Column(String)
    platform = Column(String)
    genre = Column(String)
    country = Column(String)
    developer = Column(String)
    publisher = Column(String)
    director = Column(String)
    designer = Column(String)
    writer = Column(String)
    composer = Column(String)
    budget = Column(String)
    sells = Column(String)
    user_score = Column(Float)
    metacritic_score = Column(Float)
    poster = Column(String)
    description = Column(String)


Session = sessionmaker(bind=engine)
session = Session()

for row in session.query(Games):
    try:
        if row.ru_name == 'О':
            row.ru_name = row.name
        if len(row.director) == 1:
            row.director = ''
        if len(row.designer) == 1:
            row.designer = ''
        if len(row.composer) == 1:
            row.composer = ''
        if len(row.writer) == 1:
            row.writer = ''
    except:
        pass

session.commit()
session.close()


# game_list = get_games()
# for game in game_list:
#     if not session.query(Games).filter_by(name=game['name']).first():
#         session.add(Games(**game))



# my_data = [
#     {'username': 'qwe1', 'password': 'dasd'},
#     {'username': 'qwe2', 'password': 'dasd'},
#     {'username': 'qwe3', 'password': 'dasd'}
# ]
#
# for data in my_data:
#     obj = Users(**data)
#     session.add(obj)

# for row in session.query(Games):
#     try:
#         creators_list = get_creators(row.name)
#         row.ru_name = creators_list[0]
#         row.director = creators_list[2]
#         row.designer = creators_list[4]
#         row.writer = creators_list[3]
#         row.composer = creators_list[1]
#     except:
#         pass