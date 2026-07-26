# Content-Based Book Recommendation System

A book recommendation engine that suggests titles based on genre similarity, 
weighted by community ratings.

## Overview
This project analyzes a dataset of ~52,000 books from Goodreads' "Best Books Ever" 
list, cleans and explores the data, then builds a content-based recommender that:
- Encodes book genres using multi-label one-hot encoding
- Computes cosine similarity between books based on genre overlap
- Ranks recommendations by combining similarity score with each book's average rating

## Approach
1. **Data Cleaning**: handled missing values, fixed data types (price, ratings), parsed publish dates
2. **Exploratory Data Analysis**: rating distributions, top genres, top authors, price-rating relationships
3. **Recommendation Engine**: one-hot encoded genres, computed cosine similarity on a sampled 10,000 books, ranked by similarity × rating
4. **Output**: given a genre (e.g. "Fantasy"), returns the top N recommended books

## Tech Stack
Python · Pandas · NumPy · Scikit-learn · Matplotlib · Seaborn

## Dataset
[Goodreads Best Books Ever (Kaggle)](https://www.kaggle.com/datasets/arnabchaki/goodreads-best-books-ever) 
— download and place `books_1.Best_Books_Ever.csv` in this folder to run the notebook.

## Possible Extensions
- Add true collaborative filtering using a user-item ratings dataset
- Deploy as an interac
-
## Example Output
Calling `hybrid_recommend_by_genre('Fantasy', df_sampled, similarity_matrix_sampled, top_n=10)` returns:

| Title | Author | Rating |
|---|---|---|
| Stormlight Archive 4 Book Set | Brandon Sanderson | 4.81 |
| Consequences: Opal & Origin | Jennifer L. Armentrout | 4.63 |
| A Ride of Peril | Bella Forrest | 4.60 |
| Vampire Academy | Richelle Mead | 4.52 |
-
-
-
- tive web app for live recommendations
