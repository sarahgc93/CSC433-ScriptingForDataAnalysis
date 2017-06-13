
*Project 4A
CSC 433
Sarah Cummings;
options lrecl linesize= 412 nodate pageno=1;
data baylorReligion;
	infile "/folders/myfolders/433files/baylor-religion-survey-data-2007.txt" truncover;
	input RELIGION 18-19 GENDER 360 HAPPYLOVE 328;
	title "Baylor Religion Data: Religion, relationships, and happiness";
	*the following line gets rid of observations missing the HAPPY LOVE variable;
	if missing(HAPPYLOVE) then delete;
	*the following four lines ensure we have jus tthe four religions of interest;
	if RELIGION < 12 then delete;
	if RELIGION > 12 & RELIGION <16 then delete;
	if RELIGION >16 & RELIGION <45 then delete;
	if RELIGION > 46 then delete;	
proc freq;

proc chart data=baylorReligion;
	title "Frequency of HappyLove Response for Catholic/Roman Catholic"
	where RELIGION = 16;
	vbar HAPPYLOVE / discrete type=freq;
	run;

proc chart data=baylorReligion;
	title "Frequency of HappyLove Response for Baptists"
	where RELIGION = 12;
	vbar HAPPYLOVE / discrete type=freq;
	run;

proc chart data=baylorReligion;
	title "Frequency of HappyLove Response for Non-Denominational Christians"
	where RELIGION = 45;
	vbar HAPPYLOVE / discrete type=freq;
	run;

proc chart data=baylorReligion;
	title "Frequency of HappyLove Response for Non-religious Respondants"
	where RELIGION = 46;
	vbar HAPPYLOVE / discrete type=freq;
	run;

proc sort;
	by RELIGION;

proc means;
	by RELIGION;

ods graphics / reset imagemap;

/*--SGPLOT proc statement--*/
proc sgplot data=WORK.BAYLORRELIGION;
	/*--Bar chart settings--*/
	vbar RELIGION / response=HAPPYLOVE group=GENDER groupdisplay=Cluster stat=Mean 
		name='Bar';

	/*--Response Axis--*/
	yaxis grid;
run;
ods graphics / reset;	
run;
quit;