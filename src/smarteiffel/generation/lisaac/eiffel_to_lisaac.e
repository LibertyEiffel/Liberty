-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFEL_TO_LISAAC
   --
   -- The `eiffel_to_lisaac' command is an Eiffel to Isaac translator. This work is a work in progress to 
   -- collaborate with the Isaac project (http://isaacproject.u-strasbg.fr/).
   --
   -- For `eiffel_to_lisaac' usage, just do as `eiffeldoc'.
   --
   -- This translator is not yet finished. Work in progress started in May 23th 2007.
   -- D.Colnet and B.Sonntag 
   --
inherit
   EIFFELDOC
   CODE_PRINTER
   CLASS_TEXT_VISITOR
   INSTRUCTION_VISITOR
   EXPRESSION_VISITOR
   FEATURE_CLAUSE_LIST_VISITOR
   FEATURE_CLAUSE_VISITOR
   FEATURE_TEXT_VISITOR
   TYPE_MARK_VISITOR
   LOCAL_VAR_LIST_VISITOR
   DECLARATION_LIST_VISITOR
   FORMAL_ARG_LIST_VISITOR
   DECLARATION_VISITOR
   WHEN_CLAUSE_VISITOR
   ASSERTION_LIST_VISITOR
   ASSERTION_VISITOR
   EFFECTIVE_ARG_LIST_VISITOR

insert
   GLOBALS

creation
   main
   
feature {}

   keyword_dictionary: HASHED_DICTIONARY[STRING, STRING] is
      once
         Result :=
            {HASHED_DICTIONARY[STRING, STRING]
                             << 
                               "put", "put to ";
                               "append_substring", "append_substring start end ";
                               "swap", "swap and ";
                               >> }
      end

   main is
      local
         i: INTEGER; tmp_directory: STRING; basic_directory: BASIC_DIRECTORY
      do
         -- Changing directory first in order to remove output of `eiffeldoc':
         tmp_directory := "/tmp"
         echo.put_string("Changing to %"" + tmp_directory + "%" to discards outputs of eiffeldoc.")
         basic_directory.change_current_working_directory(tmp_directory)
         if basic_directory.last_entry.is_empty then
            echo.w_put_string(command_name)
            echo.w_put_string(once ": cannot move to %"/tmp%" directory (rerun on Unix/Linux).%N")
            die_with_code(exit_failure_code)
         end
         basic_directory.compute_subdirectory_with(tmp_directory, once "eiffel_to_lisaac")
         tmp_directory.copy(basic_directory.last_entry)
         if tmp_directory.is_empty then
            echo.w_put_string(command_name)
            echo.w_put_string(once ": unable to compute %"/tmp/eiffel_to_lisaac directory%".%N")
            die_with_code(exit_failure_code)
         end
         if basic_directory.create_new_directory(tmp_directory) then
            -- Now created.
         else
            -- May be the directory already exists.
         end
         basic_directory.change_current_working_directory(tmp_directory)
         if basic_directory.last_entry.is_empty then
            echo.w_put_string(command_name)
            echo.w_put_string(once ": unable to move to %"/tmp/eiffel_to_lisaac%" directory.%N")
            die_with_code(exit_failure_code)
         end

         -- To test only a few classes (temporary):
         prune("tutorial")
         prune("tools")
         prune("lib:abilities")
         prune("lib:html")
         prune("lib:numeric")
         prune("lib:sorting")
         prune("lib:vision")
         prune("lib:backtracking")
         prune("lib:io")
         prune("lib:message_formatter")
         prune("lib:random")
         prune("lib:storage")
         prune("lib:xml")
         prune("lib:design_patterns")
         prune("lib:iterator")
         prune("lib:misc")
         prune("lib:regular_expression")
--         prune("lib:string")
         prune("lib:exec")
--         prune("lib:kernel")
         prune("lib:kernel/internal")
         prune("lib:ncurses")
         prune("lib:sequencer")
         prune("lib:time")
         prune("lib:get_text")
         prune("lib:language")
         prune("lib:net")
         prune("lib:signal")
         prune("lib:unicode")
         
         -- Calling `eiffeldoc' make:
         make

         -- Now running `eiffel_to_lisaac' specifics:
         echo.put_string("Now starting `eiffel_to_lisaac'.%N")
         create already_generated.make
         from
            i := smart_eiffel.type_dictionary.lower
         until
            i >  smart_eiffel.type_dictionary.upper
         loop
            current_type := smart_eiffel.type_dictionary.item(i)
            --***
--            if current_type.is_string then   
               current_type_to_lisaac
