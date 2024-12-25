# Layoffs_SQl-Data-Cleaning-EDA

# Data Overview
The dataset provides information on layoffs in various companies from 2020 to 2023. It captures details about companies, their locations, industries, and layoff trends during this period. The dataset is useful for analyzing trends in layoffs, identifying industries most affected, and understanding the scale and distribution of workforce reductions globally.

# Description of Dataset
company:	The name of the company that conducted layoffs.
location:	The city or region where the layoffs occurred.
industry:	The sector or industry to which the company belongs (e.g., Tech, Finance).
total_laid_off:	The total number of employees laid off by the company.
percentage_laid_off	:The percentage of the company’s workforce laid off (if available).
date:	The date when the layoffs were reported or announced (formatted as YYYY-MM-DD).
stage	:The company’s funding or operational stage (e.g., Startup, Growth, Late).
country:	The country where the company is headquartered or layoffs occurred.
funds_raised_millions:	The total funding raised by the company (in millions of USD).

# Data Cleaning Steps for the Layoffs Dataset (2020-2023)
1. Loaded the Dataset: Imported the raw layoffs dataset into the database for processing and analysis.

2. Removed Duplicates: Identified and deleted duplicate rows based on key columns such as company, location, industry, and total_laid_off.

3. Standardized Data:

Trimmed unnecessary spaces in text fields (e.g., company, industry).
Unified values in categorical fields (e.g., normalized variations like "CryptoTech" to "Crypto").
Removed special characters (e.g., trailing dots in country values).

4. Handled Missing Values:

Replaced empty or invalid entries in categorical fields with NULL.
Updated missing values in numerical fields (total_laid_off, percentage_laid_off) where possible or removed rows with critical data missing.
Formatted Dates: Standardized the date field into a uniform YYYY-MM-DD format and corrected any invalid dates.

5. Removed Irrelevant Columns: Dropped unnecessary fields (e.g., row_num) that were not required for analysis.

6. Validated Cleaned Data:

Checked unique and distinct values across fields (e.g., industry, country) to confirm consistency.
Ensured numerical values were within logical ranges.
Saved the Cleaned Dataset: Exported the final cleaned dataset, ready for analysis or visualization.
