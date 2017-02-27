Skip to content
This repository
Search
Pull requests
Issues
Gist
 @mgutierrez67-stat6250
 Sign out
 Watch 0
  Star 0
 Fork 0 stat6250/team-1_project2
 Code  Issues 0  Pull requests 0  Projects 0  Wiki  Pulse  Graphs
Branch: master Find file Copy pathteam-1_project2/STAT6250-01_w17-team-1_project2_data_analysis_by_MG.sas
a3914eb  24 minutes ago
@MarkGuutz MarkGuutz Revised data prep file with assignment feedback
2 contributors @MarkGuutz @mgutierrez67-stat6250
RawBlameHistory     
152 lines (114 sloc)  5.49 KB
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

footnote1"There was small to little correlation/relationship between the population and NO2 levels for either country."
;

footnote2"Using a significance value of .05, both p-values were higher than the designated significance value. We can conclude there is little correlation between population and NO2 values for either country."
;

footnote3"Future analysis could include identifying correlations for SO2, O3, and CO to population. This will help to identify which emission type(s) is influenced by population the most and identify reasons for the correlation."
;

*
Note: This calculates the correlation coefficients of using each country's respective population and average NO2 by city. The correlation coefficients of each country will be compared to see the relationship of NO2 to population for each country.
Methodology: Correlation analysis using PROC CORR was performed for each country to analyze the relationship of population to NO2.;

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

title2"Rationale: The purpose of this question is to identify if the difference in NO2 levels between the two countries are actually meaningful and better understand the difference between the two means."
;

title3 "If it is significantly different, additional analysis can be conducted to better understand how their respective country is handling NO2 emissions."
;

footnote1"The two sample t-test results show the difference in means between the two countries are significant. The United States has a statistically significant lower NO2 levels compared to Germany."
;

footnote2"These resuts were surprising. Germany is known to have more stringent emissions requirements than the US. Further analysis is needed to identify if their regulations focuses on a specific type of emissions like CO2 vs NO2."
;

*
Note: The two sample t-test will identify the significance of the NO2 mean difference between the countries and its significance level.
Methodology: PROC TTEST was used to perform the two sample t-test.;

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

title2"Rationale: The purpose of this question is to better understand pollution levels in 2012 between the two countries."
;

footnote1"Germany had a higher average NO2 and O3 levels than the United States."
;

footnote2"Future analysis could include collecting more data from the United States and to perform a two sample t-test for O3."
;

*
Note: The mean for NO2 and O3 will be calculated for each country using PROC Means.
Methodology: PROC MEANS was used to identify the average NO2 and O3 levels for both countries.;

proc means data=us_ger_data nonobs;
var NO2_mean;
where country="United States of America";
run;

proc means data=us_ger_data nonobs;
var NO2_mean;
where country="Germany";
run;

proc means data=us_ger_data nonobs;
var O3_mean;
where country="United States of America";
run;

proc means data=us_ger_data nonobs;
var O3_mean;
where country="Germany";
run;

title;
footnote;