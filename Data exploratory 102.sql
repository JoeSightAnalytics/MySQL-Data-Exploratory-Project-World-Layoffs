-- Exploratory Data Analysis--


select *
from my_project_layoff2.layoffs_clone2;

select max(total_laid_off)
from my_project_layoff2.layoffs_clone2;

select max(total_laid_off), max(percentage_laid_off), min(total_laid_off), min(percentage_laid_off)
from my_project_layoff2.layoffs_clone2;

select *
from my_project_layoff2.layoffs_clone2
where percentage_laid_off = 1
order by country;

select *
from my_project_layoff2.layoffs_clone2
where percentage_laid_off = 0
order by country;

select *
from my_project_layoff2.layoffs_clone2
where percentage_laid_off = 1
order by funds_raised_millions desc;

select company, sum(total_laid_off)
from my_project_layoff2.layoffs_clone2
group by company
order by 2 desc;

select min(date), max(date)
from my_project_layoff2.layoffs_clone2;

select industry, sum(total_laid_off)
from my_project_layoff2.layoffs_clone2
group by industry
order by 2 desc;

select *
from my_project_layoff2.layoffs_clone2;

select country, sum(total_laid_off)
from my_project_layoff2.layoffs_clone2
group by country
order by 2 desc;


select year(date), sum(total_laid_off)
from my_project_layoff2.layoffs_clone2
group by year(date)
order by 1 desc;


select stage, sum(total_laid_off)
from my_project_layoff2.layoffs_clone2
group by stage
order by 2 desc;

select *
from my_project_layoff2.layoffs_clone2
where country = 'nigeria';

-- progression of layoffs can be gotten by using what we know as a rolling sum--

select substring(date, 6,2) 
from my_project_layoff2.layoffs_clone2;

select month(date)
from my_project_layoff2.layoffs_clone2;

select substring(date, 6,2) month, sum(total_laid_off) 
from my_project_layoff2.layoffs_clone2
group by month;



select substring(date, 1,7) month, sum(total_laid_off) 
from my_project_layoff2.layoffs_clone2
group by month
order by 1;


select substring(date, 1,7) month, sum(total_laid_off) 
from my_project_layoff2.layoffs_clone2
where substring(date, 1,7) is not null
group by month
order by 1;


select substring(date, 1,7) month, sum(total_laid_off) 
from my_project_layoff2.layoffs_clone2
where substring(date, 1,7) is not null
group by month
order by 1;

with rolling_total as(
select substring(date, 1,7) month, sum(total_laid_off) total_off
from my_project_layoff2.layoffs_clone2
where substring(date, 1,7) is not null
group by month
order by 1
)
select month, total_off, sum(total_off) over(order by month) rolling_total
from rolling_total
order by 3;

select company, year(date), sum(total_laid_off)
from my_project_layoff2.layoffs_clone2
group by company, year(date)
order by 1;


select company, year(date), sum(total_laid_off)
from my_project_layoff2.layoffs_clone2
group by company, year(date)
order by 3 desc;

with company_year (company, years, total_laid_off) as(
select company, year(date), sum(total_laid_off)
from my_project_layoff2.layoffs_clone2
group by company, year(date)
)
select *
from company_year;


with company_year (company, years, total_laid_off) as(
select company, year(date), sum(total_laid_off)
from my_project_layoff2.layoffs_clone2
group by company, year(date)
)
select *, dense_rank() over (partition by years order by total_laid_off desc) Ranking
from company_year
where years is not null
order by ranking;


with company_year (company, years, total_laid_off) as(
select company, year(date), sum(total_laid_off)
from my_project_layoff2.layoffs_clone2
group by company, year(date)
), company_year_rank as(
select *, dense_rank() over (partition by years order by total_laid_off desc) Ranking
from company_year
where years is not null
order by ranking
)
select *
from company_year_rank
where ranking <= 5;