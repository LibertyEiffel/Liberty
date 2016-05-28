****** Fatal Error: Cyclic inheritance graph: AUX_INHERIT3, BAD_INHERIT3,
AUX_INHERIT3, ...

The source lines relevant to this message are the following:

Line 6 column 9 in BAD_INHERIT3 (/home/colnet/SmartEiffel/work/lib_test3/bad_inherit3.e):
inherit AUX_INHERIT3;
        ^            
Line 6 column 9 in AUX_INHERIT3 (/home/colnet/SmartEiffel/work/lib_test3/aux_inherit3.e):
inherit BAD_INHERIT3
        ^           
------
