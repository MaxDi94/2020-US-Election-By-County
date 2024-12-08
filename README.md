**United States Presidential Election of 2020 by County**

**Project Overview**

This project analyzes and visualizes presidential election results at the county level in the United States for 2020. It includes regression analysis, diagnostic plots, and geospatial visualizations to understand the factors influencing the vote share for different parties (Republican and Democrat).
First, the .csv files were uploaded into a relational database via SSMS 19 with a corresponding query to extract relevant data by joining all demographic tables to the election table. Data preparation was conducted mainly in SSMS by cleaning up the raw data, setting appropriate data types and aggregating/grouping the data by county. In Jupyter Notebook data analysis was conducted by determining correlation, regression and building plots.

**SQL Query**

query = """
SELECT c.state,
       c.party,
       c.county_name,
       c.county_fips,
       c.candidate,
       SUM(c.candidatevotes) AS candidatevotes,  -- Sum candidate votes
       SUM(c.totalvotes) AS totalvotes,          -- Sum total votes
       CAST(SUM(c.candidatevotes) AS DECIMAL(18, 2)) / NULLIF(CAST(SUM(c.totalvotes) AS DECIMAL(18, 2)), 0) * 100 AS voteshare,
       p.PCTPOVALL_2021 AS poverty_rate,
       u.Unemployment_rate_2020,
       e.Percent_of_adults_with_less_than_a_high_school_diploma_2018_22 AS less_HS,
       e.Percent_of_adults_with_a_high_school_diploma_only_2018_22 AS HS,
       e.Percent_of_adults_with_a_bachelor_s_degree_or_higher_2018_22 AS bachelor,
       pop.R_INTERNATIONAL_MIG_2021 AS int_mig,
       pop.R_NET_MIG_2021 AS total_mig,
       pop.Rural_Urban_Continuum_Code_2023 AS rucc
FROM elec_county.dbo.countypres AS c
LEFT JOIN elec_county.dbo.poverty AS p ON c.county_fips = p.FIPS_Code
LEFT JOIN elec_county.dbo.unemployment AS u ON c.county_fips = u.FIPS_Code
LEFT JOIN elec_county.dbo.Education AS e ON c.county_fips = e.FIPS_Code
LEFT JOIN elec_county.dbo.PopulationEstimates AS pop ON c.county_fips = pop.FIPStxt
WHERE c.year = 2020
GROUP BY c.state, c.party, c.county_name, c.county_fips, c.candidate, c.year, p.PCTPOVALL_2021, u.Unemployment_rate_2020,
         e.Percent_of_adults_with_less_than_a_high_school_diploma_2018_22,
         e.Percent_of_adults_with_a_high_school_diploma_only_2018_22,
         e.Percent_of_adults_with_a_bachelor_s_degree_or_higher_2018_22,
         pop.R_INTERNATIONAL_MIG_2021, pop.R_NET_MIG_2021,
         pop.Rural_Urban_Continuum_Code_2023
ORDER BY c.year, c.county_fips;
"""

Performing a left join to keep all data from the election dataset. Some counties like Puerto Rico, overseas territories etc. do not vote in presidential election. At the same time some districts which were included in the county breakdown of the election were not included in the census datasets, therefore not all counties of the election dataset have matches. For subsequent analysis these were dropped. 

**Election result map**

![county_level_election_result_map](https://github.com/user-attachments/assets/626a5d8d-183e-4d46-9afd-10a1cdd3fc44)

Alaska has been dropped because the Alaskan county system differs from the shapefile

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

**Total Migration vs Vote Share**




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
