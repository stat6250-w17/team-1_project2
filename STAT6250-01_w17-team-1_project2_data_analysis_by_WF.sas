
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
%setup;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
"What is the city in the top 5 cities by population that has the lowest SO2?"
;

title2
"Rationale: SO2 can affect both health and the environment.This analysis helps identify what is the best big city to live in.."
;

footnote1
"Out of the top 5 cities in population, the city in regards to having lowest SO2 pollution was Tucson in the United States"
;

footnote2
"Future Improvements: Add graph of highest polluted cities, and show how the SO2 pollution compares to the lowest polluted city"
;

*
Methodology:
- proc sort order by population (highest on top),  
    then by SO2_Mean (lowest on top)
- Print out the 1st item as this is the desired result
;

proc sort data=us_ger_data out=us_ger_data_so2_pop_sorted_desc;
    where SO2_Mean is not missing
    and population is not missing;
    by descending population;
run;

proc sort data=us_ger_data_so2_pop_sorted_desc(obs=5) out=us_ger_data_so2_pop_t5;
    by SO2_Mean;
run;

proc print data=us_ger_data_so2_pop_t5(obs=1)
    noobs;
run;

title;
footnote;

*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
"Which is the city in the bottom 5 cities by population that has highest SO2? "
;

title2
"Rationale:  SO2 can affect both health and the environment.This analysis helps identify what is the worst small city to live in..."
;

footnote1
"Out of the bottom 5 cities in population, the city in regards to having highest SO2 pollution was Wilmington in the United States"
;

footnote2
"Future Improvements: Add graph of lowest polluted cities, and show how the SO2 pollution compares to the highest polluted city"
;

*
Methodology:
- proc sort order by population (lowest on top), 
    then by SO2_Mean (highest on top)
- Print out the 1st item as this is the desired result
;

proc sort data=us_ger_data out=us_ger_data_so2_pop_sorted_asc;
    where SO2_Mean is not missing
    AND population is not missing; 
    by population;
run;

proc sort data=us_ger_data_so2_pop_sorted_asc(obs=5) out=us_ger_data_so2_pop_b5;
    by Descending SO2_Mean;
run;

proc print data=us_ger_data_so2_pop_b5(obs=1)
    noobs;
run;

title;
footnote;

*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
"What is the population of the city that has lowest SO2?"
;

title2
"Rationale: SO2 can affect both health and the environment.This analysis helps identify what is the best overall city to live in..."
;

footnote1
"The city that has lowest SO2 level is Des Miones in the United States, which has population of 206,688."
;

footnote2
"Future Improvements: Add graph of lowest polluted cities, and show how the SO2 pollution compares to the highest polluted city"
;


*
Methodology:
- proc sort order by SO2_Mean (lowest on top)
- Print out the 1st item as this is the desired result
;

proc sort data=us_ger_data out=us_ger_data_so2_sorted;
    where SO2_Mean is not missing 
    AND SO2_Mean > 0
    AND population is not missing;
    by SO2_Mean;
run;

proc print data=us_ger_data_so2_sorted(obs=1)
    noobs;
run;

title;
footnote;
