****** Error: Incompatible signatures. (One has a result type
and not the other.)

The source lines involved by the message are the following:

Line 21 column 4 in BAD_REDEFINE1 (/home/colnet/SmartEiffel/work/lib_test3/bad_redefine1.e):
   foo(file: TEXT_FILE_WRITE): INTEGER is
   ^                                     
Line 8 column 4 in AUX_REDEFINE1 (/home/colnet/SmartEiffel/work/lib_test3/aux_redefine1.e):
   foo(file: STD_FILE_WRITE) is do end;
   ^                                   
------
****** Fatal Error: Signature of the redefined feature is not
valid.

The source lines involved by the message are the following:

Line 6 column 9 in BAD_REDEFINE1 (/home/colnet/SmartEiffel/work/lib_test3/bad_redefine1.e):
inherit AUX_REDEFINE1 redefine foo end;
        ^                              
Line 21 column 4 in BAD_REDEFINE1 (/home/colnet/SmartEiffel/work/lib_test3/bad_redefine1.e):
   foo(file: TEXT_FILE_WRITE): INTEGER is
   ^                                     
Line 8 column 4 in AUX_REDEFINE1 (/home/colnet/SmartEiffel/work/lib_test3/aux_redefine1.e):
   foo(file: STD_FILE_WRITE) is do end;
   ^                                   
------
