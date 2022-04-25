--trend of new/total cases and deaths over time
SELECT TO_DATE(date,'YYYY-MM-DD') as dATE, new_cases, total_cases,new_deaths,total_deaths from covid_data_india
WHERE covid_data_india.continent IS NOT NULL

--cases, deaths and mortality rate over months
--monthaly_mortality_rate=total_new_cases/total_new_deaths
SELECT TO_CHAR(TO_DATE(date,'YYYY-MM-DD'), 'YYYY-MM') as MONTH,sum(new_cases) as total_new_cases_in_month, max(total_cases) as total_cases_at_EOM, 
SUM(new_deaths) as total_new_deaths_in_month, max(total_deaths) as total_deaths_at_EOM, CAST(sum(new_deaths)*100/SUM(new_cases) as FLOAT) as monthaly_mortality_rate
FROM covid_data_india
WHERE covid_data_india.continent IS NOT NULL
GROUP by MONTH
ORDER by month asc


--effect of vaccination on monthly mortality rate
SELECT TO_CHAR(TO_DATE(date,'YYYY-MM-DD'), 'YYYY-MM') as MONTHs,max(people_vaccinated) as total_people_vaccinations_at_EOM,CAST(sum(new_deaths)*100/SUM(new_cases) as FLOAT) as monthaly_mortality_rate
FROM covid_data_india
WHERE covid_data_india.continent IS NOT NULL
GROUP by MONTHs
ORDER by months asc
