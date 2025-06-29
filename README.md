# MySQL-Data-Exploratory-Project-World-Layoffs
# Exploratory Data Analysis: World Layoffs Dataset (MySQL)

This repository contains SQL queries and scripts for performing exploratory data analysis (EDA) on the cleaned world layoffs dataset using MySQL. The analysis aims to uncover trends, distributions, and key insights from the layoffs data after the data cleaning process.

## Overview

The EDA focuses on summarizing and visualizing important aspects of the layoffs data, such as:

- Maximum and minimum layoffs and percentages
- Companies and industries most affected by layoffs
- Temporal trends in layoffs (monthly, yearly)
- Layoff distributions by country and stage
- Rolling totals and progression of layoffs over time
- Company-level breakdowns by year

## Getting Started

### Prerequisites

- MySQL Server
- A database schema named `my_project_layoff2` with the `layoffs_clone2` table already cleaned and populated (see [Data cleaning 102.sql](../Data%20cleaning%20102.sql))

### Usage

1. **Import the Cleaned Data:**  
   Ensure the `layoffs_clone2` table is present in your `my_project_layoff2` schema.

2. **Run the Exploratory Script:**  
   Execute the SQL queries in [`Data exploratory 102.sql`](./Data%20exploratory%20102.sql) step by step or as a batch in your preferred MySQL client.

3. **Analyze the Results:**  
   Review the output of each query to gain insights into the layoff trends, distributions, and patterns within your data.

## Contents

- [`Data exploratory 102.sql`](./Data%20exploratory%20102.sql):  
  Contains the full set of EDA queries for the world layoffs dataset.

## Key Analytical Steps

- **Summary Statistics:**  
  Find max/min layoffs, percentages, and relevant outliers.
- **Group Analysis:**  
  Examine layoffs by company, industry, country, and stage.
- **Time Series Analysis:**  
  Monthly/yearly trends and rolling sums of layoffs.
- **Ranking and Top Performers:**  
  Identify top affected companies per year using SQL ranking functions.

## Author

- [JoeSightAnalytics](https://github.com/JoeSightAnalytics)

---

Feel free to suggest improvements or contribute further analyses!
