*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
[Dataset 1 Name] us12pop

[Dataset Description] 2012 City Population in US

[Experimental Unit Description] US cities

[Number of Observations] 284

[Number of Features] 11

[Data Source] http://data.un.org/Data.aspx?d=POP&f=tableCode%3A240
This dataset was downloaded from United Nations website. The site allows the user to customize the data that is needed and download a CSV file.

[Data Dictionary]
	Country or Area – Country: Name of country or area
	
	Year: 2012
	
	Area: Area of city surveyed
	
	Sex: Population figures accounts for males, females, or both
	
	City: Name of city (abbreviation of state)
	
	City type: Type of city boundary used to calculate population
	
	Record Type: Population estimate type
	
	Reliability: Confirmation of final population figures
	
	Source Year: Year of confirmed population figure
	
	Value: Population value
	
	Value Footnotes: 1 – Population statistics are compiled from registrars, 2 – Statistics are compiled from registrars

[Unique ID Schema] The columns “Country” and “City” form a composite key which aligns 
with the composite keys in German population, German O3 & NO2 pollution, and in US 
pollution datasets. 

--

[Dataset 2 Name] ger12pop

[Dataset Description] 2012 City Population in Germany

[Experimental Unit Description] German cities

[Number of Observations] 240

[Number of Features] 11

[Data Source] http://data.un.org/Data.aspx?d=POP&f=tableCode%3A240
This dataset was downloaded from United Nations website. The site allows the user to customize the data that is needed and download a CSV file.

[Data Dictionary]

    Country or Area – Country: Name of country or area

	Year: 2012
	
	Area: Area of city surveyed
	
	Sex: Population figures accounts for males, females, or both
	
	City: Name of city
	
	City type: Type of city boundary used to calculate population
	
	Record Type: Population estimate type
	
	Reliability: Confirmation of final population figures
	
	Source Year: Year of confirmed population figure
	
	Value: Population value
	
	
	Value Footnotes: 1 – Population statistics are compiled from registrars, 2 – Statistics are compiled from registrars

[Unique ID Schema] The columns “Country” and “City” form a composite key which aligns 
with the composite keys in German population, German O3 & NO2 pollution, and in US 
pollution datasets.

--

[Dataset 3 Name] us12pol

[Dataset Description] 2012 Pollution for US Cities

[Experimental Unit Description] Pollution data collected on a specific date and location

[Number of Observations] 128,203

[Number of Features] 29

[Data Source] https://www.kaggle.com/sogun3/uspollution

[Data Dictionary]
	Observation: Unique ID for dataset
	
	County Code: The code of counties in a specific state allocated by US EPA
	
	Site Num: The site number in a specific county allocated by US EPA
	
	Address: Address of monitoring site
	
	Country: Country of monitoring site
	
	State: State of monitoring site
	
	County City: City of monitoring site
	
	Date Local: Date of monitoring
	
	NO2 Units: Units measured for NO2
	
	NO2 Mean: Arithmetic mean of concentration of NO2 on a given day
	
	NO2 1st Max Value: The maximum value obtained for NO2 concentration on a given day
	
	NO2 1st Max Hour: The hour when the maximum NO2 concentration was recorded in a given day
	
	NO2 AQI: The calculated air quality index of NO2 within a given day
	
	O3 Units: Units measured for O3
	
	O3 Mean: Arithmetic mean of concentration of O3 on a given day
	
	O3 1st Max Value: The maximum value obtained for O3 concentration on a given day
	
	O3 1st Max Hour: The hour when the maximum O3 concentration was recorded in a given day
	
	O3 AQI: The calculated air quality index of O3 within a given day
	
	SO2 Units: Units measured for SO2
	
	SO2 Mean: Arithmetic mean of concentration of SO2 on a given day
	
	SO2 1st Max Value: The maximum value obtained for SO2 concentration on a given day
	
	SO2 1st Max Hour: The hour when the maximum SO2 concentration was recorded in a given day
	
	SO2 AQI: The calculated air quality index of SO2 within a given day
	
	CO Units: Units measured for CO
	
	CO Mean: Arithmetic mean of concentration of CO on a given day
	
	CO 1st Max Value: The maximum value obtained for CO concentration on a given day
	
	CO 1st Max Hour: The hour when the maximum CO concentration was recorded in a given day
	
	CO AQI: The calculated air quality index of CO within a given day 

[Unique ID Schema] The column “Observation” is a unique ID. After identifying the average 
pollution level by city the new composite key will be city, state, and country.
In order to merge tables with the other data sets.

--

[Dataset 4 Name] ger12pol

