-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class EIFFEL_GRAMMAR
   --
   -- An extended Eiffel grammar. It supports all the SmartEiffel standard grammar with some extensions:
   -- * the '''indexing''' clause may be used in a feature (somewhat like ECMA's note)
   -- * the '''separate''' keyword is supported
   --

insert
   EIFFEL_NODE_HANDLER
   PLATFORM
   LOGGING

create {ANY}
   make, make_default

feature {ANY}
   end_reached: BOOLEAN

feature {}
   the_table: PARSE_TABLE[DESCENDING_PARSE_CONTEXT]
      local
         e1, e2, e3, e4, e5, e6: FIXED_STRING
      once
         e1 := "e1".intern
         e2 := "e2".intern
         e3 := "e3".intern
         e4 := "e4".intern
         e5 := "e5".intern
         e6 := "e6".intern
         Result := {PARSE_TABLE[DESCENDING_PARSE_CONTEXT] << "Class", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "One_Class", "KW end of file" >> }, agent build_root(?, ?) >> };
                                                             "Classes", { DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "One_Class+", "KW end of file" >> }, agent build_root(?, ?) >> };
                                                             "One_Class+", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "One_Class" >> }, agent build_new_list("One_Class", "One_Class+");
                                                                                                       {FAST_ARRAY[STRING] << "One_Class", "One_Class+" >> }, agent build_continue_list("One_Class", 0, "One_Class+") >> };
                                                             "One_Class", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Class_Header", "Obsolete", "Inherit", "Insert", "Class_Creation*", "Feature*", "Invariant", "KW end" >> }, Void >> };
                                                             "Class_Header", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Indexing", "Class_Marker", "KW class name", "Type_Parameters" >> }, Void >> };
                                                             "Indexing", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                     {FAST_ARRAY[STRING] << "KW indexing", "Indexing_Clause*", "KW ;;" >> }, Void >> };
                                                             "Indexing_Clause*", {DESCENDING_NON_TERMINAL << epsilon, agent build_empty_list("Indexing_Clause*");
                                                                                                             {FAST_ARRAY[STRING] << "Indexing_Clause", "KW ;;", "Indexing_Clause*" >> }, agent build_continue_list("Indexing_Clause", 1, "Indexing_Clause*") >> };
                                                             "Indexing_Clause", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW entity name", "KW :", "KW string" >> }, Void >> };
                                                             "Class_Marker", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW class" >> }, Void;
                                                                                                         {FAST_ARRAY[STRING] << "KW deferred", "KW class" >> }, Void;
                                                                                                         {FAST_ARRAY[STRING] << "KW expanded", "KW class" >> }, Void;
                                                                                                         {FAST_ARRAY[STRING] << "KW separate", "KW class" >> }, Void >> };
                                                             "Obsolete", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                     {FAST_ARRAY[STRING] << "KW obsolete", "KW string" >> }, Void >> };
                                                             "Inherit", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW inherit", "Parent+", "KW ;;" >> }, Void >> };
                                                             "Insert", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                   {FAST_ARRAY[STRING] << "KW insert", "Parent+", "KW ;;" >> }, Void >> };
                                                             "Parent+", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Parent" >> }, agent build_new_list("Parent", "Parent+");
                                                                                                    {FAST_ARRAY[STRING] << "Parent", "KW ;;", "Parent+" >> }, agent build_continue_list("Parent", 1, "Parent+") >> };
                                                             "Parent", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Type_Definition", "Parent_Clause" >> }, Void >> };
                                                             "Parent_Clause", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                          --|*** VALID BUT AMBIGUOUS: {FAST_ARRAY[STRING] << "KW end" >> }, Void;
                                                                                                          {FAST_ARRAY[STRING] << "Parent_Rename", "Parent_Export", "Parent_Undefine", "Parent_Redefine", "KW end of parent clause" >> }, Void >> };
                                                             "Parent_Rename", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                          {FAST_ARRAY[STRING] << "KW rename", "Rename+" >> }, Void >> };
                                                             "Rename+", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Rename" >> }, agent build_new_list("Rename", "Rename+");
                                                                                                    {FAST_ARRAY[STRING] << "Rename", "Rename+" >> }, agent build_continue_list("Rename", 0, "Rename+");
                                                                                                    {FAST_ARRAY[STRING] << "Rename", "KW ,", "Rename+" >> }, agent build_continue_list("Rename", 1, "Rename+") >> };
                                                             "Rename", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Feature_Name", "KW as", "Feature_Name" >> }, Void >> };
                                                             "Parent_Export", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                          {FAST_ARRAY[STRING] << "KW export", "Export+", "KW ;;" >> }, Void >> };
                                                             "Export+", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Export" >> }, agent build_new_list("Export", "Export+");
                                                                                                    {FAST_ARRAY[STRING] << "Export", "KW ;;", "Export+" >> }, agent build_continue_list("Export", 1, "Export+") >> };
                                                             "Export", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Clients", "Export_Features" >> }, Void >> };
                                                             "Export_Features", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Feature_Name+" >> }, Void;
                                                                                                            {FAST_ARRAY[STRING] << "KW all" >> }, Void >> };
                                                             "Parent_Undefine", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                            {FAST_ARRAY[STRING] << "KW undefine", "Feature_Name+" >> }, Void >> };
                                                             "Parent_Redefine", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                            {FAST_ARRAY[STRING] << "KW redefine", "Feature_Name+" >> }, Void >> };
                                                             "Class_Creation*", {DESCENDING_NON_TERMINAL << epsilon, agent build_empty_list("Class_Creation*");
                                                                                                            {FAST_ARRAY[STRING] << "Class_Creation", "Class_Creation*" >> }, agent build_continue_list("Class_Creation", 0, "Class_Creation*") >> };
                                                             "Class_Creation", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW creation", "Clients", "Feature_Name+" >> }, Void;
                                                                                                           {FAST_ARRAY[STRING] << "KW create", "Clients", "Feature_Name+" >> }, Void >> };
                                                             "Routine_Definition", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Obsolete", "Require", "Routine_Execution", "Ensure", "Rescue_Block", "KW end" >> }, Void >> };
                                                             "Routine_Execution", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Local_Block", "Do_Block" >> }, Void;
                                                                                                              {FAST_ARRAY[STRING] << "External" >> }, Void >> };
                                                             "Local_Block", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                        {FAST_ARRAY[STRING] << "KW local", "Declaration*", "KW ;;" >> }, Void >> };
                                                             "Declaration*", {DESCENDING_NON_TERMINAL << epsilon, agent build_empty_list("Declaration*");
                                                                                                         {FAST_ARRAY[STRING] << "Declaration", "KW ;;", "Declaration*" >> }, agent build_continue_list("Declaration", 1, "Declaration*") >> };
                                                             "Declaration", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Variable+", "KW :", "Type_Definition" >> }, Void >> };
                                                             "Variable+", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Variable" >> }, agent build_new_list("Variable", "Variable+");
                                                                                                      {FAST_ARRAY[STRING] << "Variable", "KW ,", "Variable+" >> }, agent build_continue_list("Variable", 1, "Variable+") >> };
                                                             "Variable", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW entity name" >> }, Void >> };
                                                             "Do_Block", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW do", "Instruction*", "Then_Block", "KW ;;" >> }, Void;
                                                                                                     {FAST_ARRAY[STRING] << "KW once", "Instruction*", "Then_Block", "KW ;;" >> }, Void;
                                                                                                     {FAST_ARRAY[STRING] << "KW deferred" >> }, Void;
                                                                                                     {FAST_ARRAY[STRING] << "KW attribute" >> }, Void >> };
                                                             "Then_Block", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                       {FAST_ARRAY[STRING] << "KW then", "Expression" >> }, Void >> };
                                                             "Rescue_Block", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                         {FAST_ARRAY[STRING] << "KW rescue", "Instruction*", "KW ;;" >> }, Void >> };
                                                             "Instruction*", {DESCENDING_NON_TERMINAL << epsilon, agent build_empty_list("Instruction*");
                                                                                                         {FAST_ARRAY[STRING] << "Instruction", "KW ;;", "Instruction*" >> }, agent build_continue_list("Instruction", 1, "Instruction*") >> };
                                                             "Instruction", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Assignment_Or_Call" >> }, Void;
                                                                                                        {FAST_ARRAY[STRING] << "If_Then_Else" >> }, Void;
                                                                                                        {FAST_ARRAY[STRING] << "Inspect" >> }, Void;
                                                                                                        {FAST_ARRAY[STRING] << "Loop" >> }, Void;
                                                                                                        {FAST_ARRAY[STRING] << "Check" >> }, Void;
                                                                                                        {FAST_ARRAY[STRING] << "Debug" >> }, Void;
                                                                                                        {FAST_ARRAY[STRING] << "Old_Creation" >> }, Void;
                                                                                                        {FAST_ARRAY[STRING] << "Creation" >> }, Void;
                                                                                                        {FAST_ARRAY[STRING] << "Retry" >> }, Void >> };
                                                             "Retry", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW retry" >> }, Void >> };
                                                             "Creation", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW create", "KW {", "Type_Definition", "KW }", "Writable" >> }, Void;
                                                                                                     {FAST_ARRAY[STRING] << "KW create", "KW {", "Type_Definition", "KW }", "Writable", "KW .", "KW entity name", "Actuals" >> }, Void;
                                                                                                     {FAST_ARRAY[STRING] << "KW create", "Writable" >> }, Void;
                                                                                                     {FAST_ARRAY[STRING] << "KW create", "Writable", "KW .", "KW entity name", "Actuals" >> }, Void>> };
                                                             "Old_Creation", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW !", "KW !", "Writable" >> }, Void;
                                                                                                         {FAST_ARRAY[STRING] << "KW !", "KW !", "Writable", "KW .", "KW entity name", "Actuals" >> }, Void;
                                                                                                         {FAST_ARRAY[STRING] << "KW !", "Type_Definition", "KW !", "Writable" >> }, Void;
                                                                                                         {FAST_ARRAY[STRING] << "KW !", "Type_Definition", "KW !", "Writable", "KW .", "KW entity name", "Actuals" >> }, Void >> };
                                                             "Assignment_Or_Call", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Writable", "KW :=", "Expression" >> }, Void;
                                                                                                               {FAST_ARRAY[STRING] << "Writable", "KW ?=", "Expression" >> }, Void;
                                                                                                               {FAST_ARRAY[STRING] << "Writable", "KW ::=", "Expression" >> }, Void;
                                                                                                               {FAST_ARRAY[STRING] << "Target", "r10" >> }, Void >> };
                                                             "Call", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW entity name", "KW ?:=", "Expression" >> }, Void;
                                                                                                 {FAST_ARRAY[STRING] << "Target", "r10" >> }, Void >> };
                                                             "Target", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Manifest_Or_Type_Test" >> }, Void;
                                                                                                   {FAST_ARRAY[STRING] << "KW (", "Expression", "KW )" >> }, Void;
                                                                                                   {FAST_ARRAY[STRING] << "KW Precursor", "Precursor_Type_Mark", "Actuals" >> }, Void;
                                                                                                   {FAST_ARRAY[STRING] << "KW Current" >> }, Void;
                                                                                                   {FAST_ARRAY[STRING] << "KW Result" >> }, Void;
                                                                                                   {FAST_ARRAY[STRING] << "KW entity name", "Actuals" >> }, Void >> };
                                                             "Writable", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW Result" >> }, Void;
                                                                                                     {FAST_ARRAY[STRING] << "KW entity name" >> }, Void >> };
                                                             "Precursor_Type_Mark", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                                {FAST_ARRAY[STRING] << "KW {", "Type_Definition", "KW }" >> }, Void >> };
                                                             "If_Then_Else", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "If", "ElseIf*", "Else", "KW end" >> }, Void >> };
                                                             "If", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW if", "Expression", "KW then", "Instruction*" >> }, Void >> };
                                                             "ElseIf*", {DESCENDING_NON_TERMINAL << epsilon, agent build_empty_list("ElseIf*");
                                                                                                    {FAST_ARRAY[STRING] << "ElseIf", "ElseIf*" >> }, agent build_continue_list("ElseIf", 0, "ElseIf*") >> };
                                                             "ElseIf", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW elseif", "Expression", "KW then", "Instruction*" >> }, Void >> };
                                                             "Else", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                 {FAST_ARRAY[STRING] << "KW else", "Instruction*" >> }, Void >> };
                                                             "Inspect", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW inspect", "Expression", "When+", "Else", "KW end" >> }, Void >> };
                                                             "When+", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "When" >> }, agent build_new_list("When", "When+");
                                                                                                  {FAST_ARRAY[STRING] << "When", "When+" >> }, agent build_continue_list("When", 0, "When+") >> };
                                                             "When", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW when", "When_Clause", "KW then", "Instruction*" >> }, Void >> };
                                                             "When_Clause", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "When_Slice" >> }, agent build_new_list("When_Slice", "When_Clause");
                                                                                                        {FAST_ARRAY[STRING] << "When_Slice", "KW ,", "When_Clause" >> }, agent build_continue_list("When_Slice", 1, "When_Clause") >> };
                                                             "When_Slice", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "When_Value" >> }, Void;
                                                                                                       {FAST_ARRAY[STRING] << "When_Value", "KW ..", "When_Value" >> }, Void >> };
                                                             "When_Value", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW number" >> }, Void;
                                                                                                       {FAST_ARRAY[STRING] << "KW character" >> }, Void;
                                                                                                       {FAST_ARRAY[STRING] << "KW string" >> }, Void;
                                                                                                       {FAST_ARRAY[STRING] << "KW entity name" >> }, Void >> };
                                                             "Loop", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "From", "Invariant", "Variant", "KW until", "Expression", "KW loop", "Instruction*", "KW end" >> }, Void >> };
                                                             "From", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW from", "Instruction*" >> }, Void >> };
                                                             "Actuals", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW (", "Actual+", "KW )" >> }, Void >> };
                                                             "Actual+", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Actual" >> }, agent build_new_list("Actual", "Actual+");
                                                                                                    {FAST_ARRAY[STRING] << "Actual", "KW ,", "Actual+" >> }, agent build_continue_list("Actual", 1, "Actual+") >> };
                                                             "Actual", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Expression" >>}, Void;
                                                                                                   {FAST_ARRAY[STRING] << "KW $", "KW entity name" >>}, Void >>};
                                                             "Expression", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Array" >> }, Void;
                                                                                                       {FAST_ARRAY[STRING] << "Expression_No_Array" >> }, Void >> };
                                                             "Expression_No_Array", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "e1", "r1" >> }, agent build_expression_no_array(e1, ?) >> };
                                                             "e1", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "e2", "r2" >> }, agent build_expression(e2) >> };
                                                             "e2", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "e3", "r3" >> }, agent build_expression(e3) >> };
                                                             "e3", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "e4", "r4" >> }, agent build_expression(e4) >> };
                                                             "e4", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "e5", "r5" >> }, agent build_expression(e5) >> };
                                                             "e5", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "e6", "r6" >> }, agent build_expression(e6) >> };
                                                             "e6", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "e7", "r7" >> }, Void >> };
                                                             "e7", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "e8", "r8" >> }, Void >> };
                                                             "e8", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW not", "e8" >> }, Void;
                                                                                               {FAST_ARRAY[STRING] << "KW +", "e8" >> }, Void;
                                                                                               {FAST_ARRAY[STRING] << "KW -", "e8" >> }, Void;
                                                                                               {FAST_ARRAY[STRING] << "KW free operator", "e8" >> }, Void;
                                                                                               {FAST_ARRAY[STRING] << "e9" >> }, Void >> };
                                                             "e9", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "e10" >> }, Void;
                                                                                               {FAST_ARRAY[STRING] << "KW old", "e10" >> }, Void >> };
                                                             "e10", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Call" >> }, Void;
                                                                                                {FAST_ARRAY[STRING] << "KW [", "KW ]" >> }, Void;
                                                                                                {FAST_ARRAY[STRING] << "KW [", "Actual+", "KW ]" >> }, Void;
                                                                                                {FAST_ARRAY[STRING] << "KW ?" >> }, Void;
                                                                                                {FAST_ARRAY[STRING] << "Agent_Signature", "KW is", "Routine_Definition", "Actuals" >> }, Void;
                                                                                                {FAST_ARRAY[STRING] << "Agent_Signature", "Routine_Definition", "Actuals" >> }, Void;
                                                                                                {FAST_ARRAY[STRING] << "KW agent", "Expression" >> }, Void;
                                                                                                {FAST_ARRAY[STRING] << "Creation_Expression" >> }, Void;
                                                                                                {FAST_ARRAY[STRING] << "KW Void" >> }, Void >> };
                                                             "Agent_Signature", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW agent" >> }, Void;
                                                                                                            {FAST_ARRAY[STRING] << "KW agent", "KW :", "Type_Definition" >> }, Void;
                                                                                                            {FAST_ARRAY[STRING] << "KW agent", "KW (", "Declaration*", "KW )" >> }, Void;
                                                                                                            {FAST_ARRAY[STRING] << "KW agent", "KW (", "Declaration*", "KW )", "KW :", "Type_Definition" >> }, Void >> };
                                                             "Creation_Expression", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW create", "KW {", "Type_Definition", "KW }", "r10" >> }, Void >> };
                                                             "Manifest_Or_Type_Test", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW number" >> }, Void;
                                                                                                                  {FAST_ARRAY[STRING] << "KW True" >> }, Void;
                                                                                                                  {FAST_ARRAY[STRING] << "KW False" >> }, Void;
                                                                                                                  {FAST_ARRAY[STRING] << "KW character" >> }, Void;
                                                                                                                  {FAST_ARRAY[STRING] << "KW string" >> }, Void;
                                                                                                                  {FAST_ARRAY[STRING] << "KW once", "KW string" >> }, Void;
                                                                                                                  {FAST_ARRAY[STRING] << "KW {", "Type_Definition", "KW }" >> }, Void;
                                                                                                                  {FAST_ARRAY[STRING] << "KW {", "Type_Definition", "KW }", "KW ?:=", "Expression" >> }, Void;
                                                                                                                  {FAST_ARRAY[STRING] << "KW {", "Type_Definition", "KW number", "KW }" >> }, Void;
                                                                                                                  {FAST_ARRAY[STRING] << "KW {", "Type_Definition", "KW string", "KW }" >> }, Void; -- Liberty extension
                                                                                                                  {FAST_ARRAY[STRING] << "KW {", "Type_Definition", "Manifest_Parameters", "Array", "KW }" >> }, Void >> };
                                                             "Manifest_Parameters", {DESCENDING_NON_TERMINAL << epsilon, agent build_empty_list("Manifest_Parameters");
                                                                                                                {FAST_ARRAY[STRING] << "Expression_No_Array" >> }, agent build_new_list("Expression_No_Array", "Manifest_Parameters");
                                                                                                                {FAST_ARRAY[STRING] << "Expression_No_Array", "KW ,", "Manifest_Parameters" >> }, agent build_continue_list("Expression_No_Array", 1, "Manifest_Parameters") >> };
                                                             "r1", {DESCENDING_NON_TERMINAL << epsilon, agent build_expression_epsilon(e1);
                                                                                               {FAST_ARRAY[STRING] << "KW implies", "e1", "r1" >> }, agent build_expression_remainder({FAST_ARRAY[STRING] << "KW implies" >> }, e1) >> };
                                                             "r2", {DESCENDING_NON_TERMINAL << epsilon, agent build_expression_epsilon(e2);
                                                                                               {FAST_ARRAY[STRING] << "KW or", "KW else", "e2", "r2" >> }, agent build_expression_remainder({FAST_ARRAY[STRING] << "KW or", "KW else" >> }, e2);
                                                                                               {FAST_ARRAY[STRING] << "KW or", "e2", "r2" >> }, agent build_expression_remainder({FAST_ARRAY[STRING] << "KW or" >> }, e2);
                                                                                               {FAST_ARRAY[STRING] << "KW xor", "e2", "r2" >> }, agent build_expression_remainder({FAST_ARRAY[STRING] << "KW xor" >> }, e2) >> };
                                                             "r3", {DESCENDING_NON_TERMINAL << epsilon, agent build_expression_epsilon(e3);
                                                                                               {FAST_ARRAY[STRING] << "KW and", "KW then", "e3", "r3" >> }, agent build_expression_remainder({FAST_ARRAY[STRING] << "KW and", "KW then" >> }, e3);
                                                                                               {FAST_ARRAY[STRING] << "KW and", "e3", "r3" >> }, agent build_expression_remainder({FAST_ARRAY[STRING] << "KW and" >> }, e3) >> };
                                                             "r4", {DESCENDING_NON_TERMINAL << epsilon, agent build_expression_epsilon(e4);
                                                                                               {FAST_ARRAY[STRING] << "KW =", "e4", "r4" >> },  agent build_expression_remainder({FAST_ARRAY[STRING] << "KW ="  >> }, e4 );
                                                                                               {FAST_ARRAY[STRING] << "KW /=", "e4", "r4" >> }, agent build_expression_remainder({FAST_ARRAY[STRING] << "KW /=" >> }, e4 );
                                                                                               {FAST_ARRAY[STRING] << "KW <=", "e4", "r4" >> }, agent build_expression_remainder({FAST_ARRAY[STRING] << "KW <=" >> }, e4 );
                                                                                               {FAST_ARRAY[STRING] << "KW <", "e4", "r4" >> },  agent build_expression_remainder({FAST_ARRAY[STRING] << "KW <"  >> }, e4 );
                                                                                               {FAST_ARRAY[STRING] << "KW >=", "e4", "r4" >> }, agent build_expression_remainder({FAST_ARRAY[STRING] << "KW >=" >> }, e4 );
                                                                                               {FAST_ARRAY[STRING] << "KW >", "e4", "r4" >> },  agent build_expression_remainder({FAST_ARRAY[STRING] << "KW >"  >> }, e4 ) >> };
                                                             "r5", {DESCENDING_NON_TERMINAL << epsilon, agent build_expression_epsilon(e5);
                                                                                               {FAST_ARRAY[STRING] << "KW +", "e5", "r5" >> }, agent build_expression_remainder({FAST_ARRAY[STRING] << "KW +" >> }, e5 );
                                                                                               {FAST_ARRAY[STRING] << "KW -", "e5", "r5" >> }, agent build_expression_remainder({FAST_ARRAY[STRING] << "KW -" >> }, e5 ) >> };
                                                             "r6", {DESCENDING_NON_TERMINAL << epsilon, agent build_expression_e6;
                                                                                               {FAST_ARRAY[STRING] << "KW *", "e6", "r6" >> },  agent build_expression_remainder({FAST_ARRAY[STRING] << "KW *"  >> }, e6 );
                                                                                               {FAST_ARRAY[STRING] << "KW /", "e6", "r6" >> },  agent build_expression_remainder({FAST_ARRAY[STRING] << "KW /"  >> }, e6 );
                                                                                               {FAST_ARRAY[STRING] << "KW //", "e6", "r6" >> }, agent build_expression_remainder({FAST_ARRAY[STRING] << "KW //" >> }, e6 );
                                                                                               {FAST_ARRAY[STRING] << "KW \\", "e6", "r6" >> }, agent build_expression_remainder({FAST_ARRAY[STRING] << "KW \\" >> }, e6 ) >> };
                                                             "r7", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                               {FAST_ARRAY[STRING] << "KW ^", "e7", "r7" >> }, Void >> };
                                                             "r8", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                               {FAST_ARRAY[STRING] << "KW free operator", "e8", "r8" >> }, Void >> };
                                                             "r10", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                {FAST_ARRAY[STRING] << "KW .", "KW entity name", "Actuals", "r10" >> }, Void >> };
                                                             "Array", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW <<", "Array_Content", "KW >>" >> }, Void >> };
                                                             "Array_Content", {DESCENDING_NON_TERMINAL << epsilon, agent build_empty_list("Array_Content");
                                                                                                          {FAST_ARRAY[STRING] << "Expression" >> }, agent build_new_list("Expression", "Array_Content");
                                                                                                          {FAST_ARRAY[STRING] << "Expression", "KW ,", "Array_Content" >> }, agent build_continue_list("Expression", 1, "Array_Content");
                                                                                                          {FAST_ARRAY[STRING] << "Expression", "KW ;", "Array_Content" >> }, agent build_continue_list("Expression", 1, "Array_Content") >> };
                                                             "Feature*", {DESCENDING_NON_TERMINAL << epsilon, agent build_empty_list("Feature*");
                                                                                                     {FAST_ARRAY[STRING] << "Feature", "Feature*" >> }, agent build_continue_list("Feature", 0, "Feature*") >> };
                                                             "Feature", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW feature", "Clients", "Feature_Definition*" >> }, Void >> };
                                                             "Clients", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW {", "Client*", "KW }" >> }, Void >> };
                                                             "Client*", {DESCENDING_NON_TERMINAL << epsilon, agent build_empty_list("Client*");
                                                                                                    {FAST_ARRAY[STRING] << "Client" >> }, agent build_new_list("Client", "Client*");
                                                                                                    {FAST_ARRAY[STRING] << "Client", "KW ,", "Client*" >> }, agent build_continue_list("Client", 1, "Client*") >> };
                                                             "Client", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Type_Definition" >> }, Void >> }; -- Liberty extension
                                                             "Feature_Definition*", {DESCENDING_NON_TERMINAL << epsilon, agent build_empty_list("Feature_Definition*");
                                                                                                                {FAST_ARRAY[STRING] << "Feature_Definition", "Feature_Definition*" >> }, agent build_continue_list("Feature_Definition", 0, "Feature_Definition*") >> };
                                                             "Feature_Definition", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Indexing", "Signature", "Assign", "KW is", "Routine_Definition" >> }, Void;
                                                                                                               {FAST_ARRAY[STRING] << "Indexing", "Signature", "Assign", "Routine_Definition" >> }, Void;
                                                                                                               {FAST_ARRAY[STRING] << "Indexing", "Signature", "KW is", "Manifest_Or_Type_Test" >> }, Void;
                                                                                                               {FAST_ARRAY[STRING] << "Indexing", "Signature", "Manifest_Or_Type_Test" >> }, Void;
                                                                                                               {FAST_ARRAY[STRING] << "Indexing", "Signature", "KW is", "KW unique" >> }, Void;
                                                                                                               {FAST_ARRAY[STRING] << "Indexing", "Signature", "KW unique" >> }, Void;
                                                                                                               {FAST_ARRAY[STRING] << "Indexing", "Signature" >> }, Void >> };
                                                             "Signature", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Feature_Name+" >> }, Void;
                                                                                                      {FAST_ARRAY[STRING] << "Feature_Name+", "KW :", "Type_Definition" >> }, Void;
                                                                                                      {FAST_ARRAY[STRING] << "Feature_Name+", "KW (", "Declaration*", "KW )" >> }, Void;
                                                                                                      {FAST_ARRAY[STRING] << "Feature_Name+", "KW (", "Declaration*", "KW )", "KW :", "Type_Definition" >> }, Void >> };
                                                             "Assign", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                   {FAST_ARRAY[STRING] << "KW assign", "Feature_Name" >> }, Void >> };
                                                             "Feature_Name+", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Feature_Name" >> }, agent build_new_list("Feature_Name", "Feature_Name+");
                                                                                                          {FAST_ARRAY[STRING] << "Feature_Name", "KW ,", "Feature_Name+" >> }, agent build_continue_list("Feature_Name", 1, "Feature_Name+") >> };
                                                             "Feature_Name", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW frozen", "Feature_Name_Or_Alias" >> }, Void;
                                                                                                         {FAST_ARRAY[STRING] << "Feature_Name_Or_Alias" >> }, Void >> };
                                                             "Feature_Name_Or_Alias", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW entity name", "Alias" >> }, Void;
                                                                                                                  {FAST_ARRAY[STRING] << "KW infix", "KW string" >> }, Void;
                                                                                                                  {FAST_ARRAY[STRING] << "KW prefix", "KW string" >> }, Void >> };
                                                             "External", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW external", "KW string", "Alias" >> }, Void >> };
                                                             "Alias", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                  {FAST_ARRAY[STRING] << "KW alias", "KW string" >> }, Void >> };
                                                             "Type_Definition", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW class name", "Effective_Type_Parameters" >> }, Void;
                                                                                                            {FAST_ARRAY[STRING] << "KW separate", "KW class name", "Effective_Type_Parameters" >> }, Void;
                                                                                                            {FAST_ARRAY[STRING] << "KW like", "KW entity name", "r10" >> }, Void;
                                                                                                            {FAST_ARRAY[STRING] << "KW like", "KW Current", "r10" >> }, Void;
                                                                                                            {FAST_ARRAY[STRING] << "KW like", "KW Result", "r10" >> }, Void>> };
                                                             "Type_Parameters", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                            {FAST_ARRAY[STRING] << "KW [", "Type_Parameter+", "KW ]" >> }, Void >> };
                                                             "Type_Parameter+", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Type_Parameter" >> }, agent build_new_list("Type_Parameter", "Type_Parameter+");
                                                                                                            {FAST_ARRAY[STRING] << "Type_Parameter", "KW ,", "Type_Parameter+" >> }, agent build_continue_list("Type_Parameter", 1, "Type_Parameter+") >> };
                                                             "Type_Parameter", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW class name" >> }, Void;
                                                                                                           {FAST_ARRAY[STRING] << "KW class name", "KW ->", "Type_Definition" >> }, Void >> };
                                                             "Effective_Type_Parameters", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                                      {FAST_ARRAY[STRING] << "KW [", "Effective_Type_Parameter+", "KW ]" >> }, Void >> };
                                                             "Effective_Type_Parameter+", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Effective_Type_Parameter" >> }, agent build_new_list("Effective_Type_Parameter", "Effective_Type_Parameter+");
                                                                                                                      {FAST_ARRAY[STRING] << "Effective_Type_Parameter", "KW ,", "Effective_Type_Parameter+" >> }, agent build_continue_list("Effective_Type_Parameter", 1, "Effective_Type_Parameter+") >> };
                                                             "Effective_Type_Parameter", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Type_Definition" >> }, Void >> };
                                                             "Invariant", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                      {FAST_ARRAY[STRING] << "KW invariant", "Assertion*", "KW ;;" >> }, Void >> };
                                                             "Require", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                    {FAST_ARRAY[STRING] << "Require_Else", "Assertion*", "KW ;;" >> }, Void >> };
                                                             "Require_Else", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW require" >> }, Void;
                                                                                                         {FAST_ARRAY[STRING] << "KW require", "KW then" >> }, Void; -- *** Liberty extension
                                                                                                         {FAST_ARRAY[STRING] << "KW require", "KW else" >> }, Void >> };
                                                             "Ensure", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                   {FAST_ARRAY[STRING] << "Ensure_Then", "Assertion*", "KW ;;" >> }, Void >> };
                                                             "Ensure_Then", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW ensure" >> }, Void;
                                                                                                        {FAST_ARRAY[STRING] << "KW ensure", "KW then" >> }, Void >> };
                                                             "Check", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW check", "Assertion*", "KW ;;", "KW end" >> }, Void >> };
                                                             "Debug", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW debug", "Debug_Keys", "Instruction*", "KW end" >> }, Void >> };
                                                             "Debug_Keys", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                       {FAST_ARRAY[STRING] << "KW (", "Debug_Key+", "KW )" >> }, Void >> };
                                                             "Debug_Key+", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW string" >> }, agent build_new_list("Debug_Key", "Debug_Key+");
                                                                                                       {FAST_ARRAY[STRING] << "KW string", "KW ,", "Debug_Key+" >> }, agent build_continue_list("KW string", 1, "Debug_Key+") >> };
                                                             "Variant", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW variant", "Expression" >> }, Void >> };
                                                             "Assertion*", {DESCENDING_NON_TERMINAL << epsilon, agent build_empty_list("Assertion*");
                                                                                                       {FAST_ARRAY[STRING] << "Assertion", "KW ;;", "Assertion*" >> }, agent build_continue_list("Assertion", 1, "Assertion*") >> };
                                                             "Assertion", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "Assertion_Tag", "Assertion_Expression" >> }, Void >> };
                                                             "Assertion_Tag", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                          {FAST_ARRAY[STRING] << "KW entity name", "KW :" >> }, Void >> };
                                                             "Assertion_Expression", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW assertion comment" >> }, Void;
                                                                                                                 {FAST_ARRAY[STRING] << "Expression" >> }, Void >> };

                                                             "KW as", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "as"), Void);
                                                             "KW assign", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "assign"), Void);
                                                             "KW all", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "all"), Void);
                                                             "KW creation", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "creation"), Void);
                                                             "KW class", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "class"), Void);
                                                             "KW insert", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "insert"), Void);
                                                             "KW inherit", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "inherit"), Void);
                                                             "KW obsolete", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "obsolete"), Void);
                                                             "KW separate", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "separate"), Void);
                                                             "KW expanded", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "expanded"), Void);
                                                             "KW string", create {DESCENDING_TERMINAL}.make(agent parse_string(?), Void);
                                                             "KW entity name", create {DESCENDING_TERMINAL}.make(agent parse_entity_name(?), Void);
                                                             "KW class name", create {DESCENDING_TERMINAL}.make(agent parse_class_name(?), Void);
                                                             "KW number", create {DESCENDING_TERMINAL}.make(agent parse_number(?), Void);
                                                             "KW character", create {DESCENDING_TERMINAL}.make(agent parse_character(?), Void);
                                                             "KW agent", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "agent"), Void);
                                                             "KW parser", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "parser"), Void);
                                                             "KW grammar", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "grammar"), Void);
                                                             "KW feature", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "feature"), Void);
                                                             "KW indexing", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "indexing"), Void);
                                                             "KW is", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "is"), Void);
                                                             "KW external", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "external"), Void);
                                                             "KW alias", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "alias"), Void);
                                                             "KW infix", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "infix"), Void);
                                                             "KW prefix", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "prefix"), Void);
                                                             "KW unique", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "unique"), Void);
                                                             "KW frozen", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "frozen"), Void);
                                                             "KW end", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "end"), Void);
                                                             "KW rename", create {DESCENDING_TERMINAL}.make(agent parse_parent_clause(?, "rename"), Void);
                                                             "KW redefine", create {DESCENDING_TERMINAL}.make(agent parse_parent_clause(?, "redefine"), Void);
                                                             "KW undefine", create {DESCENDING_TERMINAL}.make(agent parse_parent_clause(?, "undefine"), Void);
                                                             "KW export", create {DESCENDING_TERMINAL}.make(agent parse_parent_clause(?, "export"), Void);
                                                             "KW end of parent clause", create {DESCENDING_TERMINAL}.make(agent parse_end_of_parent_clause(?), Void);
                                                             "KW local", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "local"), Void);
                                                             "KW deferred", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "deferred"), Void);
                                                             "KW attribute", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "attribute"), Void);
                                                             "KW do", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "do"), Void);
                                                             "KW once", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "once"), Void);
                                                             "KW retry", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "retry"), Void);
                                                             "KW rescue", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "rescue"), Void);
                                                             "KW create", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "create"), Void);
                                                             "KW if", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "if"), Void);
                                                             "KW then", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "then"), Void);
                                                             "KW elseif", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "elseif"), Void);
                                                             "KW else", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "else"), Void);
                                                             "KW inspect", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "inspect"), Void);
                                                             "KW when", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "when"), Void);
                                                             "KW from", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "from"), Void);
                                                             "KW until", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "until"), Void);
                                                             "KW loop", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "loop"), Void);
                                                             "KW not", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "not"), Void);
                                                             "KW and", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "and"), Void);
                                                             "KW or", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "or"), Void);
                                                             "KW xor", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "xor"), Void);
                                                             "KW implies", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "implies"), Void);
                                                             "KW old", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "old"), Void);
                                                             "KW require", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "require"), Void);
                                                             "KW ensure", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "ensure"), Void);
                                                             "KW invariant", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "invariant"), Void);
                                                             "KW variant", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "variant"), Void);
                                                             "KW check", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "check"), Void);
                                                             "KW debug", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "debug"), Void);
                                                             "KW Precursor", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "Precursor"), Void);
                                                             "KW Current", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "Current"), Void);
                                                             "KW Result", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "Result"), Void);
                                                             "KW True", create {DESCENDING_TERMINAL}.make(agent parse_boolean(?, "True"), Void);
                                                             "KW False", create {DESCENDING_TERMINAL}.make(agent parse_boolean(?, "False"), Void);
                                                             "KW Void", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "Void"), Void);
                                                             "KW like", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "like"), Void);
                                                             "KW !", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "!", ""), Void);
                                                             "KW ?", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "?", ":="), Void);
                                                             "KW :", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, ":", ":="), Void);
                                                             "KW :=", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, ":=", ""), Void);
                                                             "KW ::=", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "::=", ""), Void);
                                                             "KW ?:=", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "?:=", ""), Void);
                                                             "KW ?=", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "?=", ""), Void);
                                                             "KW |", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "|", ""), Void);
                                                             "KW ;", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, ";", ";"), Void);
                                                             "KW ;;", create {DESCENDING_TERMINAL}.make(agent parse_semi_colons(?), Void);
                                                             "KW (", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "(", ""), Void);
                                                             "KW )", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, ")", ""), Void);
                                                             --"KW )*", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, ")*", ""), Void);
                                                             --"KW )+", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, ")+", ""), Void);
                                                             --"KW )?", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, ")?", ""), Void);
                                                             "KW [", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "[", ""), Void);
                                                             "KW ]", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "]", ""), Void);
                                                             "KW {", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "{", ""), Void);
                                                             "KW }", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "}", ""), Void);
                                                             "KW .", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, ".", "."), Void);
                                                             "KW ,", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, ",", ""), Void);
                                                             "KW =", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "=", ""), Void);
                                                             "KW /=", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "/=", ""), Void);
                                                             "KW <=", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "<=", ""), Void);
                                                             "KW <", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "<", "<="), Void);
                                                             "KW >=", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, ">=", ""), Void);
                                                             "KW >", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, ">", ">="), Void);
                                                             "KW +", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "+", ""), Void);
                                                             "KW -", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "-", ""), Void);
                                                             "KW *", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "*", ""), Void);
                                                             "KW //", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "//", ""), Void);
                                                             "KW \\", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "\\", ""), Void);
                                                             "KW /", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "/", "/="), Void);
                                                             "KW ^", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "^", ""), Void);
                                                             "KW <<", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "<<", ""), Void);
                                                             "KW >>", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, ">>", ""), Void);
                                                             "KW ->", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "->", ""), Void);
                                                             "KW ..", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "..", ""), Void);
                                                             "KW $", create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, "$", ""), Void);
                                                             "KW free operator", create {DESCENDING_TERMINAL}.make(agent parse_freeop(?), Void);
                                                             "KW assertion comment", create {DESCENDING_TERMINAL}.make(agent parse_assertion_comment(?), Void);
                                                             "KW end of file", create {DESCENDING_TERMINAL}.make(agent parse_end(?), Void) >> }
      end

   table_memory: PARSE_TABLE[DESCENDING_PARSE_CONTEXT]

