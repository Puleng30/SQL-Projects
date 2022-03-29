Select *
from CovidDeaths1$
where continent is not null
order by 3,4

Select *
from CovidVaccination1$
where continent is not null
order by 3,4 

--Selection of data I will be using

Select location, date, total_cases, new_cases, total_deaths, population
from CovidDeaths1$
where continent is not null
order by 1,2


--Looking at total cases vs total deaths .'. trying to show the chances of dying from covid, should you get it. 

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from CovidDeaths1$
where location like '%africa%' AND continent is not null
order by 1,2


-- Looking at total cases vs population to show what percentage of the population got covid

Select location, date, total_cases, population, (total_cases/population)*100 as PopulationPercentage
from CovidDeaths1$
where location like '%africa%' AND continent is not null
order by 1,2

-- Looking at countries with highest infection rate vs its population

Select location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PopulationPercentage
from CovidDeaths1$
--where location like '%africa%'
where continent is not null
Group by location, population
order by PopulationPercentage desc

-- Shows contries with highest death count per population

Select location, MAX(total_deaths) as TotalDeathCount 
from CovidDeaths1$
--where location like '%africa%'
where continent is not null
Group by location
order by TotalDeathCount desc

--Breaking the data by continent --Showing continets with the higherst death count per population

Select continent, MAX(cast(total_deaths as int)) as TotalDeathCount 
from CovidDeaths1$
--where location like '%africa%'
where continent is not null
Group by continent
order by TotalDeathCount desc


-- Looking at total populstion vs vaccinations

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, convert(bigint, new_vaccinations)
from CovidDeaths1$ dea
join CovidVaccination1$ vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null 
order by 2,3

