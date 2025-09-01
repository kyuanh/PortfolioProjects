Select *
From PortfolioProject..CovidDeaths
Where continent is not null
order by 3,4

--Select *
--From PortfolioProject..CovidVaccinations
--order by 3,4

-- Select Data that we are going to be using

Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..CovidDeaths
Where continent is not null
order by 1,2

-- Looking at total cases vs total deaths
-- Shows likelihood of dying if you contract covid in US
Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Where location like '%states%' and
and continent is not null
order by 1,2

-- Looking at total cases vs population
-- shows what percentage of the population got covid 

Select Location, date, Population, total_cases, (total_cases/population)*100 as PercentageAffected
From PortfolioProject..CovidDeaths
Where location like '%states%'
and continent is not nullorder by 1,2

-- What country has the highest infection rate compared to population
Select Location, population, MAX(total_cases) as HIghestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
group by location, population
order by PercentPopulationInfected desc
 
 -- LET'S BREAK THINGS DOWN BY CONTINENT
 Select location, MAX(cast(Total_deaths as int)) as TotalDeathCount
 From PortfolioProject..CovidDeaths
 Where continent is null
 Group by location
 Order by TotalDeathCount desc

 -- Countries with highest death rate per population
 Select Location, MAX(cast(total_deaths as int)) as TotalDeathCount 
 From PortfolioProject..CovidDeaths
 Where continent is not null
 Group by location
 order by TotalDeathCount desc

 -- Showing the continents with the highest death count
  Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
 From PortfolioProject..CovidDeaths
 Where continent is not null
 Group by continent
 Order by TotalDeathCount desc

-- Global numbers
Create View GlobalNumbers as 
Select SUM(new_cases) as TotalCases, SUM(cast(new_deaths as int)) as TotalDeaths, SUM(cast(new_deaths as int))/SUM(New_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Where continent is not null
--Group by date
--order by 1,2

-- Looking at total populations vs vaccinations
Select da.continent, da.location, da.date, da.population, va.new_vaccinations, SUM(CONVERT(int,va.new_vaccinations)) OVER (Partition by da.location Order by da.location, da.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths da
Join PortfolioProject..CovidVaccinations va
	On da.location = va.location
	and da.date = va.date
	where da.continent is not null
order by 2,3

-- Use CTE
With PopvsVac (Continent, Location, date, population, New_Vaccinations, RollingPeopleVaccinated)
as 
(
Select da.continent, da.location, da.date, da.population, va.new_vaccinations, SUM(CONVERT(int,va.new_vaccinations)) OVER (Partition by da.location Order by da.location, da.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths da
Join PortfolioProject..CovidVaccinations va
	On da.location = va.location
	and da.date = va.date
	where da.continent is not null
--order by 2,3
)
Select *,(RollingPeopleVaccinated/Population)*100
From PopvsVac

-- Temp Table
DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
new_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert Into #PercentPopulationVaccinated
Select da.continent, da.location, da.date, da.population, va.new_vaccinations, SUM(CONVERT(int,va.new_vaccinations)) OVER (Partition by da.location Order by da.location, da.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths da
Join PortfolioProject..CovidVaccinations va
	On da.location = va.location
	and da.date = va.date
	where da.continent is not null
--order by 2,3

Select *,(RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated

-- Creating view to store data for later visualizations
Create View PercentPopulationVaccinated as
Select da.continent, da.location, da.date, da.population, va.new_vaccinations, SUM(CONVERT(int,va.new_vaccinations)) OVER (Partition by da.location Order by da.location, da.date) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths da
Join PortfolioProject..CovidVaccinations va
	On da.location = va.location
	and da.date = va.date
	where da.continent is not null
--order by 2,3

SELECT *
FROM PercentPopulationVaccinated

