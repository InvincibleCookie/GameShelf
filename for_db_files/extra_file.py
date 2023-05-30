import pycountry

def get_country_name_by_alpha3(alpha3_code):
    try:
        country = pycountry.countries.get(alpha_3=alpha3_code)
        return country.name
    except LookupError:
        return None

alpha3_code = input("Введите код ОКСМ страны: ")
country_name = get_country_name_by_alpha3(alpha3_code)
if country_name:
    print(f"Страна с кодом {alpha3_code}: {country_name}")
else:
    print("Неверный код страны.")
