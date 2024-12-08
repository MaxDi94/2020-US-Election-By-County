SELECT c.state,
       c.party,
       c.county_name,
       c.county_fips,
       c.candidate,
       SUM(c.candidatevotes) AS candidatevotes,  -- Sum candidate votes
       SUM(c.totalvotes) AS totalvotes,          -- Sum total votes
       CAST(SUM(c.candidatevotes) AS DECIMAL(18, 2)) / NULLIF(CAST(SUM(c.totalvotes) AS DECIMAL(18, 2)), 0) * 100 AS voteshare,
       p.PCTPOVALL_2021 AS poverty_rate,
       u.Unemployment_rate_2020,
       e.Percent_of_adults_with_less_than_a_high_school_diploma_2018_22 AS less_HS,
       e.Percent_of_adults_with_a_high_school_diploma_only_2018_22 AS HS,
       e.Percent_of_adults_with_a_bachelor_s_degree_or_higher_2018_22 AS bachelor,
       pop.R_INTERNATIONAL_MIG_2021 AS int_mig,
       pop.R_NET_MIG_2021 AS total_mig,
       pop.Rural_Urban_Continuum_Code_2023 AS rucc
FROM elec_county.dbo.countypres AS c
LEFT JOIN elec_county.dbo.poverty AS p ON c.county_fips = p.FIPS_Code
LEFT JOIN elec_county.dbo.unemployment AS u ON c.county_fips = u.FIPS_Code
LEFT JOIN elec_county.dbo.Education AS e ON c.county_fips = e.FIPS_Code
LEFT JOIN elec_county.dbo.PopulationEstimates AS pop ON c.county_fips = pop.FIPStxt
WHERE c.year = 2020
GROUP BY c.state, c.party, c.county_name, c.county_fips, c.candidate, c.year, p.PCTPOVALL_2021, u.Unemployment_rate_2020,
         e.Percent_of_adults_with_less_than_a_high_school_diploma_2018_22,
         e.Percent_of_adults_with_a_high_school_diploma_only_2018_22,
         e.Percent_of_adults_with_a_bachelor_s_degree_or_higher_2018_22,
         pop.R_INTERNATIONAL_MIG_2021, pop.R_NET_MIG_2021,
         pop.Rural_Urban_Continuum_Code_2023
ORDER BY c.year, c.county_fips;
