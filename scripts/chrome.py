from selenium import webdriver
import pandas as pd
from selenium.webdriver.common.by import By
from numpy import random
import time as ti
import os
import re
from selenium.webdriver.support import expected_conditions as EC
from datetime import datetime, date, time, timezone
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.chrome.service import Service
# from webdriver_manager.chrome import ChromeDriverManager
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium import webdriver
from fp.fp import FreeProxy
pattern = r"\D*(\d+)\s+result"
# use this to update selenium pip3 install -U selenium

# get a list of free proxies
# proxy = FreeProxy(https=True).get()
# options = Options()
# options.add_argument('--proxy-server=%s' % proxy)
# # options.add_argument('--headless')
# # options.add_argument('--window-size=1920,1080')
# # options.add_argument('--disable-gpu')
# driver = webdriver.Chrome(options=options)
driver = webdriver.Chrome()
# use this to update the chrome driver
# driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
df = pd.DataFrame(columns=['GC', 'total'])

links = pd.read_csv('../link_file/output.csv', header=None)
# Launch the browser and navigate to the webpage
for index, row in links.iterrows():
    ti.sleep(random.uniform(5, 10))
    driver.get(row[0])
    div_elements = driver.find_elements('class name', 'gs_ab_mdw')
    div_element_GC = div_elements[1].text
    #wait some time
    ti.sleep(random.uniform(5, 10))
    driver.get(row[1])
    div_elements = driver.find_elements('class name', 'gs_ab_mdw')
    div_element_total = div_elements[1].text
    df.loc[index] = [div_element_GC, div_element_total]

for col in df.columns:
    df[col] = df[col].str.extract(pattern)
df.fillna(0, inplace=True)
df = df.astype(int)
df = df.append(df.sum(numeric_only=True), ignore_index=True)
# print tables
today = datetime.now()
filename = f"../output/{today}_count.csv"
if not os.path.exists('../output'):
    os.mkdir('../output')
df.to_csv(filename, index=False)
# Find and click the button
#button = driver.find_element(By.CLASS_NAME, 'pass_configuration__day_selector__button form-control radio radio--custom')
#element = driver.find_element(By.CLASS_NAME,'pass_configuration__day_selector__button form-control radio radio--custom')
#element = driver.find_element(By.CSS_SELECTOR,"label.pass_configuration__day_selector__button.form-control.radio.radio--custom")

#driver.execute_script('arguments[0].setAttribute("aria-checked", "true")', button)


# Move up to the parent label element
# label_element = div_element.find_element('xpath', '..')
# label_element.click()

## Wait until OneTrust banner disappears
# button = driver.find_elements(By.CLASS_NAME,"onetrust-close-btn-handler")[1]
# button.click()
# wait = WebDriverWait(driver, 10)
# banner = wait.until(EC.invisibility_of_element_located((By.ID, "onetrust-banner-sdk")))

# Close the browser
driver.quit()