--            end
            --***
            i := i + 1
         end

         -- Now cleaning /tmp:
         echo.put_string("Now cleaning %"" + tmp_directory + "%" directory.%N")
         basic_directory.change_current_working_directory("/tmp")
         (create {SYSTEM}).execute_command_line("/bin/rm -rf " + tmp_directory)
      end

   already_generated: HASHED_SET[CLASS_TEXT]

   current_class_text: CLASS_TEXT
         -- The one currently beeing translated.

   current_type: TYPE
         -- The one which drives to `current_class_text'.
   
   lisaac_file_path: STRING
         -- The one beeing prepared (computed according to `current_class_text').
   
   lisaac_code_buffer: STRING
         -- The content of `lisaac_file_path' beeing prepared.

   current_indent: STRING is "  "
         -- To pretty print Lisaac code.
   
   assertion_flag: BOOLEAN;
         -- True when generating require/ensure.

   current_type_to_lisaac is
      require
         current_type /= Void
      local
         text_file_write: TEXT_FILE_WRITE
      do
         current_class_text := current_type.class_text
         if already_generated.has(current_class_text) then
            current_type := Void
            current_class_text := Void
         else
            already_generated.add(current_class_text)
            echo.put_string("Translating %"")
            echo.put_string(current_class_text.path)
            echo.put_string("%"...%N")
            lisaac_file_path := current_class_text.path.twin
            lisaac_file_path.remove_suffix(once ".e")
            lisaac_file_path.append(once ".li")
            echo.put_string("Preparing %"")
            echo.put_string(lisaac_file_path)
            echo.put_string("%" in the `lisaac_code_buffer'...%N")
            lisaac_code_buffer := once "... Unique code buffer ..."
            lisaac_code_buffer.clear_count
            current_class_text.accept(Current)
            echo.put_string("Writing %"")
            echo.put_string(lisaac_file_path)
            echo.put_string("%"...%N")
            create text_file_write.connect_to(lisaac_file_path)
            text_file_write.put_string(lisaac_code_buffer)
            text_file_write.disconnect      
            lisaac_code_buffer.clear_count
         end
      ensure
         current_class_text = Void
         current_type = Void
         lisaac_file_path = Void
         lisaac_code_buffer.is_empty
      end

feature {SMART_EIFFEL}
   compile is
      do
      end
   
feature {ANY} -- the visit_* family:
   visit_class_text (visited: CLASS_TEXT) is
      local
         comment: COMMENT
      do
         check
            visited = current_class_text
         end
         lisaac_code_buffer.append(once
            "// Lisaac code generated by `eiffel_to_lisaac' (do not update manually).%N")

         comment := visited.heading_comment1
         if comment /= Void then
            comment.accept(Current)
         end
         lisaac_code_buffer.append(once "section HEADER%N")

         lisaac_code_buffer.append(once "  + name        :=")
         lisaac_code_buffer.append(visited.name.to_string)
         lisaac_code_buffer.append(once ";%N")
         lisaac_code_buffer.append(once "%N")         
         lisaac_code_buffer.append(once "  - category    :=MICRO;%N")
         lisaac_code_buffer.append(once ";%N")
         
         comment := visited.heading_comment2
         if comment /= Void then
            comment.accept(Current)
         end

         if visited.feature_clause_list /= Void then
            visited.feature_clause_list.accept(Current)
         end
         
         comment := visited.end_comment
         if comment /= Void then
            if comment.is_dummy_class_text_end(visited) then
               -- No such comment in Lisaac.
            else
               comment.accept(Current)
            end
         end
         lisaac_code_buffer.append(once "%N// End of ")
         lisaac_code_buffer.append(visited.name.to_string)
         lisaac_code_buffer.append(once "%N")
      end

   visit_comment (visited: COMMENT) is
      local
         i, left_margin: INTEGER; 
      do
         if visited.list.count = 1 then
            -- One line style:
            lisaac_code_buffer.append(once "// ")
            visit_comment_line(visited.list.first)
            lisaac_code_buffer.append(once "%N")
         else
            -- Multiple lines style:
            lisaac_code_buffer.append(once "/* ")
            from
               i := lisaac_code_buffer.upper
            until
               (i = 0) or else lisaac_code_buffer.item(i) = '%N'
            loop
               i := i - 1
            end
            left_margin := lisaac_code_buffer.count - i
            from
               i := visited.list.lower
            until
               i > visited.list.upper
            loop
               visit_comment_line(visited.list.item(i))
               lisaac_code_buffer.append(once "%N")
               lisaac_code_buffer.extend_multiple(' ', left_margin)
               i := i + 1
            end
            lisaac_code_buffer.remove_tail(left_margin)
            lisaac_code_buffer.append(once "*/%N")
         end
      end

   visit_comment_line (line: STRING) is
         -- To filter special notations inside comments.
      do
         lisaac_code_buffer.append(line)
      end

   visit_feature_clause_list (visited: FEATURE_CLAUSE_LIST) is
      local
         i: INTEGER
      do
         from
            i := visited.list.lower
         until
            i > visited.list.upper
         loop
            visited.list.item(i).accept(Current)
            i := i + 1
         end
      end

   visit_feature_clause (visited: FEATURE_CLAUSE) is
      local
         i: INTEGER
      do
         from
            i := visited.list.lower
         until
            i > visited.list.upper
         loop
            visited.list.item(i).accept(Current)
            i := i + 1
         end
      end

   signature_definition (name: FEATURE_NAME; arguments: FORMAL_ARG_LIST) is
      do
         if arguments = Void then
            if name.is_prefix_name then
               lisaac_code_buffer.extend('%'')
               lisaac_code_buffer.append(name.to_string)
               lisaac_code_buffer.extend('%'')
            else
               lisaac_code_buffer.append(name.to_string)
            end
         elseif keyword_dictionary.has(name.to_string) then
            not_yet_implemented
         else
            if name.is_infix_name then
               lisaac_code_buffer.extend('%'')
               lisaac_code_buffer.append(name.to_string)
               lisaac_code_buffer.extend('%'')
            else
               lisaac_code_buffer.append(name.to_string)
            end
            lisaac_code_buffer.append(once " ")
            if arguments.count = 1 then
               arguments.accept(Current)
            else
               lisaac_code_buffer.append(once "(")
               arguments.accept(Current)
               lisaac_code_buffer.append(once ")")
            end
         end
      end

   synonym_of(first, synonym: FEATURE_NAME; effective_routine: EFFECTIVE_ROUTINE) is
      local
         i: INTEGER
      do
         lisaac_code_buffer.append(once "  - ")
         signature_definition(synonym, effective_routine.arguments)
         if effective_routine.result_type /= Void then
            lisaac_code_buffer.append(once ":")
            effective_routine.result_type.accept(Current)
         end
         lisaac_code_buffer.append(once "<-%N  ")
         if keyword_dictionary.has(first.to_string) then
            not_yet_implemented
         else
            lisaac_code_buffer.append(first.to_string)
            if effective_routine.arguments /= Void then
               lisaac_code_buffer.append(once " ")
               if effective_routine.arguments.count = 1 then
                  lisaac_code_buffer.append(effective_routine.arguments.name(1).to_string)
               else 
                  lisaac_code_buffer.append(once "(")
                  from
                     i := 1
                  until
                     i > effective_routine.arguments.count
                  loop
                     lisaac_code_buffer.append(effective_routine.arguments.name(i).to_string)
                     if i /=  effective_routine.arguments.count then
                        lisaac_code_buffer.append(once ", ")
                     end
                     i := i + 1
                  end
                  lisaac_code_buffer.append(once ")")
               end
            end
         end
         lisaac_code_buffer.append(once ";%N")
      end

   visit_feature_text (visited: FEATURE_TEXT) is
      local
         anonymous_feature: ANONYMOUS_FEATURE
         name: FEATURE_NAME; cst_att: CST_ATT; effective_routine: EFFECTIVE_ROUTINE
         i: INTEGER
      do
         anonymous_feature := visited.anonymous_feature
         name := visited.names.first
         if {EFFECTIVE_ROUTINE} ?:= anonymous_feature then
            effective_routine ::= anonymous_feature
            lisaac_code_buffer.append(once "  - ")
            signature_definition(name, effective_routine.arguments)
            if effective_routine.result_type /= Void then
               lisaac_code_buffer.append(once ":")
               effective_routine.result_type.accept(Current)
            end
            if effective_routine.routine_body /= Void then
               lisaac_code_buffer.append(once "<-%N")
               if effective_routine.header_comment /= Void then
                  effective_routine.header_comment.accept(Current)
               end
               lisaac_code_buffer.append(once "  (")
               current_indent.extend_multiple(' ',2)
               if effective_routine.result_type /= Void then
                  lisaac_code_buffer.append(once " + result: ")
                  effective_routine.result_type.accept(Current)
                  lisaac_code_buffer.append(once ";%N")
               end
               if effective_routine.local_vars /= Void then
                  effective_routine.local_vars.accept(Current)
               else
                  lisaac_code_buffer.append(once "%N")
               end
               lisaac_code_buffer.append(current_indent)
               effective_routine.routine_body.accept(Current)
               lisaac_code_buffer.append(once ";%N  );%N")
               current_indent.remove_tail(2)
            else
               lisaac_code_buffer.append(once ";%N")               
            end
            if visited.names.count > 1 then
               from
                  i := 2
               until
                  i > visited.names.count
               loop
                  synonym_of(visited.names.first, visited.names.item(i), effective_routine)
                  i := i + 1
               end
            end
         elseif {WRITABLE_ATTRIBUTE} ?:= anonymous_feature then
            from
               i := 1
            until
               i > visited.names.count
            loop
               lisaac_code_buffer.append(once "  + ")
               lisaac_code_buffer.append(visited.names.item(i).to_string)
               lisaac_code_buffer.append(once ":")
               visited.result_type.accept(Current)
               lisaac_code_buffer.append(once ";%N")
               i := i + 1
            end
         elseif {CST_ATT} ?:= anonymous_feature then
            cst_att ::= anonymous_feature
            from
               i := 1
            until
               i > visited.names.count
            loop
               lisaac_code_buffer.append(once "  - ")
               lisaac_code_buffer.append(visited.names.item(i).to_string)
               lisaac_code_buffer.append(once ":")
               visited.result_type.accept(Current)
               lisaac_code_buffer.append(once ":= ")
               cst_att.value.accept(Current)
               lisaac_code_buffer.append(once ";%N")
               i := i + 1
            end
         else
            not_yet_implemented
         end
      end

   prune (cluster: STRING) is
      do
         command_arguments.add_last(once "-prune")
         command_arguments.add_last(cluster)
      end

   visit_native_array_type_mark (visited: NATIVE_ARRAY_TYPE_MARK) is
      do
         lisaac_code_buffer.append(once "NATIVE_ARRAY[")
         visited.elements_type.accept(Current)
         lisaac_code_buffer.append(once "]")         
      end

   visit_string_type_mark (visited: STRING_TYPE_MARK) is
      do
         lisaac_code_buffer.append(once "STRING")
      end

   visit_any_type_mark (visited: ANY_TYPE_MARK) is
      do
         lisaac_code_buffer.append(once "ANY")
      end

   visit_character_type_mark (visited: CHARACTER_TYPE_MARK) is
      do
         lisaac_code_buffer.append(once "CHARACTER")
      end

   visit_boolean_type_mark (visited: BOOLEAN_TYPE_MARK) is
      do
         lisaac_code_buffer.append(once "BOOLEAN")
      end

   visit_integer_type_mark (visited: INTEGER_TYPE_MARK) is
      do
         lisaac_code_buffer.append(visited.pretty_name.to_string)
      end

   visit_pointer_type_mark (visited: POINTER_TYPE_MARK) is
      do
         lisaac_code_buffer.append(once "POINTER")
      end

   visit_real_type_mark (visited: REAL_TYPE_MARK) is
      do
         lisaac_code_buffer.append(visited.pretty_name.to_string)
      end

  visit_integer_constant (visited: INTEGER_CONSTANT) is
      do
         visited.append_in(lisaac_code_buffer)
      end
   
   visit_character_constant (visited: CHARACTER_CONSTANT) is
      do
         inspect
            visited.value
         when '%N' then
            lisaac_code_buffer.append(once "'\n'")
         when '%T' then
            lisaac_code_buffer.append(once "'\t'")
         when '%U' then
            lisaac_code_buffer.append(once "'\0'")
         when '%%' then
            lisaac_code_buffer.append(once "'%'")
         when '%'' then
            lisaac_code_buffer.append(once "'\''")
         when '%"' then
            lisaac_code_buffer.append(once "'%"'")
         when '%B' then
            lisaac_code_buffer.append(once "'\b'")
         when '%F' then
            lisaac_code_buffer.append(once "'\f'")
         when '\' then
            lisaac_code_buffer.append(once "'\\'")
         when '%R' then
            lisaac_code_buffer.append(once "'\r'")
         else
            lisaac_code_buffer.extend('%'')
            lisaac_code_buffer.extend(visited.value)
            lisaac_code_buffer.extend('%'')            
         end
      end

   visit_real_constant (visited: REAL_CONSTANT) is
      local
         tmp:STRING;
      do
         tmp := visited.pretty_view.twin
         tmp.to_upper;
         lisaac_code_buffer.append(tmp)
      end
 
   visit_like_feature_type_mark (visited: LIKE_FEATURE_TYPE_MARK) is
      do
         visited.to_static(current_type).accept(Current)
      end

   visit_like_argument_type_mark (visited: LIKE_ARGUMENT_TYPE_MARK) is
      do
         visited.to_static(current_type).accept(Current)
      end

   visit_formal_generic_type_mark (visited: FORMAL_GENERIC_TYPE_MARK) is
      do
         lisaac_code_buffer.append(visited.written_name.to_string)
      end
   
   visit_class_type_mark (visited: CLASS_TYPE_MARK) is
      do
         lisaac_code_buffer.append(visited.class_text_name.to_string)
      end

   visit_create_writable (visited: CREATE_WRITABLE) is
      do
         visited.writable.accept(Current)
      end

   visit_create_instruction (visited: CREATE_INSTRUCTION) is
      local
         type_mark:TYPE_MARK;
         name:STRING;
      do
         visited.writable.accept(Current)
         lisaac_code_buffer.append(once " := ");
         if visited.explicit_type /= Void then
            type_mark := visited.explicit_type
         else
            type_mark := visited.writable.resolve_in(current_type).canonical_type_mark
         end
         type_mark.accept(Current)
         lisaac_code_buffer.append(once ".");
         if visited.call /= Void then
            name := visited.call.feature_name.to_string.twin
            if name.has_prefix("make") then
               name.remove_head(4)
               name.prepend("create")
            else
               name.prepend("create_")
            end
            lisaac_code_buffer.append(name);
            if visited.call.arguments /= Void then
               if keyword_dictionary.has(name) then
                  not_yet_implemented
               else
                  lisaac_code_buffer.append(once " ");
                  if visited.call.arguments.count = 1 then
                     visited.call.arguments.accept(Current)
                  else
                     lisaac_code_buffer.append(once "(")
                     visited.call.arguments.accept(Current)
                     lisaac_code_buffer.append(once ")")
                  end
               end
            end
         else
            lisaac_code_buffer.append(once "clone;%N");
         end
      end

   visit_assignment (visited: ASSIGNMENT) is
      do
         visited.left_side.accept(Current)
         lisaac_code_buffer.append(once " := ")
         visited.right_side.accept(Current)
         lisaac_code_buffer.append(once ";%N")
      end

   visit_result (visited: RESULT) is
      do
         if assertion_flag then
            lisaac_code_buffer.append(once "Result")
         else
            lisaac_code_buffer.append(once "result")
         end
      end

   visit_procedure_call_0 (visited: PROCEDURE_CALL_0) is
   local
         i: INTEGER
      do
         i := lisaac_code_buffer.count
         visited.target.accept(Current)
         if i /= lisaac_code_buffer.count then
            lisaac_code_buffer.extend('.')
         end
         lisaac_code_buffer.append(visited.feature_name.to_string)         
      end
   
   visit_function_call_0 (visited: FUNCTION_CALL_0) is
      local
         i: INTEGER
      do
         i := lisaac_code_buffer.count
         visited.target.accept(Current)
         if i /= lisaac_code_buffer.count then
            lisaac_code_buffer.extend('.')
         end
         lisaac_code_buffer.append(visited.feature_name.to_string)         
      end
   
   call_n (target: EXPRESSION; feature_name: FEATURE_NAME; arguments: EFFECTIVE_ARG_LIST) is
      local
         i: INTEGER
      do
         i := lisaac_code_buffer.count
         target.accept(Current)
         if i /= lisaac_code_buffer.count then
            lisaac_code_buffer.extend('.')
         end
         if keyword_dictionary.has(feature_name.to_string) then
            not_yet_implemented
         else
            lisaac_code_buffer.append(feature_name.to_string)
            lisaac_code_buffer.append(once " (")
            from
               i := 1
            until
               i > arguments.count
            loop
               arguments.expression(i).accept(Current)
               if i /= arguments.count then
                  lisaac_code_buffer.append(once ", ")
               end
               i := i + 1
            end
            lisaac_code_buffer.append(once ")")
         end
      end

   visit_function_call_n (visited: FUNCTION_CALL_N) is
      do
         call_n(visited.target, visited.feature_name, visited.arguments)
      end

   visit_procedure_call_n (visited: PROCEDURE_CALL_N) is
      do
         call_n(visited.target, visited.feature_name, visited.arguments)
      end

   call_1_c (target: EXPRESSION; feature_name: FEATURE_NAME; arg1: EXPRESSION) is
      local
         i: INTEGER
      do
         i := lisaac_code_buffer.count
         target.accept(Current)
         if i /= lisaac_code_buffer.count then
            lisaac_code_buffer.extend('.')
         end
         lisaac_code_buffer.append(feature_name.to_string)
         lisaac_code_buffer.append(once " ")
         if arg1.precedence = atomic_precedence then
            arg1.accept(Current)
         else
            lisaac_code_buffer.append(once "(")
            arg1.accept(Current)
            lisaac_code_buffer.append(once ")")
         end
      end


   agent_launch (target: EXPRESSION; arg1: EXPRESSION) is
      require
         target.resolve_in(current_type).is_agent
      local
         manifest_tuple: MANIFEST_TUPLE
      do
         target.accept(Current)
         lisaac_code_buffer.append(once ".value")
         manifest_tuple ::= arg1
         if manifest_tuple.effective_arg_list /= Void then
            lisaac_code_buffer.append(once " ")
            if manifest_tuple.effective_arg_list.count = 1 then
               manifest_tuple.effective_arg_list.accept(Current)
            else
               lisaac_code_buffer.append(once "(")
               manifest_tuple.effective_arg_list.accept(Current)
               lisaac_code_buffer.append(once ")")
            end
         end
      end

   visit_function_call_1 (visited: FUNCTION_CALL_1) is
      do
         if (visited.feature_name.to_string = as_item) and then (visited.target.resolve_in(current_type).is_agent) then
            agent_launch(visited.target, visited.arg1)
         else
            call_1_c(visited.target, visited.feature_name, visited.arg1)
         end
      end

   visit_procedure_call_1 (visited: PROCEDURE_CALL_1) is
      do
         if (visited.feature_name.to_string = as_call) and then (visited.target.resolve_in(current_type).is_agent) then
            agent_launch(visited.target, visited.arg1)
         else
            call_1_c(visited.target, visited.feature_name, visited.arg1)
         end
      end

   visit_implicit_current (visited: IMPLICIT_CURRENT) is
      do
      end

   visit_written_current (visited: WRITTEN_CURRENT) is
      do
         lisaac_code_buffer.append(once "Self")         
      end

   visit_formal_arg_list (visited: FORMAL_ARG_LIST) is
      local
         i: INTEGER; list: ARRAY[DECLARATION]

      do
         list := visited.list
         from
            i := list.lower
         until
            i > list.upper
         loop
            list.item(i).accept(Current)
            if i /= list.upper then
               lisaac_code_buffer.append(once ", ")
            end
            i := i + 1
         end
      end

   visit_effective_arg_list (visited: EFFECTIVE_ARG_LIST) is 
      local
         i: INTEGER; 
      do
         from
            i := 1
         until
            i > visited.count
         loop
            visited.expression(i).accept(Current)
            if i /= visited.count then
               lisaac_code_buffer.append(once ", ")
            end
            i := i + 1
         end
      end

   visit_local_var_list (visited: LOCAL_VAR_LIST) is
      local
         i: INTEGER; list: ARRAY[DECLARATION]
      do
         list := visited.list
         from
            i := list.lower
         until
            i > list.upper
         loop
            if (i /= list.lower) then
               lisaac_code_buffer.append(current_indent);
            end
            lisaac_code_buffer.append(once "+ ")
            list.item(i).accept(Current)
            lisaac_code_buffer.append(once ";%N")
            i := i + 1
         end
      end

   visit_declaration_1 (visited: DECLARATION_1) is
      do
         lisaac_code_buffer.append(visited.name.to_string)
         lisaac_code_buffer.append(once ":")
         visited.name.result_type.accept(Current)
      end

   visit_declaration_group (visited: DECLARATION_GROUP) is
      local
         i: INTEGER
      do
         from
            i := visited.name_list.lower
         until
            i > visited.name_list.upper
         loop
            lisaac_code_buffer.append(visited.name_list.item(i).to_string)
            if i /= visited.name_list.upper then
               lisaac_code_buffer.append(once ", ")
            end
            i := i + 1
         end
         lisaac_code_buffer.append(once ":")
         visited.name_list.first.result_type.accept(Current)
      end

   visit_compound (visited: COMPOUND) is
      local
         i: INTEGER
      do
         from
            i := visited.list.lower
         until
            i > visited.list.upper
         loop
            if i > visited.list.lower then
               lisaac_code_buffer.append(current_indent)
            end
            visited.list.item(i).accept(Current)
            lisaac_code_buffer.append(once ";%N")
            i := i + 1
         end
      end

   visit_ifthen (visited: IFTHEN) is
      do
         lisaac_code_buffer.append(once "(")
         visited.expression.accept(Current)
         lisaac_code_buffer.append(once ").if {%N")
         if visited.then_compound /= Void then
            current_indent.extend_multiple(' ',2)
            lisaac_code_buffer.append(current_indent)
            visited.then_compound.accept(Current)
            current_indent.remove_tail(2)
         end
         lisaac_code_buffer.append(current_indent)
         lisaac_code_buffer.append(once "};%N")
      end

   visit_ifthenelse (visited: IFTHENELSE) is
      local
         i: INTEGER
      do
         lisaac_code_buffer.append(once "(")
         visited.expression.accept(Current)
         lisaac_code_buffer.append(once ").if {%N")
         if visited.then_compound /= Void then
            current_indent.extend_multiple(' ',2)
            lisaac_code_buffer.append(current_indent)
            visited.then_compound.accept(Current)
            current_indent.remove_tail(2)
         end
         lisaac_code_buffer.append(current_indent)
         lisaac_code_buffer.append(once "}")
         if visited.elseif_list /= Void then
            from
               i := visited.elseif_list.lower
            until
               i >  visited.elseif_list.upper
            loop
               lisaac_code_buffer.append(once ".elseif {")
               visited.elseif_list.item(i).expression.accept(Current)
               lisaac_code_buffer.append(once "} then {%N")
               if visited.elseif_list.item(i).then_compound /= Void then
                  current_indent.extend_multiple(' ',2)
                  lisaac_code_buffer.append(current_indent)
                  visited.elseif_list.item(i).then_compound.accept(Current)
                  current_indent.remove_tail(2)
               end
               lisaac_code_buffer.append(current_indent)
               lisaac_code_buffer.append(once "}")
               i := i + 1
            end
         end
         if visited.else_compound /= Void then
            lisaac_code_buffer.append(once " else {%N")
            current_indent.extend_multiple(' ',2)
            lisaac_code_buffer.append(current_indent)
            visited.else_compound.accept(Current)
            current_indent.remove_tail(2)
            lisaac_code_buffer.append(current_indent)
            lisaac_code_buffer.append(once "}")
         end
         lisaac_code_buffer.append(once ";%N")
      end

   visit_inspect_statement (visited: INSPECT_STATEMENT) is
      local
         i: INTEGER
         is_case:BOOLEAN;
      do
         lisaac_code_buffer.append(once "(")
         visited.expression.accept(Current)
         lisaac_code_buffer.append(once ")")
         is_case := not visited.else_position.is_unknown;
         if is_case then
            lisaac_code_buffer.append(once ".inspect")
         end
         if visited.when_list /= Void then
            from
               i := visited.when_list.lower
            until
               i > visited.when_list.upper
            loop
               lisaac_code_buffer.append(once "%N")
               lisaac_code_buffer.append(current_indent)
               if is_case then
                  lisaac_code_buffer.append(once ".case ")
               else
                  lisaac_code_buffer.append(once ".when ")
               end
               visited.when_list.item(i).accept(Current)
               i := i + 1
            end
         end
         if is_case then
            lisaac_code_buffer.append(once " else {%N")
            current_indent.extend_multiple(' ',2)
            lisaac_code_buffer.append(current_indent)
            visited.else_compound.accept(Current)
            lisaac_code_buffer.append(once ";%N")
            current_indent.remove_tail(2)
            lisaac_code_buffer.append(current_indent)
            lisaac_code_buffer.append(once "}")
         end
      end

   visit_when_clause (visited: WHEN_CLAUSE) is
      local
         
      do
         if visited.list.count /= 1 then 
            not_yet_implemented
         else
            visited.list.first.accept(Current)
         end
         lisaac_code_buffer.append(once " then {%N")
         if visited.compound /= Void then
            current_indent.extend_multiple(' ',2)
            lisaac_code_buffer.append(current_indent)
            visited.compound.accept(Current)
            lisaac_code_buffer.append(once ";%N")
            current_indent.remove_tail(2)
            lisaac_code_buffer.append(current_indent)
            lisaac_code_buffer.append(once "}")
         end
      end

   visit_loop_instruction (visited: LOOP_INSTRUCTION) is
      do
         if visited.initialize /= Void then 
            visited.initialize.accept(Current)
            lisaac_code_buffer.append(current_indent)
         end
         lisaac_code_buffer.extend('{')
         visited.until_expression.accept(Current)
         lisaac_code_buffer.append(once "}.until_do {%N")
         current_indent.extend_multiple(' ',2);
         lisaac_code_buffer.append(current_indent)
         if (visited.loop_body /= Void) then
            visited.loop_body.accept(Current)
         end
         current_indent.remove_tail(2)
         lisaac_code_buffer.append(current_indent)
         lisaac_code_buffer.append(once "};%N")
      end

   visit_assertion (visited: ASSERTION) is
      do
         if visited.expression /= Void then
            if visited.tag /= Void then
               lisaac_code_buffer.append(once "%"")
               lisaac_code_buffer.append(visited.tag.to_string)
               lisaac_code_buffer.append(once "%" ")
            end
            lisaac_code_buffer.append(once "? {")
            visited.expression.accept(Current)
            lisaac_code_buffer.append(once "};%N")
         end
      end

   visit_expression_with_comment (visited: EXPRESSION_WITH_COMMENT) is
      do
         visited.expression.accept(Current)
         lisaac_code_buffer.append(once " ")
         visited.comment.accept(Current)
      end

   visit_check_compound (visited: CHECK_COMPOUND) is
      do
         if visited.check_invariant /= Void then
            visited.check_invariant.accept(Current)
         end
      end

   visit_call_prefix (operator: STRING; precedence: INTEGER; target: EXPRESSION) is
      do
         lisaac_code_buffer.append(operator)
         lisaac_code_buffer.append(once " ")
         if target.precedence < precedence then
            lisaac_code_buffer.append(once "(")
            target.accept(Current)
            lisaac_code_buffer.append(once ")")
         else
            target.accept(Current)
         end
      end

   visit_call_prefix_freeop (visited: CALL_PREFIX_FREEOP) is
      do
         visit_call_prefix(visited.feature_name.to_string, visited.precedence, visited.target)
      end

   visit_call_prefix_minus (visited: CALL_PREFIX_MINUS) is
      do
         visit_call_prefix(visited.feature_name.to_string, visited.precedence, visited.target)
      end

   visit_call_prefix_plus (visited: CALL_PREFIX_PLUS) is
      do
         visit_call_prefix(visited.feature_name.to_string, visited.precedence, visited.target)
      end

   visit_call_prefix_not (visited: CALL_PREFIX_NOT) is
      do
         visit_call_prefix("!", visited.precedence, visited.target)
      end

   visit_built_in_eq_neq (visited: BUILT_IN_EQ_NEQ) is
      do
         -- The `visited.left_side' first:
         if visited.left_side.precedence = atomic_precedence then
            visited.left_side.accept(Current)
         elseif visited.precedence > visited.left_side.precedence then
            lisaac_code_buffer.append(once "(")
            visited.left_side.accept(Current)
            lisaac_code_buffer.append(once ")")
         elseif visited.precedence < visited.left_side.precedence then
            visited.left_side.accept(Current)
         else
            visited.left_side.accept(Current)
         end
         -- The operator:
         lisaac_code_buffer.extend(' ')
         if visited.eq_flag then
            lisaac_code_buffer.append(once "=")
         else
            lisaac_code_buffer.append(once "!=")
         end
         lisaac_code_buffer.extend(' ')
         -- The `visited.right_side':
         if visited.right_side.precedence = atomic_precedence then
            visited.right_side.accept(Current)
         elseif visited.precedence > visited.right_side.precedence then
            lisaac_code_buffer.append(once "(")
            visited.right_side.accept(Current)
            lisaac_code_buffer.append(once ")")
         elseif visited.precedence < visited.right_side.precedence then
            visited.right_side.accept(Current)
         else
            lisaac_code_buffer.append(once "(")
            visited.right_side.accept(Current)
            lisaac_code_buffer.append(once ")")
         end
      end

   visit_call_infix (visited: CALL_INFIX; symbol:STRING) is
      do
         -- The `target' first:
         if visited.target.precedence = atomic_precedence then
            visited.target.accept(Current)
         elseif visited.precedence > visited.target.precedence then
            lisaac_code_buffer.append(once "(")
            visited.target.accept(Current)
            lisaac_code_buffer.append(once ")")
         elseif visited.precedence < visited.target.precedence then
            visited.target.accept(Current)
         elseif visited.left_brackets then
            lisaac_code_buffer.append(once "(")
            visited.target.accept(Current)
            lisaac_code_buffer.append(once ")")
         else
            visited.target.accept(Current)
         end
         -- The operator:
         lisaac_code_buffer.extend(' ')
         lisaac_code_buffer.append(symbol)
         lisaac_code_buffer.extend(' ')
         -- The argument, `arg1':
         if visited.arg1.precedence = atomic_precedence then
            visited.arg1.accept(Current)
         elseif visited.precedence > visited.arg1.precedence then
            lisaac_code_buffer.append(once "(")
            visited.arg1.accept(Current)
            lisaac_code_buffer.append(once ")")
         elseif visited.precedence < visited.arg1.precedence then
            visited.arg1.accept(Current)
         elseif visited.right_brackets then
            lisaac_code_buffer.append(once "(")
            visited.arg1.accept(Current)
            lisaac_code_buffer.append(once ")")
         else
            visited.arg1.accept(Current)
         end
      end

   visit_call_infix_lasy (visited: CALL_INFIX; symbol:STRING) is
      do
         -- The `target' first:
         if visited.target.precedence = atomic_precedence then
            visited.target.accept(Current)
         elseif visited.precedence > visited.target.precedence then
            lisaac_code_buffer.append(once "(")
            visited.target.accept(Current)
            lisaac_code_buffer.append(once ")")
         elseif visited.precedence < visited.target.precedence then
            visited.target.accept(Current)
         elseif visited.left_brackets then
            lisaac_code_buffer.append(once "(")
            visited.target.accept(Current)
            lisaac_code_buffer.append(once ")")
         else
            visited.target.accept(Current)
         end
         -- The operator:
         lisaac_code_buffer.extend(' ')
         lisaac_code_buffer.append(symbol)
         lisaac_code_buffer.extend(' ')
         -- The argument, `arg1':
         if visited.arg1.precedence = atomic_precedence then
            visited.arg1.accept(Current)
         elseif visited.precedence > visited.arg1.precedence then
            lisaac_code_buffer.append(once "{")
            visited.arg1.accept(Current)
            lisaac_code_buffer.append(once "}")
         elseif visited.precedence < visited.arg1.precedence then
            visited.arg1.accept(Current)
         elseif visited.right_brackets then
            lisaac_code_buffer.append(once "{")
            visited.arg1.accept(Current)
            lisaac_code_buffer.append(once "}")
         else
            visited.arg1.accept(Current)
         end
      end

   visit_call_infix_gt (visited: CALL_INFIX_GT) is
      do
         visit_call_infix(visited,">")
      end

   visit_call_infix_ge (visited: CALL_INFIX_GE) is
      do
         visit_call_infix(visited,">=")
      end

   visit_call_infix_lt (visited: CALL_INFIX_LT) is
      do
         visit_call_infix(visited,"<")
      end

   visit_call_infix_le (visited: CALL_INFIX_LE) is
      do
         visit_call_infix(visited,"<=")
      end

   visit_call_infix_minus (visited: CALL_INFIX_MINUS) is
      do 
         visit_call_infix(visited,"-")
      end

   visit_call_infix_plus (visited: CALL_INFIX_PLUS) is
      do 
         visit_call_infix(visited,"+")
      end

   visit_call_infix_times (visited: CALL_INFIX_TIMES) is
      do 
         visit_call_infix(visited,"*")
      end

   visit_call_infix_div (visited: CALL_INFIX_DIV) is
      do 
         visit_call_infix(visited,"/")
      end

   visit_call_infix_int_div (visited: CALL_INFIX_INT_DIV) is
      do 
         visit_call_infix(visited,"/")
      end

   visit_call_infix_int_rem (visited: CALL_INFIX_INT_REM) is
      do 
         visit_call_infix(visited,"%%")
      end

   visit_call_infix_freeop (visited: CALL_INFIX_FREEOP) is
      do 
         visit_call_infix(visited,visited.feature_name.to_string)
      end

   visit_call_infix_power (visited: CALL_INFIX_POWER) is
      do 
         visit_call_infix(visited,"**")
      end

   visit_call_infix_xor (visited: CALL_INFIX_XOR) is
      do 
         visit_call_infix(visited,"^")
      end

   visit_call_infix_implies (visited: CALL_INFIX_IMPLIES) is
      do 
         visit_call_infix_lasy(visited,"->>")
      end

   visit_call_infix_or (visited: CALL_INFIX_OR) is
      do 
         visit_call_infix(visited,"|")
      end

   visit_call_infix_and (visited: CALL_INFIX_AND) is
      do 
         visit_call_infix(visited,"&")
      end

   visit_call_infix_and_then (visited: CALL_INFIX_AND_THEN) is
      do 
         visit_call_infix_lasy(visited,"&&")
      end

   visit_call_infix_or_else (visited: CALL_INFIX_OR_ELSE) is
      do 
         visit_call_infix_lasy(visited,"||")
      end

   visit_argument_name2 (visited: ARGUMENT_NAME2) is
      do
         lisaac_code_buffer.append(visited.to_string)
      end

   visit_local_name2 (visited: LOCAL_NAME2) is
      do
         lisaac_code_buffer.append(visited.to_string)
      end

   visit_writable_attribute_name (visited: WRITABLE_ATTRIBUTE_NAME) is
      do
         lisaac_code_buffer.append(visited.to_string)
      end

   visit_array_type_mark (visited: ARRAY_TYPE_MARK) is
      do
         lisaac_code_buffer.append(visited.class_text_name.to_string)
         lisaac_code_buffer.append(once "[")
         visited.generic_list.first.accept(Current)
         lisaac_code_buffer.append(once "]")
      end

   visit_user_generic_type_mark (visited: USER_GENERIC_TYPE_MARK) is
      local
         i: INTEGER
      do
         lisaac_code_buffer.append(visited.class_text_name.to_string)
         lisaac_code_buffer.append(once "[")
         from
            i := visited.generic_list.lower
         until
            i > visited.generic_list.upper
         loop
            visited.generic_list.item(i).accept(Current)
            if i /=  visited.generic_list.upper then
               lisaac_code_buffer.append(once ", ")
            end
            i := i + 1
         end
         lisaac_code_buffer.append(once "]")
      end

   visit_like_current_type_mark (visited: LIKE_CURRENT_TYPE_MARK) is
      do
         lisaac_code_buffer.append(once "SELF")
      end

   visit_agent_type_mark (visited: AGENT_TYPE_MARK) is
      do
         lisaac_code_buffer.append(once "BLOCK")
      end

   visit_e_true (visited: E_TRUE) is
      do
         lisaac_code_buffer.append(once "TRUE")         
      end

   visit_e_false (visited: E_FALSE) is
      do
         lisaac_code_buffer.append(once "FALSE")         
      end

   visit_e_void (visited: E_VOID) is
      do
         lisaac_code_buffer.append(once "VOID")
      end
   
   visit_manifest_string (visited: MANIFEST_STRING) is
      do
         manifest_string_pool.string_to_c_code(visited.to_string, lisaac_code_buffer)
      end

   visit_retry_instruction (visited: RETRY_INSTRUCTION) is
      do
         check
            False
         end
      end

   visit_null_pointer (visited: NULL_POINTER) is
      do
         check
            False
         end
      end

   visit_internal_local (visited: INTERNAL_LOCAL) is
      do
         check
            False
         end
      end

   visit_address_of (visited: ADDRESS_OF) is
      do
         not_yet_implemented
      end
   
   visit_fake_target (visited: FAKE_TARGET) is
      do
         not_yet_implemented
      end
   
   visit_manifest_tuple (visited: MANIFEST_TUPLE) is
      do
         not_yet_implemented
      end
   
   visit_agent_instruction (visited: AGENT_INSTRUCTION) is
      do
         not_yet_implemented
      end
   
   visit_agent_creation (visited: AGENT_CREATION) is
      do
         not_yet_implemented
      end
   
   visit_implicit_cast (visited: IMPLICIT_CAST) is
      do
         not_yet_implemented
      end
   
   visit_e_old (visited: E_OLD) is
      do
         not_yet_implemented
      end
   
   visit_old_manifest_array (visited: OLD_MANIFEST_ARRAY) is
      do
         not_yet_implemented
      end
   
   visit_manifest_generic (visited: MANIFEST_GENERIC) is
      do
         not_yet_implemented
      end
   
   visit_assignment_test (visited: ASSIGNMENT_TEST) is
      do
         not_yet_implemented
      end
   
   visit_create_expression (visited: CREATE_EXPRESSION) is
      do
         not_yet_implemented
      end
   
   visit_generator_generating_type (visited: GENERATOR_GENERATING_TYPE) is
      do
         not_yet_implemented
      end
   
   visit_static_call_0_c (visited: STATIC_CALL_0_C) is
      do
         not_yet_implemented
      end
   
   visit_precursor_expression (visited: PRECURSOR_EXPRESSION) is
      do
         not_yet_implemented
      end
   
   visit_precursor_instruction (visited: PRECURSOR_INSTRUCTION) is
      do
         not_yet_implemented
      end
   
   visit_debug_compound (visited: DEBUG_COMPOUND) is
      do
         not_yet_implemented
      end
   
   visit_assignment_attempt (visited: ASSIGNMENT_ATTEMPT) is
      do
         not_yet_implemented
      end
   
   visit_empty_tuple_type_mark (visited: EMPTY_TUPLE_TYPE_MARK) is
      do
         not_yet_implemented
      end
   
   visit_non_empty_tuple_type_mark (visited: NON_EMPTY_TUPLE_TYPE_MARK) is
      do
         not_yet_implemented
      end
   
   visit_agent_expression (visited: AGENT_EXPRESSION) is
      do
         not_yet_implemented
      end
   
   visit_open_operand (visited: OPEN_OPERAND) is
      do
         not_yet_implemented
      end
   
   visit_ensure_assertion (visited: ENSURE_ASSERTION) is
      do
         not_yet_implemented
      end

   visit_class_invariant (visited: CLASS_INVARIANT) is
      do
         not_yet_implemented
      end

   visit_fake_argument (visited: FAKE_ARGUMENT) is
      do
         not_yet_implemented
      end

   visit_non_void_no_dispatch (visited: NON_VOID_NO_DISPATCH) is
      do
         not_yet_implemented
         end
         visit_fake_tuple (visited: FAKE_TUPLE) is
      do
         not_yet_implemented
      end

   visit_void_call (visited: VOID_CALL) is
      do
         not_yet_implemented
      end

   visit_no_invariant_wrapper (visited: NO_INVARIANT_WRAPPER) is
      do
         not_yet_implemented
      end

   visit_void_proc_call (visited: VOID_PROC_CALL) is
      do
         not_yet_implemented
      end

end -- class EIFFEL_TO_LISAAC
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301, USA
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