feature {ANY}
   table: PARSE_TABLE[DESCENDING_PARSE_CONTEXT]
      do
         Result := table_memory
         if Result = Void then
            Result := the_table
            Result.set_default_tree_builders(agent build_non_terminal(?, ?), agent build_terminal(?, ?))
            table_memory := Result
         end
      end

   display (output: OUTPUT_STREAM)
      do
         if not stack.is_empty then
            stack.first.display(output, 0, Void)
         end
      end

   generate (o: OUTPUT_STREAM)
      do
         if not stack.is_empty then
            stack.first.generate(o)
         end
      end

   root_node: EIFFEL_NODE
      do
         if not stack.is_empty then
            Result := stack.first
         end
      end

   reset
      do
         stack.clear_count
         create position
         end_reached := False
      ensure
         stack.is_empty
         not end_reached
      end

feature {}
   epsilon: FAST_ARRAY[STRING]
      once
         create Result.with_capacity(0)
      ensure
         Result.is_empty
      end

   is_a_keyword (id: STRING): BOOLEAN
      do
         inspect
            id
         when "agent", "feature", "class", "obsolete", "insert", "inherit", "separate", "creation", "redefine", "undefine", "rename", "as", "export", "create", "is", "end", "local", "deferred", "attribute", "do", "once", "retry", "rescue", "if", "then", "elseif", "else", "inspect", "when", "from", "until", "loop", "not", "and", "or", "xor", "implies", "old", "require", "ensure", "invariant", "variant", "check", "debug", "Precursor", "Current", "Result", "True", "False", "Void", "like", "unique", "frozen", "infix", "prefix", "alias", "external", "indexing", "all" then
            Result := True
         else
            check
               not Result
            end
         end
      end

   is_a_free_operator (op: STRING): BOOLEAN
      require
         op.count > 0
      local
         i: INTEGER
      do
         inspect op
         when "<<", ">>", "=", "/=", "<=", "<", ">=", ">", "+", "-", "*", "//", "\\", "/", "^", "->", ".." then
            check
               not Result
            end
         else
            inspect
               op.first
            when '+', '-', '*', '/', '\', '=', '<', '>', '@', '#', '|', '&', '~' then
               Result := True
               from
                  i := 2
               until
                  i > op.count
               loop
                  inspect
                     op.item(i)
                  when '.', '?', '{', '}' then
                     Result := False
                  when '+', '-', '*', '/', '\', '=', '<', '>', '@', '#', '|', '&', '~', '^' then
                     Result := True
                  else
                     Result := False
                     i := op.count + 1
                  end
                  i := i + 1
               end
            else
               check
                  not Result
               end
            end
         end
      end

   last_blanks: STRING ""
   comment_position: like position
   has_comment: BOOLEAN

   skip_blank (buffer: MINI_PARSER_BUFFER; skip_semi_colons: BOOLEAN): BOOLEAN
      local
         old_position: like position
      do
         if not buffer.end_reached then
            old_position := position
            if buffer.current_character.is_separator then
               last_blanks.extend(buffer.current_character)
               next_character(buffer)
               Result := True
            elseif skip_semi_colons and then buffer.current_character = ';' then
               last_blanks.extend(buffer.current_character)
               next_character(buffer)
               Result := True
            elseif buffer.current_character = '-' then
               next_character(buffer)
               if buffer.current_character /= '-' then
                  restore(buffer, old_position)
               else
                  Result := True
                  if not has_comment then
                     comment_position := position
                     has_comment := True
                  end
                  last_blanks.extend('-')
                  last_blanks.extend('-')
                  from
                     next_character(buffer)
                  until
                     buffer.end_reached or else buffer.current_character = '%N'
                  loop
                     last_blanks.extend(buffer.current_character)
                     next_character(buffer)
                  end
                  if not buffer.end_reached then
                     check
                        buffer.current_character = '%N'
                     end
                     last_blanks.extend('%N')
                     next_character(buffer) -- skip the '%N'
                  end
               end
            end
         end
      ensure
         not Result implies buffer.current_index = old buffer.current_index
      end

   skip_blanks (buffer: MINI_PARSER_BUFFER)
      do
         from
            has_comment := False
            last_blanks.clear_count
         until
            not skip_blank(buffer, False)
         loop
         end
         buffer.clear_mark
      ensure
         buffer.current_index = last_blanks.count + old buffer.current_index
         not buffer.marked
      end

   skip_blanks_and_semi_colons (buffer: MINI_PARSER_BUFFER)
      do
         from
            has_comment := False
            last_blanks.clear_count
         until
            not skip_blank(buffer, True)
         loop
         end
         buffer.clear_mark
      ensure
         buffer.current_index = last_blanks.count + old buffer.current_index
         not buffer.marked
      end

   parse_assertion_comment (buffer: MINI_PARSER_BUFFER): UNTYPED_EIFFEL_IMAGE
      local
         old_position: like position; image: STRING; i: INTEGER
      do
         old_position := position
         skip_blanks(buffer)
         if has_comment then
            check
               last_blanks.has('-')
            end
            image := once ""
            image.copy(last_blanks)
            from
               i := 1
            until
               image.item(i) = '-'
            loop
               i := i + 1
            end
            image.shrink(i, image.upper)
            last_blanks.shrink(last_blanks.lower, i - 1)
            create Result.make(image.twin, last_blanks.twin, comment_position)
         end
      end

   parse_string (buffer: MINI_PARSER_BUFFER): TYPED_EIFFEL_IMAGE[STRING]
         -- the algorithm is a bit less strict than SmartEiffel's
      local
         old_position, start_position: like position; i, t, state, code, scale: INTEGER; c: CHARACTER; image, parsed, end_tag: STRING; unicode: BOOLEAN
      do
         old_position := position
         skip_blanks(buffer)
         start_position := position
         if not buffer.end_reached and then buffer.current_character = 'U' then
            image := once ""
            image.copy(once "U")
            next_character(buffer)
            if buffer.end_reached or else buffer.current_character /= '"' then
               image := Void
            end
         end
         if not buffer.end_reached and then buffer.current_character = '"' then
            if image = Void then
               image := once ""
               image.clear_count
            end
            parsed := once ""
            parsed.clear_count
            image.extend('"')
            from
               next_character(buffer)
            until
               state < 0 or else buffer.end_reached
            loop
               c := buffer.current_character
               inspect state
               when 0 then
                  -- normal simple string state
                  inspect
                     c
                  when '"' then
                     image.extend('"')
                     state := -1
                  when '%%' then
                     image.extend('%%')
                     state := 1
                  when '[' then
                     image.extend('[')
                     state := 10
                  when '{' then
                     image.extend('{')
                     state := 11
                  when '%N', '%R' then
                     image := Void
                     state := -1
                  else
                     image.extend(c)
                     parsed.extend(c)
                  end
               when 1 then
                  -- just after a % in a simple string
                  inspect
                     c
                  when '%R' then
                     parsed.extend('%R')
                     image.extend(c)
                     state := 2
                  when '%N' then
                     parsed.extend('%N')
                     image.extend(c)
                     state := 2
                  when 'A' then
                     parsed.extend('%A')
                     image.extend(c)
                     state := 0
                  when 'B' then
                     parsed.extend('%B')
                     image.extend(c)
                     state := 0
                  when 'C' then
                     parsed.extend('%C')
                     image.extend(c)
                     state := 0
                  when 'D' then
                     parsed.extend('%D')
                     image.extend(c)
                     state := 0
                  when 'F' then
                     parsed.extend('%F')
                     image.extend(c)
                     state := 0
                  when 'H' then
                     parsed.extend('%H')
                     image.extend(c)
                     state := 0
                  when 'L' then
                     parsed.extend('%L')
                     image.extend(c)
                     state := 0
                  when 'N' then
                     parsed.extend('%N')
                     image.extend(c)
                     state := 0
                  when 'Q' then
                     parsed.extend('%Q')
                     image.extend(c)
                     state := 0
                  when 'R' then
                     parsed.extend('%R')
                     image.extend(c)
                     state := 0
                  when 'S' then
                     parsed.extend('%S')
                     image.extend(c)
                     state := 0
                  when 'T' then
                     parsed.extend('%T')
                     image.extend(c)
                     state := 0
                  when 'U' then
                     parsed.extend('%U')
                     image.extend(c)
                     state := 0
                  when 'V' then
                     parsed.extend('%V')
                     image.extend(c)
                     state := 0
                  when '%%' then
                     parsed.extend('%%')
                     image.extend(c)
                     state := 0
                  when '%'' then
                     parsed.extend('%'')
                     image.extend(c)
                     state := 0
                  when '%"' then
                     parsed.extend('%"')
                     image.extend(c)
                     state := 0
                  when '(' then
                     parsed.extend('%(')
                     image.extend(c)
                     state := 0
                  when ')' then
                     parsed.extend('%)')
                     image.extend(c)
                     state := 0
                  when '<' then
                     parsed.extend('%<')
                     image.extend(c)
                     state := 0
                  when '>' then
                     parsed.extend('%>')
                     image.extend(c)
                     state := 0
                  when '/' then
                     image.extend(c)
                     code := 0
                     scale := 10
                     unicode := False
                     state := 3
                  else
                     -- unknown escape character
                     image := Void
                     state := -1
                  end
               when 2 then
                  inspect
                     c
                  when '%R', '%N', '%T', ' ' then
                     parsed.extend(c)
                     image.extend(c)
                  when '%%' then
                     image.extend(c)
                     state := 0
                  else
                     image := Void
                     state := -1
                  end
               when 3 then
                  inspect c
                  when '0'..'9' then
                     code := code * scale + (c.code - '0'.code)
                     image.extend(c)
                  when 'A'..'F' then
                     if scale = 16 then
                        code := code * scale + (c.code - 'A'.code + 10)
                        image.extend(c)
                     else
                        image := Void
                        state := -1
                     end
                  when 'a'..'f' then
                     if scale = 16 then
                        code := code * scale + (c.code - 'a'.code + 10)
                        image.extend(c)
                     else
                        image := Void
                        state := -1
                     end
                  when 'x' then
                     scale := 16
                     image.extend(c)
                  when 'U' then
                     scale := 16
                     unicode := True
                     image.extend(c)
                  when '/' then
                     if unicode then
                        -- parsed.extend(code.to_unicode_character) -- *** TODO unicode
                     else
                        parsed.extend(code.to_character)
                     end
                     image.extend('/')
                     state := 0
                  else
                     image := Void
                     state := -1
                  end
               when 10 then
                  -- maybe the start of a multi-line "[...]" string?
                  check
                     end_tag = Void
                     image.count >= 2
                  end
                  inspect
                     c
                  when '%N', '%R' then
                     end_tag := once ""
                     end_tag.copy(image)
                     end_tag.put(']', end_tag.lower)
                     end_tag.put('"', end_tag.upper)
                     image.extend(c)
                     state := 12
                     t := end_tag.lower
                  when '%%' then
                     parsed.extend('[')
                     image.extend('[')
                     image.extend('%%')
                     state := 1
                  when '"' then
                     parsed.extend('[')
                     image.extend('[')
                     image.extend('"')
                     state := -1
                  else
                     parsed.extend('[')
                     parsed.extend(c)
                     image.extend(c)
                     state := 0
                  end
               when 11 then
                  -- maybe the start of a multi-line "{...}" string?
                  check
                     end_tag = Void
                     image.count >= 2
                  end
                  inspect
                     c
                  when '%N', '%R' then
                     end_tag := once ""
                     end_tag.copy(image)
                     end_tag.put('}', end_tag.lower)
                     end_tag.put('"', end_tag.upper)
                     image.extend(c)
                     state := 12
                     t := end_tag.lower
                  when '%%' then
                     parsed.extend('{')
                     image.extend('{')
                     image.extend('%%')
                     state := 1
                  when '"' then
                     parsed.extend('{')
                     image.extend('{')
                     image.extend('"')
                     state := -1
                  else
                     parsed.extend('{')
                     parsed.extend(c)
                     image.extend(c)
                     state := 0
                  end
               when 12 then
                  -- in a multi-line string
                  check
                     end_tag.count >= 2
                     end_tag.valid_index(t)
                  end
                  inspect
                     c
                  when '"' then
                     image.extend('"')
                     if t = end_tag.upper then
                        -- check that the beginning of the line contains only spaces
                        from
                           i := image.upper - end_tag.count
                           check
                              image.count > 2 * end_tag.count
                              i > end_tag.count
                           end
                        until
                           state = -1 or else i < end_tag.count
                        loop
                           inspect
                              image.item(i)
                           when '%R', '%N' then
                              -- we found the end tag
                              state := -1
                           when ' ', '%T' then
                              -- still checking
                              i := i - 1
                           else
                              -- not the end of the string yet because the end tag is not alone on the line (except for leading spaces)
                              i := 0
                           end
                        end
                     else
                        parsed.extend('"')
                     end
                     t := end_tag.lower
                  else
                     if c = end_tag.item(t) then
                        t := t + 1
                     else
                        if t > end_tag.lower then
                           parsed.append(end_tag.substring(end_tag.lower, t - 1))
                           t := end_tag.lower
                        end
                        parsed.extend(c)
                     end
                     image.extend(c)
                  end
               end
               next_character(buffer)
            end
            if image /= Void then
               create Result.make(image.twin, parsed.twin, last_blanks.twin, start_position)
            else
               restore(buffer, old_position)
            end
         end
      ensure
         Result /= Void implies (
               (Result.image.count >= 2 and then Result.image.first = '"')
                  or else
               (Result.image.count >= 3 and then Result.image.first = 'U' and then Result.image.item(2) = '"')
            ) and then Result.image.last = '"'
      end

   is_entity_name_start (c: CHARACTER): BOOLEAN
      do
         inspect
            c
         when 'A' .. 'Z', 'a' .. 'z' then
            Result := True
         else
            check
               not Result
            end
         end
      end

   is_entity_name_part (c: CHARACTER): BOOLEAN
      do
         inspect
            c
         when 'a' .. 'z', '0' .. '9', '_' then
            Result := True
         else
            check
               not Result
            end
         end
      end

   parse_entity_name (buffer: MINI_PARSER_BUFFER): UNTYPED_EIFFEL_IMAGE
      local
         old_position, start_position: like position; image: STRING
      do
         old_position := position
         skip_blanks(buffer)
         start_position := position
         if not buffer.end_reached and then is_entity_name_start(buffer.current_character) then
            image := once ""
            image.clear_count
            from
               image.extend(buffer.current_character)
               next_character(buffer)
            until
               buffer.end_reached or else not is_entity_name_part(buffer.current_character)
            loop
               image.extend(buffer.current_character)
               next_character(buffer)
            end
         end
         if image = Void or else is_a_keyword(image) then
            restore(buffer, old_position)
         else
            if image.is_equal(once "U") and then not buffer.end_reached and then buffer.current_character = '"' then
               -- It's not an entity name but the beginning of a Unicode string
               restore(buffer, old_position)
            else
               create Result.make(image.twin, last_blanks.twin, start_position)
            end
         end
      end

   is_class_name_start (c: CHARACTER): BOOLEAN
      do
         inspect
            c
         when 'A' .. 'Z' then
            Result := True
         else
            check
               not Result
            end
         end
      end

   is_class_name_part (c: CHARACTER): BOOLEAN
      do
         inspect
            c
         when 'A' .. 'Z', '0' .. '9', '_' then
            Result := True
         else
            check
               not Result
            end
         end
      end

   parse_class_name (buffer: MINI_PARSER_BUFFER): UNTYPED_EIFFEL_IMAGE
      local
         old_position, start_position: like position; image: STRING
      do
         old_position := position
         skip_blanks(buffer)
         start_position := position
         if not buffer.end_reached and then is_class_name_start(buffer.current_character) then
            image := once ""
            image.clear_count
            from
               image.extend(buffer.current_character)
               next_character(buffer)
            until
               buffer.end_reached or else not is_class_name_part(buffer.current_character)
            loop
               image.extend(buffer.current_character)
               next_character(buffer)
            end
         end
         if image = Void or else is_a_keyword(image) then
            restore(buffer, old_position)
         else
            create Result.make(image.twin, last_blanks.twin, start_position)
         end
      end

   keyword_image (buffer: MINI_PARSER_BUFFER; keyword, not_successors: STRING): STRING
      local
         old_position, start_position: like position; i: INTEGER; c: CHARACTER
      do
         old_position := position
         start_position := position
         from
            Result := keyword
            i := keyword.lower
         until
            i > keyword.upper or else Result = Void
         loop
            if buffer.end_reached or else buffer.current_character /= keyword.item(i) then
               restore(buffer, old_position)
               Result := Void
            else
               next_character(buffer)
               i := i + 1
            end
         end
         if buffer.end_reached  then
            -- note that the end was reached with a completely correct parsing, just incomplete
            end_reached := True
         else
            -- be sure that the keyword is not just the prefix of another word
            c := buffer.current_character
            if not_successors = Void then
               if not c.is_separator and then keyword.first.is_letter_or_digit and then (c.is_letter_or_digit or else c = '_') then
                  Result := Void
                  restore(buffer, old_position)
               end
            elseif not_successors.has(c) then
               Result := Void
               restore(buffer, old_position)
            end
         end
      end

   parse_keyword (buffer: MINI_PARSER_BUFFER; keyword: STRING): UNTYPED_EIFFEL_IMAGE
      local
         old_position, start_position: like position; image: STRING
      do
         old_position := position
         skip_blanks(buffer)
         start_position := position
         image := keyword_image(buffer, keyword, Void)
         if image /= Void then
            -- `image' may be shared here
            create Result.make(image, last_blanks.twin, start_position)
         else
            restore(buffer, old_position)
         end
      end

   parse_symbol (buffer: MINI_PARSER_BUFFER; keyword, not_successors: STRING): UNTYPED_EIFFEL_IMAGE
      local
         old_position, start_position: like position; image: STRING
      do
         old_position := position
         skip_blanks(buffer)
         start_position := position
         image := keyword_image(buffer, keyword, not_successors)
         if image /= Void then
            -- `image' may be shared here
            create Result.make(image, last_blanks.twin, start_position)
         else
            restore(buffer, old_position)
         end
      end

   parse_semi_colons (buffer: MINI_PARSER_BUFFER): UNTYPED_EIFFEL_IMAGE
      local
         old_position: like position
      do
         old_position := position
         skip_blanks_and_semi_colons(buffer)
         create Result.make(once "", last_blanks.twin, position)
      end

   -- This "in parent clause" features handle the ambiguity of the following construction:
   --   class FOO
   --   inherit
   --      BAR
   --   end

   in_parent_clause: BOOLEAN

   parse_parent_clause (buffer: MINI_PARSER_BUFFER; keyword: STRING): UNTYPED_EIFFEL_IMAGE
      do
         Result := parse_keyword(buffer, keyword)
         if Result /= Void then
            in_parent_clause := True
         end
      ensure
         Result /= Void implies in_parent_clause
      end

   parse_end_of_parent_clause (buffer: MINI_PARSER_BUFFER): UNTYPED_EIFFEL_IMAGE
      do
         if in_parent_clause then
            Result := parse_keyword(buffer, once "end")
            in_parent_clause := False
         end
      ensure
         not in_parent_clause
      end

   parse_freeop (buffer: MINI_PARSER_BUFFER): UNTYPED_EIFFEL_IMAGE
      local
         old_position, start_position: like position; image: STRING
      do
         old_position := position
         skip_blanks(buffer)
         start_position := position
         if not buffer.end_reached and then not buffer.current_character.is_letter_or_digit and then not buffer.current_character.is_separator then
            image := once ""
            image.clear_count
            from
               image.extend(buffer.current_character)
               next_character(buffer)
            until
               buffer.end_reached or else buffer.current_character.is_letter_or_digit or else buffer.current_character.is_separator
            loop
               image.extend(buffer.current_character)
               next_character(buffer)
            end
            if is_a_free_operator(image) then
               create Result.make(image.twin, last_blanks.twin, start_position)
            else
               restore(buffer, old_position)
            end
         end
      end

   parse_boolean (buffer: MINI_PARSER_BUFFER; expected: STRING): TYPED_EIFFEL_IMAGE[BOOLEAN]
      require
         expected.is_boolean
      local
         old_position, start_position: like position; image: STRING
      do
         old_position := position
         skip_blanks(buffer)
         start_position := position
         image := keyword_image(buffer, expected, Void)
         if image /= Void then
            -- `image' may be shared here
            create Result.make(image, image.to_boolean, last_blanks.twin, start_position)
         else
            restore(buffer, old_position)
         end
      ensure
         Result /= Void implies Result.decoded = expected.to_boolean
      end

   parse_number (buffer: MINI_PARSER_BUFFER): EIFFEL_IMAGE
      local
         old_position, start_position: like position; state: INTEGER; c: CHARACTER; image: STRING
         valid, valid_before_dot, valid_before_exp: BOOLEAN
      do
         old_position := position
         skip_blanks(buffer)
         start_position := position
         if not buffer.end_reached then
            image := once ""
            image.clear_count
            from
               c := buffer.current_character
               image.extend(c)
               next_character(buffer)
               inspect c
               when '+', '-' then
                  c := buffer.current_character
                  image.extend(c)
                  inspect c
                  when '0' then
                     valid := True
                     state := 1
                  when '1' .. '9' then
                     valid := True
                     -- state := 0
                  else
                     state := -1
                  end
                  next_character(buffer)
               when '.' then
                  -- state := 0
               when '0' then
                  valid := True
                  state := 1
               when '1'..'9' then
                  valid := True
                  -- state := 0
               else
                  image := Void
                  state := -1
               end
            until
               buffer.end_reached or else state < 0
            loop
               c := buffer.current_character
               inspect
                  state
               when 0 then
                  -- decimal integer
                  inspect
                     c
                  when '_' then
                     image.extend(c)
                  when '0' .. '9' then
                     image.extend(c)
                     valid := True
                  when '.' then
                     image.extend(c)
                     valid_before_dot := valid
                     valid := False
                     state := 3
                  when 'e', 'E' then
                     image.extend(c)
                     valid_before_exp := valid
                     valid := False
                     state := 4
                  else
                     state := -1
                  end
               when 1 then
                  -- first character was zero; just read the second.
                  inspect
                     c
                  when 'x', 'X' then
                     image.extend(c)
                     valid := False
                     state := 2
                  when '_' then
                     image.extend(c)
                     state := 0
                  when '0' .. '9' then
                     image.extend(c)
                     valid := True
                     state := 0
                  when '.' then
                     image.extend(c)
                     valid_before_dot := valid
                     valid := False
                     state := 3
                  else
                     state := -1
                  end
               when 2 then
                  -- hexadecimal integer
                  inspect
                     c
                  when '0' .. '9', '_', 'A' .. 'F', 'a' .. 'f' then
                     image.extend(c)
                     valid := True
                  else
                     state := -1
                  end
               when 3 then
                  -- fractional part
                  inspect
                     c
                  when '_' then
                     image.extend(c)
                  when '0' .. '9' then
                     image.extend(c)
                     valid := True
                  when 'e', 'E' then
                     image.extend(c)
                     valid_before_exp := valid
                     valid := False
                     state := 4
                  else
                     if image.last = '.' then
                        image.remove_last
                        buffer.set_current_index(buffer.current_index - 1)
                        valid := valid_before_dot
                     end
                     state := -1
                  end
               when 4 then
                  -- just read the 'e' of the exponential part
                  check not valid end
                  inspect
                     c
                  when '+', '-' then
                     image.extend(c)
                     state := 5
                  when '0' .. '9' then
                     image.extend(c)
                     valid := True
                     state := 5
                  else
                     image.remove_last
                     buffer.set_current_index(buffer.current_index - 1)
                     valid := valid_before_exp
                     state := -1
                  end
               when 5 then
                  -- exponential part
                  inspect
                     c
                  when '_' then
                     image.extend(c)
                  when '0' .. '9' then
                     image.extend(c)
                     valid := True
                  else
                     state := -1
                  end
               end
               if state >= 0 then
                  next_character(buffer)
               end
            end
            if not valid or (not buffer.end_reached and then buffer.current_character.is_letter) then
               image := Void
            end
         end
         if image = Void then
            restore(buffer, old_position)
         elseif image.is_integer_64 then
            create {TYPED_EIFFEL_IMAGE[INTEGER_64]}Result.make(image.twin, image.to_integer_64, last_blanks.twin, start_position)
         elseif is_hex(image) then
            create {TYPED_EIFFEL_IMAGE[INTEGER_64]}Result.make(image.twin, hex_to_integer_64(image), last_blanks.twin, start_position)
         elseif image.is_real then
            create {TYPED_EIFFEL_IMAGE[REAL]}Result.make(image.twin, image.to_real, last_blanks.twin, start_position)
         else
            create {UNTYPED_EIFFEL_IMAGE}Result.make(image.twin, last_blanks.twin, start_position)
         end
      end

   is_hex (image: STRING): BOOLEAN
      local
         i: INTEGER
      do
         from
            Result := image.count.in_range(3, 18) and then image.has_prefix(once "0x")
            i := 3
         until
            not Result or else i > image.count
         loop
            inspect
               image.item(i)
            when '0'..'9', 'a'..'f', 'A'..'F' then
               check Result end
            else
               Result := False
            end
            i := i + 1
         end
      end

   hex_to_integer_64 (image: STRING): INTEGER_64
      require
         is_hex(image)
      local
         i, n: INTEGER; c: CHARACTER
      do
         from
            i := 3
         until
            i > image.count
         loop
            c := image.item(i)
            inspect
               c
            when '0'..'9' then
               n := c.code #- '0'.code
            when 'a'..'f' then
               n := c.code #- 'a'.code #+ 10
            when 'A'..'F' then
               n := c.code #- 'A'.code #+ 10
            end
            check
               n.in_range(0, 15)
            end
            Result := (Result #* 16) #+ n
            i := i + 1
         end
      end

   parse_character (buffer: MINI_PARSER_BUFFER): TYPED_EIFFEL_IMAGE[CHARACTER]
      local
         old_position, start_position: like position; c, character: CHARACTER; image: STRING
         invalid_character, ok_image: BOOLEAN; code: INTEGER
      do
         old_position := position
         skip_blanks(buffer)
         start_position := position
         if not buffer.end_reached and then buffer.current_character = '%'' then
            image := once "...."
            image.clear_count
            image.extend('%'')
            next_character(buffer)
            if buffer.end_reached then
               image := Void
            else
               c := buffer.current_character
               next_character(buffer)
               if c /= '%%' then
                  character := c
               else
                  image.extend('%%')
                  if buffer.end_reached then
                     image := Void
                  else
                     c := buffer.current_character
                     inspect c
                     when '%R' then
                        character := '%R'
                     when '%N' then
                        character := '%N'
                     when 'A' then
                        character := '%A'
                     when 'B' then
                        character := '%B'
                     when 'C' then
                        character := '%C'
                     when 'D' then
                        character := '%D'
                     when 'F' then
                        character := '%F'
                     when 'H' then
                        character := '%H'
                     when 'L' then
                        character := '%L'
                     when 'N' then
                        character := '%N'
                     when 'Q' then
                        character := '%Q'
                     when 'R' then
                        character := '%R'
                     when 'S' then
                        character := '%S'
                     when 'T' then
                        character := '%T'
                     when 'U' then
                        character := '%U'
                     when 'V' then
                        character := '%V'
                     when '%%' then
                        character := '%%'
                     when '%'' then
                        character := '%''
                     when '%"' then
                        character := '%"'
                     when '(' then
                        character := '%('
                     when ')' then
                        character := '%)'
                     when '<' then
                        character := '%<'
                     when '>' then
                        character := '%>'
                     when '/' then
                        image.extend('/')
                        from
                           next_character(buffer)
                           if buffer.end_reached then
                              invalid_character := True
                           else
                              c := buffer.current_character
                              inspect
                                 c
                              when '0'..'9' then
                                 image.extend(c)
                                 code := c.code - '0'.code
                                 next_character(buffer)
                                 if buffer.end_reached then
                                    invalid_character := True
                                 else
                                    c := buffer.current_character
                                 end
                              else
                                 invalid_character := True
                              end
                           end
                        invariant
                           not buffer.end_reached
                        until
                           invalid_character or else c = '/'
                        loop
                           c := buffer.current_character
                           inspect
                              c
                           when '0'..'9' then
                              image.extend(c)
                              code := code * 10 + (c.code - '0'.code)
                              next_character(buffer)
                              if buffer.end_reached then
                                 invalid_character := True
                              else
                                 c := buffer.current_character
                              end
                           when '/' then
                              -- OK, done
                           else
                              invalid_character := True
                           end
                        end
                        if not invalid_character then
                           check c = '/' end
                           image.extend(c)
                           if code > Maximum_character_code then
                              invalid_character := True
                           else
                              character := code.to_character
                              ok_image := True
                           end
                        end
                     else
                        -- unknown escape character
                        invalid_character := True
                     end
                     next_character(buffer)
                  end
               end
               if invalid_character or else buffer.end_reached or else buffer.current_character /= '%'' then
                  image := Void
               else
                  if not ok_image then
                     image.extend(c)
                  end
                  image.extend('%'')
                  next_character(buffer)
               end
            end
         end
         if image = Void then
            restore(buffer, old_position)
         else
            create Result.make(image.twin, character, last_blanks.twin, position)
         end
      end

   parse_end (buffer: MINI_PARSER_BUFFER): UNTYPED_EIFFEL_IMAGE
      local
         old_position: like position
      do
         old_position := position
         skip_blanks(buffer)
         if buffer.end_reached then
            create Result.make(once "", last_blanks.twin, position)
         else
            restore(buffer, old_position)
         end
      end

feature {}
   stack: FAST_ARRAY[EIFFEL_NODE]
   left_assoc_stack: FAST_ARRAY[EIFFEL_LEFT_ASSOCIATIVE_EXPRESSION]

   show_stack
      local
         i: INTEGER
      do
         log.trace.put_line(once "--8<-------- <start stack>")
         from
            i := stack.lower
         until
            i > stack.upper
         loop
            log.trace.put_integer(i)
            log.trace.put_string(once ":%T")
            log.trace.put_line(stack.item(i).name)
            i := i + 1
         end
         log.trace.put_line(once "-------->8-- <end stack>")
      end

   stack_matches (node_content: TRAVERSABLE[FIXED_STRING]): BOOLEAN
      local
         i: INTEGER
      do
         Result := node_content /= Void and then stack.count >= node_content.count
         from
            i := 0
         until
            not Result or else i >= node_content.count
         loop
            Result := node_content.item(i + node_content.lower) = stack.item(stack.upper - node_content.count + 1 + i).name
            if not Result then
               breakpoint
            end
            i := i + 1
         end
      ensure
         used_only_in_assertions: Result
      end

   build_root (root_name: FIXED_STRING; root_content: TRAVERSABLE[FIXED_STRING])
      do
         build_non_terminal(root_name, root_content)
         debug ("parse/eiffel/ast")
            log.trace.put_line(once "Final AST:")
            display(log.trace)
         end
      end

   build_non_terminal (node_name: FIXED_STRING; node_content: TRAVERSABLE[FIXED_STRING])
      require
         stack_matches(node_content)
      local
         i: INTEGER; new_node: EIFFEL_NON_TERMINAL_NODE; node: EIFFEL_NODE
      do
         debug ("parse/eiffel/build")
            log.trace.put_string(once "Building non-terminal node: ")
            log.trace.put_character('"')
            log.trace.put_string(node_name)
            log.trace.put_character('"')
            log.trace.put_new_line
         end
         new_node := factory.non_terminal(node_name, node_content)
         from
            i := node_content.upper
         until
            i < node_content.lower
         loop
            node := stack.last
            stack.remove_last
            new_node.set(i, node)
            debug ("parse/eiffel/build")
               log.trace.put_string(once "   aggregating: ")
               log.trace.put_line(node_content.item(i))
            end
            i := i - 1
         end
         stack.add_last(new_node)
         debug ("parse/eiffel/build")
            show_stack
         end
      ensure
         node_content.count = old node_content.count
         stack.count = old stack.count - node_content.count + 1
         stack.last.name.is_equal(node_name)
      end

   build_terminal (node_name: FIXED_STRING; node_image: PARSER_IMAGE)
      local
         eiffel_image: EIFFEL_IMAGE
      do
         eiffel_image ::= node_image
         debug ("parse/eiffel/build")
            log.trace.put_string(once "Building terminal node: ")
            log.trace.put_character('"')
            log.trace.put_string(node_name)
            log.trace.put_string(once "%": ")
            log.trace.put_line(eiffel_image.image)
         end
         stack.add_last(factory.terminal(node_name, eiffel_image))
         debug ("parse/eiffel/build")
            show_stack
         end
      ensure
         stack.count = old stack.count + 1
         stack.last.name.is_equal(node_name)
      end

   ensure_expression (expression: EIFFEL_NODE; expression_name: FIXED_STRING): EIFFEL_NON_TERMINAL_NODE
      local
         expname: STRING
      do
         if expression.name.is_equal(expression_name) then
            Result ::= expression
         else
            expname := once "..-exp"
            expname.make_from_string(expression_name)
            expname.append(once "-exp")
            if expression.name.is_equal(expname) then
               Result ::= expression
            else
               left_assoc_names.clear_count
               left_assoc_names.add_last(expression.name)
               Result := factory.non_terminal(expression_name, left_assoc_names)
               Result.set(0, expression)
            end
         end
      end

   build_expression_remainder (operator_names: FAST_ARRAY[ABSTRACT_STRING]; expression_name: FIXED_STRING)
      local
         tail: EIFFEL_LEFT_ASSOCIATIVE_EXPRESSION
         exp: EIFFEL_NODE; operator_nodes: COLLECTION[EIFFEL_NODE]
         i: INTEGER
      do
         debug ("parse/eiffel/build")
            log.trace.put_string(once "Building left-associative expression ")
            log.trace.put_string(expression_name)
            log.trace.put_string(once " using operator ")
            log.trace.put_line(operator_names.out)
         end

         exp := ensure_expression(stack.last, expression_name)
         stack.remove_last
         debug ("parse/eiffel/build")
            log.trace.put_string(once "  => setting aside: ")
            log.trace.put_line(exp.name)
         end
         create {FAST_ARRAY[EIFFEL_NODE]} operator_nodes.with_capacity(operator_names.count)
         from
            i := operator_names.lower
         until
            i > operator_names.upper
         loop
            operator_nodes.add_last(stack.last)
            stack.remove_last
            i := i + 1
         end
         tail.set(expression_name, operator_names, exp, operator_nodes)
         left_assoc_stack.add_last(tail)

         debug ("parse/eiffel/build")
            show_stack
         end
      end

   build_expression (expression_name: FIXED_STRING)
      local
         tail: EIFFEL_LEFT_ASSOCIATIVE_EXPRESSION
         left, right: EIFFEL_NODE; nt: EIFFEL_NON_TERMINAL_NODE
         i: INTEGER; name: STRING
      do
         debug ("parse/eiffel/build")
            log.trace.put_string(once "Building simple expression ")
            log.trace.put_line(expression_name)
         end

         name := once "..-exp"
         name.make_from_string(expression_name)
         name.append(once "-exp")

         from
            left := ensure_expression(stack.last, expression_name)
            stack.remove_last
         invariant
            not left_assoc_stack.is_empty implies left_assoc_stack.last.expression_name = expression_name
         until
            left_assoc_stack.is_empty
         loop
            debug ("parse/eiffel/build")
               log.trace.put_string(once "  left: ")
               log.trace.put_line(left.name)
            end

            tail := left_assoc_stack.last
            left_assoc_stack.remove_last

            right := ensure_expression(tail.right_node, expression_name)
            debug ("parse/eiffel/build")
               log.trace.put_string(once "  op: ")
               log.trace.put_line(tail.operator_names_out)
               log.trace.put_string(once "  right: ")
               log.trace.put_line(right.name)
            end

            left_assoc_names.clear_count
            left_assoc_names.add_last(left.name)
            tail.append_operators_in(left_assoc_names)
            left_assoc_names.add_last(expression_name)

            nt := factory.non_terminal(name.intern, left_assoc_names)
            nt.set(nt.lower, left)
            nt.set(nt.upper, right)
            debug ("parse/eiffel/build")
               log.trace.put_string(once "  => nt: ")
               log.trace.put_line(nt.name)
            end
            check
               tail.operator_nodes.lower = 0
            end
            from
               i := tail.operator_nodes.lower
            until
               i > tail.operator_nodes.upper
            loop
               nt.set(nt.lower + i + 1, tail.operator_nodes.item(i))
               i := i + 1
            end

            left := nt
         end

         stack.add_last(left)
         debug ("parse/eiffel/build")
            show_stack
         end
      end

   build_expression_epsilon (expression_name: FIXED_STRING)
      do
         debug ("parse/eiffel/build")
            log.trace.put_string(once "Building epsilon expression ")
            log.trace.put_line(expression_name)
         end

         stack.put(ensure_expression(stack.last, expression_name), stack.upper)

         debug ("parse/eiffel/build")
            show_stack
         end
      end

   build_expression_e6
      do
         debug ("parse/eiffel/build")
            log.trace.put_line(once "Building epsilon expression e6")
         end

         -- nothing

         debug ("parse/eiffel/build")
            show_stack
         end
      end

   build_expression_no_array (expression_name, node_name: FIXED_STRING)
      local
         exp, nt: EIFFEL_NON_TERMINAL_NODE
      do
         build_expression(expression_name)

         debug ("parse/eiffel/build")
            log.trace.put_line(once "Building expression no-array")
         end

         exp ::= stack.last
         stack.remove_last

         left_assoc_names.clear_count
         left_assoc_names.add_last(exp.name)

         nt := factory.non_terminal(node_name, left_assoc_names)
         nt.set(nt.lower, exp)

         stack.add_last(nt)
         debug ("parse/eiffel/build")
            show_stack
         end
      end

   left_assoc_names: FAST_ARRAY[FIXED_STRING]
      once
         create Result.with_capacity(4)
      end

   build_empty_list (list_name: ABSTRACT_STRING)
      local
         list: EIFFEL_LIST_NODE
      do
         debug ("parse/eiffel/build")
            log.trace.put_string(once "Building new empty list %"")
            log.trace.put_string(list_name)
            log.trace.put_character('"')
            log.trace.put_character('%N')
         end
         list := factory.list(list_name.intern)
         stack.add_last(list)
         debug ("parse/eiffel/build")
            show_stack
         end
      ensure
         stack.count = old stack.count + 1
         stack.last.name = list_name.intern
      end

   build_new_list (atom_name, list_name: ABSTRACT_STRING)
      require
         not stack.is_empty
         stack.last.name.is_equal(atom_name)
      local
         atom: EIFFEL_NODE; list: EIFFEL_LIST_NODE
      do
         atom := stack.last
         stack.remove_last
         debug ("parse/eiffel/build")
            log.trace.put_string(once "Building new list %"")
            log.trace.put_string(list_name)
            log.trace.put_string(once "%" with one atom: atom should be %"")
            log.trace.put_string(atom_name)
            log.trace.put_character('"')
            log.trace.put_character('%N')
            log.trace.put_string(once "   Found atom: ")
            log.trace.put_line(atom.name)
         end
         list := factory.list(list_name.intern)
         list.add(atom)
         stack.add_last(list)
         debug ("parse/eiffel/build")
            show_stack
         end
      ensure
         stack.count = old stack.count
         stack.last.name = list_name.intern
      end

   build_continue_list (atom_name: ABSTRACT_STRING; forget: INTEGER; list_name: ABSTRACT_STRING)
      require
         stack.count >= forget + 2
         stack.item(stack.upper).name.is_equal(list_name)
         stack.item(stack.upper - 1 - forget).name.is_equal(atom_name)
      local
         atom: EIFFEL_NODE; list: EIFFEL_LIST_NODE; i: INTEGER; forgotten_nodes: FAST_ARRAY[EIFFEL_NODE]
      do
         atom := stack.last
         stack.remove_last
         check
            atom.name = list_name.intern
         end
         list ::= atom
         if forget > 0 then
            create forgotten_nodes.make(forget)
            from
               i := forget - 1
            until
               i < 0
            loop
               forgotten_nodes.put(stack.last, i)
               stack.remove_last
               i := i - 1
            end
         end
         atom := stack.last
         stack.remove_last
         atom.set_forgotten(forgotten_nodes)
         check
            atom.name = atom_name.intern
         end
         debug ("parse/eiffel/build")
            log.trace.put_string(once "Building list %"")
            log.trace.put_string(list_name)
            log.trace.put_string(once "%" (continuation): atom should be %"")
            log.trace.put_string(atom_name)
            log.trace.put_character('"')
            log.trace.put_character('%N')
            log.trace.put_string(once "   Found list: ")
            log.trace.put_line(list.name)
            log.trace.put_string(once "   Found atom: ")
            log.trace.put_line(atom.name)
         end
         list.add(atom)
         stack.add_last(list)
         debug ("parse/eiffel/build")
            show_stack
         end
      ensure
         stack.count = old stack.count - 1 - forget
         stack.last = old stack.last
      end

feature {} -- buffer moves
   next_character (buffer: MINI_PARSER_BUFFER)
      do
         position := position.next(buffer)
      end

   restore (buffer: MINI_PARSER_BUFFER; a_position: like position)
      do
         position := a_position
         buffer.set_current_index(position.index)
      end

   position: EIFFEL_POSITION

feature {}
   make (a_factory: like factory)
      do
         factory := a_factory
         create stack.make(0)
         create left_assoc_stack.make(0)
      ensure
         factory = a_factory
         stack.is_empty
         left_assoc_stack.is_empty
      end

   make_default
      do
         make(create {EIFFEL_DEFAULT_NODE_FACTORY}.make)
      end

   factory: EIFFEL_NODE_FACTORY

invariant
   stack /= Void
   left_assoc_stack /= Void

end -- class EIFFEL_GRAMMAR
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
