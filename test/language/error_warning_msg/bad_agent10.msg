****** Error: Type INTEGER is not a kind of Type STRING. 
Line 14 column 20 in BAD_AGENT08 (./bad_agent08.e) :
   f(s: STRING; i: STRING) is
                   ^
------
****** Error:  Actual-argument/Formal-argument mismatch.
Line 14 column 20 in BAD_AGENT08 (./bad_agent08.e) :
   f(s: STRING; i: STRING) is
                   ^
Line 9 column 18 in BAD_AGENT08 (./bad_agent08.e) :
	 r := agent f(?,2)
	                ^
------
****** Fatal Error: Bad instruction (when interpreted in BAD_AGENT08).
Line 9 column 3 in BAD_AGENT08 (./bad_agent08.e) :
	 r := agent f(?,2)
	 ^
------
File "bad_agent08.make" not found. Error(s) during `compile_to_c'.
