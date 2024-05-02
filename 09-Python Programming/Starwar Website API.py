from requests import get
import pandas as pd

## copy link from starwarapi website
url = "https://anapioficeandfire.com/api/characters/"

charac = pd.DataFrame(columns = ["names", "genders", "cultures", "borns", "dieds"])


for i in range(50, 60):
  index = i + 1 ##เพราะ range เริ่มจาก 0
  new_url = url + str(index)
  response = get(new_url).json()
  ## see data gat from server
  names = response["name"]
  genders = response["gender"]
  cultures = response["culture"]
  borns = response["born"]
  dieds = response["died"]
  charac.loc[len(charac)] = [names, genders, cultures, borns, dieds]

print(charac)
#charac.to_csv("characters.csv", index=False)
