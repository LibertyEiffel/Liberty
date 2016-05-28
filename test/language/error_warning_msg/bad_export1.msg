****** Error: Forbidden call (i.e. exportation rules violated) when the type of Current is AUX_EXPORT1B. (See the next error report for details.)

Line 12 column 16 in AUX_EXPORT1B (/home/r/Liberty/test/language/error_warning_msg/aux_export1b.e):
         other.make -- It is right to reject this :-)
               ^                                     
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT1A.`make'. This can lead to catcalls! The final export list is {}.

The source lines relevant to this message are the following:

Line 7 column 14 in AUX_EXPORT1A (/home/r/Liberty/test/language/error_warning_msg/aux_export1a.e):
      export {NONE} make
             ^          
Line 5 column 9 in AUX_EXPORT1C (/home/r/Liberty/test/language/error_warning_msg/aux_export1c.e):
feature {ANY}
        ^    
------
****** Warning: Since february 2006, for SmartEiffel release 2.3, the old legacy NONE type mark is obsolete. Keep in mind that an empty class name list like {} do indicate no exportation at all, hence making NONE unuseful and probably misleading for newcomers. So, just remove this NONE class name right now. Please update your code now.

Line 7 column 15 in AUX_EXPORT1A (/home/r/Liberty/test/language/error_warning_msg/aux_export1a.e):
      export {NONE} make
              ^         
------
****** Warning: Since february 2006, for SmartEiffel release 2.3, the old legacy NONE type mark is obsolete. Keep in mind that an empty class name list such as {} does indicate no exportation at all, hence making NONE useless and probably misleading for newcomers. So, just remove this NONE class name now. Please update your code now.

Line 7 column 15 in AUX_EXPORT1A (/home/r/Liberty/test/language/error_warning_msg/aux_export1a.e):
      export {NONE} make
              ^         
------
****** Fatal Error: This feature is only exported to {}.

The source lines relevant to this message are the following:

Line 7 column 14 in AUX_EXPORT1A (/home/r/Liberty/test/language/error_warning_msg/aux_export1a.e):
      export {NONE} make
             ^          
Line 6 column 4 in AUX_EXPORT1C (/home/r/Liberty/test/language/error_warning_msg/aux_export1c.e):
   make
   ^   
------
