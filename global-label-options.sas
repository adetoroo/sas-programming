

/*Global options-using these options 
we can manage the SAS window environment

 Once you use the global options it remains active 
 until you close the SAS session or you inactviate those
 global options.

Global options you can write anywhere in your coding 
except in the cards statement. */
/*
PORTABLE OPTIONS:
 TITLE             title of the out put
 FOOTNOTE          Footr of the out put page
 NOCAPS            Translate quoted strings and titles to upper case?
 CENTER            Center SAS output?
 DATE              Date printed in title?
 ERRORS=20         Maximum number of observations with error messages
 FIRSTOBS=1        First observation of each data set to be processed
 FMTERR            Treat missing format or informat as an error?
 LABEL             Allow procedures to use variable labels?
 LINESIZE=64       Line size for printed output
 MISSING=.         Character printed to represent numeric missing values
 NOTES             Print SAS notes on log?
 NUMBER            Print page number on each page of SAS output?
 OBS=MAX           Number of last observation to be processed
 PAGENO=1          Resets the current page number on the print file
 PAGESIZE=78       Number of lines printed per page of output
 REPLACE           Allow replacement of permanent SAS data sets?
 SOURCE            List SAS source statements on log?
 YEARCUTOFF=1920   Cutoff year for DATE7. informat
 

*/



/*Global options-output window*/
 
data med;
input pid name$ age;
option  nocaps ;

cards;
123 kumar 26
145 madhu 24
156 kiran 27
;
proc print data=med;
run;



data medii;
input pid name$ age;
cards;
123 kumar 26
145 madhu 24
156 kiran 27
;

proc print data=medii;
run;
/*linesize=default 64
            u can give upto 256*/
/*The LINESIZE= option specifies the width of the print line for your procedure output and log.
Observations that do not fit within the line size continue on a different line*/


data medidata;
input pid name$ age;
cards;
123 kumar 30
145 madhu 24
156 kiran 27
;
options ls=200;
proc print data=medidata;
run;
/* page size 

 default ps=54  max=32,767*/
/*The PAGESIZE= option specifies how many lines each page of output contains. In the following
example, each page of the output that the PRINT procedure produces contains 500 lines (including
those used by the title, date, and so on). */

data lab;
input pid name$ age;
options ps=500;
cards;
123 kumar 26
145 madhu 24
156 kiran 27
;

proc print data=lab;
run;

options  ps=290 pageno=8;
data labinfo;
input pid name$ age;
cards;
123 kumar 26
145 madhu 24
156 kiran 27

;
proc print data=labinfo;
run;


/*Global options-log window*/

options nonotes nosource ;
data infolab;
input pid name$ age;
cards;
123 kumar 26
145 madhu 24
156 kiran 27
;
proc print data=infolab;
run;

options  notes source ;
data labdata;
input pid name$ age;
cards;
123 kumar 26
145 madhu 24
156 kiran 27
;
proc print data=labdata;
run;


/*Global options-explorer window */

options user=sasuser;
data medi;
input pid name$ age;
cards;
123 kumar 26
145 madhu 24
156 kiran 27
;
proc print data=medi;
run;

data medidata;
input pid name$ age;
cards;
123 kumar 26
145 madhu 24
156 kiran 27
;
proc print data=medidata ;
run;
