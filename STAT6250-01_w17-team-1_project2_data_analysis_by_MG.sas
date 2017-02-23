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

title2"Rationale: The purpose of this analysis is try to identify the relationship of population to NO2 levels between the two countries."
;

footnote1"There was no correlation/relationship between the population and NO2 levels for either country."
;

footnote2"Using a significance value of .05, both p-values were signficantly higher than the designated significance value. Therefore, we conclude there is no correlation between population and NO2 values for either country."
;

*Methodology: Correlation analysis was performed for each country to analyze the relationship the population to NO2.;

proc corr data=us_ger_data;
	var population NO2_mean;
	where country="United States of America";
run;

proc corr data=us_ger_data;
	var population NO2_mean;
	where country="Germany";
run;

title;
footnote;

*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1"Is the difference in NO2 levels between the United States and Germany significant?"
;

title2"Rationale: The purpose of this question is to identify if the difference in NO2 levels between the two countries are actually meaningful and better understand the difference between the two means. If it is significantly different, additional analysis can be conducted to better understand why and how their respective country can better control NO2 emissions."
;

footnote1"The two sample t-test results show the difference in means between the two countries are significant. The United States has a statistically significant lower NO2 levels compared to Germany."
;

footnote2"I was surprised at these results. Germany is known to have more stringent emissions requirements than the US. Further analysis is needed to identify if their regulations focuses on a specific type of emissions like CO2 vs NO2."
;

*Methodology: PROC TTEST was used to perform the two sample t-test.;

proc ttest data=us_ger_data cochran ci=equal umpu;
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

title2"Rationale: The purpose of this question is to get better picture of pollution levels in 2012 between the two countries."
;

footnote1"Germany had higher average NO2 and O3 levels than the United States."
;

footnote2"Possible follow include collecting more data from the United States and to perform a two sample t-test for O3 also."
;

*Methodology: PROC MEANS was used to identify the average NO2 and O3 levels for both countries.;

proc means data=us_ger_data noobs;
var NO2_mean;
where country="United States of America";
run;

proc means data=us_ger_data noobs;
var NO2_mean;
where country="Germany";
run;

proc means data=us_ger_data noobs;
var O3_mean;
where country="United States of America";
run;

proc means data=us_ger_data noobs;
var O3_mean;
where country="Germany";
run;

title;
footnote;