[Dataset Description] 2012 NO2 Pollution for Germany

[Experimental Unit Description] European station

[Number of Observations] NO2_station_statistics tab: 211

[Number of Features] 11

[Data Source] http://www.eea.europa.eu/data-and-maps/data/air-pollutant-concentrations-at-station/#tab-based-on-data

This dataset was downloaded from the European Environment Agency. Only pollution data from 2012 was used. 
Cities with characters disallowed in SAS were reformatted. Measurement_unit column was removed prior to use in SAS
due to characters disallowed in SAS and was also not needed for analysis.

[Data Dictionary]
    country_iso_code: Country
	
	city_name: City
	
	station_european_code: European station code
	
	type_of_station: Pollution measurement station type
	
	station_type_of_area: Station type/location
	
	component_caption: Air pollutant airbase code
	
	component_name: Air polluting substance
	
	statistics_year: Year pollution data collected
	
	statistic_value: Value
	
	measurement_unit: Measurement unit
	
	above_TV?: Binary (1 = yes, 0 = no) if above target value

[Unique ID Schema] The column “station_european_code” is a unique ID. After 
identifying the average NO2 pollution level by city the new composite key will 
be city and country. This is necessary in order to merge tables with the other  
data sets.

--

[Dataset 5 Name] ger12pol

[Dataset Description] 2012 O3 Pollution for Germany

[Experimental Unit Description] European station

[Number of Observations] O3_station_statistics tab: 100

[Number of Features] 11

[Data Source] http://www.eea.europa.eu/data-and-maps/data/air-pollutant-concentrations-at-station/#tab-based-on-data
This dataset was downloaded from the European Environment Agency. Only pollution data from 2012 was used. 
Cities with characters disallowed in SAS were reformatted. Measurement_unit column was removed prior to use in SAS
due to characters disallowed in SAS and was also not needed for analysis.

[Data Dictionary]
    country_iso_code: Country
	
	city_name: City
	
	station_european_code: European station code
	
	type_of_station: Pollution measurement station type
	
	station_type_of_area: Station type/location
	
	component_caption: Air pollutant airbase code
	
	component_name: Air polluting substance
	
	statistics_year: Year pollution data collected
	
	statistic_value: Value
	
	measurement_unit: Measurement unit
	
	above_TV?: Binary (1 = yes, 0 = no) if above target value

[Unique ID Schema] The column “station_european_code” is a unique ID. After 
identifying the average SO3 pollution level by city the new composite key will 
be city and country. This is necessary in order to merge tables with the 
other data sets.
;

* setup environmental parameters;
%let inputDataset1URL = 
http://filebin.ca/3DMG9d0J8zkD/2012_US_population.xls;
%let inputDataset1Type = xls;
%let inputDataset1DSN = us12pop_raw;

%let inputDataset2URL =
http://filebin.ca/3D0oybzVVxEz/2012_Germany_population.xls;
%let inputDataset2Type = xls;
%let inputDataset2DSN = ger12pop_raw;

%let inputDataset3URL = http://filebin.ca/3CzNApMHeQ9H/2012_US_pollution.xls;
%let inputDataset3Type = xls;
%let inputDataset3DSN = us12pol_raw;

%let inputDataset4URL = 
http://filebin.ca/3D0xbkmJYPdp/2012_Germany_pol_NO.xls;
%let inputDataset4Type = xls;
%let inputDataset4DSN = ger12pol_NO_raw;

%let inputDataset5URL = 
http://filebin.ca/3D0xjFMIo8jJ/2012_Germany_pol_O.xls;
%let inputDataset5Type = xls;
%let inputDataset5DSN = ger12pol_O_raw;


* load raw datasets over the wire, if they doesn't already exist;
%macro loadDataIfNotAlreadyAvailable(dsn,url,filetype);
    %put &=dsn;
    %put &=url;
    %put &=filetype;
    %if
        %sysfunc(exist(&dsn.)) = 0
    %then
        %do;
            %put Loading dataset &dsn. over the wire now...;
            filename tempfile TEMP;
            proc http
                method="get"
                url="&url."
                out=tempfile
                ;
            run;
            proc import
                file=tempfile
                out=&dsn.
                dbms=&filetype.;
            run;
            filename tempfile clear;
        %end;
    %else
        %do;
            %put Dataset &dsn. already exists. Please delete and try again.;
        %end;
