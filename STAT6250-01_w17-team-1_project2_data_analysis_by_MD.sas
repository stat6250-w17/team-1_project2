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
"Which city among the top 10 cities by population has the lowest pollution (CO)?"
;

title2
"Rationale: This helps identify what is the best big city to live in if one is sensitive to pollution or have health issues affected by pollution."
;

footnote1
"Out of the highest 10 cities in population, the lowest city in regards to CO pollution was Tucson in the United States"
;

footnote2
"Future Improvements: Add graph of highest polluted cities, and show how the CO pollution compares to the lowest polluted city"
;

*
Methodology:
- proc sort order by population (highest on top), 
    then by CO_Mean (lowest on top)
- Print out the 1st item as this is the desired result
;

proc sort data=us_ger_data out=us_ger_data_co_pop_sorted_desc;
    where CO_Mean is not missing
    and population is not missing;
    by descending population;
run;

proc sort data=us_ger_data_co_pop_sorted_desc(obs=10) out=us_ger_data_co_pop_t10;
    by CO_Mean;
run;

proc print data=us_ger_data_co_pop_t10(obs=1)
    noobs;
run;

title;
footnote;

*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
"Which city among the bottom 10 cities by population has the highest pollution (CO)? "
;

title2
"Rationale:  This helps identify what is the worst little city to live in if one is sensitive to pollution or have health issues affected by pollution."
;

footnote1
"Out of the lowest 10 cities in population, the highest city in regards to CO pollution was Burbank in the United States"
;

footnote2
"Future Improvements: Add graph of lowest polluted cities, and show how the CO pollution compares to the highest polluted city"
;

*
Methodology:
- proc sort order by population (lowest on top), 
    then by CO_Mean (highest on top)
- Print out the 1st item as this is the desired result
;

proc sort data=us_ger_data out=us_ger_data_co_pop_sorted_asc;
    where CO_Mean is not missing
    and population is not missing;
    by population;
run;

proc sort data=us_ger_data_co_pop_sorted_asc(obs=10) out=us_ger_data_co_pop_b10;
    by descending CO_Mean;
run;

proc print data=us_ger_data_co_pop_b10(obs=1)
    noobs;
run;

title;
footnote;

*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
"What is the population of the lowest polluted city (CO)?"
;

title2
"Rationale: This helps identify what is the best overall city to live in if one is sensitive to pollution or have health issues affected by pollution."
;

footnote1
"The lowest CO level is in Costa Mesa in the United States which has 111918 people"
;

footnote2
"Future Improvements: Add graph of lowest polluted cities, and show how the CO pollution compares to the highest polluted city"
;


*
Methodology:
- proc sort order by CO_Mean (lowest on top)
- Print out the 1st item as this is the desired result
;

proc sort data=us_ger_data out=us_ger_data_co_sorted;
    where CO_Mean is not missing
    and population is not missing;
    by CO_Mean;
run;

proc print data=us_ger_data_co_sorted(obs=1)
    noobs;
run;

title;
footnote;