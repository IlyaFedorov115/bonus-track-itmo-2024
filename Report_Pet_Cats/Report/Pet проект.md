В каждой из ИДЗ необходимо реализовать функциональность массового импорта-экспорта. Что она подразумевает:
1. возможность импорта экспорта всех данных из системы в машино-читаемом формате (json, xml, csv …. на ваш выбор)
2. пользовательские интерфейсы для импорта и экспорта
Зачем это нужно
1. потренироваться в создании простого модуля бакапа
2. посмотреть, какие возможности предоставляет ваша СУБД для работы с дампами БД

> Подробное описание [ИДЗ - состав, порядок работы [se.moevm.info]](https://se.moevm.info/doku.php/staff:courses:no_sql_introduction:course_work)

> тут список датасетов и примеров [Темы для ИДЗ [se.moevm.info]](https://se.moevm.info/doku.php/staff:courses:no_sql_introduction:course_work:topics)

> Наш проект [Data Model · moevm/nosql2h21-cats-mongodb Wiki (github.com)](https://github.com/moevm/nosql2h21-cats-mongodb/wiki/Data-Model)

> Дата сеты для котов (тут только некоторые поля могут пригодиться, но для примера похер). Прям конспектим, что случайным образом генерируем данные, просто взяли список цифр, список пород, список ссылок и т.п. И получили csv + json

[Cat Breeds Dataset (kaggle.com)](https://www.kaggle.com/datasets/ma7555/cat-breeds-dataset)
[Cat Breeds Dataset (Cleared) (kaggle.com)](https://www.kaggle.com/datasets/denispotapov/cat-breeds-dataset-cleared)

Вот это топ: [Cat breeds details (kaggle.com)](https://www.kaggle.com/datasets/warcoder/cat-breeds-details)

>[!info] Вдруг пригодится для проекта ==Бонус ТРЕК==
>[MOEVM LETI (github.com)](https://github.com/moevm)

> добавить еще такого котика [Arduino: Работаем с сервоприводами (alexanderklimov.ru)](https://developer.alexanderklimov.ru/arduino/servo.php?ysclid=lpzk83fttj111582121)


![[ui_mockup_and_uc.pdf]]

![[Пояснительная записка.pdf]]


> ссылка на проект: [moevm/nosql2h21-cats-mongodb at master (github.com)](https://github.com/moevm/nosql2h21-cats-mongodb/tree/master)




>Отсюда можно и json и другие форматы: [link](https://celestrak.org/NORAD/elements/index.php?FORMAT=json)

> Тут есть активные спутники, можно с них начать.

Формат **JSON** и столбцы **csv** следующие:

```json
{
    "OBJECT_NAME": "STARLINK-1329",
    "OBJECT_ID": "2020-025A",
    "EPOCH": "2023-12-05T19:10:43.809888",
    "MEAN_MOTION": 15.06434775,
    "ECCENTRICITY": 0.0001452,
    "INCLINATION": 53.0543,
    "RA_OF_ASC_NODE": 209.695,
    "ARG_OF_PERICENTER": 86.9036,
    "MEAN_ANOMALY": 273.2119,
    "EPHEMERIS_TYPE": 0,
    "CLASSIFICATION_TYPE": "U",
    "NORAD_CAT_ID": 45531,
    "ELEMENT_SET_NO": 999,
    "REV_AT_EPOCH": 20016,
    "BSTAR": 0.0006412,
    "MEAN_MOTION_DOT": 9.291e-5,
    "MEAN_MOTION_DDOT": 0
}
```

> Есть еще формат TLE [TLE — Википедия (wikipedia.org)](https://ru.wikipedia.org/wiki/TLE) Который можно парсить. Типо онлайн сайт, которому вставляешь строку, а он выдает удобочитаемый формат + перевод в json/xml. ==Можно на flask ==сделать по быстрому за 2 дня + chatgpt/black...



> Примеры планет на javascript: [Miniature Earth | Flight Time Demo](https://miniature.earth/demo/flight-time.htm)
> [GitHub - inverser-pro/threejs-3d-planet: webgl 3d planet](https://github.com/inverser-pro/threejs-3d-planet?ysclid=lpuxkzum4i346798212)


1. **OBJECT_NAME**: Название объекта - в данном случае, название спутника, которое используется для его идентификации. В примере это "STARLINK-1329".
2. **OBJECT_ID**: Идентификатор объекта - уникальный идентификатор спутника. В данном случае, "2020-025A".
3. **EPOCH**: Время эпохи - момент времени, для которого предоставлены орбитальные параметры. В примере это "2023-12-05T19:10:43.809888".
4. **MEAN_MOTION**: Среднее движение - среднее количество оборотов спутника вокруг Земли за сутки. Значение в примере равно 15.06434775 об/мин.
5. **ECCENTRICITY**: Эксцентриситет орбиты - мера отклонения формы орбиты от круга. Значение в примере равно 0.0001452.
6. **INCLINATION**: Наклонение орбиты - угол между плоскостью орбиты и экватором Земли. Значение в примере равно 53.0543 градуса.
7. **RA_OF_ASC_NODE**: Прямое восхождение восходящего узла - угол между линией восходящего узла и нулевым меридианом. Значение в примере равно 209.695 градуса.
8. **ARG_OF_PERICENTER**: Аргумент перигея - угол между восходящим узлом и точкой перигея. Значение в примере равно 86.9036 градуса.
9. **MEAN_ANOMALY**: Средняя аномалия - угол между перигеем и текущей позицией спутника. Значение в примере равно 273.2119 градуса.
10. **EPHEMERIS_TYPE**: Тип эфемерид (орбитальных данных). Значение 0 обычно указывает на использование двухфокусных элементов Кеплера.
11. **CLASSIFICATION_TYPE**: Классификация типа орбиты. "U" в данном случае, вероятно, указывает на объект с неопределенной (unclassified) орбитой.
12. **NORAD_CAT_ID**: Номер каталога NORAD - уникальный номер, присвоенный объекту в каталоге NORAD. В данном случае, 45531.
13. **ELEMENT_SET_NO**: Номер набора элементов - номер, связанный с орбитальными элементами.
14. **REV_AT_EPOCH**: Количество оборотов спутника на момент эпохи. В данном случае, 20016 оборотов.
15. **BSTAR**: Коэффициент, учитывающий влияние атмосферного торможения и других неорбитальных сил на спутник.
16. **MEAN_MOTION_DOT**: Производная от среднего движения по времени.
17. **MEAN_MOTION_DDOT**: Вторая производная от среднего движения по времени.


> Один из методов расчета местоположения спутника на определенный момент времени включает в себя использование орбитальных элементов для определения орбиты, а затем преобразование этих элементов в координаты (например, прямоугольные координаты в инерциальной системе отсчета). После этого можно получить относительное положение спутника относительно Земли.

Вот пример того, как можно использовать Python и библиотеку `ephem` для выполнения таких расчетов:
```python
import ephem
from datetime import datetime
# Загрузка данных из JSON
data = {
    "OBJECT_NAME": "STARLINK-1329",
    "OBJECT_ID": "2020-025A",
    # ... (остальные данные)
}
# Извлечение данных
epoch_str = data["EPOCH"]
norad_cat_id = data["NORAD_CAT_ID"]
mean_motion = data["MEAN_MOTION"]
eccentricity = data["ECCENTRICITY"]
inclination = data["INCLINATION"]
ra_of_asc_node = data["RA_OF_ASC_NODE"]
arg_of_pericenter = data["ARG_OF_PERICENTER"]
mean_anomaly = data["MEAN_ANOMALY"]
# Преобразование строки в объект datetime
epoch = datetime.strptime(epoch_str, "%Y-%m-%dT%H:%M:%S.%f")
# Инициализация спутника с использованием библиотеки ephem
satellite = ephem.readtle(data["OBJECT_NAME"], data["OBJECT_ID"], norad_cat_id, epoch_str, mean_motion, eccentricity, inclination, ra_of_asc_node, arg_of_pericenter, mean_anomaly)
# Установка даты, для которой нужно рассчитать положение
date_of_interest = datetime(2023, 12, 7, 12, 0, 0)  # Пример: 7 декабря 2023 года в 12:00
# Рассчет положения спутника для указанной даты
satellite.compute(date_of_interest)
# Получение координат (широта, долгота, высота) спутника относительно Земли
latitude = satellite.sublat
longitude = satellite.sublong
altitude = satellite.elevation / 1000  # перевод в километры
print(f"Latitude: {latitude}, Longitude: {longitude}, Altitude: {altitude} km")
```

> [Целимся и общаемся со спутниками: Часть первая — целимся программно / Хабр (habr.com)](https://habr.com/ru/articles/514308/)
> Тут картинки есть полезные, для получения отображения.

> Красивый пример как отображать можно было бы [StuffInSpace - трёхмерная карта всех космических объектов на орбите (spacegid.com)](https://spacegid.com/media/space_sattelite/)
> Там javascript библиотека указана

> Полезная бакалаврская, но формулы похерены [smoglyuk_bak_rabota.pdf (sfu-kras.ru)](http://elib.sfu-kras.ru/bitstream/handle/2311/29085/smoglyuk_bak_rabota.pdf?sequence=2&ysclid=lmbpkgqy1w318755471)
> 

[GitHub - AndreyRysistov/PostgresHomework: Домашнее задание по курсу "Проектирование и сопровождение баз данных"](https://github.com/AndreyRysistov/PostgresHomework?ysclid=lpv18s6pr7972497402)

### Какие проекты отсюда можно

1) Парсинг формата TLE, одностраничный сайт на flask, который выдает данные в виде json/xml и просто на страничке
2) База данных хранения спутников (а что хранить, тут все в одной таблице, не?)
3) База данных инвентаризации (домашней или иной) + веб отображение



. [https://github.com/afourmy/pyEarth](https://github.com/afourmy/pyEarth)


**QT библиотеки**

[https://doc.qt.io/qt-5/qt3d-planets-qml-example.html](https://doc.qt.io/qt-5/qt3d-planets-qml-example.html) 
[https://qt-mirror.dannhauer.de/learning/developerguides/gamedevelopmentqt3d/GameDevelopmentQt3D.pdf](https://qt-mirror.dannhauer.de/learning/developerguides/gamedevelopmentqt3d/GameDevelopmentQt3D.pdf)

[https://microtechnics.ru/qt-i-qml-mtpaint3d-sozdaem-utilitu-dlya-3d-risovaniya-den-4/](https://microtechnics.ru/qt-i-qml-mtpaint3d-sozdaem-utilitu-dlya-3d-risovaniya-den-4/) [https://www.youtube.com/watch?v=I5yRV3ZUiWA](https://www.youtube.com/watch?v=I5yRV3ZUiWA) [https://evileg.com/ru/post/544/](https://evileg.com/ru/post/544/)

#### Полезности по БД
[Использование PostgreSQL для управления данными инвентаризации и их визуализации - DEV Community](https://dev.to/dbvismarketing/using-postgresql-to-manage-business-inventory-data-and-visualize-it-2h35)

==Где искать наборы данных== [Find Open Datasets and Machine Learning Projects | Kaggle](https://www.kaggle.com/datasets)

SQL КРУТЫЕ ШПОРЫ [Sql Cheat sheets | Kaggle](https://www.kaggle.com/discussions/getting-started/97406)

База данных магазина велосипедов [Bike Store Relational Database | SQL (kaggle.com)](https://www.kaggle.com/datasets/dillonmyrick/bike-store-sample-database)

[JOINs and UNIONs | Kaggle](https://www.kaggle.com/code/alexisbcook/joins-and-unions)