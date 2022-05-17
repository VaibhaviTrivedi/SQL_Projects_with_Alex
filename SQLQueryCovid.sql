
-- Imported data from Excel File. However it copied 115250 rows instead of original 185435 rows in the excel file. 
-- Therefore decided to import flat file csv and checked the data type while importing. It imported all rows and columns. Yay!

select *
from covid_deaths
order by 3,4

--select * 
--from covid_vaccinations
--order by 3,4

-- Select Data that we are going to be using

Select location, date, total_cases, new_cases, total_deaths, population
From covid_deaths
order by 1,2


-- Looking at country wise total cases during 2020 and 2021

select location, sum(total_cases) as TotalCases
from covid_deaths
where date between '2020-01-01' and '2021-12-31'
	and continent is not null
group by location
order by TotalCases desc


-- Looking at Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract Covid a particular country
Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From covid_deaths
where location like '%state%'
order by 1,2

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From covid_deaths
where location = 'Canada'
order by 1,2


-- Looking at Total Cases vs Population
-- Shows what percentage of population got Covid

Select location, date, total_cases, population, (total_cases/population)*100 as PercentPopulationInfected
From covid_deaths
--where location like '%state%'
where date between '2020-01-01' and '2021-12-31'
	and continent is not null
order by 1,2


-- Looking at Countries with Highest Infection Rate compared to Population in 2020 & 2021

Select location, population, MAX(Total_Cases) AS HighestInfectionCount, 
	MAX(total_cases/population)*100 as PercentPopulationInfected
From covid_deaths
--where location like '%state%'
Where Date BETWEEN '2020-01-01' AND '2021-12-31'
	and continent is not null
Group by location, population
Order by PercentPopulationInfected desc


-- Showing countries with Highest Death Count per population

Select location, population, max(cast(total_deaths as int)) as TotalDeathCount
--,max((cast (total_deaths as int))/(cast (population as int)))*100 as PercentDeath
from covid_deaths
-- where location like '%state%'
where date between '2020-01-01' and '2021-12-31' 
	and continent is not null
Group by location, population
order by PercentDeath desc

select * from covid_deaths

