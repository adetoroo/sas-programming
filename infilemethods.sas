

/*INFILE OPTIONS*/


/* dealing with missing data*/
/* sas handles missing data by replacing the missing data with a dot*/


data trials;
input center$ trial$ sub;
cards;
appolo phase1 78
nims          89
care   phase3 56
appolo phase2  .
nims   phase2 79
care   phase3  .
;
proc print data =trials;
run;

/*inflie demonstration*/
/* if dot is not used, missover should be used when importing the data to handle the missing data*/
/* this example was done using sas studio */

data missing;
infile '/home/adetoroseyi0/mylib/Day3/Missing.txt' missover ;
input x y z;
run;
proc print data=missing;
run;

data missing;
infile cards missover ;
input x y z;
cards;
11 1 78
12 2 89 
13 3 56
14 2  
15 2 79
16 3  
run;
proc print data=missing;
run;


/*Miss over option-when you have the end missing values you can use the missover option instead of assigning
a period for missing values.*/

data missing;
infile '/home/adetoroseyi0/mylib/Day3/Missing.txt' missover;
input x y z;
run;

/*Flow over-Its a default nature of the SAS,
it reads only one line for one observation*/
/*If any value is missing in raw data 
SAS catches the next value,
this concept is called Flow over.*/



/*DLM-delimiter
when the data values are separated with multiple special 
characters other than the default delimeter blank space
you need to mention those special characters within single quotes*/



/*Demonstrating the infile statement using the dsd for
local data  */

/*Tab separated dlm='09'x */;
data clin; 
infile cards dlm=',&$ ';
input pid name$ age gender$;
cards;
123,kiran$24&male
145&kumar,25 male
134 ramya$25$female
;
proc print data=clin;
run;

/*Demonstrating the infile statement using the dlm for
importing the external files  */
data demo1;
infile '/home/adetoroseyi0/mylib/Day3/trail.txt' dlm=',&$ ';
input pid name$ age gender$;
run;

proc print data=demo1;
run;



/*DSD-data sensitive delimeter you can use this when your 
datavalues are separatedwith only commas.*/

/*Demonstrating the infile statement using the dsd for
local data  */
data clin;
infile cards dsd;
input pid name$ age gender$;
cards;
123,kiran,24,male
145,kumar,25,male
134,ramya,25,female
;
proc print data=clin;
run;

/*Demonstrating the infile statement using the dsd for
importing the external files  */

data demodata;
infile '/home/adetoroseyi0/mylib/Day3/subjects list.txt' dsd;
input pid name$ age gender$;
run;

proc print data=demodata;
run;

/*Demonstrating the infile statement using the dsd for 
removing the single and double qouts using  */


data clinical;
infile cards  dsd dlm=',';
input pid name$ age gender$;
cards;
134,'kiran',56,male
167,kumar,26,"male"
156,"ramya",45,female
;
proc print data=clinical;
run;

/*Demonstrating the dlm and Dsd in one program*/


data clinical;
infile cards dlm=',$@ ' dsd  ;
input pid name$ age gender$;
cards;
134$'kiran',56$male
167 kumar,26,"male"
156,"ramya",45@female
;
proc print data=clinical;
run;


/*Reading a Portion of a Raw Data File*/

/*Scan over-To find out the specific word and 
to read the remaining data values for required
variables*/

data lab;
input @ 'Care' trial$ sub;
cards;
appolo phase1 78
nims   phase1 45
Care   phase1 89
appolo phase2 45
nims   phase2 67
Care   phase2 89
nims   phase3 46
;
proc print data =lab;
run;



/*firstobs and obs-to get part of the data in sequential order*/

data blood1;
infile"E:\final classes\day17 18\blood.txt"  obs=10 ;
input pid gender$ bloodtype$ agegroup$ wbc rbc chole;
run;
proc print data=blood1;
run;
