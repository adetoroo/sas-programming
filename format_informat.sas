/*Format and Informat statements*/

/*Using informat statement we can read 
non-standard data 
or invalid data into our required data.
  eg: date ,time ,numeric*/

/*If we read any date value using informat 
SAS converts it into the number format.
This number is called SAS date value.*/

/*If we write the format statement in 
procedural block this format is temporary format*/
/*If we write the format statement in dataset block ,
this format is permanent format */
options yearcutoff=1850;
data medi;
input pid age jdate ;
informat jdate ddmmyy10.;
cards;
100 24 21/05/20
101 24 05-08-1991
102 25 07.09.1992
103 25 01.01.1960
;
run;
proc print data=medi;
format 	 jdate ddmmyy2.;
run;

/*Informat- it converts datevalue into number
    Format- it converts into display date  */

/*Informat statement*/
  


data medi;
input pid age jdate  ;
informat jdate ddmmyy10. ;
format jdate ddmmyy7. ;
cards;
100 24 21/05/1890
101 24 05-08-1991
102 25 07.09.11
;
run;
proc print data=medi;
run;

/*Informat and Format*/

data medidata;
input pid age jdate ;
informat jdate ddmmyy10. ;
format jdate ddmmyy10.;

cards;
100 24 01/05/1990
101 24 05-08-1991
102 25 07.09.92
;
run;
proc print data=medidata;

run;
/*default out put wiil be slashes */


/*Date Values    Informat    Format

   23/12/2003                ddmmyy10.
   23-12-2003                ddmmyyD10.
   23.12.2003     ddmmyy10.  ddmmyyp10. 
   23:12:2003                ddmmyyc10.
   23122003                  ddmmyyb10. 
*/

data medi2;
input pid age jdate ldate;
informat jdate mmddyy10. ldate ddmmyy10. ;
cards;
100 24 10/15/1990 16-06-1990
101 24  05-08-90   07/09/1991
102 25 07.09.1992 05-10-1992
;
run;
proc print data=medi2;
format jdate   ldate  ddmmyyd10. fdate dendt  ;
run;


data labdata;
input pid age jdate ;
informat jdate  mmddyy10. ;
cards;
100 24 12/23/1990 
101 24  05-18-90  
102 25 07.29.1992 
;
run;
proc print data=labdata;
format jdate  ddmmyyd8.;
run;


/*Date Values    Informat    Format

    12dec2003     date9.      date9.
    12-dec-2003   date11.     date9.
    12dec03       date7.      date7.
                              (any format)
*/
    

data labinfo;
input pid age jdate ldate;
informat jdate ldate date11.;
cards;
11 23 12aug2003 11-dec-2003
12 26 19nov2003 18-jan-2004
13 28 10dec2003 19-jan-2004
;
run;
proc print data=labinfo;
format jdate ddmmyy10. ldate date9. ;
run;

/*Date Values    Informat    Format

   jan2003        monyy7.    monyy7.
    jan03         monyy5.    monyy5.   
   jan-2003       monyy8.    monyy7.

*/

data infolab;
input pid age jdate ldate;
informat jdate monyy7. ldate julian7. ;
cards;
10 30 jan2003 2003032
11 32 feb2003 2003075
12 28 mar2003 2003110
;
run;
proc print data =infolab;
format jdate ldate ddmmyy10. ;
run;

/*Only Format specifications-worddate18.
                             weekdate24-34.*/
data demodata;
input pid age jdate ;
informat jdate monyy7.  ;
format jdate   weekdate24. ;
cards;
10 30 jan2003 
11 32 feb2003 
12 28 mar2003 
;
run;
proc print data =demodata;

run;


/*Replacing informat statement by using 
colon modifier in input statement*/

data patinfo;
input pid age jdate :ddmmyy10. ldate :date9.;
cards;
100 24 01/05/1990 06jan1990
101 24 05-08-1991 07feb1991
102 25 07.09.1992 05mar1992
;
run;
proc print data=patinfo;
format jdate ldate ddmmyy10.;
run;


/*Data values    Informat       Format
   25,000          comma6.      comma6.
   25,25,000       comma9.      comma9.
   $25,000         dollar7.     dollar7.
*/

data emp;
input eid salary  pf ;
cards;
123 23,000 $2,23,000
124 30,000 $3,00,000
;
proc print data=emp; 
run;

data empdata;
input eid salary :comma6. pf :dollar9.;
cards;
123 23,000 $2,23,000
124 30,000 $3,00,000
;
proc print data=empdata;
format salary dollar7. pf dollar15.;
run;
 
data empinfo;
input eid salary :comma8. pf :dollar12.;
cards;
123 223000 $223,000.67
124 3,30,000 $300,000.80
;
proc print data=empinfo;
format salary comma8. pf dollar14.4;
run;

data demo;
input eid salary :comma6. pf :dollar9.;
cards;
123 23,000 $2,23,000
124 30,000 $3,00,000
;
proc print data=demo;
format salary  pf words24.;
run;

/*Time informat*/

/*Data values            Informat         Format
   10:12:30                 time8.         time8.
   02:12:30pm               time10.        timeampm10.
   12dec2003:14:12:23       datetime18.    datetime18.
   12dec2003:10:12:23pm     datetime20.    dateampm20.
*/

data lab;
input pid jtime  ltime ;
informat jtime time10. ltime time8.;
cards;
123 05:12:51am 14:23:54
134 02:11:55pm 00:01:00
;
run;
proc print data =lab;
format jtime time8. ltime timeampm10.;
run;




data sideeffects;
input pid drug$  time :datetime20. ;
cards;
1234 col5mg 12aug2003:12:20:23pm
1456 col10mg 13dec2003:09:12:36am
;
run;
proc print data=sideeffects;
format time dateampm20.;
run;

/*Reading, Writing and Calculating Date Values*/

data meeting;
options nodate pageno=1 linesize=100 pagesize=60;    
   input region $ mtg : mmddyy10.;
   sendmail=mtg-45;
   datalines;
N  11-24-99
S  12-28-99
E  12-03-99
W  10-04-99
;
run;


proc print data=meeting;
   format mtg sendmail date9.;
   title 'When To Send Announcements';
run;
