/*The INPUT statement reads raw data 
from instream data lines or external files
into a SAS data set

-list input

-column input

-formatted input

-named input */

/*List Input

List input uses a scanning method for locating data values.

-Data values are required to be aligned in columns but 
must be separated by at least one blank
*/
data scores;
length 	name  $ 20   ;
input name$    score1$ score2$;
cards;
rajashaker      .       1187
jayaprakashvardhan 1015      1102
;

proc print data=scores;
run;

/*List input has several restriction
-Input values must be separated by at least
one blank (the default delimiter) or by the
delimiter specified with the DELIMITER= option
in the INFILE statement

-Blanks cannot represent missing values. 
A real value, such as a period, 
must be used instead.

- To read and store a character input value 
longer than 8 bytes, 
define a variable's length by using a LENGTH statement

-Character values cannot contain embedded blanks
when the file is delimited by blanks.

-Fields must be read in order.

-Data must be in standard numeric or
character format. */

/*Column Input*/

/*Column input enables you to read standard 
data values that are aligned in columns in the
data records. Specify the variable name,
followed by a dollar sign ($) if it is a
character variable, and specify the columns in
which the data values are located in each record*/
data scores;
	input name $30-40    score1 $ 23-27 score2  $1-21 ;
	cards;
what is your name ?            cancontainembeddedblanks 
;

proc print data=scores;
run;

data employee1;
	input ssn $ 1-9 w2amt$ 1-12;
	datalines;
23456789
JAMES SMITH
356
345671234
Jeffrey Thomas
;
run;

proc print data=employee1;
run;

/*Note:   You cannot use an informat with 
column input. 
Features of column input include the following:

* Character values can contain embedded blanks.

* Character values can be from 1 to 32,767 characters
  long.

* Placeholders, such as a single period (.), are not required 
  for missing data.

* Input values can be read in any order, regardless
  of their position in the record.


* Both leading and trailing blanks within the field are ignored.

* Values do not need to be separated by blanks or other delimiters.*/

                /*Formatted Input*/

/*By using formatted input, you can read 
nonstandard data for which SAS requires 
additional instructions.*/

/*Formatted input is typically used with
pointer controls that enable you to control
the position of the input pointer in the 
input buffer when you read data.*/
data scores;
	input  @1name $12. @3 score1$ 5.  @4 score2$ 6.;
	datalines;
values can contain embedded blanks
;

proc print data=scores;
run;

data scores;
	input   name $12. +3 score1$ 5.  +4 score2$ 6.;
	datalines;
values can contain embedded blanks
;

proc print data=scores;
run;

data scores;
	input   name $12. score1$ 5. score2$ 8;
	datalines;
values can contain embedded blanks
;

proc print data=scores;
run;

/*
# Characters values can contain embedded blanks.

# Character values can be from 1 to 32,767 characters long.

# Placeholders, such as a single period (.),
are not required for missing data.

# With the use of pointer controls to position
the pointer, input values can be read in any 
order, regardless of their positions in the 
record.

# Values or parts of values can be reread.

# Formatted input enables you to read data
stored in nonstandard form, such as packed 
decimal or numbers with commas.	*/

/*Named Input */

/*named input to read records in which 
data values are preceded by the name of 
the variable and an equal sign (=).	*/
data games;
	input name=$  score1= score2=;
	datalines;
name=riley score1=1132 score2=1187
name=naidu score1=1111 score2=2222

;

proc print data=games;
run;
/*********************************/
data kk;
	a=20;
	b=30;
	c="hi there";
run;

proc print;
run;

data kk;
    a=20;
    b=30;
    c="hi there";
    output;
    a=10;
    b=20;
    c="I am from Naija";
    output;
run;
proc print data=kk;
run;

/****************practice********************/

data naidu;
	input ssn : & $24. place$25.;
	datalines;
naidu sas online trainer  hyd
naidu  mumbai
;
run;
proc print data = naidu;
run;
