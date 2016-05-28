****** Fatal Error: Unable to solve cyclic anchored types.

The source lines relevant to this message are the following:

Line 22 column 4 in BAD_LIKE2 (/home/colnet/SmartEiffel/work/lib_test3/bad_like2.e):
   b: like c;
   ^         
Line 24 column 4 in BAD_LIKE2 (/home/colnet/SmartEiffel/work/lib_test3/bad_like2.e):
   c: like d;
   ^         
Line 26 column 4 in BAD_LIKE2 (/home/colnet/SmartEiffel/work/lib_test3/bad_like2.e):
   d: like b;
   ^         
------
