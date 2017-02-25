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
"What is the city in the top 10 cities by population that has the lowest pollution (CO)?"
;

title2
"Rationale: This helps identify what is the best big city to live in if one is sensitive to pollution or have health issues affected by pollution."
;

footnote1
"Out of the higehst 10 cities in population, the lowest city in regards to CO polution was East Hartford in the United States"
;

footnote2
""
;

*Methodology: This would aggregate on the value column of the population data, and compare with the CO column of pollution data.;

proc sort data=us_ger_data out=us_ger_data_co_pop_sorted_desc;
   where CO_Mean is not missing;
   by descending population;
run;

proc sort data=us_ger_data_co_pop_sorted_desc(obs=5) out=us_ger_data_co_pop_t5;
   by CO_Mean;
run;

proc print data=us_ger_data_co_pop_t5(obs=1)
   noobs;
run;

title;
footnote;

*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
"What is the city in the bottom 10 cities by population that has the highest pollution (CO)? "
;

title2
"Rationale:  This helps identify what is the worst little city to live in if one is sensitive to pollution or have health issues affected by pollution."
;

footnote1
"Out of the lowest 10 cities in population, the highest city in regards to CO polution was Oakland in the United States"
;

*Methodology: This would aggregate on the value column of the population data, and compare with the CO column of pollution data.;

proc sort data=us_ger_data out=us_ger_data_co_pop_sorted_asc;
   where CO_Mean is not missing;
   by population;
run;

proc sort data=us_ger_data_co_pop_sorted_asc(obs=5) out=us_ger_data_co_pop_b5;
   by descending CO_Mean;
run;

proc print data=us_ger_data_co_pop_b5(obs=1)
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
"The lowest mean CO leven is in Vandenberg Air Force Base in the United States."
;

*Methodology: This would aggregate on the value column of the population data, and compare with the CO column of pollution data.;

proc sort data=us_ger_data out=us_ger_data_co_sorted;
   where CO_Mean is not missing;
   by CO_Mean;
run;

proc print data=us_ger_data_co_sorted(obs=1)
   noobs;
run;   

title;
footnote;