\ Intended to be similar in spirit to my Lisp version, though it's
\ quite different in low-level details.

( Output numeral for one decimal digit. )

variable d
: n[ ( -- u )   :noname  postpone [  depth d ! ;
: ]n ( u -- )   ]  depth d @ - 0 ?do ]] dup literal + @ emit [[ loop
   postpone drop postpone ; ; immediate
n[ 0 2 ]n n[ 2 2 2 1 ]n n[ 2 2 1 ]n n[ 2 1 ]n n[ 1 ]n
n[ 1 2 ]n n[ 2 2 2 ]n n[ 2 2 ]n n[ 2 ]n n[ ]n
create table , , , , , , , , , ,
: numeral ( u a -- )   swap cells table + @ execute ;

( Convert one decimal digit at a time. )

: digit: ( u1 u2 "name" -- )   create , ,
   does> ( u a -- ) @+ swap >r / 10 mod s" ??MDCLXVI" drop r> @ + numeral ;
0 1000 digit: 1st   2 100 digit: 2nd   4 10 digit: 3rd   6 1 digit: 4th
: roman ( u -- )   dup 1st dup 2nd dup 3rd 4th ;
