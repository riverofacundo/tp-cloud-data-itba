-- Crear la tabla WorldBank
CREATE TABLE WorldBank (
    Country_Name VARCHAR(255),
    Country_Code VARCHAR(3),
    Region VARCHAR(255),
    IncomeGroup VARCHAR(255),
    Year INT,
    Birth_rate_crude FLOAT,
    Death_rate_crude FLOAT,
    Electric_power_consumption FLOAT,
    GDP NUMERIC,
    GDP_per_capita NUMERIC,
    Individuals_using_Internet FLOAT,
    Infant_mortality_rate FLOAT,
    Life_expectancy_at_birth FLOAT,
    Population_density FLOAT,
    Unemployment FLOAT,
    PRIMARY KEY (Country_Code, Year)
);

-- Crear la tabla hdi
CREATE TABLE hdi (
    iso3 VARCHAR(200),
    country VARCHAR(255),
    hdicode VARCHAR(10),
    hdi_rank_2021 INT,
    PRIMARY KEY (iso3)
);


