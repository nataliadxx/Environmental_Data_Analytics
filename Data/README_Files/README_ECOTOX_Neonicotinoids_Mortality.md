# ECOTOX Neonicotinoid Dataset


## Summary
This dataset was prepared for Environmental Data Analytics (ENV 872L) at Duke University, Spring 2019

The dataset contains data from studies on several neonicotinoids and their effects on mortality of various organisms. 

## Database Information
Data were collected from the U.S. Environmental Protection Agency's ECOTOX Knowledgebase. More information can be found here: https://cfpub.epa.gov/ecotox/help.cfm

Data were collected using the Explore tool on the ECOTOX website (https://cfpub.epa.gov/ecotox/explore.cfm).
From the Explore homepage, the following selections were made: 
* Chemicals (left button)
* Neonicotinoids (check box)
* Explore Data (top right button)
* Scatterplot function (top right button)
* Effect Measurement = Mortality (drop down menu on left panel)
* Export (top right button)

csv file was saved as `ECOTOX_Neonicotinoid_Mortality_Raw.csv`. 

Data were accessed 2018-12-03.

## Data Content Information
**CAS No.** Chemical Abstracts Service (CAS) registry number

**Chemical Name** CAS collective index name

**Species Name** Scientific name (Genus species) of organism

**Common Name** Common name of organism

**Effect** Observation of a response resulting from the action of a chemical stressor. Must be provided by the author to be included in database query.

**Measurement** Is the measurement made in each study (e.g., mortality)

**Endpoint** Codes for study end point. 
* EC10, EC50: effective concentration to x % of test organisms
* ET50: effective response time to 50 % of test organisms
* LC0 through LC95: lethal concentration to x % of test organisms
* LD50, LD95, LD99: lethal dose to x % of test organisms
* LOEC: lowest observable effect concentration
* LOEL: lowest observable effect level
* LT50: time to 50 % mortality of organisms
* NOEC: no observable effect concentration
* NOEL: no observable effect level
* NR: not reported
* NR-LETH: 100 % mortality or 0 % survival of test organisms
* NR-ZERO: 0 % mortality or 100 % survival of test organisms

**Dur (Std)** Duration of exposure, in days

**Conc. Type** Concentrations based on active ingredient or formulation.

**Conc. Mean (Std)** Concentration (number)

**Conc. Units (Std)** Units for concentration

**Pub. Year** Year study was published

**Citation** Citation information for study

## Naming conventions and file formats
Files are named according to the following naming convention: `databasename_datatype_details_stage.format`, where: 

**databasename** refers to the database from where the data originated

**datatype** is a description of data 

**details** are additional descriptive details, particularly important for processed data 

**stage**refers to the stage in data management pipelines (e.g., raw, cleaned, or processed)

**format** is a non-proprietary file format (e.g., .csv, .txt)

## Additional Information and Support
For more information, please contact the data assembler, **Kateri Salk** (kateri.salk@duke.edu)