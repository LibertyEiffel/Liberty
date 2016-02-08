****** Error: Forbidden call (i.e. exportation rules violated) when the type of Current is BAD_EXPORT3. (See the next error report for details.)

Line 15 column 14 in BAD_EXPORT3 (/home/r/Liberty/test/language/error_warning_msg/bad_export3.e):
         aux.foo
             ^  
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`foo'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
Line 5 column 9 in AUX_EXPORT3A (/home/r/Liberty/test/language/error_warning_msg/aux_export3a.e):
feature {ANY}
        ^    
------
****** Warning: Since february 2006, for SmartEiffel release 2.3, the old legacy NONE type mark is obsolete. Keep in mind that an empty class name list like {} do indicate no exportation at all, hence making NONE unuseful and probably misleading for newcomers. So, just remove this NONE class name right now. Please update your code now.

Line 7 column 15 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
              ^        
------
****** Warning: Since february 2006, for SmartEiffel release 2.3, the old legacy NONE type mark is obsolete. Keep in mind that an empty class name list such as {} does indicate no exportation at all, hence making NONE useless and probably misleading for newcomers. So, just remove this NONE class name now. Please update your code now.

Line 7 column 15 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
              ^        
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.prefix "&". This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 225 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Object Printing:
        ^                        
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`is_default'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 137 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Basic operations:
        ^                         
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`is_deep_equal'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 79 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Deep Comparison:
        ^                        
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`immutable'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 87 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Duplication:
        ^                    
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.infix "~". This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 49 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Comparison:
        ^                   
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`standard_is_equal'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 49 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Comparison:
        ^                   
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`default'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 137 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Basic operations:
        ^                         
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`lazy_out'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 225 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Object Printing:
        ^                        
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`fill_tagged_out_memory'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 225 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Object Printing:
        ^                        
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`to_pointer'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 420 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- The Guru section:
        ^                         
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`generating_type'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 29 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Access:
        ^               
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`twin'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 87 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Duplication:
        ^                    
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`out_in_tagged_out_memory'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 225 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Object Printing:
        ^                        
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`is_basic_expanded_type'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 420 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- The Guru section:
        ^                         
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`copy'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 87 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Duplication:
        ^                    
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`same_dynamic_type'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 41 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Status report:
        ^                      
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`is_equal'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 49 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Comparison:
        ^                   
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`standard_twin'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 87 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Duplication:
        ^                    
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`tagged_out'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 225 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Object Printing:
        ^                        
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`to_internals'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 488 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {INTERNALS_HANDLER}
        ^                  
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`object_size'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 420 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- The Guru section:
        ^                         
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`internals_can_be_retrieved'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 495 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {TYPED_INTERNALS}
        ^                
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`generator'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 29 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Access:
        ^               
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`deep_twin'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 129 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Deep Duplication:
        ^                         
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`out'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 225 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Object Printing:
        ^                        
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`standard_copy'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 87 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Duplication:
        ^                    
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT3B.`print_on'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 225 column 9 in ANY (/home/r/Liberty/src/lib/kernel/any.e):
feature {ANY} -- Object Printing:
        ^                        
Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
------
****** Fatal Error: This feature is only exported to {}.

The source lines involved by the message are the following:

Line 7 column 14 in AUX_EXPORT3B (/home/r/Liberty/test/language/error_warning_msg/aux_export3b.e):
      export {NONE} all
             ^         
Line 6 column 4 in AUX_EXPORT3A (/home/r/Liberty/test/language/error_warning_msg/aux_export3a.e):
   foo do end
   ^         
------
