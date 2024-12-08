🗳️ United States Presidential Election of 2020

📋 Project Overview
This project analyzes and visualizes presidential election results at the county level in the United States for 2020. It includes regression analysis, diagnostic plots, and geospatial visualizations to understand the factors influencing the vote share for different parties (Republican and Democrat).

📊 Key Features
Scatter Plots with Regression Lines
Generates scatter plots to visualize the relationship between various socioeconomic factors (e.g., poverty rate, unemployment rate) and Republican vote share.

Regression Diagnostics
Provides diagnostic plots for regression models, including:

Residuals vs Fitted
Normal Q-Q Plot
Scale-Location Plot
Residuals vs Leverage
County-Level Heatmap
Creates a heatmap displaying the election results on a US county map, color-coded by the winning party.

⚙️ Dependencies
To run this project, you'll need the following Python libraries:

matplotlib
seaborn
geopandas
pandas
numpy
statsmodels

📦 Installation
Clone the Repository

bash
Copy code
git clone https://github.com/yourusername/Election-Analysis-Project.git
cd Election-Analysis-Project
Install Dependencies

bash
Copy code
pip install -r requirements.txt

🚀 How to Run the Project
Prepare the Data
Ensure you have the following data files in the data/ folder:

election_results.csv (containing election data and socioeconomic factors)
tl_2020_us_county.shp (shapefile for US counties)
Execute the Main Script

Run the main Python script:

bash
Copy code
python main.py
View the Output

Scatter plots and regression diagnostics will be saved in the outputs/ folder.
The county-level heatmap will also be saved as an image in the outputs/ folder.

🗺️ Data Sources
Election Data: 
Shapefile: https://www.census.gov/cgi-bin/geo/shapefiles/ (Select year: 2020 / Select a layer type: County (and equivalent)
