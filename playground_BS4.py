from bs4 import BeautifulSoup
import requests
import lxml
import pandas as pd

headers = {
    'User-Agent': 'Mozilla/5.0',                 
    'Accept': 'text/html,application/xhtml+xml',  
    'Connection': 'keep-alive'                    
}

url = "https://dogell.com/en/cat-breeds?page=1"
response = requests.get(url=url, headers=headers)
response.encoding = 'utf-8'
soup = BeautifulSoup(response.text, 'lxml')

# поиск элемента пагинации для определения числа страниц
pag_tag = soup.find('ul', {'class': 'pagination'})
link_list = pag_tag.find_all('a')
link_list = [elem['href'] for elem in link_list[:-1]]  # последний не берем, т.к. ссылка стрелки и повторение

# подготовка датафрейма
base_url = "https://dogell.com"
columns = ['name', 'img_link', 'hypoallergenic', 'origin']
dataFrame = pd.DataFrame(columns=columns)

# парсинг сайта
i = 0
for link in link_list:
    url = f"{base_url}{link}"
    response = requests.get(url=url, headers=headers)
    if response.status_code == 200:
        response.encoding = 'utf-8'
        soup = BeautifulSoup(response.text, 'lxml')
        tags = soup.find_all('div', {'class': 'categorie-wrap'})
        for elem in tags:
            name = elem.find('div', {'class': 'col-md-12 breed-property-item breed-name'}).find('a').text.strip()
            img_link = elem.find('div', {'class': 'categories-img'}).find('a').find('img')['data-src']
            hypoallerg = elem.find_all('div', {'class': 'row breed-property'})[2]
            hypoallerg = hypoallerg.find_all('div', {'class': 'col-md-4 breed-property-item'})[1].find('strong')
            hypoallerg = True if hypoallerg.text.lower() == 'yes' else False
            origin = elem.find_all('div', {'class': 'row breed-property'})[1]
            origin = origin.find_all('div', {'class': 'col-md-4 breed-property-item'})[0].find('a')
            origin = origin.text if origin is not None else "Unknown"
            #print(i, name , origin)
            dataFrame = dataFrame._append(pd.Series([name, img_link, hypoallerg, origin], index=dataFrame.columns), ignore_index=True)
    else:
        print("Wrong url: ", url, " status code: ", response.status_code)

# save dataframe
csv_file_path = 'parseOut.csv'
dataFrame.to_csv(csv_file_path, index=False)
