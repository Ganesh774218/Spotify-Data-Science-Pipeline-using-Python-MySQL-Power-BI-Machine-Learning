# Spotify-Data-Science-Pipeline-using-Python-MySQL-Power-BI-Machine-Learning
End-to-End Spotify Data Science Project: EDA, SQL Analytics, Power BI Dashboard &amp; ML Prediction

Spotify Hits Analysis (EDA + SQL + Power BI + ML)
An end-to-end Spotify analytics project that explores hit songs using Python, SQL, Power BI, and machine learning. The project analyzes audio features, compares genres and artists, visualizes music trends, and builds a regression model to predict song popularity.

Project Goal
To understand what characteristics are common among Spotify hit songs and whether song popularity can be predicted from available audio features.

Tools Used
Python
Pandas
NumPy
Seaborn
Plotly
MySQL / SQL
Power BI
Scikit-learn
Joblib

Dataset
Spotify hit songs dataset covering the project theme of 2000–2019.

Dataset Highlights
2,000 rows
18 columns
835 unique artists
1,879 unique songs
59 unique genres
551 explicit songs
1,449 non-explicit songs
> Note: the raw file includes a few edge-year records outside the nominal 2000–2019 framing.

Project Structure
Spotify Project/
├── Spotify EDA Project.ipynb
├── Spotify SQL file.sql
├── Spotify Prediction Model .ipynb
├── spotify power bi dashboard.pbix
├── spotify_hits_cleaned.csv
├── spotify_with_predicted_popularity.csv
└── spotify_popularity_model.pkl



Workflow
1. Python EDA
The EDA notebook:
loads the raw Spotify CSV
checks shape, data types, and duplicates
converts `explicit` to Yes/No
formats song duration
generates descriptive charts
saves a cleaned dataset as `spotify\\\_hits\\\_cleaned.csv`

2. SQL Analysis
The SQL file:
creates the database
loads the cleaned table
renames the table to `spotifyhits`
performs aggregate analysis on artists, genres, popularity, explicit songs, tempo buckets, and year-wise trends

3. Power BI Dashboard
The Power BI report contains 3 pages:
Page 1: overview cards, artist track count chart, detail table, popularity over time
Page 2: trend analysis, genre comparison, scatter relationship analysis
Page 3: tempo bucket analysis

4. Machine Learning
The ML notebook:
trains regression models to predict song popularity
compares Linear Regression, Ridge, Random Forest, and Gradient Boosting
selects Gradient Boosting as the best model
saves predictions and the trained pipeline

ML Results
Model	MAE	RMSE	R²
Gradient Boosting	14.691	21.449	0.040

Feature Importance Highlights
The most influential features in the model were:
genre_Dance/Electronic
year
acousticness
tempo
valence

Key Insights
Popularity changes across years and varies by genre.
Year and genre context are stronger predictors than many raw audio features.
Explicit songs can be compared to non-explicit songs meaningfully.
Popularity prediction is possible, but the available features explain only a small part of the variation.

Outputs
`spotify\\\_hits\\\_cleaned.csv`
`spotify\\\_with\\\_predicted\\\_popularity.csv`
`spotify\\\_popularity\\\_model.pkl`

How to Run
Open `Spotify EDA Project.ipynb` and run the cells to inspect the data and generate EDA outputs.
Run `Spotify SQL file.sql` in MySQL or another SQL environment after loading the cleaned dataset.
Open `Spotify Prediction Model .ipynb` to train the model and save prediction outputs.
Open `spotify power bi dashboard.pbix` in Power BI Desktop to view the report pages.
