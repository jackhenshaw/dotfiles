#!/usr/bin/env python3
import requests                 # to get html from website
from bs4 import BeautifulSoup   # to parse the html

local_area = True
tmux = True

# choosing correct website depending on location and setting initial title
if not local_area: # entire UK
    URL = "https://coronavirus.data.gov.uk/"
    output = "#[bold]|#[nobold] COVID-19 (UK) #[bold]|#[nobold] " if tmux else "COVID-19 (UK): "
else: # postcode of University of Birmingham
    URL = "https://coronavirus.data.gov.uk/search?postcode=B152TT"
    output = "#[bold]|#[nobold] COVID-19 (Birmingham) #[bold]|#[nobold] " if tmux else "COVID-19 (Birmingham): "

# pull the html from the website and create beautiful soup object to parse
page = requests.get(URL)
soup = BeautifulSoup(page.content, "html.parser")

# find interested html element by looking for its id
# - use web developer tools in browser to find what this is
all_results = soup.find(id="main-content")
numbers = all_results.find_all("span", {"class": "govuk-link--no-visited-state"})
changes = all_results.find_all("strong", {"class": "govuk-!-margin-right-1"})

# extract values from website
positive  = numbers[0].text
positiveChange = changes[0].text
deaths    = numbers[15].text
deathsChange = changes[1].text

# defining formatting of output
down  = "⬇️  "
green = "#[fg=green, bright nobold]" if tmux else "\033[92m"
up    = "⬆️  "
red   = "#[fg=red, bright nobold]" if tmux else "\033[91m"

output += green if int(positiveChange) < 0 else red
output += "Cases: {}".format(positive)
output += down if int(positiveChange) < 0 else up
output += green if int(deathsChange) < 0 else red
output += "Deaths: {}".format(deaths)
output += down if int(deathsChange) < 0 else up

print(output)
