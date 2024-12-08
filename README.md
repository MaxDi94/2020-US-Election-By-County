**Analysis of the United States Presidential Election of 2020 by County with key demographics**

**Project Overview**

This project analyzes and visualizes presidential election results at the county level in the United States for 2020. It includes regression analysis, correlations, and geospatial visualizations to understand the factors influencing the vote share for different candidates, Donald J. Trump Jr. for the Republican Party and Josef R. Biden for the Democratic Party. The datasets used in this project are election results, poverty rate, level of education, unemployment rate, rural-urban classification. All datasets are on county level identified by the FIPS code used by the US Census Bureau.

Presidential Election results are reported on the precinct level, which is the most granular and on the county level. I choose the county level election data, as counties and county equivalents are administrative units usually used by the US Census Bureau to provide demographic data. The next higher level would be the state which also ultimately decides the electors to vote for a presidential candidate. Of all 3,155 counties and county equivalents, the Republican Party won 2,596 and the Democratic Party 559. The Democratic Party won the election nonetheless, by number of electors and also by popular vote. Democrat-won counties are much more populous which is also reflected in the analysis. 

First, the .csv files were uploaded into a relational database via SSMS 19 with a corresponding query to extract relevant data by joining all demographic tables to the election table. Data preparation was conducted mainly in SSMS by cleaning up the raw data, setting appropriate data types, developing relations, and aggregating/grouping the data by county. In Jupyter Notebook data analysis was conducted by determining correlation, regression and building plots.

Performing a left join in the SQL query to keep all data from the election dataset. Some counties like Puerto Rico, overseas territories etc. do not vote in presidential elections. At the same time some districts which were included in the county breakdown of the election dataset were not included in the census datasets, therefore not all counties of the election dataset have matches. For subsequent analysis these were dropped from the dataset. 


**Explanation of Independent Variables**


Poverty Rate (2020) - The U.S. Census Bureau defines the poverty rate as the percentage of people living in households whose income is below the poverty threshold.


Percentage of Population with less than a High School Degree (2020) - The U.S. Census Bureau defines the percentage of the population with less than a high school degree as the proportion of individuals aged 25 and older who have not completed high school.


Unemployment Rate (2020) - The unemployment rate is defined by the U.S. Census Bureau (and other government agencies, like the Bureau of Labor Statistics) as the percentage of people in the labor force who are unemployed and actively seeking work.


RUCC (Rural-Urban-Continuum Code) (2023) - RUCC was developed by the U.S. Department of Agriculture to categorize counties based on their level of urbanization and proximity to metropolitan areas. It ranges from 1-9 with 1 being most urban and 9 being most rural. 1-3 are considered urban, 4-6 are considered suburban and 7-9 are considered rural.


**Election Result Map on County Level**


