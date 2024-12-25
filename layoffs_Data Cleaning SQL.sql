



-- Data cleaning
select*
from layoffs;
-- 1. Removing duplicates
-- 2. Standardize the data > 
-- 3. Null values or blank values 
-- 4. Remove irrelevent columns 

CREATE TABLE c_staging
like layoffs;

select*
from layoffs_staging;

INSERT layoffs_staging
SELECT*
FROM  layoffs;

-- Checking the duplicates
SELECT *,
       ROW_NUMBER() OVER (
           PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'data',stage, country,funds_raised_millions
       ) AS row_num
FROM layoffs_staging;
WITH duplicate_cte AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'data'
           ) AS row_num
    FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;



select*
from layoffs_staging
where company= 'casper';



WITH duplicate_cte AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'data', stage, country, funds_raised_millions
           ) AS row_num
    FROM layoffs_staging
)
delete
FROM duplicate_cte
WHERE row_num > 1;



















CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select*
from layoffs_staging2
where row_num>1;

select*
from layoffs_staging2;
insert into  layoffs_staging2
SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'data', stage, country, funds_raised_millions
           ) AS row_num
    FROM layoffs_staging;
SET SQL_SAFE_UPDATES = 0;

DELETE FROM layoffs_staging2
WHERE row_num > 1;

SET SQL_SAFE_UPDATES = 1; -- Re-enable safe update mode (optional)

DELETE FROM layoffs_staging2
WHERE row_num > 1 ;



select*
from layoffs_staging2;


-- standardizing data  and it's a finding issues in your data
select company, trim(company)
from  layoffs_staging2;
update  layoffs_staging2
set company = trim(company);

select distinct(industry)
from  layoffs_staging2
order by 1;

select*
from  layoffs_staging2
where industry like 'Crypto%';

update layoffs_staging2
set industry= 'Crypto'
where industry like 'Crypto%';


select distinct  industry
from layoffs_staging2
;


select distinct location 
from layoffs_staging2
order by 1;

select distinct country 
from layoffs_staging2
order by 1;
-- standardization
select distinct country, trim(trailing '.' from country)    # just removing the dot(.) symbol
from layoffs_staging2
order by 1
;
-- updating the date 
SELECT `date`, str_to_date(`date`,'%m/%d/%Y') 
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y')
WHERE `date` LIKE '%/%/%';

## i have an issue here when it comes the date update i will be back this part 

SELECT `date`
FROM layoffs_staging2;





-- 3. working on Null blank values 
select* 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;
update layoffs_staging2
set industry= null
where industry='';

select*
from layoffs_staging2
where industry is null 
or  industry = '';

select*
from layoffs_staging2
where company like'Bally%'
;





select t1.industry , t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
   on t1.company= t2.company
   and t1.location= t2.location
   where (t1.industry is null or t1.industry='')
   and t2.industry is  not null;
-- update 
update layoffs_staging2 t1
join layoffs_staging2 t2
   on t1.company= t2.company
set t1.industry= t2.industry
 where t1.industry is null 
   and t2.industry is  not null;
   
   
   select*
   from layoffs_staging2;
   
select* 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

delete 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;


  select*
   from layoffs_staging2
   ;
   
   
   -- we gonna delete row numb column
   alter  table layoffs_staging2
   drop column row_num;
   
   -- i have done this project only changing the date fomrat is remainded 
   -- 1. Remove duplicates
   -- 2. standardise the data
   -- 3. Null values or blan values 
   -- 4. Remove any column rows 
   
   
   
   