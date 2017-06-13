*Project 1-- csc433
Sarah Cummings
4/13/16;
options linesize=70 nodate pageno=1;
data erie;
	*read in the text file which contains our data and set it to read starting with the 12th line;
	infile "/folders/myfolders/433files/erie-marathon-2006.txt" firstobs=12 obs=447 flowover truncover;
  	*create variables and point to where they are in the file;
  	input jerseyNumber 3-5 place 9-11 name $19-29 finalTime $88-94 milePace $98-102;  
	*get rid of the lines we don't want by having sas throw out the lines without a jersey number
	*perhaps this is  trivial way to get discard those extra lines, but it works;
	if missing(jerseyNumber) then delete;
run;	

*sort by name to be printed;
proc sort;
	by name;

*Print data and label our varaibles to clarify;
proc print label;
	label jerseyNumber= 'Jersey Number';
	label place= 'Place';
	label name= 'Name';
	label finalTime= 'Final Time';
	label milePace= 'Mile Pace';
*create a title for our print page;
	title 'Alphabetized Erie Marathon Runners';

*sort by final time as per required for our second report;
proc sort;
	by finalTime;

*Do the assignment the second way-- with an output file;
data erie;
	*create a new file to store our data to;
	file "/folders/myfolders/433files/erie-marathon3.txt";
	*read in the text file which contains our data and set it to read starting with the 12th line;
	infile "/folders/myfolders/433files/erie-marathon-2006.txt" firstobs=12 obs=447 flowover truncover;
  	*create variables and point to where they are in the file;
  	input jerseyNumber 3-5 place 9-11 name $19-29 finalTime $88-94 milePace $98-102;  
	*get rid of the lines we don't want by having sas throw out the lines without a jersey number
	*perhaps this is  trivial way to get discard those extra lines, but it works;
	if missing(jerseyNumber) then delete;
	put'Jersey Number: ' jerseyNumber 'Place: ' place 'Name: ' name 'Final Time:' finalTime 'Mile Pace:' milePace;
	
run;	
quit;