![county_level_election_result_map](https://github.com/user-attachments/assets/626a5d8d-183e-4d46-9afd-10a1cdd3fc44)

Alaska has been dropped because the Alaskan county system differs from the shapefile



**1. Analysis - Pearson Correlation**


**Poverty Rate vs Vote Share**


![scatter_poverty_rate_vs_democrat_voteshare](https://github.com/user-attachments/assets/3be0c77d-1458-481e-aba5-aca52e83cf26)


Correlation = -0.02 (p-value = 0.316) - Statistically insignificant (p-value above 0.05)


![scatter_poverty_rate_vs_republican_voteshare](https://github.com/user-attachments/assets/8a1eaa25-4b6f-461c-b979-71737a20695c)


Correlation = -0.11 (p-value = 0.000) - Weak correlation, statistically significant

In counties with higher poverty rates the share of votes for the republican candidate tends to decrease slightly.



**Percentage of Population with less than a High School Degree vs Vote Share**


![scatter_less_HS_vs_democrat_voteshare](https://github.com/user-attachments/assets/929de661-fe17-4e3e-b4f3-c58a366d0b69)


Correlation = -0.15 (p-value = 0.000) - Weak correlation, statistically significant

As the percentage of individuals with less than a High School degree increases, the vote share of the democratic candidate decreases.


![scatter_less_HS_vs_republican_voteshare](https://github.com/user-attachments/assets/daa984ce-1a36-4340-b067-97391bb266aa)


Correlation = 0.02 (p-value 0.373) - Statistically insignificant



**Unemployment Rate vs Vote Share**


![scatter_Unemployment_rate_2020_vs_democrat_voteshare](https://github.com/user-attachments/assets/de8d7db3-f969-4ab7-b0c9-242533cfa539)


Correlation = 0.40 (p-value = 0.000) - Moderate correlation, statistically significant

Higher unemployment rates in a county are associated with a higher share of votes for the democratic candidate


![scatter_Unemployment_rate_2020_vs_republican_voteshare](https://github.com/user-attachments/assets/46928c76-990e-46ab-9dea-b004288b1020)


Correlation = -0.11 (p-value = 0.000) - Weak correlation, statistically significant

Higher unemployment rates in a county are associated with a lower share of votes for the republican candidate



**RUCC (Rural-Urban-Continuum-Code**


![scatter_rucc_vs_democrat_voteshare](https://github.com/user-attachments/assets/af7200b5-bf75-4312-b818-56844937eeb5)


Correlation = -0.28 (p-value = 0.000) -Moderate correlation, statistically significant

Higher RUCC values which indicate more rural areas correspond to higher vote share for the Republican candidate


![scatter_rucc_vs_republican_voteshare](https://github.com/user-attachments/assets/6ba4ec82-db67-4801-801a-272e88f3554f)


Correlation = 0.30 (p-value = 0.000) -Moderate correlation, statistically significant

Higher RUCC values which indicate more rural areas correspond to lower vote share for the Democratic candidate



**Poverty Rate Breakdown by RUCC**


Republican Party:


Urban (RUCC 1-3): Correlation = -0.06 (p-value = 0.047)

Weak negative correlation; higher poverty rates slightly decrease Republican vote share.



Suburban (RUCC 4-6): Correlation = -0.22 (p-value = 0.000)

Moderate negative correlation; higher poverty rates are associated with lower Republican vote share in suburban areas.



Rural (RUCC 7-9): Correlation = -0.24 (p-value = 0.000)

Moderate negative correlation; higher poverty rates lead to lower Republican vote share in rural areas.



Democrat Party:


Urban (RUCC 1-3): Correlation = 0.01 (p-value = 0.724)

No significant correlation between poverty rate and Democrat vote share in urban areas.



Suburban (RUCC 4-6): Correlation = -0.01 (p-value = 0.883)

No significant correlation in suburban areas.



Rural (RUCC 7-9): Correlation = 0.16 (p-value = 0.000)

Weak positive correlation; higher poverty rates are associated with increased Democrat vote share in rural areas.


**2. Analysis - Regression**

Republican Party:


Poverty Rate: -1.1690 (p-value = 0.000)

A 1% increase in poverty rate decreases Republican vote share by 1.17%.



Unemployment Rate: 0.2869 (p-value = 0.190)

Not statistically significant.



Percentage of Population with less than a High School Diploma: 0.4689 (p-value = 0.000)

Higher rates of individuals without a high school education increase Republican vote share.



RUCC: 2.9587 (p-value = 0.000)

More rural areas are associated with a significant increase in Republican vote share.



Democratic Party:


Poverty Rate: 0.1223 (p-value = 0.063)

Weak positive relationship, but not quite statistically significant.



Unemployment Rate: 2.8922 (p-value = 0.000)

A 1% increase in unemployment rate leads to a 2.89% increase in Democrat vote share.



Percentage of Population with less than a High School Diploma: -0.7461 (p-value = 0.000)

Higher rates of individuals without high school education decrease Democrat vote share.



RUCC: -0.9233 (p-value = 0.000)

More rural areas are associated with a significant decrease in Democrat vote share.


**Conclusion**
The strongest correlation for both parties can be observed for changes in the RUCC. Rural areas tend to vote Republican and Urban areas tend to vote Democrat. In general exit polls suggest a similar tendency. For the poverty rate, there is a slightly weak negative correlation to the Republican vote share, suggesting counties with a higher poverty rate to vote less Republican. This is somewhat in line with polling as low-income individuals tend to vote more democrat whereas high-income individuals tend to vote more Republican. This is also reflected by a related variable, unemployment rate, which if higher, tends to be accompanied by more votes for the Democratic party and vice-versa.

Another indicator for voting patterns is education. Polls suggest poorly educated voters tend to vote more Republican. This is reflected in the regression analysis with a coefficient of 0.4689 for the percentage of people with less than a High School diploma and Republican vote share.


**Limitations**

Variables are limited, other variables generally deemed significant for voting choices like race are not included. Counties can be politically quite diverse and some are highly contested. Geographic location of counties is not being controlled for. Some rural areas in the Northeast still vote solidly Democrat and some urban areas in the Midwest vote solidly Republican.


**Dependencies**

matplotlib

seaborn

geopandas

pandas

numpy

statsmodels

**Installation**

git clone https://github.com/MaxDi94/2020-US-Election-By-County.git

cd 2020-US-Election-By-County

pip install -r requirements.txt


**Data Sources**

Election Data: https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/VOQCHQ (Presidential Election from 2000-2020 on county level)

Shapefile: https://www.census.gov/cgi-bin/geo/shapefiles/ (Select year: 2020 / Seect a layer type: County (and equivalent)

Poverty, Education, Populatio, Employment, Migration Data: US Census Bureau
