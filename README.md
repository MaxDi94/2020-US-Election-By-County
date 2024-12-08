**United States Presidential Election of 2020 by County**

**Project Overview**

This project analyzes and visualizes presidential election results at the county level in the United States for 2020. It includes regression analysis, diagnostic plots, and geospatial visualizations to understand the factors influencing the vote share for different parties (Republican and Democrat).
First, the .csv files were uploaded into a relational database via SSMS 19 with a corresponding query to extract relevant data by joining all demographic tables to the election table. Data preparation was conducted mainly in SSMS by cleaning up the raw data, setting appropriate data types and aggregating/grouping the data by county. In Jupyter Notebook data analysis was conducted by determining correlation, regression and building plots.

**Election result map**

![county_level_election_result_map](https://github.com/user-attachments/assets/626a5d8d-183e-4d46-9afd-10a1cdd3fc44)


**Dependencies**

To run this project you need the following Python libraries:
matplotlib
seaborn
geopandas
pandas
numpy
statsmodels

**Installation**

Clone the Repository

git clone https://github.com/MaxDi94/2020-US-Election-By-County.git
cd 2020-US-Election-By-County
Install Dependencies

pip install -r requirements.txt

**Data Sources**

Election Data: https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/VOQCHQ (Presidential Election from 2000-2020 on county level)
Shapefile: https://www.census.gov/cgi-bin/geo/shapefiles/ (Select year: 2020 / Seect a layer type: County (and equivalent)
Poverty, Education, Populatio, Employment, Migration Data: US Census Bureau