%mend;
%loadDataIfNotAlreadyAvailable(
    &inputDataset1DSN.,
    &inputDataset1URL.,
    &inputDataset1Type.
)
%loadDataIfNotAlreadyAvailable(
    &inputDataset2DSN.,
    &inputDataset2URL.,
    &inputDataset2Type.
)
%loadDataIfNotAlreadyAvailable(
    &inputDataset3DSN.,
    &inputDataset3URL.,
    &inputDataset3Type.
)
%loadDataIfNotAlreadyAvailable(
    &inputDataset4DSN.,
    &inputDataset4URL.,
    &inputDataset4Type.
)
%loadDataIfNotAlreadyAvailable(
    &inputDataset5DSN.,
    &inputDataset5URL.,
    &inputDataset5Type.
)

*Create dataset of Germany's average NO2 levels by city;
proc sort data=ger12pol_NO_raw;
	by city_name;
run;

*Create new dataset which contains the average NO2 levels by city;
proc means data=ger12pol_NO_raw mean nonobs nway;
	class city_name country_iso_code;
	var statistic_value;
	OUTPUT OUT = ger12pol_NO_avg;
run;

data ger12pol_NO (keep=city country NO2_Mean);
	set ger12pol_NO_avg;
	by city_name;
	if _STAT_="MEAN" and city_name^="";
	format statistic_value 7.2;
	rename statistic_value=NO2_Mean;
	rename city_name=City;
	rename country_iso_code=Country;
run;

*Create dataset of Germany's average O3 levels by city;
proc sort data=ger12pol_O_raw;
	by city_name;
run;

*Create new dataset which contains the average O3 levels by city;
proc means data=ger12pol_O_raw mean nonobs nway;
	class city_name country_iso_code;
	var statistic_value;
	OUTPUT OUT = ger12pol_O_avg;
run;

data ger12pol_O (keep=city country O3_Mean);
	set ger12pol_O_avg;
	by city_name;
	if _STAT_="MEAN" and city_name^="";
	format statistic_value 7.2;
	rename statistic_value=O3_Mean;
	rename city_name=City;
	rename country_iso_code=Country;
run;

*Create dataset of US's average NO2, O3, SO2 levels by city and state;
proc sort data=us12pol_raw;
	by city state country;
run;

proc means data=us12pol_raw mean nonobs nway;
	class city state country;
	var NO2_Mean O3_Mean SO2_Mean CO_Mean;
	OUTPUT OUT=us12pol_avg;
run;

data us12pol (keep=city country NO2_Mean O3_Mean SO2_Mean CO_Mean);
	set us12pol_avg;
	by city;
	if _STAT_="MEAN" and city^="";
	format NO2_Mean 7.2;
	format O3_Mean 7.2;
	format SO2_Mean 7.2;
	format CO_Mean 7.2;
	O3_Mean=O3_Mean*1000; /*Convert to same scale (ppb) for analysis*/
	CO_Mean=CO_Mean*1000; /*Convert to same scale (ppb) for analysis*/
run;

* sort and check raw datasets for duplicates with respect to their unique ids,
  removing blank rows, if needed;
proc sort
		nodupkey
		data=us12pop_raw
		dupout=us12pop_dup
		out=us12pop_sorted;
	by
		city
		state;
run;

proc sort
		nodupkey
		data=ger12pop_raw
		dupout=ger12pop_dup
		out=ger12pop_sorted;
	by
		city;
run;

proc sort
		nodupkey
		data=us12pol
		dupout=us12pol_dup
		out=us12pol_sorted;
	by
		city;
run;

proc sort
		nodupkey
		data=ger12pol_NO
		dupout=ger12pol_NO_dup
		out=ger12pol_NO_sorted;
	by
		city;
run;

proc sort
		nodupkey
		data=ger12pol_O
		dupout=ger12pol_O_dup
		out=ger12pol_O_sorted;
	by
		city;
run;

*Merge vertically US and German population data sets;
data us_ger_pop (drop=year area sex city_type record_type reliability 
	source_year value_footnotes state);
	format country_or_area $ 24. city $21.;
	merge 
		ger12pop_sorted 
		us12pop_sorted;
	by city;
	rename value=population;
	rename country_or_area=country;
run;

*Merge horizontally US and German pollution datasets;
data us_ger_pol;
	merge 
		us12pol_sorted
		ger12pol_no_sorted
		ger12pol_o_sorted;
	by city;
run;

*Merge population and pollution datasets;
data us_ger_main;
	merge
		us_ger_pop
		us_ger_pol;
run;

*Remove any cities that do not have pollution data. This will be the primary 
data set used in answering research questions.;
data us_ger_data;
	set us_ger_main;
	where NO2_mean>=-10 or CO_mean>=-10 or SO2_mean>=-10 or O3_mean>=-10;
run;