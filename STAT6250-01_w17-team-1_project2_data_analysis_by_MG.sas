*******************************************************************************;
**************** 80-character banner for column width reference ***************;
*******************************************************************************;
*
This file uses the following analytic dataset to address several research
questions regarding the potential relationship of various emission particles to 
population in the United States and Germany.

Dataset Name: us_ger_data created in external file

STAT6250-01_w17-team-1_project2_data_preparation.sas, which is assumed to be
in the same directory as this file.

See included file for dataset properties.
;

* environmental setup;
%let dataPrepFileName = STAT6250-01_w17-team-1_project2_data_preparation.sas;
%let sasUEFilePrefix = team-1_project2;

* load external file that generates analytic dataset us_ger_data
using a system path dependent on the host operating system, after setting the
relative file import path to the current directory, if using Windows;
%macro setup;
    %if
        &SYSSCP. = WIN
    %then
        %do;
            X
            "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))"""
            ;           
            %include ".\&dataPrepFileName.";
        %end;
    %else
        %do;
            %include "~/&sasUEFilePrefix./&dataPrepFileName.";
        %end;
%mend;
%setup


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1"What is the correlation of NO2 to population in the US versus Germany?"
;

title2"Rationale: The purpose of this analysis is try to identify the relationship of population to average NO2 levels in cities between the two countries."
;

footnote1"There was little correlation/relationship between the population and NO2 levels for either country."
;

footnote2"Using a significance value of .05, Germany's correlation p-value was .24 and the US's correlation p-vaue was .16. Bothe were higher than the designated significance value. We can conclude there is little correlation between population and average NO2 values for cities in both countries."
;

footnote3"Future analysis could include identifying correlations for SO2, O3, and CO to population. This will help to identify which emission type(s) is influenced by population the most and identify reasons for the correlation."
;

*
Note: This calculates the correlation coefficients of using each country's 
respective population and average NO2 by city. The correlation coefficients of 
each country will be compared to see the relationship of NO2 to population for 
each country.

Methodology: Correlation analysis using PROC CORR was performed for each country 
to analyze the relationship of population to NO2.;

title3"US: Population to NO2 Correlation";

proc corr data=us_ger_data;
	var population NO2_mean;
	where country="United States of America";
run;

title3"Germany: Population to NO2 Correlation";

proc corr data=us_ger_data;
	var population NO2_mean;
	where country="Germany";
run;

title;
footnote;

*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1"Is the difference in average NO2 levels between cities in the United States and Germany significant?"
;

title2"Rationale: The purpose of this question is to identify if the difference in average city NO2 levels between the two countries are actually meaningful and better understand the difference between the two means."
;

title3 "If it is significantly different, additional analysis can be conducted to better understand how their respective country is handling NO2 emissions."
;

footnote1"The two sample t-test resulted in P values less than .001 (lower than the significance value of .05). This can be interpreted as cities in the United States having a statistically significant lower NO2 levels compared to cities in Germany."
;

footnote2"The distribution of NO2 means in Germany was normally distributed versus U.S. not being normally distribution "
;

footnote3"These resuts were surprising. Germany is known to have more stringent emissions requirements than the US. Further analysis is needed to identify if their regulations focuses on a specific type of emissions like CO2 vs NO2."
;

*
Note: The two sample t-test will identify the significance of the NO2 mean 
difference between the countries and its significance level.

Methodology: PROC TTEST was used to perform the two sample t-test.;

proc ttest data=us_ger_data cochran;
	class country;
	var NO2_mean;
run;

title;
footnote;

*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1"What are the average NO2 and O3 levels for the US and Germany?"
;

title2"Rationale: The purpose of this question is to better understand pollution levels in 2012 between the two countries."
;

footnote1"Cities in Germany on average had higher average NO2 (34) and O3 (106) levels than the United States (NO2: 11 O3: 27)."
;

footnote2"Future analysis could include collecting more data from the United States and to perform a two sample t-test for O3."
;

*
Note: The mean for NO2 and O3 will be calculated for each country using PROC 
Means.

Methodology: PROC MEANS was used to identify the average NO2 and O3 levels for 
both countries.;

proc means data=us_ger_data nonobs;
	class country;
	var NO2_Mean O3_mean;
run;

title;
footnote;