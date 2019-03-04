/*ARRYS - Special types of variable*/

/*Converting values of 999 to a SAS missing value without
using arrays*/

data raju;
input  Height  Weight Age ;
cards;
122 58 66
155 45 78
999 65 40
111 999 22
222 45 999
;
run;
proc print;
run;


data sasuser.clinical;
set raju;
if Height = 999 then Height = .;
if Weight = 999 then Weight = .;
if Age = 999 then Age = .;
run;
proc print data= sasuser.clinical;
run;

/*the above method is not feasible when dealing with many variables, hence the 
use of arrays*/

/*Converting values of 999 to a SAS missing value using
arrays*/

data new;
set raju;
array myownvar{*} Height Weight Age;
do i = 1 to 3;
if myownvar{i}=999 then myownvar{i}=.;
end;
run;

proc print data = new;
run;

/*using the CALL MISSING routine*/

data lab;
set raju;
array myvars{3} Height Weight Age;
do i = 1 to 3;
if myvars{i} = 999 then call missing(myvars{i});
end;
drop i;
run;
proc print data=lab;
run;

/*array: Run same operation multiple variables.

syntax:
array <array anme> (length)
<data type> <variable names>;

array names can be given upto 8 characters.
arrays are of two types:
1.	one dimensional array
2.	two dimensional array.

1.	one-dimensional array: Runs the process depending on column.
2.	Two-dimensional array: Runs the process depending on columns and rows.

one-dimensional array: 
To replace missing values for multiple variables in dataset.
i.	numeric
ii.	character.

/* source data */
data subj_bp;
input subjid $ sbp1-sbp6;
cards;
P101 230 340 210 220 210 240
P102 310 . 200 . 230 250
P103 . 210 210 220 . 210
P104 220 250 . 210 200 . 
;

run;

proc print;
run;

/* replacing missing values with 0 */

data jj;
set subj_bp;
array newvar{*} sbp1 - sbp6;
do i = 1 to 6;
if newvar{i} = . then newvar{i} = 0;
end;
drop i;
run;

proc print data = jj;
run;

/*Using _Numeric_ : 

dim function: It requires array name as an argument and returns length of 
the variable to control loop processing. */

data jj2;
set subj_bp;
array newvar2(*) _numeric_;
do i = 1 to dim(newvar2);
if newvar2(i) = . then newvar2(i) = 0;
end;
drop i;
run;

proc print data = jj2;
run;

/*to replace the missing values by the mean of corresponding non-missing values:*/

data jj3;
set subj_bp;
array newvar3(*) sbp1 - sbp6;
do i = 1 to dim(newvar3);
if newvar3(i) = . then newvar3(i) = mean(of sbp1 - sbp6);
end;
drop i;
run;

proc print data = jj3;
run;

/*To replace character missing:
  source data  */
data crosstrails;
input pid (visit1-visit4) ($);
cards;
101 Asp-05mg . Msp-10mg . 
102 . Asp-10mg . Msp-10mg
103 Asp-15mg . Msp-15mg . 
;

proc print data=crosstrails;
run;

/* this method will work if the nos of variables are not known*/

data ct2;
set crosstrails;
array newv1(*) _character_;
do i = 1 to dim(newv1);
if newv1(i) = "" then newv1(i) ="Placebo";
end;
drop i;
run;

proc print data = ct2;
run;

data trails;
set crosstrails;
array orange (4) $ visit1-visit4 ;
do i=1 to 4;
if orange (i)= "" then orange(i)= "placebo";
end;
drop i;
run;
proc print data=trails;
run;

/*To replace multiple columns by the multiple values or 
To replace missing values by the temporary or standard values.

Relacing values:
Hr	72
DBP	80
SBP	120
  Extract  */
  
 
data vt;
infile "/home/adetoroseyi0/mylib/Day 14/Vitalsigns.txt";
input Pid Visit Test $ Units;
run;

proc print data =vt noobs;
run;
 
/*  Transpose the data but sort before transpose */

proc sort data = vt out = vt1;
by pid visit;
run;

proc transpose data=vt1 out=vt2 prefix=a;
id Test;
by pid visit;
var Units;
run;

proc print data=vt2;
run;

/* Replace missing values */

data vt3;
set vt2;
array newvt3(*) HR DBP SBP; /* if prefix a if included in the previous code, this has to be taken into account in this step*/
array newvt3_1(3) _temporary_ (70 80 120);
do i = 1 to 3;
if newvt3(i) =. then newvt3(i) = newvt3_1(i);
end;
drop I;
run;

proc print data =vt3;
run;

/* Converting back to original format*/

proc sort data=vt3 out=vt4;
by pid visit;
run;

proc transpose data= vt3 out=vt4 (rename=(_Name_=Test));
var HR DBP SBP;
by pid visit;
run;

proc print data=vt4;
run;

