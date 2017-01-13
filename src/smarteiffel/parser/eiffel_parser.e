-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFEL_PARSER
   --
   -- Singleton object in charge of Eiffel parsing.
   -- This singleton is shared via the GLOBALS.`eiffel_parser' once function.
   --

inherit
   PARSER
      undefine is_equal
      end

insert
   SINGLETON

create {ANY}
   make

feature {ANY}
   no_rescue: BOOLEAN

   is_running: BOOLEAN
         -- True when the parser is running (i.e. parsing of the current class
         -- is not finished).

   total_time: INTEGER_64

feature {ANY}
   predefined_type_mark (tm: STRING; sp: POSITION): TYPE_MARK
      require
         tm /= Void
      do
         inspect
            tm
         when "ANY" then
               create {ANY_TYPE_MARK} Result.make(sp)
         when "BOOLEAN" then
            create {BOOLEAN_TYPE_MARK} Result.make(sp)
         when "CHARACTER" then
            create {CHARACTER_TYPE_MARK} Result.make(sp)
         when "INTEGER_8" then
            create {INTEGER_TYPE_MARK} Result.integer_8(sp)
         when "INTEGER_16" then
            create {INTEGER_TYPE_MARK} Result.integer_16(sp)
         when "INTEGER_32" then
            create {INTEGER_TYPE_MARK} Result.integer_32(sp)
         when "INTEGER" then
            create {INTEGER_TYPE_MARK} Result.integer(sp)
         when "INTEGER_64" then
            create {INTEGER_TYPE_MARK} Result.integer_64(sp)
         when "NATURAL_8" then
            create {NATURAL_TYPE_MARK} Result.natural_8(sp)
         when "NATURAL_16" then
            create {NATURAL_TYPE_MARK} Result.natural_16(sp)
         when "NATURAL_32" then
            create {NATURAL_TYPE_MARK} Result.natural_32(sp)
         when "NATURAL_64" then
            create {NATURAL_TYPE_MARK} Result.natural_64(sp)
         when "NATURAL" then
            create {NATURAL_TYPE_MARK} Result.natural(sp)
         when "POINTER" then
            create {POINTER_TYPE_MARK} Result.make(sp)
         when "REAL_32" then
            create {REAL_TYPE_MARK} Result.real_32(sp)
         when "REAL_64" then
            create {REAL_TYPE_MARK} Result.real_64(sp)
         when "REAL" then
            create {REAL_TYPE_MARK} Result.real(sp)
         when "REAL_80" then
            create {REAL_TYPE_MARK} Result.real_80(sp)
         when "REAL_128" then
            create {REAL_TYPE_MARK} Result.real_128(sp)
         when "REAL_EXTENDED" then
            create {REAL_TYPE_MARK} Result.real_extended(sp)
         when "STRING" then
            create {STRING_TYPE_MARK} Result.make(sp)
         else
            check Result = Void end
         end
      end

feature {SMART_EIFFEL}
   analyse_class (class_name: CLASS_NAME; a_cluster: CLUSTER): CLASS_TEXT
      require
         not is_running
         not smart_eiffel.is_ready
         smart_eiffel.status.is_collecting
         class_name.to_string /= Void
         a_cluster /= Void
         parser_buffer.is_ready
      local
         old_nbe, old_nbw: INTEGER; path: STRING; cn: HASHED_STRING
         start_time, end_time: MICROSECOND_TIME
         ctc: INTEGER
      do
         start_time.update
         check
            as_predicate = class_name.to_string
               implies smart_eiffel.short_or_class_check_flag or smart_eiffel.pretty_flag
         end
         if class_name.is_tuple_related then
            tuple_flag := True
            cn := string_aliaser.hashed_string(as_tuple)
         else
            tuple_flag := False
            cn := class_name.hashed_name
         end
         current_id := id_provider.item(cn, a_cluster)
         path := parser_buffer.path
         if nb_errors > 0 then
            error_handler.append(once "Correct the previous error")
            if nb_errors > 1 then
               error_handler.extend('s')
            end
            error_handler.append(once " first.")
            error_handler.print_as_fatal_error
         end
         debug
            if smart_eiffel.is_ready then
               error_handler.append(once "Tried to load class ")
               error_handler.append(path)
               error_handler.append(once " while smart_eiffel `is_ready'.")
               error_handler.print_as_warning
            end
         end

         ctc := smart_eiffel.class_text_count + 1
         if ctc < 10000 then
            if ctc < 1000 then
               if ctc < 100 then
                  if ctc < 10 then
                     echo.put_character(' ')
                  end
                  echo.put_character(' ')
               end
               echo.put_character(' ')
            end
            echo.put_character(' ')
         end
         echo.put_integer(ctc)
         echo.put_character('%T')
         echo.put_line(path)

         old_nbe := nb_errors
         old_nbw := nb_warnings
         is_running := True
         last_comment := Void
         line := 1
         column := 1
         cluster := a_cluster
         current_line := parser_buffer.item(line)
         if current_line.count = 0 then
            cc := '%N'
         else
            cc := current_line.first
         end
         create last_class_text.make(path, cn.to_string, parser_buffer.cluster, current_id)
         skip_comments
         a_class_declaration
         is_running := False
         parser_buffer.release
         if tuple_flag then
            Result := smart_eiffel.loaded_class_text(class_name)
            if Result = Void then
               smart_eiffel.tuple_class_not_found_fatal_error(class_name)
            end
         else
            Result := last_class_text
         end
         if nb_errors - old_nbe > 0 then
            show_nb_errors
            echo.w_put_string("Load class %"")
            echo.w_put_string(path)
            echo.w_put_string("%" aborted.%N")
            Result := Void
         elseif nb_warnings - old_nbw > 0 then
            show_nb_warnings
            check
               Result /= Void
            end
         end
         if Result /= Void and then not tuple_flag then
            is_running := False
            Result.initialize_and_check_level_1
         end
         end_time.update

         total_time := total_time + (end_time.timestamp - start_time.timestamp)
      ensure
         not parser_buffer.is_ready
      end

   analyse_buffer: CLASS_TEXT
         -- Scan the header of the `parser_buffer' in order to find the name of
         -- the class in order to launch `analyse_class' with the appropriate
         -- argument. (This is used for to handle the "include" option of ACE
         -- files.)
      require
         not is_running
         not smart_eiffel.is_ready
         parser_buffer.is_ready
      local
         stop: BOOLEAN; n: STRING; cn: CLASS_NAME
      do
         last_comment := Void
         line := 1
         column := 1
         current_line := parser_buffer.item(line)
         if current_line.count = 0 then
            cc := '%N'
         else
            cc := current_line.first
         end
         from
            skip_comments
         until
            stop
         loop
            if cc = end_of_text then
               stop := True
            elseif a_keyword(fz_class) then
               stop := True
               from
                  create n.make(32)
               until
                  (once " %T[%/0/%N").has(cc)
               loop
                  n.extend(cc)
                  next_char
               end
               create cn.unknown_position(string_aliaser.hashed_string(n), False)
            else
               from
               until
                  (once " %T%/0/%N").has(cc)
               loop
                  next_char
               end
               skip_comments
            end
         end
         if cn = Void then
            error_handler.append(once "Unable to find a class definition in %"")
            error_handler.append(parser_buffer.path)
            error_handler.append(once "%".")
            error_handler.print_as_fatal_error
         end
         Result := analyse_class(cn, cluster)
      end

feature {ACE, COMMAND_LINE_TOOLS}
   set_no_rescue
      do
         no_rescue := True
      end

feature {CECIL_FILE}
   connect_to_cecil (a_path: STRING): STRING
         -- Return the cecil file user's include path (first information).
      require
         not is_running
         nb_errors = 0
         a_path /= Void
         not string_aliaser.registered_one(a_path)
      local
         path: HASHED_STRING
      do
         echo.put_string(once "Parsing Cecil File: %"")
         echo.put_string(a_path)
         echo.put_string(once "%"%N")
         parser_buffer.load_file(a_path)
         if not parser_buffer.is_ready then
            error_handler.append(once "Cannot open Cecil file (use -verbose flag for details).")
            error_handler.print_as_fatal_error
         end
         path := parser_buffer.hashed_path
         current_id := id_provider.high_item(path)
         is_running := True
         formal_generic_list := Void
         last_comment := Void
         line := 1
         column := 1
         current_line := parser_buffer.item(line)
         last_class_text := Void
         if current_line.count = 0 then
            cc := '%N'
         else
            cc := current_line.first
         end
         skip_comments
         from
            create Result.make(32)
         until
            cc = '%N' or else cc = end_of_text
         loop
            Result.extend(cc)
            next_char
         end
         skip_comments
         if cc = end_of_text then
            error_handler.append(once "Empty Cecil file (use -verbose flag for details).")
            error_handler.print_as_fatal_error
         end
      end

   end_of_input: BOOLEAN
      do
         Result := cc = end_of_text
      end

   parse_c_name: STRING
      do
         from
            create Result.make(32)
         until
            cc.is_separator
         loop
            Result.extend(cc)
            next_char
         end
         skip_comments
      end

   parse_type_mark: TYPE_MARK
      do
         if a_static_type_mark(False) then
            Result := last_type_mark
         else
            error_handler.add_position(current_position)
            error_handler.append(em16)
            error_handler.print_as_fatal_error
         end
      ensure
         nb_errors = 0
      end

   parse_feature_name: FEATURE_NAME
      do
         if a_feature_name then
            Result := last_feature_name
         else
            error_handler.add_position(current_position)
            error_handler.append(once "Feature name expected here.")
            error_handler.print_as_fatal_error
         end
      ensure
         nb_errors = 0
      end

   parse_cecil_is_creation: BOOLEAN
      do
         Result := a_creation_keyword
      end

   disconnect
      do
         is_running := False
         parser_buffer.release
      end

feature {}
   a_creation_keyword: BOOLEAN
      local
         l, c: INTEGER
      do
         l := line
         c := column
         if a_keyword(fz_create) then
            Result := True
         elseif a_keyword(fz_creation) then
            error_handler.add_position(pos(l, c))
            error_handler.append(once "The keyword 'creation' is now replaced by 'create'. Please update your code.")
            error_handler.print_as_fatal_error --| **** TODO: remove the keyword (in Dennis)
            Result := True
         end
      end

feature {SMART_EIFFEL}
   echo_information
      do
         show_total_time
         show_nb_warnings
         show_nb_errors
      end

feature {}
   show_total_time
      do
         echo.put_string("Total time spent in parser: ")
         echo.put_time(total_time)
         echo.put_new_line
      end

   show_nb_warnings
      local
         do_it: BOOLEAN
      do
         if echo.is_verbose then
            do_it := True
         elseif error_handler.no_warning then
         else
            do_it := True
         end
         if do_it then
            show_nb(nb_warnings, once " warning")
         end
      end

   show_nb_errors
      do
         show_nb(nb_errors, once " error")
      end

feature {COMPILE_TO_C, RUN}
   set_drop_comments
      do
         drop_comments := True
      end

feature {}
   -- To add extra contextual information:
   Expression_syntax_flag: INTEGER_8           0
         -- Any possible complex expression.
   Instruction_syntax_flag: INTEGER_8          1
         -- Any possible complex instruction.
   Atomic_syntax_flag: INTEGER_8               2
         -- Simple value with no dot.
   When_inspect_syntax_flag: INTEGER_8         3
         -- Expression in "when" part of "inspect".

feature {}
   current_id: INTEGER_16
         -- This is the `id' of the `last_class_text' or the `id' of the ACE file or of some cecil file path.

   cluster: CLUSTER
         -- The current cluster of the class being analyzed

   last_class_text: CLASS_TEXT
         -- The one being parsed.

   inside_function_flag: BOOLEAN
         -- True when a function (an ordinary one as well as a once function) is being parsed.

   inside_ensure_flag: BOOLEAN
         -- True during the parsing of a ensure clause.

   inside_rescue_flag: BOOLEAN
         -- True during the parsing of a rescue clause.

   inside_class_invariant_flag: BOOLEAN
         -- True during the parsing of a class invariant.

   tuple_flag: BOOLEAN
         -- True when we are parsing the special tuple.e file.

   formal_generic_list: FORMAL_GENERIC_LIST
         -- Void or not empty list of formal generic arguments.

   arguments: FORMAL_ARG_LIST
         -- Void or actual formal arguments list.

   local_vars: LOCAL_VAR_LIST
         -- Void or actual local variables list.

   closure_arguments: RING_ARRAY[FORMAL_ARG_LIST]

   closure_local_vars: RING_ARRAY[LOCAL_VAR_LIST]

   ok: BOOLEAN
         -- Dummy variable to call functions.

   last_expression: EXPRESSION

   last_type_mark: TYPE_MARK

   last_class_name: CLASS_NAME

   last_feature_declaration: FEATURE_TEXT

   last_feature_name: FEATURE_NAME

   last_feature_name_list: FEATURE_NAME_LIST

   last_formal_generic_type_mark: FORMAL_GENERIC_TYPE_MARK

   last_instruction: INSTRUCTION

   last_parent_edge: PARENT_EDGE

   last_tag_mark: TAG_NAME

   S_just_started_manifest_number_or_generic_manifest: INTEGER 0
   S_after_sign_of_some_number:                        INTEGER 1
   S_after_open_curly_brace:                           INTEGER 2
   S_inside_some_number:                               INTEGER 3
   S_inside_a_real_just_after_the_dot:                 INTEGER 4
   S_after_real_waiting_the_closing_curly:             INTEGER 5
   S_after_integer_waiting_the_closing_curly:          INTEGER 6
   S_first_hexadecimal_digit:                          INTEGER 7
   S_inside_hexadecimal:                               INTEGER 8
   S_after_hexadecimal_waiting_the_closing_curly:      INTEGER 9
   S_after_type_mark:                                  INTEGER 10
   S_inside_fractional_part_of_a_real:                 INTEGER 11
   S_just_after_the_e_of_exponent_part_of_a_real:      INTEGER 12
   S_inside_exponent_part_of_a_real:                   INTEGER 13
   S_inside_manifest_generic:                          INTEGER 14

   S_finished_with_no_error_and_true:                  INTEGER 20
   S_finished_with_no_error_and_false:                 INTEGER 21

   a_manifest_or_type_test (syntax_flag: INTEGER_8): BOOLEAN
         --  ++ manifest_or_type_test_expression -> manifest_or_type_test [ "." after_a_dot ]
         --  ++ manifest_or_type_test -> integer |
         --  ++                      real |
         --  ++                      "{" type_mark integer "}" |
         --  ++                      "{" type_mark real "}" |
         --  ++                      open_argument |
         --  ++                      "{" type_mark "} ?:= expression |
         --  ++                      "{" type_mark [ { expression "," ... } ] "<<" { expression "," ...} ">>" "}"
         --  ++ open_argument -> "{" type_mark "}"
         --
         -- When True, the result is made available in `last_expression'.
         --
      require
         (syntax_flag = Expression_syntax_flag) xor
         (syntax_flag = Instruction_syntax_flag) xor
         (syntax_flag = Atomic_syntax_flag) xor
         (syntax_flag = When_inspect_syntax_flag)
      local
         stop: BOOLEAN; optional_list, item_list: FAST_ARRAY[EXPRESSION]
         type_mark: TYPE_MARK; integer_type_mark: INTEGER_TYPE_MARK; real_type_mark: REAL_TYPE_MARK
         pretty_view, normal_integer_view: STRING; state, l, c, dot_index, digit_count, semicolon_count: INTEGER
         sign_flag: CHARACTER; opening_curly_position, ip: POSITION
         first_digit_index, first_hexadecimal_digit_index: INTEGER; value: INTEGER_64
      do
         from
            pretty_view := once ".........................................................."
            pretty_view.clear_count
            normal_integer_view := once ".........................................................."
            normal_integer_view.clear_count
            l := line
            c := column
            state := S_just_started_manifest_number_or_generic_manifest
         until
            state >= S_finished_with_no_error_and_true
         loop
            inspect
               state
            when S_just_started_manifest_number_or_generic_manifest then
               inspect
                  cc
               when '{' then
                  opening_curly_position := pos(line, column)
                  pretty_view.extend(cc)
                  state := S_after_open_curly_brace
                  next_char
               when '-' then
                  pretty_view.extend(cc)
                  normal_integer_view.extend(cc)
                  sign_flag := cc
                  state := S_after_sign_of_some_number
                  next_char
               when '+' then
                  sign_flag := cc
                  state := S_after_sign_of_some_number
                  next_char
               when '0' .. '9' then
                  pretty_view.extend(cc)
                  normal_integer_view.extend(cc)
                  first_digit_index := pretty_view.count
                  state := S_inside_some_number
                  next_char
               else
                  state := S_finished_with_no_error_and_false
               end
            when S_after_sign_of_some_number then
               inspect
                  cc
               when ' ', '%T', '%N' then
                  next_char
               when '0' .. '9' then
                  pretty_view.extend(cc)
                  normal_integer_view.extend(cc)
                  first_digit_index := pretty_view.count
                  state := S_inside_some_number
                  next_char
               else
                  go_back_at(l, c)
                  state := S_finished_with_no_error_and_false
               end
            when S_after_open_curly_brace then
               inspect
                  cc
               when ' ', '%T', '%N' then
                  next_char
               when 'A' .. 'Z', 'a' .. 'z' then
                  if not a_type_mark(False) then
                     error_handler.add_position(current_position)
                     error_handler.append(once "Type mark expected.")
                     error_handler.print_as_fatal_error
                  end
                  type_mark := last_type_mark
                  pretty_view.append(type_mark.written_name.to_string)
                  state := S_after_type_mark
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "Error in manifest constant or %"?:=%" type test ?")
                  error_handler.print_as_fatal_error
               end
            when S_after_type_mark then
               pretty_view.extend(' ')
               inspect
                  cc
               when ' ', '%T', '%N' then
                  next_char
               when '}' then
                  next_char
                  skip_comments
                  if skip3('?', ':', '=') then
                     if not a_expression then
                        error_handler.add_position(current_position)
                        error_handler.append(em21)
                        error_handler.print_as_fatal_error
                     end
                     create {ASSIGNMENT_TEST} last_expression.with_type_mark(type_mark, last_expression)
                     state := S_finished_with_no_error_and_true
                  elseif syntax_flag = Instruction_syntax_flag then
                     error_handler.add_position(opening_curly_position)
                     error_handler.append(once "Instruction expected.")
                     error_handler.print_as_fatal_error
                  else
                     create {OPEN_OPERAND} last_expression.type_holder(pos(l, c), type_mark)
                     state := S_finished_with_no_error_and_true
                  end
               when '0' .. '9' then
                  if type_mark.is_integer or else type_mark.is_real then
                     pretty_view.extend(cc)
                     normal_integer_view.extend(cc)
                     first_digit_index := pretty_view.count
                     state := S_inside_some_number
                     next_char
                  else
                     state := S_inside_manifest_generic
                  end
               when '-' then
                  if type_mark.is_integer or else type_mark.is_real then
                     pretty_view.extend(cc)
                     normal_integer_view.extend(cc)
                     sign_flag := cc
                     state := S_after_sign_of_some_number
                     next_char
                  else
                     state := S_inside_manifest_generic
                  end
               when '+' then
                  if type_mark.is_integer or else type_mark.is_real then
                     sign_flag := cc
                     state := S_after_sign_of_some_number
                     next_char
                  else
                     state := S_inside_manifest_generic
                  end
               else
                  if type_mark.is_integer or else type_mark.is_real then
                     error_handler.add_position(current_position)
                     error_handler.append(once "Error in constant or manifest creation.")
                     error_handler.print_as_fatal_error
                  else
                     state := S_inside_manifest_generic
                  end
               end
            when S_inside_some_number then
               inspect
                  cc
               when '0' .. '9' then
                  pretty_view.extend(cc)
                  normal_integer_view.extend(cc)
                  next_char
               when '.' then
                  if syntax_flag = When_inspect_syntax_flag then
                     -- It is probably the first dot of ".." slice.
                     if pretty_view.first = '{' then
                        error_handler.add_position(current_position)
                        error_handler.append(once "Error while reading an integer constant. Missing %"}%" ?")
                        error_handler.print_as_fatal_error
                     end
                     if not normal_integer_view.is_integer_64 then
                        integer_overflow_error(l, c, normal_integer_view)
                     end
                     value := normal_integer_view.to_integer_64
                     create {INTEGER_CONSTANT} last_expression.make(value, pos(l, c))
                     state := S_finished_with_no_error_and_true
                  else
                     next_char
                     if cc.is_letter then
                        if pretty_view.first = '{' then
                           error_handler.add_position(current_position)
                           error_handler.append(once "Error while reading a number. Missing %"}%" ?")
                           error_handler.print_as_fatal_error
                        end
                        if not normal_integer_view.is_integer_64 then
                           integer_overflow_error(l, c, normal_integer_view)
                        end
                        value := normal_integer_view.to_integer_64
                        create {INTEGER_CONSTANT} last_expression.make(value, pos(l, c))
                        column := column - 1
                        cc := '.'
                        state := S_finished_with_no_error_and_true
                     else
                        pretty_view.extend('.')
                        dot_index := pretty_view.count
                        state := S_inside_a_real_just_after_the_dot
                     end
                  end
               when 'x' then
                  if first_digit_index /= pretty_view.count or else pretty_view.last /= '0' then
                     error_handler.add_position(current_position)
                     error_handler.append(once "Error while reading a number.")
                     error_handler.print_as_fatal_error
                  end
                  pretty_view.extend(cc)
                  state := S_first_hexadecimal_digit
                  next_char
               when '_' then
                  pretty_view.extend(cc)
                  next_char
               when 'e', 'E' then
                  pretty_view.extend(cc)
                  next_char
                  state := S_just_after_the_e_of_exponent_part_of_a_real
               when 'a'..'d', 'f'..'v', 'y'..'z','A'..'D', 'F'..'V', 'Y'..'Z' then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Error while reading a number.")
                  error_handler.print_as_fatal_error
               else
                  if pretty_view.first /= '{' then
                     state := S_finished_with_no_error_and_true
                     if not normal_integer_view.is_integer_64 then
                        integer_overflow_error(l, c, normal_integer_view)
                     end
                     value := normal_integer_view.to_integer_64
                     create {INTEGER_CONSTANT} last_expression.make(value, pos(l, c))
                  else
                     state := S_after_integer_waiting_the_closing_curly
                  end
               end
            when S_inside_a_real_just_after_the_dot then
               if pretty_view.item(first_digit_index) = '0' and then pretty_view.count - 1 /= first_digit_index then
                  error_handler.add_position(pos(line, column - pretty_view.count + first_digit_index - 1))
                  error_handler.append(once "Removed non-significant digit(s) from integral part of real constant.")
                  error_handler.print_as_style_warning
                  from
                  until
                     (pretty_view.item(first_digit_index) /= '0')
                        or else
                     (pretty_view.count - 1 = first_digit_index)
                  loop
                     pretty_view.remove(first_digit_index)
                  end
               end
               inspect
                  cc
               when '0' .. '9' then
                  pretty_view.extend(cc)
                  state := S_inside_fractional_part_of_a_real
                  next_char
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "Error while reading fractional part of a real value (digit expected after the dot).")
                  error_handler.print_as_error
                  pretty_view.extend('0')
                  state := S_finished_with_no_error_and_true
               end
            when S_inside_fractional_part_of_a_real then
               inspect
                  cc
               when '0' .. '9' then
                  pretty_view.extend(cc)
                  state := S_inside_fractional_part_of_a_real
                  next_char
               when 'e', 'E' then
                  pretty_view.extend(cc)
                  next_char
                  state := S_just_after_the_e_of_exponent_part_of_a_real
               when 'a'..'d', 'f'..'z', 'A'..'D', 'F'..'Z' then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Error while reading a real. Missing separator after the value ?")
                  error_handler.print_as_fatal_error
               when '.' then
                  if pretty_view.first = '{' then
                     error_handler.add_position(current_position)
                     error_handler.append(once "Error while reading a real. Missing %"}%" ?")
                     error_handler.print_as_fatal_error
                  end
                  create {REAL_CONSTANT} last_expression.make(pos(l, c), pretty_view.twin, Void)
                  state := S_finished_with_no_error_and_true
               when '_' then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Underscore notation not supported inside fractional part.")
                  error_handler.print_as_fatal_error
               else
                  if pretty_view.first /= '{' then
                     state := S_finished_with_no_error_and_true
                     create {REAL_CONSTANT} last_expression.make(pos(l, c), pretty_view.twin, Void)
                  else
                     state := S_after_real_waiting_the_closing_curly
                  end
               end
            when S_just_after_the_e_of_exponent_part_of_a_real then
               if cc = '+' or else cc = '-' then
                  pretty_view.extend(cc)
                  next_char
               end
               inspect
                  cc
               when '0' .. '9' then
                  pretty_view.extend(cc)
                  next_char
                  state := S_inside_exponent_part_of_a_real
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "Exponent part of a real value expected.")
                  error_handler.print_as_fatal_error
               end
            when S_inside_exponent_part_of_a_real then
               inspect
                  cc
               when '0' .. '9' then
                  pretty_view.extend(cc)
                  next_char
                  state := S_inside_exponent_part_of_a_real
               else
                  if pretty_view.first /= '{' then
                     state := S_finished_with_no_error_and_true
                     create {REAL_CONSTANT} last_expression.make(pos(l, c), pretty_view.twin, Void)
                  else
                     state := S_after_real_waiting_the_closing_curly
                  end
               end
            when S_first_hexadecimal_digit then
               if sign_flag /= '%U' then
                  error_handler.add_position(current_position)
                  error_handler.append(once "No sign allowed before an hexadecimal constant value.")
                  error_handler.print_as_fatal_error
               end
               pretty_view.extend(cc)
               first_hexadecimal_digit_index := pretty_view.count
               inspect
                  cc
               when '0' .. '7' then
                  value := cc.decimal_value
                  state := S_inside_hexadecimal
                  next_char
               when '8' .. '9', 'A' .. 'F', 'a' .. 'f' then
                  sign_flag := '-'
                  value := cc.hexadecimal_value - 8
                  state := S_inside_hexadecimal
                  next_char
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "Error while reading hexadecimal value.")
                  error_handler.print_as_fatal_error
               end
            when S_inside_hexadecimal then
               inspect
                  cc
               when '0' .. '9', 'A' .. 'F', 'a' .. 'f' then
                  pretty_view.extend(cc)
                  value := value * 16 + cc.hexadecimal_value
                  next_char
               when 'G' .. 'Z', 'g' .. 'z' then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Separator expected to end hexadecimal constant.")
                  error_handler.print_as_fatal_error
               else
                  digit_count := pretty_view.count - first_hexadecimal_digit_index + 1
                  inspect
                     digit_count
                  when 2, 4, 8, 16 then
                  else
                     error_handler.append(once "Incorrect hexadecimal notation. Wrong number of hexadecimal %
                                          %digits (")
                     error_handler.append_integer(digit_count)
                     error_handler.add_position(current_position)
                     error_handler.append(
                         " digits). You must use exactly 2, 4, 8 or 16 digits only. A 2 digit value %
                         %denotes an INTEGER_8, a 4 digit value denotes an INTEGER_16, an 8 digit value %
                         %denotes an INTEGER_32, and, finally, a 16 digit value denotes an INTEGER_64. %
                         %(See examples in file %"tutorial/manifest_notation.e%".)")
                     error_handler.print_as_fatal_error
                  end
                  if pretty_view.first /= '{' then
                     state := S_finished_with_no_error_and_true
                     create {INTEGER_CONSTANT} last_expression.hexadecimal(pos(l, c), pretty_view.twin,
                                                                           digit_count.to_integer_8,
                                                                           sign_flag = '-', value)
                  else
                     state := S_after_hexadecimal_waiting_the_closing_curly
                  end
               end
            when S_after_real_waiting_the_closing_curly then
               check
                  pretty_view.first = '{'
               end
               inspect
                  cc
               when ' ', '%T', '%N' then
                  next_char
               when '}' then
                  pretty_view.extend(cc)
                  next_char
                  if type_mark = Void then
                     error_handler.add_position(current_position)
                     error_handler.append(once "Error while reading real number.")
                     error_handler.print_as_fatal_error
                  elseif {REAL_TYPE_MARK} ?:= type_mark then
                     real_type_mark ::= type_mark
                     create {REAL_CONSTANT} last_expression.make(pos(l, c), pretty_view.twin, real_type_mark)
                     state := S_finished_with_no_error_and_true
                  else
                     error_handler.add_position(type_mark.start_position)
                     error_handler.add_position(current_position)
                     error_handler.append(once "Manifest real value not compatible with this type.")
                     error_handler.print_as_fatal_error
                  end
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "Error while reading a real. Missing %"}%" ?")
                  error_handler.print_as_fatal_error
               end
            when S_after_integer_waiting_the_closing_curly then
               check
                  pretty_view.first = '{'
               end
               inspect
                  cc
               when ' ', '%T', '%N' then
                  next_char
               when '}' then
                  pretty_view.extend(cc)
                  next_char
                  if type_mark = Void then
                     error_handler.add_position(current_position)
                     error_handler.append(once "Error while reading manifest number.")
                     error_handler.print_as_fatal_error
                  elseif {INTEGER_TYPE_MARK} ?:= type_mark then
                     integer_type_mark ::= type_mark
                     if not normal_integer_view.is_integer_64 then
                        integer_overflow_error(l, c, normal_integer_view)
                     end
                     value := normal_integer_view.to_integer_64
                     create {INTEGER_CONSTANT} last_expression.special(pos(l, c), pretty_view.twin,
                                                                       integer_type_mark, value)
                  else
                     error_handler.add_position(type_mark.start_position)
                     error_handler.add_position(current_position)
                     error_handler.append(once "Manifest value not compatible with this type.")
                     error_handler.print_as_fatal_error
                  end
                  state := S_finished_with_no_error_and_true
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "Error while reading a number. Missing %"}%" ?")
                  error_handler.print_as_fatal_error
               end
            when S_after_hexadecimal_waiting_the_closing_curly then
               check
                  pretty_view.first = '{'
               end
               inspect
                  cc
               when ' ', '%T', '%N' then
                  next_char
               when '}' then
                  pretty_view.extend(cc)
                  next_char
                  if type_mark = Void then
                     error_handler.add_position(current_position)
                     error_handler.append(once "Error while reading hexadecimal number.")
                     error_handler.print_as_fatal_error
                  elseif {INTEGER_TYPE_MARK} ?:= type_mark then
                     integer_type_mark ::= type_mark
                     inspect
                        integer_type_mark.bit_count
                     when 8 then
                        if digit_count /= 2 then
                           error_handler.add_position(type_mark.start_position)
                           error_handler.append(once "Must use exactly 2 hexadecimal digits for INTEGER_8.")
                           error_handler.print_as_fatal_error
                        end
                     when 16 then
                        if digit_count /= 4 then
                           error_handler.add_position(type_mark.start_position)
                           error_handler.append(once "Must use exactly 4 hexadecimal digits for INTEGER_16.")
                           error_handler.print_as_fatal_error
                        end
                     when 32 then
                        if digit_count /= 8 then
                           error_handler.add_position(type_mark.start_position)
                           error_handler.append(once "Must use exactly 8 hexadecimal digits for INTEGER_32.")
                           error_handler.print_as_fatal_error
                        end
                     when 64 then
                        if digit_count /= 16 then
                           error_handler.add_position(type_mark.start_position)
                           error_handler.append(once "Must use exactly 16 hexadecimal digits for INTEGER_64.")
                           error_handler.print_as_fatal_error
                        end
                     end
                     create {INTEGER_CONSTANT} last_expression.hexadecimal(pos(l, c), pretty_view.twin,
                                                                           digit_count.to_integer_8,
                                                                           sign_flag = '-', value)
                  else
                     error_handler.add_position(type_mark.start_position)
                     error_handler.append(once "Cannot use hexadecimal notation for this type.")
                     error_handler.print_as_fatal_error
                  end
                  state := S_finished_with_no_error_and_true
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "Error while reading an hexadecimal value. Missing %"}%" ?")
                  error_handler.print_as_fatal_error
               end
            when S_inside_manifest_generic then
               if cc = ',' then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Extra %",%" ignored.")
                  error_handler.print_as_style_warning
                  if skip1(',') then end
               end
               from
                  stop := False
               until
                  stop
               loop
                  if skip2('<', '<') then
                     stop := True
                  elseif a_expression then
                     if optional_list = Void then
                        create optional_list.with_capacity(4)
                     end
                     optional_list.add_last(last_expression)
                     if not skip1(',') then
                        error_handler.add_position(current_position)
                        error_handler.append(em5)
                        error_handler.print_as_warning
                     end
                  else
                     error_handler.add_position(type_mark.start_position)
                     error_handler.add_position(current_position)
                     error_handler.append(once "Opening %"<<%" of manifest generic creation expected.")
                     error_handler.print_as_fatal_error
                  end
               end
               from
                  stop := False
               until
                  stop
               loop
                  if a_expression then
                     if item_list = Void then
                        create item_list.with_capacity(16)
                     end
                     item_list.add_last(last_expression)
                     if skip2('>', '>') then
                        stop := True
                        if semicolon_count > 0 and then (item_list.count #\\ semicolon_count) > 0 then
                           error_handler.add_position(pos(start_line, start_column))
                           error_handler.append(once "Missing items in manifest creation %"<< ... >>%" list. %
                                                %The last bunch should have ")
                           error_handler.append(semicolon_count.to_string)
                           error_handler.append(once " items.")
                           error_handler.print_as_fatal_error
                        end
                     elseif cc = ';' then
                        if semicolon_count = 0 then
                           semicolon_count := item_list.count
                        elseif (item_list.count #\\ semicolon_count) > 0 then
                           semicolon_count := -1
                           ip := pos(line, column)
                        end
                        if skip1(';') then end
                     elseif cc = ',' then
                        if semicolon_count > 0 and then (item_list.count #\\ semicolon_count) = 0 then
                           semicolon_count := -1
                           ip := pos(line, column)
                        end
                        if skip1(',') then end
                     elseif semicolon_count > 0 then
                        if (item_list.count #\\ semicolon_count) > 0 then
                           error_handler.add_position(current_position)
                           error_handler.append(em5)
                           error_handler.print_as_warning
                        else
                           error_handler.add_position(current_position)
                           error_handler.append(em6)
                           error_handler.print_as_warning
                        end
                     else
                        error_handler.add_position(current_position)
                        error_handler.append(em5)
                        error_handler.print_as_warning
                     end
                  elseif skip2('>', '>') then
                     stop := True
                  else
                     error_handler.add_position(type_mark.start_position)
                     error_handler.add_position(current_position)
                     error_handler.append(once "Closing %">>%" of manifest generic creation expected.")
                     error_handler.print_as_fatal_error
                  end
               end
               if item_list = Void then
                  error_handler.add_position(pos(l, c))
                  error_handler.add_position(current_position)
                  error_handler.append(once "Empty list not allowed for manifest generic creation.")
                  error_handler.print_as_fatal_error
               end
               if cc /= '}' then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Missing %"}%" to terminate manifest generic creation.")
                  error_handler.print_as_fatal_error
               end
               next_char
               create {MANIFEST_GENERIC}
                  last_expression.make(pos(l, c), type_mark, optional_list, item_list, semicolon_count, ip)
               state := S_finished_with_no_error_and_true
            end
         end
         inspect
            state
         when S_finished_with_no_error_and_true then
            Result := True
            inspect
               syntax_flag
            when When_inspect_syntax_flag, Atomic_syntax_flag then
               skip_comments
            when Expression_syntax_flag then
               if cc = '.' then
                  next_char
                  Result := manifest_just_after_a_dot(sign_flag, False, last_expression)
               else
                  skip_comments
                  if cc = '.' then
                     error_handler.add_position(current_position)
                     error_handler.append(once "Removed unexpected blank space(s) just before this dot (assume %
                         %you really want to call a function using the previous manifest expression %
                                          %as the target).")
                     error_handler.print_as_style_warning
                     next_char
                     Result := manifest_just_after_a_dot(sign_flag, False, last_expression)
                  end
               end
            when Instruction_syntax_flag then
               if cc = '.' then
                  next_char
                  Result := manifest_just_after_a_dot(sign_flag, True, last_expression)
               else
                  skip_comments
                  if cc = '.' then
                     error_handler.add_position(current_position)
                     error_handler.append(once "Removed unexpected blank space(s) just before this dot (assume %
                         %you really want to call a procedure using the previous manifest expression %
                                          %as the target).")
                     error_handler.print_as_style_warning
                     next_char
                     Result := manifest_just_after_a_dot(sign_flag, True, last_expression)
                  else
                     error_handler.add_position(pos(l, c))
                     error_handler.append(once "This call has a result value (and you must use it).")
                     error_handler.print_as_fatal_error
                  end
               end
            end
         when S_finished_with_no_error_and_false then
            Result := False
         end
      ensure
         (Result and (syntax_flag = Instruction_syntax_flag)) implies last_instruction /= Void
         (Result and (syntax_flag = Expression_syntax_flag)) implies last_expression /= Void
      end

   integer_overflow_error (l, c: INTEGER; normal_integer_view: STRING)
      do
         error_handler.add_position(pos(l, c))
         error_handler.append(once "Overflow while reading integer constant. Value `")
         error_handler.append(normal_integer_view)
         error_handler.append(once "' does not fit on INTEGER_64).")
         error_handler.print_as_error
      end

   a_argument_ (args: like arguments; closure_rank: INTEGER): BOOLEAN
      local
         rank: INTEGER
      do
         if args /= Void then
            rank := args.rank_of(token_buffer.buffer)
            if rank > 0 then
               last_expression := token_buffer.to_argument_name_ref(args, rank, closure_rank)
               Result := True
               if skip2(':', '=') or else skip3(':', ':', '=') or else skip2('?', '=') then
                  error_handler.add_position(pos(start_line, start_column))
                  error_handler.append(once "Argument name ")
                  error_handler.add_expression(last_expression)
                  error_handler.append(once " is not writable. Cannot use ")
                  error_handler.add_expression(last_expression)
                  error_handler.append(once " for the left-hand side of an assignment.")
                  error_handler.print_as_fatal_error
               end
            end
         end
      end

   a_argument: BOOLEAN
      local
         i: INTEGER
      do
         Result := a_argument_(arguments, 0)
         if closure_arguments /= Void then
            from
               i := closure_arguments.lower
            until
               Result or else i > closure_arguments.upper
            loop
               Result := a_argument_(closure_arguments.item(i), i - closure_arguments.lower + 1)
               i := i + 1
            end
         end
      end

   check_name_rank (name: LOCAL_ARGUMENT_DEF; dl: DECLARATION_LIST; err: STRING): BOOLEAN
      local
         rank: INTEGER
      do
         if dl /= Void then
            rank := dl.fast_rank_of(name.to_string)
         end
         if rank = 0 then
            Result := True
         else
            error_handler.add_position(name.start_position)
            error_handler.add_position(dl.name(rank).start_position)
            error_handler.append(err)
            error_handler.print_as_error
         end
      end

   check_name_rank_and_closure (name: LOCAL_ARGUMENT_DEF)
      local
         i: INTEGER; failed: BOOLEAN
      do
         if closure_arguments /= Void then
            from
               i := closure_arguments.lower
            until
               failed or else i > closure_arguments.upper
            loop
               failed := not check_name_rank(name, closure_arguments.item(i), em26_2)
               i := i + 1
            end
         end
         if closure_local_vars /= Void then
            from
               i := closure_local_vars.lower
            until
               failed or else i > closure_local_vars.upper
            loop
               failed := not check_name_rank(name, closure_local_vars.item(i), em26_2)
               i := i + 1
            end
         end
      end

   a_formal_arg_list: BOOLEAN
         --  ++ formal_arg_list -> ["(" {declaration_group ";" ...} ")"]
         --  ++ declaration_group -> {identifier "," ...}+ ":" type_mark
      local
         name: ARGUMENT_NAME_DEF; name_list: ARRAY[ARGUMENT_NAME_DEF]; declaration: DECLARATION
         list: ARRAY[DECLARATION]; state: INTEGER; sp: POSITION
      do
         Result := True
         arguments := Void
         if skip1('(') then
            from
               sp := pos(start_line, start_column)
            until
               state > 4
            loop
               inspect
                  state
               when 0 then
                  -- Waiting for the first name of a group.
                  if a_ordinary_feature_name_or_local_name then
                     name := token_buffer.to_argument_name_def
                     check_name_rank_and_closure(name)
                     state := 1
                  elseif skip1(')') then
                     state := 5
                  else
                     state := 6
                  end
               when 1 then
                  -- Waiting "," or ":".
                  if skip1(':') then
                     if name_list /= Void then
                        name_list.add_last(name)
                        name := Void
                     end
                     state := 3
                  else
                     ok := skip1(',')
                     if name_list = Void then
                        create name_list.with_capacity(2, 1)
                     end
                     name_list.add_last(name)
                     name := Void
                     state := 2
                  end
               when 2 then
                  -- Waiting for a name (not the first).
                  if a_ordinary_feature_name_or_local_name then
                     name := token_buffer.to_argument_name_def
                     check_name_rank_and_closure(name)
                     state := 1
                  elseif cc = ',' or else cc = ';' then
                     error_handler.add_position(current_position)
                     error_handler.append(em13)
                     error_handler.print_as_style_warning
                     ok := skip1(',') or else skip1(';')
                  else
                     state := 6
                  end
               when 3 then
                  -- Waiting for type_mark mark.
                  if a_type_mark(False) then
                     if name_list /= Void then
                        create {DECLARATION_GROUP} declaration.make(name_list, last_type_mark)
                        name_list := Void
                     else
                        create {DECLARATION_1} declaration.make(name, last_type_mark)
                        name := Void
                     end
                     if list = Void then
                        create list.with_capacity(2, 1)
                     end
                     list.add_last(declaration)
                     declaration := Void
                     state := 4
                  else
                     state := 6
                  end
               when 4 then
                  -- Waiting ";" or ")".
                  if skip1(')') then
                     state := 5
                  elseif cc = ',' then
                     error_handler.add_position(current_position)
                     error_handler.append(once "Replaced %",%" with %";%".")
                     error_handler.print_as_warning
                     ok := skip1(',')
                     state := 0
                  else
                     ok := skip1(';')
                     state := 0
                  end
               end
            end
            if state = 6 then
               error_handler.add_position(current_position)
               error_handler.append(once "Bad formal arguments list.")
               Result := False
            elseif list = Void then
               error_handler.add_position(current_position)
               error_handler.append(once "Empty formal argument list (deleted).")
               error_handler.print_as_style_warning
            else
               create arguments.make(sp, list)
               tmp_feature.set_arguments(arguments)
            end
         end
      end

   error_handler_append_info_about_feature_name
      do
         error_handler.append(once "Cannot use an uppercase letter inside such an identifier. %
         %Yes, this rule is strict, but it is better for all of us to be able %
         %to distinguish at a glance a CLASS_NAME from another name. %
         %Furthermore, it would be really too bad for example to use `IsEmpty' or %
         %`isEmpty' at one place while all other places are using `is_empty'. %
         %Finally, this strict constraint will help us to improve error messages of %
         %the compiler.")
      end

   a_local_name_def: BOOLEAN
         -- Used inside `a_local_var_list' in order to detect a LOCAL_NAME_DEF name.
         -- See also `a_local_name_ref' and use the good one.
      local
         backward_column: INTEGER; stop, lower_case_letter_encountered, may_be_a_keyword: BOOLEAN
         not_an_identifier: BOOLEAN
      do
         if cc.is_letter then
            from
               lower_case_letter_encountered := cc.is_lower
               backward_column := column
               may_be_a_keyword := True
               token_buffer.reset(line, backward_column)
               token_buffer.extend(cc)
            until
               stop
            loop
               next_char
               inspect
                  cc
               when 'a' .. 'z' then
                  lower_case_letter_encountered := True
                  token_buffer.extend(cc)
               when 'A' .. 'Z' then
                  if lower_case_letter_encountered then
                     error_handler.add_position(pos(line, column))
                     error_handler_append_info_about_feature_name
                     error_handler.print_as_fatal_error
                  else
                     not_an_identifier := True
                     stop := True
                  end
               when '0' .. '9', '_' then
                  may_be_a_keyword := False
                  token_buffer.extend(cc)
               else
                  stop := True
               end
            end
            if not_an_identifier then
               cc := token_buffer.buffer.first
               column := backward_column
               check
                  not Result
               end
            elseif may_be_a_keyword then
               if token_buffer.isa_keyword then
                  cc := token_buffer.buffer.first
                  column := backward_column
                  check
                     not Result
                  end
                  inspect
                     token_buffer.buffer
                  when "do", "once" then
                  else
                     error_handler.add_position(token_buffer.start_position)
                     error_handler.append(once "Syntax error inside %"local%" variable list definition. %
                                          %Encountered keyword %"")
                     error_handler.append(token_buffer.buffer)
                     error_handler.append(once "%" while waiting for some local variable name. Cannot use %"")
                     error_handler.append(token_buffer.buffer)
                     error_handler.append(once "%" as a local variable name.")
                     error_handler.print_as_fatal_error
                  end
               else
                  Result := True
                  skip_comments
               end
            else
               Result := True
               skip_comments
            end
         end
      end

   S_waiting_for_the_first_name_of_a_group: INTEGER 0
   S_waiting_for_colon_or_semicolon:        INTEGER 1
   S_waiting_for_a_second_local_name:       INTEGER 2
   S_waiting_for_a_type_mark:               INTEGER 3
   S_waiting_for_optional_colon:            INTEGER 4

   check_local_var_rank_and_closure (name: LOCAL_NAME_DEF)
      do
         if check_name_rank(name, arguments, em26) then
            check_name_rank_and_closure(name)
         end
      end

   a_local_var_list
         --  ++ local_var_list -> [{declaration_group ";" ...}]
         --  ++ declaration_group -> {identifier "," ...}+ ":" type_mark
      local
         name: LOCAL_NAME_DEF; name_list: ARRAY[LOCAL_NAME_DEF]; declaration: DECLARATION; list: ARRAY[DECLARATION]
         state: INTEGER; sp, p: POSITION
      do
         from
            sp := current_position
         until
            state > S_waiting_for_optional_colon
         loop
            inspect
               state
            when S_waiting_for_the_first_name_of_a_group then
               if a_local_name_def then
                  name := token_buffer.to_local_name_def
                  state := S_waiting_for_colon_or_semicolon
                  check_local_var_rank_and_closure(name)
               elseif cc = ',' or else cc = ';' then
                  error_handler.add_position(current_position)
                  error_handler.append(em13)
                  error_handler.print_as_style_warning
                  ok := skip1(',') or else skip1(';')
               else
                  state := 5
               end
            when S_waiting_for_colon_or_semicolon then
               if skip1(':') then
                  if name_list /= Void then
                     name_list.add_last(name)
                     name := Void
                  end
                  state := S_waiting_for_a_type_mark
               else
                  if cc = ';' then
                     error_handler.add_position(current_position)
                     error_handler.append(once "Replaced %";%" with %",%".")
                     error_handler.print_as_warning
                     ok := skip1(';')
                  else
                     ok := skip1(',')
                  end
                  if name_list = Void then
                     create name_list.with_capacity(2, 1)
                  end
                  name_list.add_last(name)
                  name := Void
                  state := S_waiting_for_a_second_local_name
               end
            when S_waiting_for_a_second_local_name then
               if a_local_name_def then
                  name := token_buffer.to_local_name_def
                  state := S_waiting_for_colon_or_semicolon
                  check_local_var_rank_and_closure(name)
               elseif cc = ',' or else cc = ';' then
                  error_handler.add_position(current_position)
                  error_handler.append(em13)
                  error_handler.print_as_style_warning
                  ok := skip1(',') or else skip1(';')
               elseif a_type_mark(False) then
                  p := last_type_mark.start_position
                  go_back_at(p.line, p.column)
                  error_handler.add_position(current_position)
                  error_handler.append(once "Added missing %":%" before this type mark.")
                  error_handler.print_as_warning
                  state := S_waiting_for_a_type_mark
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "Local variable name expected after comma inside local variable list.")
                  error_handler.print_as_fatal_error
               end
            when S_waiting_for_a_type_mark then
               if a_type_mark(False) then
                  if name_list /= Void then
                     create {DECLARATION_GROUP} declaration.make(name_list, last_type_mark)
                     name_list := Void
                  else
                     create {DECLARATION_1} declaration.make(name, last_type_mark)
                     name := Void
                  end
                  if list = Void then
                     create list.with_capacity(2, 1)
                  end
                  list.add_last(declaration)
                  state := S_waiting_for_optional_colon
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "Type mark expected after a colon mark inside a local variable list.")
                  error_handler.print_as_fatal_error
               end
            when S_waiting_for_optional_colon then
               if cc = ',' then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Replaced %",%" with %";%".")
                  error_handler.print_as_warning
                  ok := skip1(',')
                  state := S_waiting_for_the_first_name_of_a_group
               else
                  ok := skip1(';')
                  state := S_waiting_for_the_first_name_of_a_group
               end
            end
         end
         if list /= Void then
            create local_vars.make(sp, list)
            tmp_feature.set_local_vars(local_vars)
         end
      end

   a_local_name_ref_ (vars: like local_vars; closure_rank: INTEGER): BOOLEAN
         -- Used to detect the usage of some local variable.
         -- See also `a_local_name_def' and use the good one.
      local
         rank: INTEGER
      do
         if vars /= Void then
            rank := vars.rank_of(token_buffer.buffer)
            if rank > 0 then
               last_expression := token_buffer.to_local_name_ref(vars, rank, closure_rank)
               Result := True
               if inside_ensure_flag then
                  error_handler.add_position(last_expression.start_position)
                  error_handler.append(once "Must not use local variable in ensure assertions (VEEN).")
                  error_handler.print_as_fatal_error
               elseif closure_rank > 0 and then (skip2(':', '=') or else skip3(':', ':', '=') or else skip2('?', '=')) then
                  error_handler.add_position(pos(start_line, start_column))
                  error_handler.append(once "Local name ")
                  error_handler.add_expression(last_expression)
                  error_handler.append(once " is not writable (reached through closure). Cannot use ")
                  error_handler.add_expression(last_expression)
                  error_handler.append(once " for the left-hand side of an assignment.")
                  error_handler.print_as_fatal_error
               end
            end
         end
      end

   a_local_name_ref: BOOLEAN
      local
         i: INTEGER
      do
         Result := a_local_name_ref_(local_vars, 0)
         if closure_local_vars /= Void then
            from
               i := closure_local_vars.lower
            until
               Result or else i > closure_local_vars.upper
            loop
               Result := a_local_name_ref_(closure_local_vars.item(i), i - closure_local_vars.lower + 1)
               i := i + 1
            end
         end
      end

   get_comment: COMMENT
      do
         Result := last_comment
         last_comment := Void
      end

   skip2 (c1, c2: CHARACTER): BOOLEAN
      require
         c1 /= '%N' and c2 /= '%N'
      do
         if c1 = cc then
            start_line := line
            start_column := column
            next_char
            if c2 = cc then
               Result := True
               next_char
               skip_comments
            else
               cc := c1
               column := start_column
            end
         end
      end

   skip3 (c1, c2, c3: CHARACTER): BOOLEAN
      require
         c1 /= '%N' and c2 /= '%N' and c3 /= '%N'
      do
         if c1 = cc then
            start_line := line
            start_column := column
            next_char
            if c2 = cc then
               next_char
               if c3 = cc then
                  Result := True
                  next_char
                  skip_comments
               else
                  cc := c1
                  column := start_column
               end
            else
               cc := c1
               column := start_column
            end
         end
      end

   skip1unless2 (c1, c2: CHARACTER): BOOLEAN
      do
         start_line := line
         start_column := column
         if cc = c1 then
            next_char
            if cc = c2 then
               cc := c1
               column := start_column
            else
               Result := True
               skip_comments
            end
         end
      end

   a_character_constant (syntax_flag: INTEGER_8): BOOLEAN
      require
         (syntax_flag = Atomic_syntax_flag) xor
         (syntax_flag = Expression_syntax_flag) xor
         (syntax_flag = Instruction_syntax_flag)
      local
         sp: POSITION; pretty_view: STRING; value: CHARACTER; ascii_code: INTEGER
      do
         if cc = '%'' then
            Result := True
            pretty_view := once "........"
            pretty_view.clear_count
            sp := pos(line, column)
            pretty_view.extend(cc); next_char
            inspect
               cc
            when '%%' then
               pretty_view.extend(cc); next_char
               inspect
                  cc
               when 'A' then
                  value := '%A'
               when 'B' then
                  value := '%B'
               when 'C' then
                  value := '%C'
               when 'D' then
                  value := '%D'
               when 'F' then
                  value := '%F'
               when 'H' then
                  value := '%H'
               when 'L' then
                  value := '%L'
               when 'N' then
                  value := '%N'
               when 'Q' then
                  value := '%Q'
               when 'R' then
                  value := '%R'
               when 'S' then
                  value := '%S'
               when 'T' then
                  value := '%T'
               when 'U' then
                  value := '%U'
               when 'V' then
                  value := '%V'
               when '%%' then
                  value := '%%'
               when '%'' then
                  value := '%''
               when '%"' then
                  value := '%"'
               when '(' then
                  value := '%('
               when ')' then
                  value := '%)'
               when '<' then
                  value := '%<'
               when '>' then
                  value := '%>'
               when '/' then
                  pretty_view.extend(cc); next_char
                  inspect
                     cc
                  when '0' then
                     pretty_view.extend(cc); next_char
                     inspect
                        cc
                     when '/' then
                        ascii_code := 0
                     when 'x' then
                        pretty_view.extend(cc); next_char
                        if not cc.is_hexadecimal_digit then
                           error_handler.add_position(current_position)
                           error_handler.append(once "Hexadecimal digit expected while reading CHARACTER constant.")
                           error_handler.print_as_error
                        end
                        ascii_code := cc.hexadecimal_value
                        pretty_view.extend(cc); next_char
                        if not cc.is_hexadecimal_digit then
                           error_handler.add_position(current_position)
                           error_handler.append(once "Must use exactly two hexadecimal digits for a CHARACTER constant.")
                           error_handler.print_as_error
                        end
                        ascii_code := ascii_code * 16 + cc.hexadecimal_value
                        pretty_view.extend(cc); next_char
                        if cc /= '/' then
                           error_handler.add_position(current_position)
                           error_handler.append(once "Slash %"/%" character expected after hexadecimal value in CHARACTER constant.")
                           error_handler.print_as_error
                        end
                        if ascii_code > Maximum_character_code then
                           error_handler.add_position(current_position)
                           error_handler.append(em40)
                           error_handler.print_as_error
                        end
                        value := ascii_code.to_character
                     else
                        error_handler.add_position(current_position)
                        error_handler.append(em38)
                        error_handler.print_as_fatal_error
                     end
                  when '1' .. '9' then
                     ascii_code := cc.decimal_value
                     pretty_view.extend(cc); next_char
                     inspect
                        cc
                     when '0' .. '9' then
                        ascii_code := ascii_code * 10 + cc.decimal_value
                        pretty_view.extend(cc); next_char
                        inspect
                           cc
                        when '0' .. '9' then
                           ascii_code := ascii_code * 10 + cc.decimal_value
                           pretty_view.extend(cc); next_char
                           if cc /= '/' then
                              error_handler.add_position(current_position)
                              error_handler.append(once "Slash %"/%" character expected after decimal value in CHARACTER constant.")
                              error_handler.print_as_fatal_error
                           end
                           if ascii_code > Maximum_character_code then
                              error_handler.add_position(current_position)
                              error_handler.append(em40)
                              error_handler.print_as_error
                           end
                        when '/' then
                        else
                           error_handler.add_position(current_position)
                           error_handler.append(once "Slash %"/%" or decimal digit expected (inside CHARACTER constant).")
                           error_handler.print_as_fatal_error
                        end
                     when '/' then
                     else
                        error_handler.add_position(current_position)
                        error_handler.append(once "Slash %"/%" or decimal digit expected (inside CHARACTER constant).")
                        error_handler.print_as_fatal_error
                     end
                     value := ascii_code.to_character
                  else
                     error_handler.add_position(current_position)
                     error_handler.append(em38)
                     error_handler.print_as_fatal_error
                  end
                  if cc /= '/' then
                     error_handler.add_position(current_position)
                     error_handler.append(once "Slash (%"/%") expected (inside CHARACTER constant).")
                     error_handler.print_as_fatal_error
                  end
               else
                  error_handler.add_position(current_position)
                  error_handler.append(em37)
                  error_handler.print_as_fatal_error
               end
               pretty_view.extend(cc); next_char
            when '%'' then
               -- ''
               error_handler.add_position(current_position)
               error_handler.append(once "Bad empty character constant.")
               error_handler.print_as_fatal_error
            else
               -- Finally, the most common notation:
               value := cc
               pretty_view.extend(cc); next_char
            end
            if cc /= '%'' then
               error_handler.add_position(current_position)
               error_handler.append(once "Bad character constant. Closing %"'%" expected.")
               error_handler.print_as_fatal_error
            end
            pretty_view.extend(cc); next_char
            if smart_eiffel.pretty_flag or else smart_eiffel.short_or_class_check_flag then
               pretty_view := pretty_view.twin
            else
               pretty_view := Void
            end
            create {CHARACTER_CONSTANT} last_expression.make(sp, value, pretty_view)
            inspect
               syntax_flag
            when Atomic_syntax_flag then
               skip_comments
            when Expression_syntax_flag then
               if cc = '.' then
                  next_char
                  Result := just_after_a_dot(False, last_expression)
               elseif cc = '(' then
                  Result := a_alias_parentheses(False, last_expression)
               elseif cc = '[' then
                  Result := a_alias_brackets(False, last_expression)
               else
                  skip_comments
                  if cc = '.' then
                     error_handler.add_position(current_position)
                     error_handler.append(once "Removed unexpected blank space(s) just before this dot (assume %
                         %you really want to apply a function using the previous CHARACTER constant %
                         %as the target).")
                     error_handler.print_as_style_warning
                     next_char
                     Result := just_after_a_dot(False, last_expression)
                  elseif not skipped_new_line and then cc = '(' then
                     Result := a_alias_parentheses(False, last_expression)
                  elseif not skipped_new_line and then cc = '[' then
                     Result := a_alias_brackets(False, last_expression)
                  end
               end
            when Instruction_syntax_flag then
               if cc = '.' then
                  next_char
                  Result := just_after_a_dot(True, last_expression)
               elseif cc = '(' then
                  Result := a_alias_parentheses(True, last_expression)
               elseif cc = '[' then
                  Result := a_alias_brackets(True, last_expression)
               else
                  skip_comments
                  if cc = '.' then
                     error_handler.add_position(current_position)
                     error_handler.append(once "Removed unexpected blank space(s) just before this dot (assume %
                         %you really want to apply a procedure using the previous CHARACTER constant %
                         %as the target).")
                     error_handler.print_as_style_warning
                     next_char
                     Result := just_after_a_dot(True, last_expression)
                  elseif not skipped_new_line and then cc = '(' then
                     Result := a_alias_parentheses(True, last_expression)
                  elseif not skipped_new_line and then cc = '[' then
                     Result := a_alias_brackets(True, last_expression)
                  end
               end
            end
         end
      end

   an_allowed_expression_in_when_of_inspect: BOOLEAN
         -- Only True for static values allowed in "when of inspect".
      local
         implicit_current: IMPLICIT_CURRENT; sfn: FEATURE_NAME
      do
         if a_ordinary_feature_name_or_local_name then
            Result := True
            sfn := token_buffer.to_feature_name
            create implicit_current.make(sfn.start_position)
            create {FUNCTION_CALL_0} last_expression.make(implicit_current, sfn)
         elseif a_character_constant(Atomic_syntax_flag) then
            Result := True
         elseif a_manifest_or_type_test(When_inspect_syntax_flag) then
            if {INTEGER_CONSTANT} ?:= last_expression then
               Result := True
            else
               error_handler.add_position(last_expression.start_position)
               error_handler.append(once "Such a constant cannot be used in %"when%" part of an inspect statement.")
               error_handler.print_as_fatal_error
            end
         elseif a_manifest_string(True) then
            Result := True
            last_expression := last_manifest_string
         elseif a_keyword_void then
            error_handler.add_position(pos(start_line, start_column))
            error_handler.append(once "Void is not a valid expression inside %"when%" part of an inspect statement.")
            error_handler.print_as_fatal_error
         else
            error_handler.add_position(current_position)
            error_handler.append(once "Only simple and statically computable expression are allowed here %
            %(inside %"when%" of %"inspect%" statement).")
            error_handler.print_as_fatal_error
         end
      end

   a_class_name: BOOLEAN
         -- The class name found is left in the `token_buffer'.
      local
         stop: BOOLEAN
      do
         inspect
            cc
         when 'A' .. 'Z' then
            Result := True
            from
               token_buffer.reset(line, column)
               token_buffer.extend(cc)
            until
               stop
            loop
               next_char
               inspect
                  cc
               when 'A' .. 'Z', '0' .. '9', '_' then
                  token_buffer.extend(cc)
               when 'a' .. 'z' then
                  Result := False
                  column := token_buffer.column
                  cc := current_line.item(column)
                  stop := True
               when ' ', '%T', '%N', '-' then
                  skip_comments
                  stop := True
               else
                  stop := True
               end
            end
         else
            -- Not a class name.
         end
      ensure
         no_class_name_looks_like_a_keyword: Result implies (not token_buffer.isa_keyword)
      end

   a_base_class_name: BOOLEAN
      do
         if a_class_name then
            Result := True
            last_class_name := token_buffer.to_class_name(False)
         end
      end

   a_base_class_name_def
         -- Read the current class text name which is just after the "class" keyword.
      local
         cn: CLASS_NAME; bc: CLASS_TEXT
      do
         bc := last_class_text
         cn := bc.name
         cn.set_accurate_position(pos(line, column))
         if a_base_class_name then
            if tuple_flag then
               -- No check for TUPLE.
            elseif last_class_name.to_string /= cn.to_string then
               error_handler.add_position(last_class_name.start_position)
               error_handler.append(once "File %"")
               error_handler.append(bc.path)
               error_handler.append(once "%" does not contain class %"")
               error_handler.append(cn.to_string)
               error_handler.append(once "%".")
               error_handler.print_as_fatal_error
            end
         elseif a_ordinary_feature_name_or_local_name then
            error_handler.add_position(token_buffer.start_position)
            error_handler.append(once "You are using a case sensitive language in which all class names must use %
            %only upper case letters. This decision was made to make the code more readable and to allow %
            %better error messages as well as syntax error recovery. The name %"")
            error_handler.append(token_buffer.buffer)
            error_handler.append(once "%" has been automatically replaced with %"")
            token_buffer.buffer.to_upper
            error_handler.append(token_buffer.buffer)
            error_handler.append(once "%".")
            error_handler.print_as_warning
            last_class_name := token_buffer.to_class_name(False)
         else
            error_handler.add_position(current_position)
            error_handler.append(once "Name of the current class expected.")
            error_handler.print_as_fatal_error
         end
         if cn.to_string.is_equal(once "NONE") then
            error_handler.add_position(cn.start_position)
            error_handler.append(once "This name cannot be used as a valid class name.")
            error_handler.print_as_fatal_error
         end
      end

   a_formal_generic_type_mark: BOOLEAN
      local
         sp: POSITION; fga: FORMAL_GENERIC_ARG; cn: CLASS_NAME; rank: INTEGER
      do
         if formal_generic_list /= Void then
            from
               rank := 1
            until
               Result or else rank > formal_generic_list.count
            loop
               fga := formal_generic_list.item(rank)
               if a_keyword(fga.name.to_string) then
                  sp := pos(start_line, start_column)
                  create cn.make(fga.name.hashed_name, sp, True)
                  create last_formal_generic_type_mark.make(cn, fga, rank)
                  Result := True
               end
               rank := rank + 1
            end
         end
      end

   freeop_prefix: INTEGER_8 1
   freeop_infix: INTEGER_8 2
   freeop_alias: INTEGER_8 3

   a_free_operator_definition (freeop: INTEGER_8; sp: POSITION): BOOLEAN
         -- A free operator name definition (the one which comes after the
         -- "infix" keyword or the "prefix" keyword at the definition
         -- place). A free operator must start and finish with one of the
         -- following character:  +-*/\=<>@#|&~
      require
         freeop.in_range(freeop_prefix, freeop_alias)
      local
         stop: BOOLEAN; l, c: INTEGER
      do
         if freeop = freeop_alias then
            if skip2('[', ']') then
               create last_feature_name.alias_name(brackets_name, sp)
               Result := True
            elseif skip2('(', ')') then
               create last_feature_name.alias_name(parentheses_name, sp)
               Result := True
            end
         end

         if not Result then
            inspect
               cc
            when '+', '-', '*', '/', '\', '=', '<', '>', '@', '#', '|', '&', '~' then
               l := line
               c := column
               buffer.clear_count
               Result := True
               from
                  buffer.extend(cc)
                  next_char
               until
                  stop
               loop
                  inspect
                     cc
                  when '.', '?', '{', '}' then
                     Result := False
                     buffer.extend(cc)
                     next_char
                  when '+', '-', '*', '/', '\', '=', '<', '>', '@', '#', '|', '&', '~', '^' then
                     Result := True
                     buffer.extend(cc)
                     next_char
                  else
                     stop := True
                  end
               end
               if not Result then
                  error_handler.add_position(pos(line, column))
                  error_handler.append(em43)
                  error_handler.print_as_fatal_error
               end

               if buffer.count = 1 and then buffer.first = '=' then
                  error_handler.add_position(pos(l, c))
                  error_handler.append(once "The basic = operator cannot be redefined. (This is a hard-coded builtin that we must trust.)")
                  error_handler.print_as_fatal_error
               end
               create_infix_prefix(freeop, l, c)
            else
               -- illegal infix name
            end
         end
      end

   a_free_operator_usage (freeop: INTEGER_8): BOOLEAN
         -- Syntactically, a free operator must start and finish with one
         -- of the following set of characters:  +-*/\=<>@#|&~
         -- Because of priority, traditional operators are not handled here.
      require
         freeop.in_range(freeop_prefix, freeop_alias)
      local
         stop: BOOLEAN; l, c: INTEGER
      do
         inspect
            cc
         when '+', '-', '*', '/', '\', '=', '<', '>', '@', '#', '|', '&', '~' then
            l := line
            c := column
            buffer.clear_count
            from
               Result := True
               buffer.extend(cc)
               next_char
            until
               stop
            loop
               inspect
                  cc
               when '.', '?', '{', '}' then
                  Result := False
                  buffer.extend(cc)
                  next_char
               when '+', '-', '*', '/', '\', '=', '<', '>', '@', '#', '|', '&', '~', '^' then
                  Result := True
                  buffer.extend(cc)
                  next_char
               else
                  stop := True
               end
            end
            -- Elimination of traditional operators which are handled
            -- by specific class as well as some other usage in order
            -- to provide backward compatibility:
            if Result then
               inspect
                  buffer.count
               when 1 then
                  inspect
                     buffer.first
                  when '+', '-', '*', '/', '=', '<', '>' then
                     Result := False
                  else
                  end
               when 2 then
                  inspect
                     buffer.first
                  when '>' then
                     inspect
                        buffer.last
                     when '=', '>' then
                        Result := False
                     else
                     end
                  when '/', '\', '<' then
                     inspect
                        buffer.last
                     when '=', '\', '/' then
                        Result := False
                     else
                     end
                  else
                  end
               else
                  Result := buffer.occurrences('>') /= buffer.count
               end
            end
            if Result then
               skip_comments
               create_infix_prefix(freeop, l, c)
            else
               go_back_at(l, c)
            end
         else
         end
      end

   a_retry: BOOLEAN
      do
         if a_keyword(fz_retry) then
            if not inside_rescue_flag then
               error_handler.add_position(pos(start_line, start_column))
               error_handler.append(once "%"retry%" cannot be outside of a rescue clause.")
               error_handler.print_as_error
            end
            create {RETRY_INSTRUCTION} last_instruction.make(pos(start_line, start_column))
            Result := True
         end
      end

   a_address_of: BOOLEAN
         --  ++ address_of -> "$" identifier
      local
         sp: POSITION; sfn: FEATURE_NAME; local_name: EXPRESSION
      do
         if skip1('$') then
            Result := True
            if a_keyword_result then
               sp := pos(start_line, start_column)
               create {RESULT} local_name.make(sp)
               create {ADDRESS_OF} last_expression.with_local(local_name)
            elseif a_ordinary_feature_name_or_local_name then
               if a_local_name_ref then
                  create {ADDRESS_OF} last_expression.with_local(last_expression)
               else
                  sfn := token_buffer.to_feature_name
                  create {ADDRESS_OF} last_expression.with_feature_name(sfn)
               end
            elseif a_expression then
               error_handler.add_position(last_expression.start_position)
               error_handler.append(once "Cannot use ")
               error_handler.add_expression(last_expression)
               error_handler.append(once " after the $ operator. ")
               error_handler.append(fz_vuar4)
               error_handler.print_as_fatal_error
            else
               error_handler.add_position(current_position)
               error_handler.append(fz_vuar4)
               error_handler.print_as_fatal_error
            end
         end
      end

   a_actuals: EFFECTIVE_ARG_LIST
         --  ++ actuals -> "(" {actual "," ...} ")"
         --  ++
      do
         if not skipped_new_line and then cc = '(' then
            start_line := line
            start_column := column
            next_char
            skip_comments
            Result := a_actuals_until(')', False)
         end
      end

   a_actuals_until (close: CHARACTER; allow_empty: BOOLEAN): EFFECTIVE_ARG_LIST
         --  ++ actuals -> "(" {actual "," ...} ")"
         --  ++                ^
         --  ++
      local
         sp, ep: POSITION; first_one: EXPRESSION; remainder: FAST_ARRAY[EXPRESSION]; l, c: INTEGER; snl: BOOLEAN
      do
         l := start_line
         c := start_column
         snl := skipped_new_line
         sp := pos(l, c)
         from
         until
            not a_expression
         loop
            if not skip1(',') and then cc /= close then
               error_handler.add_position(current_position)
               error_handler.append(em5)
               error_handler.print_as_warning
            end
            if first_one = Void then
               first_one := last_expression
            else
               if remainder = Void then
                  create remainder.with_capacity(4)
               end
               remainder.add_last(last_expression)
            end
         end
         if skip1(close) then
            ep := pos(start_line, start_column)
         else
            ep := pos(line, column)
            error_handler.add_position(current_position)
            error_handler.extend('%'')
            error_handler.extend(close)
            error_handler.append(once "' expected to end arguments list.")
            error_handler.print_as_fatal_error
         end
         if first_one = Void then
            if not allow_empty then
               go_back_at(l, c) -- empty actuals is not accepted, further analysis may trigger alias "()"
               skipped_new_line := snl
            end
         else
            create {EFFECTIVE_ARG_LIST_N} Result.make_n(sp, first_one, remainder)
            Result.end_position := ep
         end
      end

   just_after_a_dot (do_instruction: BOOLEAN; target: EXPRESSION): BOOLEAN
         --  ++ after_a_dot -> identifier [actuals] ["." after_a_dot]
         --  ++
      require
         target /= Void
      local
         fn: FEATURE_NAME; eal: EFFECTIVE_ARG_LIST
      do
         if a_ordinary_feature_name_or_local_name then
            fn := token_buffer.to_feature_name
            eal := a_actuals
            Result := a_r10(do_instruction, target, fn, eal)
         else
            error_handler.add_position(current_position)
            error_handler.append(once "Simple identifier expected just after a dot. %
                                 %Nothing else but a simple feature name is meaningful just after a dot.")
            error_handler.print_as_fatal_error
         end
      end

   a_alias_parentheses (do_instruction: BOOLEAN; target: EXPRESSION): BOOLEAN
         --  ++ alias_parentheses -> "(" {actual "," ...} ")"
         --  ++                      ^
      require
         target /= Void
         cc = '('
      local
         sp: POSITION; fn: FEATURE_NAME; eal: EFFECTIVE_ARG_LIST
      do
         start_line := line
         start_column := column
         sp := pos(start_line, start_column)
         next_char
         skip_comments
         eal := a_actuals_until(')', True)
         create fn.alias_name(parentheses_name, sp)
         Result := a_r10(do_instruction, target, fn, eal)
      end

   a_alias_brackets (do_instruction: BOOLEAN; target: EXPRESSION): BOOLEAN
         --  ++ alias_brackets -> "[" {actual "," ...} "]"
         --  ++                   ^
      require
         target /= Void
         cc = '['
      local
         sp: POSITION; fn: FEATURE_NAME; eal: EFFECTIVE_ARG_LIST
      do
         start_line := line
         start_column := column
         sp := pos(start_line, start_column)
         next_char
         skip_comments
         eal := a_actuals_until(']', True)
         create fn.alias_name(brackets_name, sp)
         Result := a_r10(do_instruction, target, fn, eal)
      end

   a_assignment_or_procedure_call: BOOLEAN
         --  ++ assignment_or_procedure_call -> "(" expression ")" r10 |
         --  ++                       "Precursor" ["{" type_mark "}"] [actuals] r10 |
         --  ++                       "Current" r10 |
         --  ++                       "Result" r10 |
         --  ++                       local_variable r10 |
         --  ++                       formal_argument r10 |
         --  ++                       writable ":=" expression |
         --  ++                       writable "?=" expression |
         --  ++                       writable "::=" expression |
         --  ++                       identifier procedure_call
         --  ++
      local
         type_mark: TYPE_MARK; args: EFFECTIVE_ARG_LIST; sp: POSITION; writable: EXPRESSION
         c, l: INTEGER
      do
         c := column
         l := line
         if skip1('(') and then a_expression then
            sp := pos(start_line, start_column)
            if skip1(')') then
               Result := a_r10(True, last_expression, Void, Void)
            else
               error_handler.add_position(sp)
               error_handler.add_position(current_position)
               error_handler.append(once "Corresponding closing ')' expected here.")
               error_handler.print_as_fatal_error
            end
         elseif a_keyword_precursor then
            sp := pos(start_line, start_column)
            if skip1('{') then
               type_mark := a_precursor_type_mark(sp)
            end
            args := a_actuals
            if cc = '{' then
               error_handler.add_position(current_position)
               error_handler.append(once "The type mark must be specified just after the %"Precursor%" keyword.")
               error_handler.print_as_fatal_error
            end
            if skip1('.') then
               create {PRECURSOR_EXPRESSION} last_expression.make(sp, type_mark, args)
               inside_function_precursor_check(last_expression)
               Result := just_after_a_dot(True, last_expression)
            elseif not skipped_new_line and then cc = '(' then
               create {PRECURSOR_EXPRESSION} last_expression.make(sp, type_mark, args)
               inside_function_precursor_check(last_expression)
               Result := a_alias_parentheses(True, last_expression)
            elseif not skipped_new_line and then cc = '[' then
               create {PRECURSOR_EXPRESSION} last_expression.make(sp, type_mark, args)
               inside_function_precursor_check(last_expression)
               Result := a_alias_brackets(True, last_expression)
            else
               create {PRECURSOR_INSTRUCTION} last_instruction.make(sp, type_mark, args)
               if inside_function_flag then
                  error_handler.append(once "Inside a function, a Precursor call must be a function call %
                  %(not a procedure call).")
                  error_handler.add_position(last_instruction.start_position)
                  error_handler.print_as_fatal_error
               end
               Result := True
            end
         elseif a_keyword_current then
            if skip2(':', '=') or else skip3(':', ':', '=') or else skip2('?', '=') then
               error_handler.add_position(pos(start_line, start_column))
               error_handler.append(once "Entity `Current' is not writable. Cannot use `Current' for the %
                                    %left-hand side of an assignment.")
               error_handler.print_as_fatal_error
            else
               Result := a_r10(True, create {WRITTEN_CURRENT}.make(pos(start_line, start_column)), Void, Void)
            end
         elseif a_keyword_result then
            Result := True
            sp := pos(start_line, start_column)
            if not inside_function_flag then
               error_handler.add_position(sp)
               error_handler.append(em14)
               error_handler.print_as_fatal_error
            end
            create {RESULT} writable.make(sp)
            if skip2(':', '=') then
               if a_expression then
                  create {ASSIGNMENT} last_instruction.make(writable, last_expression)
               else
                  error_handler.add_position(current_position)
                  error_handler.append(em2)
                  error_handler.print_as_fatal_error
               end
            elseif skip3(':', ':', '=') then
               if a_expression then
                  create {ASSIGNMENT_ATTEMPT} last_instruction.make(writable, last_expression, True)
               else
                  error_handler.add_position(current_position)
                  error_handler.append(em10)
                  error_handler.print_as_fatal_error
               end
            elseif skip2('?', '=') then
               if a_expression then
                  create {ASSIGNMENT_ATTEMPT} last_instruction.make(writable, last_expression, False)
               else
                  error_handler.add_position(current_position)
                  error_handler.append(em20)
                  error_handler.print_as_fatal_error
               end
            else
               Result := a_r10(True, writable, Void, Void)
            end
         elseif a_ordinary_feature_name_or_local_name then
            Result := True
            if a_local_name_ref then
               writable := last_expression
               if skip2(':', '=') then
                  if a_expression then
                     create {ASSIGNMENT} last_instruction.make(writable, last_expression)
                  else
                     error_handler.add_position(current_position)
                     error_handler.append(em2)
                     error_handler.print_as_fatal_error
                  end
               elseif skip3(':', ':', '=') then
                  if a_expression then
                     create {ASSIGNMENT_ATTEMPT} last_instruction.make(writable, last_expression, True)
                  else
                     error_handler.add_position(current_position)
                     error_handler.append(em10)
                     error_handler.print_as_fatal_error
                  end
               elseif skip2('?', '=') then
                  if a_expression then
                     create {ASSIGNMENT_ATTEMPT} last_instruction.make(writable, last_expression, False)
                  else
                     error_handler.add_position(current_position)
                     error_handler.append(em20)
                     error_handler.print_as_fatal_error
                  end
               else
                  Result := a_r10(True, writable, Void, Void)
               end
            elseif a_argument then
               Result := a_r10(True, last_expression, Void, Void)
            else
               writable := token_buffer.to_writable_attribute_name
               if skip2(':', '=') then
                  if a_expression then
                     create {ASSIGNMENT} last_instruction.make(writable, last_expression)
                  else
                     error_handler.add_position(current_position)
                     error_handler.append(em2)
                     error_handler.print_as_fatal_error
                  end
               elseif skip3(':', ':', '=') then
                  if a_expression then
                     create {ASSIGNMENT_ATTEMPT} last_instruction.make(writable, last_expression, True)
                  else
                     error_handler.add_position(current_position)
                     error_handler.append(em10)
                     error_handler.print_as_fatal_error
                  end
               elseif skip2('?', '=') then
                  if a_expression then
                     create {ASSIGNMENT_ATTEMPT} last_instruction.make(writable, last_expression, False)
                  else
                     error_handler.add_position(current_position)
                     error_handler.append(em20)
                     error_handler.print_as_fatal_error
                  end
               else
                  Result := a_procedure_call
               end
            end
         elseif a_manifest_or_type_test(Instruction_syntax_flag) then
            Result := True
         end

         if not Result then
            go_back_at(l, c)
         end
      ensure
         Result implies last_instruction /= Void
      end

   a_assignment_call_assigner (do_expression: BOOLEAN): BOOLEAN
      local
         pc: PROCEDURE_CALL; fc: FUNCTION_CALL
         l, c: INTEGER
      do
         c := column
         l := line

         if do_expression then
            if a_expression then
               fc ?= last_expression
               if fc /= Void then
                  echo.put_line(once "**** Found potentially assignable expression")
               end
            end
         else
            pc ?= last_instruction
         end

         if skip2(':', '=') then
            if pc /= Void then
               check
                  not do_expression
                  fc = Void
               end
               if pc.arguments = Void then
                  create {FUNCTION_CALL_0} fc.make(pc.target, pc.feature_name)
               elseif pc.arguments.count = 1 then
                  create {FUNCTION_CALL_1} fc.make(pc.target, pc.feature_name, pc.arguments)
               else
                  create {FUNCTION_CALL_N} fc.make(pc.target, pc.feature_name, pc.arguments)
               end
            end
            if fc = Void then
               if not do_expression then
                  error_handler.add_position(last_instruction.start_position)
                  error_handler.append(once "Left hand side expression of := assignment must be a feature call.")
                  error_handler.print_as_fatal_error
               end
            elseif a_expression then
               fc.set_assigned_to
               create {ASSIGNMENT_CALL_ASSIGNER} last_instruction.make(fc, last_expression)
               Result := True
            else
               error_handler.add_position(current_position)
               error_handler.append(em2)
               error_handler.print_as_fatal_error
            end
         end

         if not Result then
            go_back_at(l, c)
         end
      end

   a_assertion_buffer: FAST_ARRAY[ASSERTION]
         -- Used only inside `a_assertion'.
      once
         create Result.with_capacity(32)
      end

   a_assertion: FAST_ARRAY[ASSERTION]
         --  ++ assertion -> {assertion_clause ";" ...}
         --  ++ assertion_clause -> [identifier ":"] [expression] [comment]
         --  ++
      local
         tag: like last_tag_mark; expression: like last_expression; assertion: ASSERTION; state: INTEGER
      do
         from
            a_assertion_buffer.clear_count
         until
            state > 3
         loop
            inspect
               state
            when 0 then
               -- Nothing read.
               if cc = ';' then
                  error_handler.add_position(current_position)
                  error_handler.append(em24)
                  error_handler.print_as_style_warning
                  ok := skip1(';')
               elseif last_comment /= Void then
                  create assertion.make(Void, Void, get_comment)
                  a_assertion_buffer.add_last(assertion)
               elseif a_tag_mark then
                  tag := last_tag_mark
                  state := 1
               elseif a_expression then
                  expression := last_expression
                  state := 2
               else
                  state := 4
               end
            when 1 then
               -- Read a `tag'.
               if skip1(';') then
                  create assertion.make(tag, Void, get_comment)
                  a_assertion_buffer.add_last(assertion)
                  state := 0
               elseif a_tag_mark then
                  create assertion.make(tag, Void, get_comment)
                  a_assertion_buffer.add_last(assertion)
                  tag := last_tag_mark
               elseif a_expression then
                  expression := last_expression
                  state := 3
               else
                  create assertion.make(tag, Void, get_comment)
                  a_assertion_buffer.add_last(assertion)
                  state := 4
               end
            when 2 then
               -- Read an `expression'.
               if skip1(';') then
                  create assertion.make(Void, expression, get_comment)
                  a_assertion_buffer.add_last(assertion)
                  state := 0
               elseif a_tag_mark then
                  create assertion.make(Void, expression, get_comment)
                  a_assertion_buffer.add_last(assertion)
                  tag := last_tag_mark
                  state := 1
               elseif a_expression then
                  create assertion.make(Void, expression, get_comment)
                  a_assertion_buffer.add_last(assertion)
                  expression := last_expression
                  state := 2
               else
                  create assertion.make(Void, expression, get_comment)
                  a_assertion_buffer.add_last(assertion)
                  state := 4
               end
            else
               -- Read a `tag' and an `expression'.
               if skip1(';') then
                  create assertion.make(tag, expression, get_comment)
                  a_assertion_buffer.add_last(assertion)
                  state := 0
               elseif a_tag_mark then
                  create assertion.make(tag, expression, get_comment)
                  a_assertion_buffer.add_last(assertion)
                  tag := last_tag_mark
                  state := 1
               elseif a_expression then
                  create assertion.make(tag, expression, get_comment)
                  a_assertion_buffer.add_last(assertion)
                  expression := last_expression
                  state := 2
               else
                  create assertion.make(tag, expression, get_comment)
                  a_assertion_buffer.add_last(assertion)
                  state := 4
               end
            end
         end
         if not a_assertion_buffer.is_empty then
            Result := a_assertion_buffer.twin
         end
      end

feature {EXTERNAL_PROCEDURE, FEATURE_CALL}
   brackets_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_brackets)
      end

   parentheses_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_parentheses)
      end

   le_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_le)
      end

   ge_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_ge)
      end

   slash_slash_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_slash_slash)
      end

   backslash_backslash_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_backslash_backslash)
      end

   muls_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_muls)
      end

   slash_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_slash)
      end

   gt_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_gt)
      end

   lt_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_lt)
      end

   pow_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_pow)
      end

   xor_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_xor)
      end

   implies_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_implies)
      end

   and_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_and)
      end

   or_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_or)
      end

   sharp_plus_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_sharp_plus)
      end

   sharp_minus_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_sharp_minus)
      end

   sharp_muls_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_sharp_muls)
      end

   plus_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_plus)
      end

   minus_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_minus)
      end

   not_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_not)
      end

feature {}
   update_last_manifest_string (p: POSITION; once_flag, unicode_flag: BOOLEAN; string, source_view: STRING)
      do
         create last_manifest_string.make(p, once_flag, unicode_flag, string)
         last_manifest_string.set_source_view(source_view)
      end

   may_expand_var
      do
         buffer.extend('$')
      end

   a_binary (sp: POSITION): BOOLEAN
         --  ++ binary -> "<=" | ">=" | "//" | "\\" |
         --  ++           "+" | "-" | "*" | "/" | "<" | ">" | "^" |
         --  ++           xor" | "implies" | "and then" | "and" |
         --  ++           "or else" | "or" | "#+" | "#-" | "#*"
         --  ++
      do
         Result := True
         if skip2('<', '=') then
            create last_feature_name.infix_name(le_name, sp)
         elseif skip2('>', '=') then
            create last_feature_name.infix_name(ge_name, sp)
         elseif skip2('/', '/') then
            create last_feature_name.infix_name(slash_slash_name, sp)
         elseif skip2('\', '\') then
            create last_feature_name.infix_name(backslash_backslash_name, sp)
         elseif skip1('+') then
            create last_feature_name.infix_name(plus_name, sp)
         elseif skip1('-') then
            create last_feature_name.infix_name(minus_name, sp)
         elseif skip1('*') then
            create last_feature_name.infix_name(muls_name, sp)
         elseif skip1('/') then
            create last_feature_name.infix_name(slash_name, sp)
         elseif skip1('>') then
            create last_feature_name.infix_name(gt_name, sp)
         elseif skip1('<') then
            create last_feature_name.infix_name(lt_name, sp)
         elseif skip1('^') then
            create last_feature_name.infix_name(pow_name, sp)
         elseif a_keyword(as_xor) then
            create last_feature_name.infix_name(xor_name, sp)
         elseif a_keyword(as_implies) then
            create last_feature_name.infix_name(implies_name, sp)
         elseif a_keyword(as_and) then
            if a_keyword(fz_then) then
               create last_feature_name.infix_name(and_then_name, sp)
            else
               create last_feature_name.infix_name(and_name, sp)
            end
         elseif a_keyword(as_or) then
            if a_keyword(fz_else) then
               create last_feature_name.infix_name(or_else_name, sp)
            else
               create last_feature_name.infix_name(or_name, sp)
            end
         elseif skip2('#', '+') then
            create last_feature_name.infix_name(sharp_plus_name, sp)
         elseif skip2('#', '-') then
            create last_feature_name.infix_name(sharp_minus_name, sp)
         elseif skip2('#', '*') then
            create last_feature_name.infix_name(sharp_muls_name, sp)
         else
            last_feature_name := Void
            Result := False
         end
      end

   a_boolean_constant: BOOLEAN
         --  ++ boolean_constant -> "True" | "False"
         --  ++
      do
         if a_keyword_true then
            create {E_TRUE} last_expression.make(pos(start_line, start_column))
            Result := True
         elseif a_keyword_false then
            create {E_FALSE} last_expression.make(pos(start_line, start_column))
            Result := True
         end
      end

   a_check: BOOLEAN
         --  ++ check -> "check" assertion [indexing] "end"
         --  ++
      local
         sp: POSITION; hc: COMMENT; al: FAST_ARRAY[ASSERTION]; chk: CHECK_COMPOUND
      do
         if a_keyword(fz_check) then
            sp := pos(start_line, start_column)
            hc := get_comment
            al := a_assertion
            if hc /= Void or else al /= Void then
               create chk.make(sp, hc, al)
               last_instruction := chk
               Result := True
            end
            a_indexing(chk, Void)
            if not a_keyword(fz_end) then
               error_handler.add_position(sp)
               error_handler.add_position(current_position)
               error_handler.append(once "Keyword %"end%" expected at the end of check clause.")
               error_handler.print_as_fatal_error
            elseif skip1(';') then
            end
         end
      end

   a_class_declaration
         --  ++ class_declaration -> [indexing]
         --  ++                      ["expanded" | "deferred" | "separate"]
         --  ++                      "class" class_text_name
         --  ++                      ["[" formal_generic_list "]"]
         --  ++                      [comment]
         --  ++                      ["obsolete" manifest_string]
         --  ++                      ["inherit" inherit_text]
         --  ++                      ["insert" inherit_text]
         --  ++                      {{"creation"|"create"} creation_clause ...}
         --  ++                      ["convert" convert_clause]
         --  ++                      {"feature" feature_clause ...}
         --  ++                      ["invariant" assertion]
         --  ++                      [indexing]
         --  ++                      "end"
         --  ++
      local
         sp: POSITION; hc: COMMENT; al: FAST_ARRAY[ASSERTION]; prefixword: BOOLEAN
         feature_clause: FEATURE_CLAUSE
      do
         check
            closure_arguments /= Void implies closure_arguments.is_empty
            closure_local_vars /= Void implies closure_local_vars.is_empty
         end
         inline_agents.clear_count
         a_indexing(last_class_text, once "top")
         from
            prefixword := True
         until
            not prefixword
         loop
            if a_keyword(fz_deferred) then
               last_class_text.set_is_deferred
            elseif a_keyword(fz_expanded) then
               last_class_text.set_is_expanded
            elseif a_keyword(fz_separate) then
               error_handler.add_position(pos(start_line, start_column))
               error_handler.append(once "Compiler limitation: separate classes are not supported. SCOOP attempt %
               %implementation currently abandoned (December 2006).")
               error_handler.print_as_fatal_error
            else
               prefixword := False
            end
         end
         last_class_text.set_heading_comment1(get_comment)
         if not a_keyword(fz_class) then
            error_handler.add_position(current_position)
            error_handler.append(once "Keyword %"class%" expected.")
            error_handler.print_as_fatal_error
         end
         a_base_class_name_def
         a_formal_generic_list
         last_class_text.finish_create
         if a_keyword(fz_obsolete) then
            if a_manifest_string(True) then
               last_manifest_string.set_once_flag(True)
               last_class_text.set_obsolete_mark(last_manifest_string)
            else
               error_handler.add_position(current_position)
               error_handler.append(once "Manifest string expected for %"obsolete%" clause.")
               error_handler.print_as_fatal_error
            end
         end
         last_class_text.set_heading_comment2(get_comment)
         a_parent_list
         from
         until
            not a_creation_keyword
         loop
            last_class_text.add_creation_clause(a_creation_clause(pos(start_line, start_column), True))
         end
         if a_keyword(fz_convert) then
            a_convert_clause(pos(start_line, start_column))
         end
         from
         until
            not a_keyword(fz_feature)
         loop
            a_feature_clause
         end
         if a_keyword(fz_invariant) then
            sp := pos(start_line, start_column)
            inside_class_invariant_flag := True
            hc := get_comment
            al := a_assertion
            last_class_text.set_invariant(sp, hc, al)
            inside_class_invariant_flag := False
         end
         a_indexing(last_class_text, once "bottom")
         if a_keyword(fz_end) then
            ok := skip1(';')
            last_class_text.set_end_comment(get_comment)
            if tuple_flag then
               last_class_text.initialize_and_check_level_1
               if cc /= end_of_text then
                  -- Recursively load following TUPLE definitions:
                  last_class_text := last_class_text.next_tuple
                  current_id := last_class_text.id
                  a_class_declaration
               end
            elseif cc /= end_of_text then
               error_handler.add_position(current_position)
               error_handler.append(once "End of text expected.")
               error_handler.print_as_fatal_error
            end
         elseif a_non_allowed_very_strange_identifier then
            error_handler.print_as_fatal_error
         else
            error_handler.add_position(current_position)
            error_handler.append(once "Keyword %"end%" expected at the end of a class.")
            error_handler.print_as_fatal_error
         end
         if not inline_agents.is_empty then
            create feature_clause.make(last_class_text, create {CLIENT_LIST}.make(current_position, Void), Void, inline_agents.twin)
            last_class_text.add_feature_clause(feature_clause)
         end

         if closure_arguments /= Void then
            check
               closure_local_vars /= Void
            end
            closure_arguments.clear_count
            closure_local_vars.clear_count
         end
      end

   a_static_type_mark (for_client_list: BOOLEAN): BOOLEAN
         --  ++ base_type_mark -> "ANY" | ARRAY "[" type_mark "]" | "BOOLEAN" |
         --  ++         "CHARACTER" | "DOUBLE" | "INTEGER" |
         --  ++         "POINTER" | "REAL" | "STRING" | "TUPLE" |
         --  ++         "ROUTINE" | "PROCEDURE" | "FUNCTION" | "PREDICATE"
         --  ++
         --  ++ static_type_mark -> base_type_mark |
         --  ++               class_text_name ["[" {type_mark "," ...} "]"]
         --  ++
      local
         state: INTEGER; class_text_name: CLASS_NAME; generic_list: ARRAY[TYPE_MARK]
         sp: POSITION; types: ARRAY[TYPE_MARK]; tm, base_type_mark, open_type_mark, result_type_mark: TYPE_MARK
      do
         if a_class_name then
            Result := True
            inspect
               token_buffer.buffer
            when "ARRAY" then
               sp := token_buffer.start_position
               if skip1('[') and then a_type_mark(False) and then skip1(']') then
                  check
                     last_type_mark /= Void
                  end
                  create {ARRAY_TYPE_MARK} last_type_mark.make(sp, last_type_mark)
               elseif not for_client_list then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Bad use of predefined type ARRAY.")
                  error_handler.print_as_fatal_error
               end
            when "NATIVE_ARRAY" then
               sp := token_buffer.start_position
               if skip1('[') and then a_type_mark(False) and then skip1(']') then
                  check
                     last_type_mark /= Void
                  end
                  create {NATIVE_ARRAY_TYPE_MARK} last_type_mark.make(sp, last_type_mark)
               elseif not for_client_list then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Bad use of predefined type NATIVE_ARRAY.")
                  error_handler.print_as_fatal_error
               end
            when "WEAK_REFERENCE" then
               sp := token_buffer.start_position
               if skip1('[') and then a_type_mark(False) and then skip1(']') then
                  check
                     last_type_mark /= Void
                  end
                  create {WEAK_REFERENCE_TYPE_MARK} last_type_mark.make(sp, last_type_mark)
               elseif not for_client_list then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Bad use of predefined type NATIVE_ARRAY.")
                  error_handler.print_as_fatal_error
               end
            when "NONE" then
               error_handler.add_position(token_buffer.start_position)
               error_handler.append(once "Since february 2006, for SmartEiffel release 2.3, the old legacy NONE type mark is %
                                    %obsolete. Keep in mind that an empty class name list like {} do indicate no %
                                    %exportation at all, hence making NONE unuseful and probably misleading for %
                                    %newcomers. So, just remove this NONE class name right now. Please update your code now.")
               error_handler.print_as_warning
               create {CLASS_TYPE_MARK} last_type_mark.make(token_buffer.to_class_name(for_client_list))
            when "DOUBLE" then
               error_handler.add_position(token_buffer.start_position)
               error_handler.append(once "No more DOUBLE type mark (update your code). This DOUBLE type %
               %mark is automatically replaced with REAL which is actually equivalent to REAL_64. %
               %Also consider to use REAL_32 or REAL_80 when you prefer. Also consider command pretty %
               %to replace automatically all DOUBLE with REAL.")
               error_handler.print_as_warning
               create {REAL_TYPE_MARK} last_type_mark.real(token_buffer.start_position)
            when "BIT" then
               error_handler.add_position(token_buffer.start_position)
               error_handler.append(once "No more class BIT since release 2.1. Just use bit operations from %
               % INTEGER_8, INTEGER_16, INTEGER_32, INTEGER or INTEGER_64.")
               error_handler.print_as_fatal_error
            when "TUPLE" then
               sp := token_buffer.start_position
               if skip1('[') then
                  from
                     create types.with_capacity(4, 1)
                  until
                     skip1(']')
                  loop
                     if a_type_mark(False) then
                        types.add_last(last_type_mark)
                        if not skip1(',') then
                           if cc /= ']' then
                              error_handler.add_position(current_position)
                              error_handler.append(em5)
                              error_handler.print_as_warning
                           end
                        end
                     else
                        error_handler.add_position(current_position)
                        error_handler.append(once "Incorrect TUPLE (type expected).")
                        error_handler.print_as_fatal_error
                     end
                  end
                  create {NON_EMPTY_TUPLE_TYPE_MARK} last_type_mark.make(sp, types)
               else
                  create {EMPTY_TUPLE_TYPE_MARK} last_type_mark.make(sp)
               end
            when "ROUTINE" then
               sp := token_buffer.start_position
               if not skip1('[') then
                  error_handler.add_position(current_position)
                  error_handler.append(em30)
                  error_handler.print_as_fatal_error
               end
               if not a_type_mark(False) then
                  error_handler.add_position(current_position)
                  error_handler.append(em32)
                  error_handler.print_as_fatal_error
               end
               base_type_mark := last_type_mark
               open_type_mark := last_type_mark
               ok := skip1(',')
               if a_type_mark(False) then
                  -- Old style with unused base:
                  open_type_mark := last_type_mark
                  error_handler.add_position(base_type_mark.start_position)
                  error_handler.append(once "The base type is no longer used. Class ROUTINE now has only one %
                  %formal argument. Just remove this unused type mark.")
                  error_handler.print_as_warning
               end
               if not skip1(']') then
                  error_handler.add_position(current_position)
                  error_handler.append(em31)
                  error_handler.print_as_fatal_error
               end
               create {AGENT_TYPE_MARK} last_type_mark.routine(sp, open_type_mark)
            when "PROCEDURE" then
               sp := token_buffer.start_position
               if not skip1('[') then
                  error_handler.add_position(current_position)
                  error_handler.append(em30)
                  error_handler.print_as_fatal_error
               end
               if not a_type_mark(False) then
                  error_handler.add_position(current_position)
                  error_handler.append(em32)
                  error_handler.print_as_fatal_error
               end
               base_type_mark := last_type_mark
               open_type_mark := last_type_mark
               ok := skip1(',')
               if a_type_mark(False) then
                  -- Old style with unused base:
                  open_type_mark := last_type_mark
                  error_handler.add_position(base_type_mark.start_position)
                  error_handler.append(once "The base type is no longer used. Class PROCEDURE now has only one %
                  %formal argument. Just remove this unused type mark.")
                  error_handler.print_as_warning
               end
               if not skip1(']') then
                  error_handler.add_position(current_position)
                  error_handler.append(em31)
                  error_handler.print_as_fatal_error
               end
               create {AGENT_TYPE_MARK} last_type_mark.procedure(sp, open_type_mark)
            when "PREDICATE" then
               sp := token_buffer.start_position
               if not skip1('[') then
                  error_handler.add_position(current_position)
                  error_handler.append(em30)
                  error_handler.print_as_fatal_error
               end
               if not a_type_mark(False) then
                  error_handler.add_position(current_position)
                  error_handler.append(em32)
                  error_handler.print_as_fatal_error
               end
               base_type_mark := last_type_mark
               open_type_mark := last_type_mark
               ok := skip1(',')
               if a_type_mark(False) then
                  -- Old style with unused base:
                  open_type_mark := last_type_mark
                  error_handler.add_position(base_type_mark.start_position)
                  error_handler.append(once "The base type is no longer used. Class ROUTINE now has only one %
                  %formal argument. Just remove this unused type mark.")
                  error_handler.print_as_warning
               end
               if not skip1(']') then
                  error_handler.add_position(current_position)
                  error_handler.append(em31)
                  error_handler.print_as_fatal_error
               end
               create {AGENT_TYPE_MARK} last_type_mark.predicate(sp, open_type_mark)
            when "FUNCTION" then
               sp := token_buffer.start_position
               if not skip1('[') then
                  error_handler.add_position(current_position)
                  error_handler.append(em30)
                  error_handler.print_as_fatal_error
               end
               if not a_type_mark(False) then
                  error_handler.add_position(current_position)
                  error_handler.append(em32)
                  error_handler.print_as_fatal_error
               end
               base_type_mark := last_type_mark
               open_type_mark := last_type_mark
               if not skip1(',') then
                  error_handler.add_position(current_position)
                  error_handler.append(em5)
                  error_handler.print_as_warning
               end
               if not a_type_mark(False) then
                  error_handler.add_position(current_position)
                  error_handler.append(em32)
                  error_handler.print_as_fatal_error
               end
               result_type_mark := last_type_mark
               ok := skip1(',')
               if a_type_mark(False) then
                  -- Old style with unused base:
                  open_type_mark := result_type_mark
                  result_type_mark := last_type_mark
                  error_handler.add_position(base_type_mark.start_position)
                  error_handler.append(once "The base type is no longer used. Class FUNCTION now has only two %
                  %formal generic arguments. Just remove this unused type mark.")
                  error_handler.print_as_warning
               end
               if not skip1(']') then
                  error_handler.add_position(current_position)
                  error_handler.append(em31)
                  error_handler.print_as_fatal_error
               end
               create {AGENT_TYPE_MARK} last_type_mark.function(sp, open_type_mark, result_type_mark)
            else
               tm := predefined_type_mark(token_buffer.buffer, token_buffer.start_position)
               if tm /= Void then
                  last_type_mark := tm
               else
                  from
                     class_text_name := token_buffer.to_class_name(for_client_list)
                  until
                     state > 2
                  loop
                     inspect
                        state
                     when 0 then
                        -- `class_text_name' read.
                        if skip1('[') then
                           state := 1
                        else
                           create {CLASS_TYPE_MARK} last_type_mark.make(class_text_name)
                           state := 3
                        end
                     when 1 then
                        -- Waiting next generic argument.
                        if a_type_mark(False) then
                           if generic_list = Void then
                              create generic_list.with_capacity(2, 1)
                           end
                           generic_list.add_last(last_type_mark)
                           state := 2
                        elseif cc = ',' then
                           error_handler.add_position(current_position)
                           error_handler.append(em12)
                           error_handler.print_as_style_warning
                           ok := skip1(',')
                        elseif cc = ']' then
                           state := 2
                        else
                           error_handler.add_position(current_position)
                           error_handler.append(em16)
                           error_handler.print_as_fatal_error
                           state := 2
                        end
                     when 2 then
                        -- Waiting ',' or ']'.
                        if skip1(',') then
                           state := 1
                        elseif cc = ']' then
                           if generic_list = Void then
                              error_handler.add_position(current_position)
                              error_handler.append(once "Empty generic list (deleted).")
                              error_handler.print_as_style_warning
                              create {CLASS_TYPE_MARK} last_type_mark.make(class_text_name)
                           else
                              create {USER_GENERIC_TYPE_MARK} last_type_mark.make(class_text_name, generic_list)
                           end
                           ok := skip1(']')
                           state := 3
                        elseif a_type_mark(False) then
                           if generic_list = Void then
                              create generic_list.with_capacity(2, 1)
                           end
                           generic_list.add_last(last_type_mark)
                           error_handler.add_position(last_type_mark.start_position)
                           error_handler.append(em5)
                           error_handler.print_as_warning
                        else
                           error_handler.add_position(current_position)
                           error_handler.append(once "Bad generic list. Expected ',' or ']', but found '")
                           error_handler.extend(cc)
                           error_handler.append(once "' instead.")
                           error_handler.print_as_fatal_error
                        end
                     end
                  end
               end
            end
         end
      end

   a_type_mark_inside_client_list: BOOLEAN
      local
         fn: FEATURE_NAME; ctm: CLASS_TYPE_MARK
      do
         if a_type_mark(True) then
            if last_type_mark.is_anchored then
               error_handler.add_position(token_buffer.start_position)
               error_handler.append(once "An anchored type cannot be used to indicate exportation status in a client list.")
               error_handler.print_as_fatal_error
            end
            if last_type_mark.written_mark.is_equal(once "NONE") then
               error_handler.add_position(token_buffer.start_position)
               error_handler.append(once "Since february 2006, for SmartEiffel release 2.3, the old legacy %
                                         %NONE type mark is obsolete. Keep in mind that an empty class name list %
                                         %such as {} does indicate no exportation at all, hence making NONE useless %
                                         %and probably misleading for newcomers. So, just remove this NONE class %
                                         %name now. Please update your code now.")
               error_handler.print_as_warning
            else
               if ctm ?:= last_type_mark then
                  ctm ::= last_type_mark
                  create {CLIENT_TYPE_MARK} last_type_mark.make(ctm)
               end
               Result := True
            end
         elseif a_ordinary_feature_name_or_local_name then
            fn := token_buffer.to_feature_name
            error_handler.add_position(fn.start_position)
            error_handler.append(once "A feature name cannot be used to indicate exportation status in a client list. %
                                      %Only plain class names are allowed here (class names must use only uppercase letters).")
            error_handler.print_as_fatal_error
         elseif cc.is_letter or else cc.is_digit then
            error_handler.add_position(current_position)
            error_handler.append(once "Inside a client list, only plain class names are allowed. %
                                      %(Class names must use only uppercase letters.)")
            error_handler.print_as_fatal_error

         end
      end

   a_conversion_list
         --  ++ conversion_list -> type_mark_list
         --  ++
      local
         list: TYPE_MARK_LIST; sp: POSITION
      do
         if skip1('{') then
            sp := pos(start_line, start_column)
            list := a_type_mark_list
         else
            sp := current_position
         end
         if list = Void then
            error_handler.add_position(sp)
            error_handler.append(once "Expected a non-empty types list.")
            error_handler.print_as_fatal_error
         end
         --create Result.make(sp, list)
      end

   a_clients: CLIENT_LIST
         --  ++ clients -> type_mark_list
         --  ++
      local
         list: TYPE_MARK_LIST; sp: POSITION
      do
         if skip1('{') then
            sp := pos(start_line, start_column)
            list := a_type_mark_list
            create Result.make(sp, list)
         else
            error_handler.add_position(current_position)
            error_handler.append(once "A missing client list is interpreted as {ANY}. It is better to be explicit.")
            error_handler.print_as_warning
            Result := omitted_client_list
         end
      ensure
         Result /= Void
      end

   a_type_mark_list: TYPE_MARK_LIST
         --  ++ type_mark_list -> "{" { class_text_name "," ... } "}"
         --  ++
      local
         state: INTEGER
      do
         from
         until
            state > 3
         loop
            inspect
               state
            when 0 then
               -- Waiting a class_text_name or "}" if empty list.
               if a_type_mark_inside_client_list then
                  create Result.make_1(last_type_mark)
                  state := 2
               elseif skip1('}') then
                  state := 4
               elseif cc = ',' then
                  error_handler.add_position(current_position)
                  error_handler.append(em12)
                  error_handler.print_as_style_warning
                  ok := skip1(',')
               else
                  state := 3
               end
            when 1 then
               -- Waiting a class_text_name after a ",".
               if a_type_mark_inside_client_list then
                  Result.add_last(last_type_mark)
                  state := 2
               elseif cc = ',' then
                  error_handler.add_position(current_position)
                  error_handler.append(em12)
                  error_handler.print_as_style_warning
                  ok := skip1(',')
               elseif cc = '}' then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Unexpected bracket after a comma.")
                  error_handler.print_as_style_warning
                  ok := skip1('}')
                  state := 4
               else
                  state := 3
               end
            when 2 then
               -- Waiting "," or "}" to end list.
               if skip1(',') then
                  state := 1
               elseif skip1('}') then
                  state := 4
               elseif a_type_mark_inside_client_list then
                  error_handler.add_position(last_type_mark.start_position)
                  error_handler.append(em5)
                  error_handler.print_as_warning
                  Result.add_last(last_type_mark)
               else
                  state := 3
               end
            when 3 then
               -- Error.
               error_handler.add_position(current_position)
               error_handler.append(em11)
               error_handler.print_as_fatal_error
               state := 4
            end
         end
      end

   a_compound1: INSTRUCTION
         --  ++ compound -> {instruction ";" ...}
         --  ++
      local
         compound: COMPOUND; i2, i3, i4, i5: INSTRUCTION
      do
         if a_instruction then
            Result := last_instruction
            ok := skip1(';')
            if a_instruction then
               i2 := last_instruction
               ok := skip1(';')
               if a_instruction then
                  i3 := last_instruction
                  ok := skip1(';')
                  if a_instruction then
                     i4 := last_instruction
                     ok := skip1(';')
                     if a_instruction then
                        i5 := last_instruction
                        ok := skip1(';')
                        create compound.make_n(Result, i2, i3, i4, i5)
                        Result := compound
                        from
                        until
                           not a_instruction
                        loop
                           compound.add_last(last_instruction)
                           ok := skip1(';')
                        end
                     else
                        create {COMPOUND} Result.make_4(Result, i2, i3, i4)
                     end
                  else
                     create {COMPOUND} Result.make_3(Result, i2, i3)
                  end
               else
                  create {COMPOUND} Result.make_2(Result, i2)
               end
            end
         end
      ensure
         cc /= ';'
      end

   a_compound2 (compound_of, terminator: STRING): INSTRUCTION
         -- Call `a_compound1' and then enforce the `terminator' at the end.
      do
         Result := a_compound1
         if not a_keyword(terminator) then
            error_handler.append(once "In compound (")
            error_handler.append(compound_of)
            error_handler.append(once "). Instruction or keyword %"")
            error_handler.append(terminator)
            error_handler.add_position(current_position)
            error_handler.append(once "%" expected.")
            error_handler.print_as_fatal_error
         end
      end

   a_exp2 (compound_of, terminator: STRING): EXPRESSION
         -- Call `a_expression' and then enforce the `terminator' at the end.
      do
         if a_expression then
            Result := last_expression
         else
            error_handler.append(once "Expression expected (")
            error_handler.append(compound_of)
            error_handler.append(once ").")
            error_handler.print_as_fatal_error
         end
         if not a_keyword(terminator) then
            error_handler.append(once "After expression (")
            error_handler.append(compound_of)
            error_handler.append(once "). Keyword %"")
            error_handler.append(terminator)
            error_handler.add_position(current_position)
            error_handler.append(once "%" expected.")
            error_handler.print_as_fatal_error
         end
      ensure
         Result /= Void
      end

   a_conditional_exp: BOOLEAN
         --  ++ conditional_exp -> "if" expression "then" expression
         --  ++                    [ {"elseif" expression "then" expression ...}+ ]
         --  ++                    [ "else" expression ]
         --  ++                    "end"
         --  ++
      local
         expression1, expression2: EXPRESSION; then_part1: EXPRESSION; ifthenelse: IFTHENELSE_EXP
         ifthen: IFTHEN_EXP; sp1, sp2: POSITION; else_part: EXPRESSION
      do
         if a_keyword(fz_if) then
            Result := True
            sp1 := pos(start_line, start_column)
            if not a_expression then
               error_handler.add_position(sp1)
               error_handler.add_position(current_position)
               error_handler.append(once "Expression expected after the %"if%" keyword.")
               error_handler.print_as_fatal_error
            end
            expression1 := last_expression
            if expression1.is_void then
               error_handler.add_position(expression1.start_position)
               error_handler.append(once "Void is not a valid BOOLEAN expression (just after keyword %"if%").")
               error_handler.print_as_fatal_error
            end
            then_part1 := a_then_exp
            if a_keyword(fz_elseif) then
               from
                  sp2 := pos(start_line, start_column)
                  if not a_expression then
                     error_handler.add_position(sp2)
                     error_handler.add_position(current_position)
                     error_handler.append(once "Expression expected after %"elseif%" keyword.")
                     error_handler.print_as_fatal_error
                  end
                  expression2 := last_expression
                  no_void_after_elseif_check(expression2)
                  create ifthen.make(sp2, expression2, a_then_exp)
                  create ifthenelse.with_elseif(sp1, expression1, then_part1, ifthen)
               until
                  not a_keyword(fz_elseif)
               loop
                  sp2 := pos(start_line, start_column)
                  if not a_expression then
                     error_handler.add_position(sp2)
                     error_handler.add_position(current_position)
                     error_handler.append(once "Expression expected after the %"elseif%" keyword.")
                     error_handler.print_as_fatal_error
                  end
                  expression2 := last_expression
                  no_void_after_elseif_check(expression2)
                  ifthenelse.add_elseif(create {IFTHEN_EXP}.make(sp2, expression2, a_then_exp))
               end
               if a_keyword(fz_else) then
                  else_part := a_exp2(once "else part", fz_end)
                  if else_part /= Void then
                     ifthenelse.set_else(else_part)
                  end
               else
                  error_handler.add_position(sp1)
                  error_handler.add_position(current_position)
                  error_handler.append("An if-then-else expression must have an 'else' part.")
                  error_handler.print_as_fatal_error
               end
               last_expression := ifthenelse
            elseif a_keyword(fz_else) then
               else_part := a_exp2(once "else part", fz_end)
               create {IFTHENELSE_EXP} last_expression.with_else(sp1, expression1, then_part1, else_part)
            else
               error_handler.add_position(sp1)
               error_handler.add_position(current_position)
               error_handler.append("An if-then-else expression must have an 'else' part.")
               error_handler.print_as_fatal_error
            end
         end
      end

   a_conditional: BOOLEAN
         --  ++ conditional -> "if" expression "then" compound
         --  ++                [ {"elseif" expression "then" compound ...}+ ]
         --  ++                [ "else" compound ]
         --  ++                "end"
         --  ++
      local
         expression1, expression2: EXPRESSION; then_part1: INSTRUCTION; ifthenelse: IFTHENELSE
         ifthen: IFTHEN; sp1, sp2: POSITION; else_part: INSTRUCTION
      do
         if a_keyword(fz_if) then
            Result := True
            sp1 := pos(start_line, start_column)
            if not a_expression then
               error_handler.add_position(sp1)
               error_handler.add_position(current_position)
               error_handler.append(once "Expression expected after the %"if%" keyword.")
               error_handler.print_as_fatal_error
            end
            expression1 := last_expression
            if expression1.is_void then
               error_handler.add_position(expression1.start_position)
               error_handler.append(once "Void is not a valid BOOLEAN expression (just after keyword %"if%").")
               error_handler.print_as_fatal_error
            end
            then_part1 := a_then_compound
            if a_keyword(fz_elseif) then
               from
                  sp2 := pos(start_line, start_column)
                  if not a_expression then
                     error_handler.add_position(sp2)
                     error_handler.add_position(current_position)
                     error_handler.append(once "Expression expected after %"elseif%" keyword.")
                     error_handler.print_as_fatal_error
                  end
                  expression2 := last_expression
                  no_void_after_elseif_check(expression2)
                  create ifthen.make(sp2, expression2, a_then_compound)
                  create ifthenelse.with_elseif(sp1, expression1, then_part1, ifthen)
               until
                  not a_keyword(fz_elseif)
               loop
                  sp2 := pos(start_line, start_column)
                  if not a_expression then
                     error_handler.add_position(sp2)
                     error_handler.add_position(current_position)
                     error_handler.append(once "Expression expected after the %"elseif%" keyword.")
                     error_handler.print_as_fatal_error
                  end
                  expression2 := last_expression
                  no_void_after_elseif_check(expression2)
                  ifthenelse.add_elseif(create {IFTHEN}.make(sp2, expression2, a_then_compound))
               end
               if a_keyword(fz_else) then
                  else_part := a_compound2(once "else part", fz_end)
                  if else_part /= Void then
                     ifthenelse.set_else(else_part)
                  end
               elseif not a_keyword(fz_end) then
                  error_handler.add_position(sp1)
                  error_handler.add_position(current_position)
                  error_handler.append(once "Added missing %"end%" keyword to finish this %"if%" instruction.")
                  error_handler.print_as_warning
               end
               last_instruction := ifthenelse
            elseif a_keyword(fz_else) then
               else_part := a_compound2(once "else part", fz_end)
               if else_part = Void then
                  create {IFTHEN} last_instruction.make(sp1, expression1, then_part1)
               else
                  create {IFTHENELSE} last_instruction.with_else(sp1, expression1, then_part1, else_part)
               end
            else
               if not a_keyword(fz_end) then
                  error_handler.add_position(sp1)
                  error_handler.add_position(current_position)
                  error_handler.append(once "Added missing %"end%" keyword to finish this %"if%" instruction.")
                  error_handler.print_as_warning
               end
               create {IFTHEN} last_instruction.make(sp1, expression1, then_part1)
            end
         end
      end

   no_void_after_elseif_check (expression: EXPRESSION)
      do
         if expression.is_void then
            error_handler.add_position(expression.start_position)
            error_handler.append(once "Void is not a valid BOOLEAN expression (just after keyword %"elseif%").")
            error_handler.print_as_fatal_error
         end
      end

   a_then_compound: INSTRUCTION
         --  ++ then_compound -> "then" compound
      do
         if not a_keyword(fz_then) then
            error_handler.add_position(current_position)
            error_handler.append(once "Added missing %"then%" keyword.")
            error_handler.print_as_warning
         end
         Result := a_compound1
      end

   a_then_exp: EXPRESSION
         --  ++ then_exp -> "then" expression
      do
         if not a_keyword(fz_then) then
            error_handler.add_position(current_position)
            error_handler.append(once "Added missing %"then%" keyword.")
            error_handler.print_as_warning
         end
         if a_expression then
            Result := last_expression
         else
            error_handler.add_position(current_position)
            error_handler.append(once "Expected expression after the %"then%" keyword.")
            error_handler.print_as_fatal_error
         end
      end

   a_old_creation: BOOLEAN
         --  ++ old_creation -> "!"[type_mark]"!" writable
         --  ++                 ["." procedure_name [actuals]]
         --  ++
      local
         sp: POSITION; type: TYPE_MARK; writable: EXPRESSION; procedure_name: FEATURE_NAME; call: PROCEDURE_CALL
      do
         if skip1('!') then
            Result := True
            sp := pos(start_line, start_column)
            if a_type_mark(False) then
               type := last_type_mark
               anchored_creation_check(type)
               if not skip1('!') then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Bad creation instruction ('!' expected).")
                  error_handler.print_as_fatal_error
               end
            elseif skip1('!') then
            else
               error_handler.add_position(current_position)
               error_handler.append(once "Bad creation instruction (type or '!' expected).")
               error_handler.print_as_fatal_error
            end
            writable := mandatory_writable
            if skip1('.') then
               if a_ordinary_feature_name_or_local_name then
                  procedure_name := token_buffer.to_feature_name
                  if cc = '(' then
                     call := to_proc_call(writable, procedure_name, a_actuals)
                  else
                     create {PROCEDURE_CALL_0} call.make(writable, procedure_name)
                  end
               else
                  error_handler.add_position(current_position)
                  error_handler.append(em23)
                  error_handler.print_as_fatal_error
               end
            end
            error_handler.add_position(sp)
            error_handler.append(once "The !! notation is really old and ugly, it should not be used anymore. Please update your code and use the `create' keyword.")
            error_handler.print_as_warning
            create {CREATE_INSTRUCTION} last_instruction.make(sp, type, writable, call)
         end
      end

   a_c_inline_c: BOOLEAN
         --  ++ c_inline_c -> "c_inline_c" "(" manifest_string ")"
         --  ++
      local
         sp: POSITION; c_code: STRING; c_inline: C_INLINE
      do
         if a_keyword(as_c_inline_c) then
            Result := True
            sp := pos(start_line, start_column)
            if not skip1('(') then
               error_handler.add_position(current_position)
               error_handler.append(once "Missing '(' after `c_inline_c'.")
               error_handler.print_as_fatal_error
            end
            if not a_manifest_string(True) then
               error_handler.add_position(current_position)
               error_handler.append(once "Missing manifest STRING for `c_inline_c'.")
               error_handler.print_as_fatal_error
            end
            c_code := last_manifest_string.to_string
            if not skip1(')') then
               error_handler.add_position(current_position)
               error_handler.append(once "Missing ')' to end `c_inline_c' call.")
               error_handler.print_as_fatal_error
            end
            create c_inline.make_c_inline_c(sp, c_code)
            if smart_eiffel.short_or_class_check_flag or else smart_eiffel.pretty_flag then
               c_inline.set_source_view(last_manifest_string.source_view)
            end
            last_instruction := c_inline
         end
      end

   a_c_inline_h: BOOLEAN
         --  ++ c_inline_h -> "c_inline_h" "(" manifest_string ")"
         --  ++
      local
         sp: POSITION; c_code: STRING
      do
         if a_keyword(as_c_inline_h) then
            Result := True
            sp := pos(start_line, start_column)
            if not skip1('(') then
               error_handler.add_position(current_position)
               error_handler.append(once "Missing '(' after `c_inline_h'.")
               error_handler.print_as_fatal_error
            end
            if not a_manifest_string(True) then
               error_handler.add_position(current_position)
               error_handler.append(once "Missing manifest STRING for `c_inline_h'.")
               error_handler.print_as_fatal_error
            end
            c_code := last_manifest_string.to_string
            if not skip1(')') then
               error_handler.add_position(current_position)
               error_handler.append(once "Missing ')' to end `c_inline_h' call.")
               error_handler.print_as_fatal_error
            end
            create {C_INLINE} last_instruction.make_c_inline_h(sp, c_code)
         end
      end

   a_create_instruction: BOOLEAN
         --  ++ create_instruction -> "create" ["{" type "}"] writable
         --  ++                       ["." procedure_name [actuals]]
         --  ++
      local
         sp: POSITION; type: TYPE_MARK; writable: EXPRESSION; procedure_name: FEATURE_NAME; call: PROCEDURE_CALL
      do
         if a_keyword(fz_create) then
            Result := True
            sp := pos(start_line, start_column)
            if skip1('{') then
               if a_type_mark(False) then
                  type := last_type_mark
                  anchored_creation_check(type)
                  if not skip1('}') then
                     error_handler.add_position(current_position)
                     error_handler.append(em36)
                     error_handler.print_as_fatal_error
                  end
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "Bad create instruction (type expected).")
                  error_handler.print_as_fatal_error
               end
            end
            writable := mandatory_writable
            if skip1('.') then
               if a_ordinary_feature_name_or_local_name then
                  procedure_name := token_buffer.to_feature_name
                  if cc = '(' then
                     call := to_proc_call(writable, procedure_name, a_actuals)
                  else
                     create {PROCEDURE_CALL_0} call.make(writable, procedure_name)
                  end
               end
            end
            create {CREATE_INSTRUCTION} last_instruction.make(sp, type, writable, call)
         end
      end

   a_create_expression: BOOLEAN
         --  ++ create_expression -> "create" "{" type "}" ["." procedure_name [actuals]]
         --  ++
      local
         sp: POSITION; type: TYPE_MARK; procedure_name: FEATURE_NAME; call: PROCEDURE_CALL
         fake_target: FAKE_TARGET
      do
         if a_keyword(fz_create) then
            Result := True
            sp := pos(start_line, start_column)
            if not skip1('{') then
               error_handler.add_position(current_position)
               error_handler.append(once "Bad create expression ('{' expected).")
               error_handler.print_as_fatal_error
            end
            if not a_type_mark(False) then
               error_handler.add_position(current_position)
               error_handler.append(once "Bad create instruction (type expected).")
               error_handler.print_as_fatal_error
            end
            type := last_type_mark
            anchored_creation_check(type)
            if not skip1('}') then
               error_handler.add_position(current_position)
               error_handler.append(once "Bad create expression ('}' expected).")
               error_handler.print_as_fatal_error
            end
            if skip1('.') then
               if a_ordinary_feature_name_or_local_name then
                  procedure_name := token_buffer.to_feature_name
                  create fake_target.make(procedure_name.start_position, type)
                  if cc = '(' then
                     call := to_proc_call(fake_target, procedure_name, a_actuals)
                  else
                     create {PROCEDURE_CALL_0} call.make(fake_target, procedure_name)
                  end
               end
            end
            create {CREATE_EXPRESSION} last_expression.make(sp, type, call)
         end
      end

   a_creation_clause (sp: POSITION; with_clients: BOOLEAN): CREATION_CLAUSE
         --  ++ creation_clause -> [clients] [comment] feature_list
         --  ++
      local
         clients: CLIENT_LIST; comments: COMMENT
      do
         if with_clients then
            clients := a_clients
         end
         comments := get_comment
         if not a_feature_name_list then
            error_handler.add_position(sp)
            error_handler.append(once "Added missing `default_create'. Actually, a creation list must not be empty. %
                                 %You must have at least the `default_create' procedure inherited from ANY. The %
                                 %`default_create' indicates that one can also create an object with no creation procedure.")
            error_handler.print_as_warning
            create last_feature_name.simple_feature_name(as_default_create, sp)
            create last_feature_name_list.make_1(last_feature_name)
         end
         create Result.make(sp, clients, comments, last_feature_name_list)
      end

   a_convert_clause (sp: POSITION)
         --  ++ convert_clause -> {feature_name conversion_clause ...}
         --  ++
      local
         done: BOOLEAN
      do
         if a_feature_name then
            from
               a_conversion_clause
            until
               done
            loop
               if skip1(',') then
                  if a_feature_name then
                     a_conversion_clause
                  else
                     error_handler.add_position(current_position)
                     error_handler.append(once "Ignored extra %",%".")
                     error_handler.print_as_style_warning
                  end
               elseif a_feature_name then
                  error_handler.add_position(last_feature_name.start_position)
                  error_handler.append(em5)
                  error_handler.print_as_warning
                  a_conversion_clause
               else
                  done := True
               end
            end
            error_handler.add_position(sp)
            error_handler.append(once "The convert support is EXPERIMENTAL (work in progress).")
            error_handler.print_as_warning
         else
            error_handler.add_position(sp)
            error_handler.append(once "Discarded empty convert clause")
            error_handler.print_as_warning
         end
      end

   a_conversion_clause
         --  ++ conversion_clause -> conversion_procedure |
         --  ++                      conversion_query
         --  ++
      do
         if not a_conversion_procedure and then not a_conversion_query then
            error_handler.add_position(last_feature_name.start_position)
            error_handler.append(once "Syntax error while trying to parse a conversion clause. Expected either '(' or ':'")
            error_handler.print_as_fatal_error
         end
      end

   a_conversion_procedure: BOOLEAN
         --  ++ conversion_procedure -> '(' conversion_list ')'
         --  ++
      local
         lfn: like last_feature_name
      do
         if skip1('(') then
            lfn := last_feature_name
            a_conversion_list
            if not skip1(')') then
               error_handler.add_position(current_position)
               error_handler.append(em28)
               error_handler.print_as_warning
            end
            Result := True
         end
      end

   a_conversion_query: BOOLEAN
         --  ++ conversion_query -> ':' conversion_list
         --  ++
      local
         lfn: like last_feature_name
      do
         if skip1(':') then
            lfn := last_feature_name
            a_conversion_list
            Result := True
         end
      end

   a_debug: BOOLEAN
         --  ++ debug -> "debug" "(" {manifest_string "," ...} ")"
         --  ++                  compound "end"
         --  ++
      local
         sp: POSITION; list: FAST_ARRAY[MANIFEST_STRING]; e_debug: DEBUG_COMPOUND
      do
         if a_keyword(fz_debug) then
            sp := pos(start_line, start_column)
            if skip1('(') then
               from
                  create list.with_capacity(4)
               until
                  not a_manifest_string(True)
               loop
                  last_manifest_string.set_once_flag(True)
                  list.add_last(last_manifest_string)
                  ok := skip1(',')
               end
               if list.is_empty then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Empty debug key list (deleted).")
                  error_handler.print_as_style_warning
                  list := Void
               end
               if not skip1(')') then
                  error_handler.add_position(current_position)
                  error_handler.append(once "%")%" expected to end debug string list.")
                  error_handler.print_as_fatal_error
               end
            end
            Result := True
            create e_debug.make(sp, list, a_compound2(once "debug", fz_end))
            last_instruction := e_debug
         end
      end

   a_expression: BOOLEAN
         --  ++ expression -> "<<" { expression "," ... } ">>" |
         --  ++               e1 r1
         --  ++
      local
         sp: POSITION; list: FAST_ARRAY[EXPRESSION]
      do
         if skip2('<', '<') then
            from
               Result := True
               sp := pos(start_line, start_column)
            until
               not a_expression
            loop
               if list = Void then
                  create list.with_capacity(4)
               end
               list.add_last(last_expression)
               if skip1(',') then
                  -- the comma is here.
               else
                  -- the comma is optional or "is" was the last item.
               end
            end
            if not skip2('>', '>') then
               if a_type_mark(False) then
                  error_handler.add_position(last_type_mark.start_position)
                  error_handler.append(once "A type mark is not a valid item for a manifest array. %
                                       %Keep in mind that Liberty Eiffel is case-sensitive and that ")
                  error_handler.add_type_mark(last_type_mark)
                  error_handler.append(once " cannot be an expression. ")
               else
                  error_handler.add_position(current_position)
               end
               error_handler.append(once "End of manifest array expected.")
               error_handler.print_as_fatal_error
            end
            if list = Void then
               error_handler.add_position(current_position)
               error_handler.append(once "Empty manifest array is not a valid notation. If you want to create %
               %an empty ARRAY, just use an ordinary creation call of class ARRAY.")
               error_handler.print_as_fatal_error
            end
            create {OLD_MANIFEST_ARRAY} last_expression.make(sp, list)
         elseif a_e1 then
            Result := True
            a_r1(last_expression)
            last_expression := expression_with_comment(last_expression)
         elseif a_address_of then
            Result := True
         elseif a_non_allowed_very_strange_identifier then
            error_handler.print_as_fatal_error
         end
      ensure
         Result implies last_expression /= Void
      end

   a_e1: BOOLEAN
         --  ++ e1 -> e2 r2
         --  ++
      do
         Result := a_e2
         if Result then
            a_r2(last_expression)
         end
      end

   a_e2: BOOLEAN
         --  ++ e2 -> e3 r3
         --  ++
      do
         Result := a_e3
         if Result then
            a_r3(last_expression)
         end
      end

   a_e3: BOOLEAN
         --  ++ e3 -> e4 r4
         --  ++
      do
         Result := a_e4
         if Result then
            a_r4(last_expression)
         end
      end

   a_e4: BOOLEAN
         --  ++ e4 -> e5 r5
         --  ++
      do
         Result := a_e5
         if Result then
            a_r5(last_expression)
         end
      end

   a_e5: BOOLEAN
         --  ++ e5 -> e6 r6
         --  ++
      do
         Result := a_e6
         if Result then
            a_r6(last_expression)
         end
      end

   a_e6: BOOLEAN
         --  ++ e6 -> e7 r7
         --  ++
      do
         Result := a_e7
         if Result then
            a_r7(last_expression)
         end
      end

   a_e7: BOOLEAN
         --  ++ e7 -> e8 r8
         --  ++
      do
         Result := a_e8
         if Result then
            a_r8(last_expression)
         end
      end

   a_e8: BOOLEAN
         --  ++ e8 -> "not" e8 |
         --  ++       "+" e8 |
         --  ++       "-" e8 |
         --  ++       free_operator e8 !
         --  ++       e9
         --  ++
      local
         op: FEATURE_NAME; prefix_freeop: CALL_PREFIX_FREEOP; sp: POSITION
      do
         if a_keyword(as_not) then
            sp := pos(start_line, start_column)
            if a_e8 then
               create {CALL_PREFIX_NOT} last_expression.make(sp, last_expression)
               Result := True
            else
               err_exp(sp, True, as_not)
            end
         elseif cc = '+' and then a_manifest_or_type_test(Expression_syntax_flag) then
            Result := True
         elseif skip1('+') then
            sp := pos(start_line, start_column)
            if a_e8 then
               no_void_check(last_expression, once "Void cannot be used after unary %"+%" operator.")
               create {CALL_PREFIX_PLUS} last_expression.make(sp, last_expression)
               last_expression := static_simplify(last_expression)
               Result := True
            else
               err_exp(sp, True, as_plus)
            end
         elseif cc = '-' and then a_manifest_or_type_test(Expression_syntax_flag) then
            Result := True
         elseif skip1('-') then
            sp := pos(start_line, start_column)
            if a_e8 then
               no_void_check(last_expression, once "Void cannot be used after unary %"-%" operator.")
               create {CALL_PREFIX_MINUS} last_expression.make(sp, last_expression)
               last_expression := static_simplify(last_expression)
               Result := True
            else
               err_exp(sp, True, as_minus)
            end
         elseif a_free_operator_usage(freeop_prefix) then
            op := last_feature_name
            if a_e8 then
               if last_expression.is_void then
                  error_handler.add_position(last_expression.start_position)
                  error_handler.add_position(op.start_position)
                  error_handler.append(once "Void cannot be the target of prefix operator %"")
                  error_handler.append(op.to_string)
                  error_handler.append(once "%".")
                  error_handler.print_as_fatal_error
               end
               create prefix_freeop.make(last_expression, op)
               last_expression := prefix_freeop
               Result := True
            else
               err_exp(op.start_position, True, op.to_string)
            end
         else
            Result := a_e9
         end
      end

   a_e9: BOOLEAN
         --  ++ e9 -> e10 |
         --  ++       "old" e10
         --  ++
      local
         sp: POSITION
      do
         if a_keyword(fz_old) then
            Result := True
            sp := pos(start_line, start_column)
            if not inside_ensure_flag then
               error_handler.add_position(sp)
               error_handler.append(once "Expression %"old%" can be used in ensure clause only (VAOL.1).")
               error_handler.print_as_error
            end
            if a_e10 then
               create {E_OLD} last_expression.make(sp, last_expression)
            else
               error_handler.add_position(current_position)
               error_handler.append(once "Expression expected after %"old%".")
               error_handler.print_as_fatal_error
            end
         else
            Result := a_e10
         end
      end

   a_e10: BOOLEAN
         --  ++ e10 -> "(" expression ")" r10 |
         --  ++       "[" {Expression "," ...} "]" |
         --  ++       "True" | "False" |
         --  ++       "?" |
         --  ++       character_constant |
         --  ++       manifest_string |
         --  ++       manifest_or_type_test |
         --  ++       "Precursor" ["{" type_mark "}"] [actuals] r10 |
         --  ++       "agent" expression |
         --  ++       "Result" r10 |
         --  ++       "Current" r10 |
         --  ++       "Void" r10 |
         --  ++       local_variable r10 |
         --  ++       argument r10 |
         --  ++       identifier ?:= expression
         --  ++       function_call r10 |
         -- ++        a_condition_exp r10
         --  ++
      local
         type_mark: TYPE_MARK; args: EFFECTIVE_ARG_LIST; sp: POSITION; eal: EFFECTIVE_ARG_LIST_N
         delayed_call: FUNCTION_CALL; writable: EXPRESSION; ft: FEATURE_TEXT; ewc: EXPRESSION_WITH_COMMENT
         e1: EXPRESSION; rem: FAST_ARRAY[EXPRESSION]
      do
         if skip1('(') then
            if a_expression then
               if skip1(')') then
                  Result := a_r10(False, last_expression, Void, Void)
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "')' expected in expression.")
                  error_handler.print_as_fatal_error
               end
            else
               error_handler.add_position(current_position)
               error_handler.append(once "Expression expected.")
               error_handler.print_as_fatal_error
            end
         elseif skip1('[') then
            Result := True
            sp := pos(start_line, start_column)
            if a_expression then
               e1 := last_expression
               ok := skip1(',')
               if a_expression then
                  from
                     create rem.with_capacity(4)
                     rem.add_last(last_expression)
                     ok := skip1(',')
                  until
                     not a_expression
                  loop
                     rem.add_last(last_expression)
                     ok := skip1(',')
                  end
               end
               create eal.make_n(sp, e1, rem)
            end
            if not skip1(']') then
               error_handler.add_position(current_position)
               error_handler.append(once "End of TUPLE expression expected.")
               error_handler.print_as_fatal_error
            end
            create {MANIFEST_TUPLE} last_expression.make(sp, eal)
         elseif a_keyword_true then
            Result := True
            create {E_TRUE} last_expression.make(pos(start_line, start_column))
            if cc = '.' then
               if (start_line /= line) or else (column /= start_column + 4) then
                  -- I do not want to allow a blank space after the dot here.
                  error_handler.add_position(pos(start_line, start_column + 4))
                  error_handler.append(once "Removed unexpected blank space(s) just before this dot (assume %
                  %you really want to apply a function using the previous `True' constant as target).")
                  error_handler.print_as_style_warning
               end
               next_char
               Result := just_after_a_dot(False, last_expression)
            end
         elseif a_keyword_false then
            Result := True
            create {E_FALSE} last_expression.make(pos(start_line, start_column))
            if cc = '.' then
               if (start_line /= line) or else (column /= start_column + 5) then
                  -- I do not want to allow a blank space after the dot here.
                  error_handler.add_position(pos(start_line, start_column + 5))
                  error_handler.append(once "Removed unexpected blank space(s) just before this dot (assume %
                  %you really want to apply a procedure to the previous `False' constant as target).")
                  error_handler.print_as_style_warning
               end
               next_char
               Result := just_after_a_dot(False, last_expression)
            end
         elseif skip1('?') then
            Result := True
            create {OPEN_OPERAND} last_expression.question_mark(pos(start_line, start_column))
         elseif a_character_constant(Expression_syntax_flag) then
            Result := True
         elseif a_manifest_string(False) then
            Result := True
            if cc = '.' then
               if last_manifest_string.once_flag then
                  error_handler.add_position(current_position)
                  error_handler.append(em19)
                  error_handler.print_as_warning
               end
               next_char
               Result := just_after_a_dot(False, last_manifest_string)
            elseif cc = '(' then
               if last_manifest_string.once_flag then
                  error_handler.add_position(current_position)
                  error_handler.append(em19)
                  error_handler.print_as_warning
               end
               Result := a_alias_parentheses(False, last_manifest_string)
            elseif cc = '[' then
               if last_manifest_string.once_flag then
                  error_handler.add_position(current_position)
                  error_handler.append(em19)
                  error_handler.print_as_warning
               end
               Result := a_alias_brackets(False, last_manifest_string)
            else
               skip_comments
               if cc = '.' then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Removed unexpected blank space(s) just before this dot (assume %
                      %you really want to apply a function using the previous manifest STRING as target).")
                  error_handler.print_as_style_warning
                  if last_manifest_string.once_flag then
                     error_handler.add_position(current_position)
                     error_handler.append(em19)
                     error_handler.print_as_warning
                  end
                  next_char
                  Result := just_after_a_dot(False, last_manifest_string)
               elseif not skipped_new_line and then cc = '(' then
                  Result := a_alias_parentheses(False, last_manifest_string)
               elseif not skipped_new_line and then cc = '[' then
                  Result := a_alias_brackets(False, last_manifest_string)
               else
                  last_expression := last_manifest_string
               end
            end
         elseif a_manifest_or_type_test(Expression_syntax_flag) then
            Result := True
         elseif a_keyword_precursor then
            Result := True
            sp := pos(start_line, start_column)
            if skip1('{') then
               type_mark := a_precursor_type_mark(sp)
            end
            args := a_actuals
            if skip1('.') then
               create {PRECURSOR_EXPRESSION} last_expression.make(sp, type_mark, args)
               inside_function_precursor_check(last_expression)
               Result := just_after_a_dot(False, last_expression)
            elseif not skipped_new_line and then cc = '(' then
               create {PRECURSOR_EXPRESSION} last_expression.make(sp, type_mark, args)
               inside_function_precursor_check(last_expression)
               Result := a_alias_parentheses(False, last_manifest_string)
            elseif not skipped_new_line and then cc = '[' then
               create {PRECURSOR_EXPRESSION} last_expression.make(sp, type_mark, args)
               inside_function_precursor_check(last_expression)
               Result := a_alias_brackets(False, last_manifest_string)
            else
               create {PRECURSOR_EXPRESSION} last_expression.make(sp, type_mark, args)
               inside_function_precursor_check(last_expression)
            end
         elseif a_create_expression then
            Result := True
         elseif a_keyword(as_agent) then
            Result := True
            sp := pos(start_line, start_column)
            ft := a_inline_agent
            if ft /= Void then
               delayed_call ::= last_expression
               create {AGENT_CREATION} last_expression.make(sp, delayed_call, ft)
            elseif a_expression then
               if delayed_call ?:= last_expression then
                  delayed_call ::= last_expression
               elseif ewc ?:= last_expression then
                  ewc ::= last_expression
                  if delayed_call ?:= ewc.expression then
                     delayed_call ::= ewc.expression
                  end
               end
               if delayed_call /= Void then
                  create {AGENT_CREATION} last_expression.make(sp, delayed_call, Void)
               else
                  error_handler.add_position(last_expression.start_position)
                  if {OPEN_OPERAND} ?:= last_expression then
                     error_handler.append(once "Expression ")
                     error_handler.add_expression(last_expression)
                     error_handler.append(once " cannot be used just after agent keyword. The type of the %
                     %target must be given. Consider using the curly braces notation, e.g. `{TARGET_TYPE}'.")
                  else
                     error_handler.append(once "Expression ")
                     error_handler.add_expression(last_expression)
                     error_handler.append(once " cannot be used just after agent keyword (it does not denote a feature call).")
                  end
                  error_handler.print_as_fatal_error
               end
            else
               error_handler.add_position(sp)
               error_handler.append(once "Inline agent or expression expected after agent keyword.")
               error_handler.print_as_fatal_error
            end
         elseif a_keyword_current then
            create {WRITTEN_CURRENT} last_expression.make(pos(start_line, start_column))
            Result := a_r10(False, last_expression, Void, Void)
         elseif a_keyword_void then
            create {E_VOID} last_expression.make(pos(start_line, start_column))
            Result := a_r10(False, last_expression, Void, Void)
         elseif a_keyword_result then
            sp := pos(start_line, start_column)
            if not inside_function_flag then
               error_handler.add_position(sp)
               error_handler.append(em14)
               error_handler.print_as_fatal_error
            end
            create {RESULT} writable.make(sp)
            if skip3('?', ':', '=') then
               if not a_expression then
                  error_handler.add_position(current_position)
                  error_handler.append(em21)
                  error_handler.print_as_fatal_error
               end
               create {ASSIGNMENT_TEST} last_expression.with_writable(writable, last_expression)
               Result := True
            else
               Result := a_r10(False, writable, Void, Void)
            end
         elseif a_ordinary_feature_name_or_local_name then
            if a_argument then
               Result := a_r10(False, last_expression, Void, Void)
            elseif a_local_name_ref then
               writable := last_expression
               if skip3('?', ':', '=') then
                  if not a_expression then
                     error_handler.add_position(current_position)
                     error_handler.append(em21)
                     error_handler.print_as_fatal_error
                  end
                  create {ASSIGNMENT_TEST} last_expression.with_writable(writable, last_expression)
                  Result := True
               else
                  Result := a_r10(False, writable, Void, Void)
               end
            elseif skip3('?', ':', '=') then
               writable := token_buffer.to_writable_attribute_name
               if not a_expression then
                  error_handler.add_position(current_position)
                  error_handler.append(em21)
                  error_handler.print_as_fatal_error
               end
               create {ASSIGNMENT_TEST} last_expression.with_writable(writable, last_expression)
               Result := True
            else
               Result := a_function_call
            end
         elseif a_conditional_exp then
            Result := a_r10(False, last_expression, Void, Void)
         end
      end

   inline_agent_counter: INTEGER

   inline_agents: FAST_ARRAY[FEATURE_TEXT]
      once
         create Result.with_capacity(256)
      end

   a_is: BOOLEAN
      do
         if a_keyword(fz_is) then
            error_handler.append(once "Keyword %"is%" is deprecated.")
            error_handler.add_position(pos(start_line, start_column))
            error_handler.print_as_style_warning
            Result := True
         end
      end

   a_inline_agent: FEATURE_TEXT
         --  ++ inline_agent -> formal_arg_list
         --  ++                 [":" type]
         --  ++                 "is" routine
         --  ++
      local
         n: STRING; fn: FEATURE_NAME
         spos, rpos: POSITION
         c, l: INTEGER
         outer_feature: like tmp_feature
         iff, ief, irf, icif, expect_routine: BOOLEAN
         a: like arguments; lv: like local_vars
      do
         if closure_arguments = Void then
            check
               closure_local_vars = Void
            end
            create closure_arguments.with_capacity(2, 0)
            create closure_local_vars.with_capacity(2, 0)
         end
         if not inside_class_invariant_flag then
            closure_arguments.add_first(arguments)
            closure_local_vars.add_first(local_vars)
         end

         outer_feature := tmp_feature
         iff := inside_function_flag
         ief := inside_ensure_flag
         irf := inside_rescue_flag
         icif := inside_class_invariant_flag
         a := arguments
         lv := local_vars

         tmp_feature := Void
         inside_function_flag := False
         inside_ensure_flag := False
         inside_rescue_flag := False
         inside_class_invariant_flag := False
         arguments := Void
         local_vars := Void

         c := column
         l := line
         spos := current_position
         if unused_tmp_features.is_empty then
            create tmp_feature.initialize
         else
            tmp_feature := unused_tmp_features.top
            unused_tmp_features.pop
            tmp_feature.initialize
         end

         if not a_formal_arg_list then
            error_handler.cancel
         else
            if skip1(':') then
               if a_type_mark(False) then
                  inside_function_flag := True
                  tmp_feature.set_type(last_type_mark)
               else
                  error_handler.add_position(current_position)
                  error_handler.append(em16)
                  error_handler.print_as_fatal_error
               end
            end

            if a_is then
               expect_routine := True
            end

            tmp_feature.add_synonym(inline_agent_no_name) -- just to keep the tmp_feature contract happy
            last_feature_declaration := a_routine(expect_routine)
            if last_feature_declaration /= Void then
               -- OK, really an inline agent; let's allocate resources (viz feature name)
               inline_agent_counter := inline_agent_counter + 1
               n := once ""
               n.copy(once "_inline_agent")
               inline_agent_counter.append_in(n)
               create fn.simple_feature_name(n, token_buffer.start_position)
               fn.set_is_frozen
               tmp_feature.clear_synonyms
               tmp_feature.add_synonym(fn)

               rpos := current_position
               if (not {E_PROCEDURE} ?:= last_feature_declaration.anonymous_feature) and then (not {E_FUNCTION} ?:= last_feature_declaration.anonymous_feature) then
                  error_handler.add_position(rpos)
                  error_handler.append(once "Bad inline agent definition (%"do...end%" routine body expected).")
                  error_handler.print_as_fatal_error
               end
               Result := tmp_feature.as_procedure_or_function
               Result.set_inline_agent(closure_arguments, closure_local_vars)
               inline_agents.add_last(Result)

               -- must reset the outer feature before calling a_actuals, otherwise the actuals won't be
               -- correctly set
               tmp_feature.done
               unused_tmp_features.push(tmp_feature)
               tmp_feature := outer_feature
               inside_function_flag := iff
               inside_ensure_flag := ief
               inside_rescue_flag := irf
               inside_class_invariant_flag := icif
               arguments := a
               local_vars := lv

               last_expression := to_call(create {IMPLICIT_CURRENT}.make(spos), fn, a_actuals)

               outer_feature.set_has_closures
            end
         end

         if Result = Void then
            -- Not an inline agent, restore context

            go_back_at(l, c)

            tmp_feature.done
            unused_tmp_features.push(tmp_feature)
            tmp_feature := outer_feature
            inside_function_flag := iff
            inside_ensure_flag := ief
            inside_rescue_flag := irf
            inside_class_invariant_flag := icif
            arguments := a
            local_vars := lv
         end

         if not inside_class_invariant_flag then
            closure_local_vars.remove_first
            closure_arguments.remove_first
         end
      end

   inline_agent_no_name: FEATURE_NAME
      once
         create Result.unknown_position("__inline_agent__")
         Result.set_is_frozen
      end

   a_external: FEATURE_TEXT
         --  ++ external -> "<external-specification>" external_name
         --  ++ external_name -> ["alias" manifest_string]
         --  ++
      local
         alias_tag: MANIFEST_STRING; l: NATIVE
      do
         l := a_external_specification
         alias_tag := a_external_name
         Result := tmp_feature.as_external_routine(l, alias_tag)
      end

   a_external_specification: NATIVE
      local
         external_tag: MANIFEST_STRING
      do
         if not a_manifest_string(True) then
            error_handler.add_position(current_position)
            error_handler.append(once "Bad external clause (manifest string expected).")
            error_handler.print_as_fatal_error
         end
         unused_once_warning_check
         external_tag := last_manifest_string
         external_tag.set_once_flag(False)
         mini_buffer.start_with(external_tag)
         if mini_buffer.is_off then
            unknown_external_language(external_tag)
         elseif mini_buffer.a_word(once "built_in") then
            create {NATIVE_BUILT_IN} Result.make(external_tag)
         elseif mini_buffer.a_word(once "plug_in") then
            create {NATIVE_PLUG_IN} Result.make(external_tag)
         elseif mini_buffer.a_keyword(once "C++") then
            create {NATIVE_C_PLUS_PLUS} Result.make(external_tag)
         elseif mini_buffer.a_keyword(once "C") then
            create {NATIVE_C} Result.make(external_tag)
         else
            unknown_external_language(external_tag)
         end
      end

   a_external_name: MANIFEST_STRING
      do
         if a_keyword(fz_alias) then
            if not a_manifest_string(True) then
               error_handler.add_position(current_position)
               error_handler.append(once "Bad external alias clause.")
               error_handler.print_as_fatal_error
            end
            unused_once_warning_check
            Result := last_manifest_string
         end
      end

   a_feature_name_list: BOOLEAN
         --  ++ feature_name_list -> {feature_name "," ...}
         --  ++
         --
         -- Gives True when list is not empty.
      local
         state: INTEGER
      do
         from
            last_feature_name_list := Void
         until
            state >= 3
         loop
            inspect
               state
            when 0 then
               -- Nothing read.
               if a_feature_name then
                  create last_feature_name_list.make_1(last_feature_name)
                  Result := True
                  state := 1
               elseif cc = ',' then
                  error_handler.add_position(current_position)
                  error_handler.append(em12)
                  error_handler.print_as_style_warning
                  ok := skip1(',')
               else
                  state := 3
               end
            when 1 then
               -- Feature name read.
               if cc = ',' then
                  ok := skip1(',')
                  state := 2
               elseif a_feature_name then
                  error_handler.add_position(last_feature_name.start_position)
                  error_handler.append(em5)
                  error_handler.print_as_warning
                  last_feature_name_list.add_last(last_feature_name)
               else
                  state := 3
               end
            when 2 then
               -- Separator read.
               if a_feature_name then
                  last_feature_name_list.add_last(last_feature_name)
                  state := 1
               elseif cc = ',' then
                  error_handler.add_position(current_position)
                  error_handler.append(em12)
                  error_handler.print_as_style_warning
                  ok := skip1(',')
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "Feature name expected here.")
                  if a_class_name then
                     error_handler.print_as_error
                     error_handler.add_position(token_buffer.start_position)
                     error_handler.append(once "This is not a feature name, but a class name.")
                  end
                  error_handler.print_as_fatal_error
               end
            end
         end
      end

   a_feature_name: BOOLEAN
         --  ++ feature_name -> prefix |
         --  ++                 infix |
         --  ++                 simple_feature_name
         --  ++
      local
         fn: like last_feature_name
      do
         if a_prefix then
            Result := True
         elseif a_infix then
            Result := True
         elseif a_ordinary_feature_name_or_local_name then
            fn := token_buffer.to_feature_name
            if a_alias(fn) then
               Result := True
            else
               last_feature_name := fn
               Result := True
            end
         end
      end

   a_feature_clause
         --  ++ feature_clause -> [clients] [comment] feature_declaration_list
         --  ++
      local
         feature_clause: FEATURE_CLAUSE; clients: CLIENT_LIST; comment: COMMENT
      do
         from
            clients := a_clients
            comment := get_comment
            faof.clear_count
         until
            not a_feature_declaration
         loop
            ok := skip1(';')
            if last_feature_declaration /= Void then
               faof.add_last(last_feature_declaration)
            end
         end
         if not faof.is_empty then
            create feature_clause.make(last_class_text, clients, comment, faof.twin)
            last_class_text.add_feature_clause(feature_clause)
         elseif comment /= Void then
            create feature_clause.make(last_class_text, clients, comment, Void)
            last_class_text.add_feature_clause(feature_clause)
         end
      end

   a_possibly_frozen_feature_name: BOOLEAN
      do
         if a_keyword(fz_frozen) then
            if a_feature_name then
               Result := True
               last_feature_name.set_is_frozen
               tmp_feature.add_synonym(last_feature_name)
            else
               error_handler.add_position(current_position)
               error_handler.append(once "Unable to find the feature name which is mandatory just %
                                    %after the %"frozen%" keyword.")
               if a_class_name then
                  error_handler.print_as_error
                  error_handler.add_position(token_buffer.start_position)
                  error_handler.append(once "This is not a feature name, but a class name.")
               elseif a_expression then
                  error_handler.print_as_error
                  error_handler.add_position(last_expression.start_position)
                  error_handler.append(once "Expression ")
                  error_handler.add_expression(last_expression)
                  error_handler.append(once " is not a feature name.")
               end
               error_handler.print_as_fatal_error
            end
         elseif a_feature_name then
            Result := True
            tmp_feature.add_synonym(last_feature_name)
            if last_feature_name.name_alias /= Void then
               tmp_feature.add_synonym(last_feature_name.name_alias)
            end
         end
      end

   a_feature_declaration: BOOLEAN
         --  ++ feature_declaration -> {["frozen"] feature_name "," ...}+
         --  ++                        formal_arg_list
         --  ++                        [":" type]
         --  ++                        ["is" "unique" |
         --  ++                         "is" manifest_constant |
         --  ++                         "is" routine]
         --  ++
      local
         is_prefix, is_infix, is_alias, is_constant, expect_routine: BOOLEAN
         prefix_sp, infix_sp, alias_sp: POSITION
      do
         from
            tmp_feature.initialize
            if a_possibly_frozen_feature_name then
               if last_feature_name.is_prefix_name then
                  is_prefix := True
                  prefix_sp := last_feature_name.start_position
               end
               if last_feature_name.is_infix_name then
                  is_infix := True
                  infix_sp := last_feature_name.start_position
               end
               if last_feature_name.name_alias /= Void then
                  is_alias := True
                  alias_sp := last_feature_name.name_alias.start_position
               end
               Result := True
            elseif a_expression then
               error_handler.add_position(last_expression.start_position)
               error_handler.append(once "Syntax error while trying to parse the beginning of a new %
                                    %feature definition. Expression ")
               error_handler.add_expression(last_expression)
               error_handler.append(once " is not a valid feature name to start a new feature definition. %
                                    %Parser lost. Sorry. Check before and after that point.")
               error_handler.print_as_fatal_error
            elseif a_class_name then
               error_handler.add_position(token_buffer.start_position)
               error_handler.append(once "Syntax error while trying to parse the beginning of a new %
                                    %feature definition. Feature name expected. Class name ")
               error_handler.append(token_buffer.buffer)
               error_handler.append(once " cannot be used as a feature name to start a new feature definition. %
                                    %Parser lost. Sorry. Check before and after that point.")
               error_handler.print_as_fatal_error
            end
         until
            not skip1(',')
         loop
            if a_possibly_frozen_feature_name then
               if not is_prefix and then last_feature_name.is_prefix_name then
                  is_prefix := True
                  prefix_sp := last_feature_name.start_position
               end
               if not is_infix and then last_feature_name.is_infix_name then
                  is_infix := True
                  infix_sp := last_feature_name.start_position
               end
               if not is_alias and then last_feature_name.name_alias /= Void then
                  is_alias := True
                  alias_sp := last_feature_name.name_alias.start_position
               end
            else
               error_handler.add_position(current_position)
               error_handler.append(once "Error inside feature name definition. Unable to find the synonymous name %
                                    %which must be just after the previous colon mark %",%".")
               if a_class_name then
                  error_handler.print_as_error
                  error_handler.add_position(token_buffer.start_position)
                  error_handler.append(once "This is not a feature name, but a class name.")
               end
               error_handler.print_as_fatal_error
            end
         end

         if Result then
            if a_formal_arg_list then
               expect_routine := tmp_feature.arguments /= Void
            else
               error_handler.print_as_fatal_error
            end
            if is_prefix and then tmp_feature.arguments /= Void then
               error_handler.add_position(prefix_sp)
               error_handler.add_position(tmp_feature.arguments.start_position)
               error_handler.append("Prefix functions cannot have arguments.")
               error_handler.print_as_fatal_error
            end
            if is_infix and then (tmp_feature.arguments = Void or else tmp_feature.arguments.count /= 1) then
               error_handler.add_position(infix_sp)
               if tmp_feature.arguments /= Void then
                  error_handler.add_position(tmp_feature.arguments.start_position)
               end
               error_handler.append("Infix functions must have exactly one argument.")
               error_handler.print_as_fatal_error
            end
            if skip1(':') then
               if a_type_mark(False) then
                  inside_function_flag := True
                  tmp_feature.set_type(last_type_mark)
               else
                  error_handler.add_position(current_position)
                  error_handler.append(em16)
                  error_handler.print_as_fatal_error
               end
            elseif a_type_mark(False) then
               error_handler.add_position(pos(start_line, start_column))
               error_handler.append(once "Added missing %":%" before this type mark.")
               error_handler.print_as_warning
               inside_function_flag := True
               tmp_feature.set_type(last_type_mark)
            end

            if a_keyword(fz_assign) then
               if a_feature_name then
                  tmp_feature.set_assigned(last_feature_name)
                  expect_routine := True
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "Expected a feature name to assign.")
                  error_handler.print_as_fatal_error
               end
            end
            check_alias

            if a_is then
               expect_routine := True
            elseif cc = '=' then
               is_constant := True
               error_handler.add_position(current_position)
               error_handler.append(once "Deleted optional %"=%".")
               error_handler.print_as_warning
               ok := skip1(cc)
            end

            if a_keyword(fz_unique) then
               last_feature_declaration := tmp_feature.as_unique_constant
               ok := skip1(';')
               last_feature_declaration.set_header_comment(get_comment)
            elseif a_boolean_constant then
               last_feature_declaration := tmp_feature.as_boolean_constant(last_expression)
               ok := skip1(';')
               last_feature_declaration.set_header_comment(get_comment)
            elseif a_character_constant(Atomic_syntax_flag) then
               last_feature_declaration := tmp_feature.as_character_constant(last_expression)
               ok := skip1(';')
               last_feature_declaration.set_header_comment(get_comment)
            elseif a_manifest_string(True) then
               unused_once_warning_check
               last_manifest_string.set_once_flag(True)
               last_feature_declaration := tmp_feature.as_string_constant(last_manifest_string)
               ok := skip1(';')
               last_feature_declaration.set_header_comment(get_comment)
            elseif a_manifest_or_type_test(Atomic_syntax_flag) then
               last_feature_declaration := tmp_feature.as_constant(last_expression)
               ok := skip1(';')
               last_feature_declaration.set_header_comment(get_comment)
            else
               if is_constant then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Bad constant-attribute definition. The feature value must be a manifest constant.")
                  error_handler.print_as_fatal_error
               end
               last_feature_declaration := a_routine(expect_routine)
            end

            if last_feature_declaration = Void then
               if tmp_feature.arguments /= Void then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Syntax error while trying to parse the header of routine `")
                  error_handler.append(tmp_feature.first_name.to_string)
                  error_handler.append(once "'. A routine with arguments cannot be an attribute.")
                  error_handler.print_as_fatal_error
               elseif tmp_feature.type = Void then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Bad procedure definition. Unable to parse definition of `")
                  error_handler.append(tmp_feature.first_name.to_string)
                  error_handler.append(once "'. Missing function type?")
                  error_handler.print_as_fatal_error
               else
                  last_feature_declaration := tmp_feature.as_writable_attribute
                  ok := skip1(';')
                  if tmp_feature.header_comment = Void then
                     last_feature_declaration.set_header_comment(get_comment)
                  end
               end
            end

            inside_function_flag := False
            arguments := Void
         end
         tmp_feature.done
      end

   check_alias
      local
         i: INTEGER; a: FEATURE_NAME
      do
         from
            i := tmp_feature.names.lower
         until
            i > tmp_feature.names.upper
         loop
            a := tmp_feature.names.item(i).name_alias
            if a /= Void then
               if a.is_infix_name then
                  if (a.name.to_string = as_plus or else a.name.to_string = as_minus) and then (tmp_feature.arguments = Void or else tmp_feature.arguments.count = 0) then
                     a.set_plus_minus_prefix
                  elseif tmp_feature.arguments = Void or else tmp_feature.arguments.count /= 1 then
                     error_handler.add_position(a.start_position)
                     error_handler.append("This alias can be used only as infix, needing exactly one argument.")
                     error_handler.print_as_fatal_error
                  elseif tmp_feature.type = Void then
                     error_handler.add_position(a.start_position)
                     error_handler.append("This alias can be used only as infix, needing a Result type.")
                     error_handler.print_as_fatal_error
                  end
               elseif a.is_prefix_name then
                  if tmp_feature.arguments /= Void and then tmp_feature.arguments.count /= 0 then
                     error_handler.add_position(a.start_position)
                     error_handler.append("This alias can be used only as prefix, needing exactly zero argument.")
                     error_handler.print_as_fatal_error
                  elseif tmp_feature.type = Void then
                     error_handler.add_position(a.start_position)
                     error_handler.append("This alias can be used only as prefix, needing a Result type.")
                     error_handler.print_as_fatal_error
                  end
               end
            end
            i := i + 1
         end
      end

   a_formal_generic_list
         --  ++ formal_generic_list -> ["[" {formal_generic "," ...} "]"]
         --  ++ formal_generic -> class_text_name ["->" static_type_mark]
         --  ++
      local
         fga: FORMAL_GENERIC_ARG; formal_generic_name: CLASS_NAME; constraint: TYPE_MARK; state: INTEGER
         creation_clause: CREATION_CLAUSE
      do
         formal_generic_list := Void
         if skip1('[') then
            from
               create formal_generic_list.make(pos(start_line, start_column))
               last_class_text.set_formal_generic_list(formal_generic_list)
            until
               state < 0
            loop
               inspect
                  state
               when 0 then
                  -- Waiting for a `formal_generic_name'.
                  if a_base_class_name then
                     formal_generic_name := last_class_name
                     state := 1
                  else
                     state := -2
                  end
               when 1 then
                  -- Waiting for "->" or "," or "]".
                  if skip2('-', '>') then
                     state := 3
                  elseif cc = ',' or else cc = ']' then
                     create fga.make(formal_generic_name, constraint)
                     constraint := Void
                     formal_generic_list.add_last(fga)
                     inspect
                        cc
                     when ',' then
                        state := 0
                     when ']' then
                        state := -1
                     end
                     ok := skip1(cc)
                  else
                     state := -2
                  end
               when 2 then
                  -- Waiting for "," or "]".
                  if cc = ',' or else cc = ']' then
                     create fga.make(formal_generic_name, constraint)
                     constraint := Void
                     formal_generic_list.add_last(fga)
                     inspect
                        cc
                     when ',' then
                        state := 0
                     when ']' then
                        state := -1
                     end
                     ok := skip1(cc)
                  else
                     state := -2
                  end
               when 3 then
                  -- Waiting for a `constraint' type.
                  if a_formal_generic_type_mark then
                     constraint := last_formal_generic_type_mark
                     state := 2
                  elseif a_static_type_mark(False) then
                     constraint := last_type_mark
                     state := 4
                  else
                     error_handler.add_position(current_position)
                     error_handler.append(once "Constraint Class name expected.")
                     error_handler.print_as_fatal_error
                  end
               when 4 then
                  -- Waiting got "create", ",", or "]".
                  if cc = ',' or else cc = ']' then
                     state := 2
                  elseif a_keyword(fz_create) then
                     creation_clause := a_creation_clause(pos(start_line, start_column), False)
                     if a_keyword(fz_end) then
                        constraint.generic_creation := creation_clause
                        state := 2
                     else
                        state := -2
                     end
                  else
                     state := -2
                  end
               end
            end
            inspect
               state
            when -1 then
               if formal_generic_list.count = 0 then
                  error_handler.add_position(formal_generic_list.start_position)
                  error_handler.append(once "Empty formal generic list (deleted).")
                  error_handler.print_as_style_warning
                  formal_generic_list := Void
                  last_class_text.set_formal_generic_list(Void)
               end
            when -2 then
               check
                  nb_errors > 0
               end
            end
         end
      end

   a_function_call: BOOLEAN
         --  ++ function_call -> [actuals] r10 |
         --  ++                   ^
         --  ++
      local
         sfn: FEATURE_NAME; implicit_current: IMPLICIT_CURRENT
      do
         sfn := token_buffer.to_feature_name
         create implicit_current.make(sfn.start_position)
         Result := a_r10(False, implicit_current, sfn, a_actuals)
      end

   a_index_clause (a_indexingable: INDEXINGABLE; a_spec: STRING): BOOLEAN
         --  ++ index_clause -> [identifier ":"] {index_value "," ...}+
         --  ++
      require
         a_indexingable /= Void
      local
         index_clause: INDEX_CLAUSE
      do
         if a_ordinary_feature_name_or_local_name then
            Result := True
            if skip1(':') then
               create index_clause.with_tag(token_buffer.hashed_string, a_spec)
               if a_index_value then
                  index_clause.add_last(last_manifest_string)
               else
                  error_handler.add_position(current_position)
                  error_handler.append(em3)
                  error_handler.print_as_fatal_error
               end
            else
               create index_clause.without_tag(token_buffer.to_manifest_string, a_spec)
            end
         elseif a_manifest_string(True) then
            Result := True
            create index_clause.without_tag(last_manifest_string, a_spec)
         end
         if Result then
            from
            until
               not skip1(',')
            loop
               if a_index_value then
                  index_clause.add_last(last_manifest_string)
               else
                  error_handler.add_position(current_position)
                  error_handler.append(em3)
                  error_handler.print_as_fatal_error
               end
            end
            if a_indexingable /= Void then
               a_indexingable.add_index_clause(index_clause)
               -- may be Void in some check clauses that contain only comments
            end
         end
      end

   a_index_value: BOOLEAN
         --  ++ index_value -> identifier | manifest_constant
         --  ++
      do
         if a_ordinary_feature_name_or_local_name then
            last_manifest_string := token_buffer.to_manifest_string
            Result := True
         elseif a_manifest_string(True) then
            Result := True
         end
      end

   a_indexing (a_indexingable: INDEXINGABLE; a_spec: STRING)
         --  ++ indexing -> "indexing" {index_clause ";" ...}
         --  ++
      local
         has_note: BOOLEAN
      do
         if a_keyword(fz_note) then
            has_note := True
         elseif a_keyword(fz_indexing) then
            error_handler.add_position(pos(start_line, start_column))
            error_handler.append(once "`indexing' is an obsolete keyword, please use `note' instead.")
            error_handler.print_as_warning
            has_note := True
         end
         if has_note then
            from
            until
               not a_index_clause(a_indexingable, a_spec)
            loop
               ok := skip1(';')
            end
         end
      end

   a_infix: BOOLEAN
         --  ++ infix -> "infix" "%"" binary "%""
         --  ++          "infix" "%"" free_operator "%""
         --  ++
      local
         sp: POSITION
      do
         if a_keyword(fz_infix) then
            Result := True
            sp := pos(start_line, start_column)
            if cc = '%"' then
               next_char
            else
               error_handler.add_position(current_position)
               error_handler.append(once "Added missing '%%%"' after %"infix%".")
               error_handler.print_as_warning
            end
            if a_binary(sp) then
            elseif a_free_operator_definition(freeop_infix, sp) then
            else
               error_handler.add_position(current_position)
               error_handler.append(once "Infix operator name expected.")
               error_handler.print_as_fatal_error
            end
            if not skip1('%"') then
               error_handler.add_position(current_position)
               error_handler.append(once "Added missing '%%%"'.")
               error_handler.print_as_warning
            end
         end
      end

   a_inspect: BOOLEAN
         --  ++ inspect -> "inspect" expression
         --  ++            {when_part ...}
         --  ++            ["else" compound]
         --  ++            "end"
         --  ++
      local
         inspect_start_position, else_start_position: POSITION; inspect_expression: EXPRESSION
         when_clause: WHEN_CLAUSE; when_list: FAST_ARRAY[WHEN_CLAUSE]; manifest_string_flag: INTEGER
         inspect_statement: INSPECT_STATEMENT; else_compound: INSTRUCTION
      do
         if a_keyword(fz_inspect) then
            Result := True
            inspect_start_position := pos(start_line, start_column)
            if not a_expression then
               error_handler.add_position(current_position)
               error_handler.append(once "Expression expected (%"inspect ... %").")
               error_handler.print_as_fatal_error
            end
            inspect_expression := last_expression
            if inspect_expression.is_void then
               error_handler.add_position(inspect_expression.start_position)
               error_handler.append(once "Void is not a valid inspect expression (just after keyword %"inspect%").")
               error_handler.print_as_fatal_error
            end
            from
               create when_list.with_capacity(4)
            until
               not a_keyword(fz_when)
            loop
               create when_clause.parser_make(pos(start_line, start_column), get_comment)
               when_list.add_last(when_clause)
               manifest_string_flag := a_when_part(manifest_string_flag, when_clause)
            end
            inspect
               manifest_string_flag
            when 0 then
               create {OTHER_INSPECT_STATEMENT}
                  inspect_statement.make(inspect_start_position,
                                         inspect_expression)
            when 1 then
               create {MANIFEST_STRING_INSPECT_STATEMENT}
                  inspect_statement.with_when_list(inspect_start_position,
                                                   inspect_expression,
                                                   when_list)
            when -1 then
               create {OTHER_INSPECT_STATEMENT}
                  inspect_statement.with_when_list(inspect_start_position,
                                                   inspect_expression,
                                                   when_list)
            end
            if a_keyword(fz_else) then
               else_start_position := pos(start_line, start_column)
               else_compound := a_compound2(once "else of inspect", fz_end)
               inspect_statement.set_else_compound(else_start_position, else_compound)
            elseif not a_keyword(fz_end) then
               error_handler.add_position(current_position)
               error_handler.append(once "Added missing %"end%" keyword to finish this %"inspect%" instruction.")
               error_handler.print_as_warning
            end
            last_instruction := inspect_statement
         end
      end

   a_instruction: BOOLEAN
         --  ++ instruction -> check | debug | conditional | retry |
         --  ++                inspect | loop | old_creation |
         --  ++                c_inline_c | c_inline_h |
         --  ++                create_instruction |
         --  ++                assignment_or_procedure_call [":=" expression ]
         --  ++                expression [":=" expression ]
         --  ++
      local
         dummy: BOOLEAN
      do
         last_instruction := get_comment
         if last_instruction /= Void then
            -- An isolated comment is treated here as an ordinary instruction.
            Result := True
         elseif a_check then
            Result := True
         elseif a_debug then
            Result := True
         elseif a_conditional then
            Result := True
         elseif a_inspect then
            Result := True
         elseif a_loop then
            Result := True
         elseif a_create_instruction then
            Result := True
         elseif a_old_creation then
            Result := True
         elseif a_c_inline_c then
            Result := True
         elseif a_c_inline_h then
            Result := True
         elseif a_assignment_or_procedure_call then
            dummy := a_assignment_call_assigner(False)
            Result := True
         elseif a_retry then
            Result := True
         elseif a_character_constant(Instruction_syntax_flag) then
            Result := True
         elseif a_manifest_string(False) then
            if cc = '.' then
               if last_manifest_string.once_flag then
                  error_handler.add_position(current_position)
                  error_handler.append(em19)
                  error_handler.print_as_warning
               end
               next_char
               Result := just_after_a_dot(True, last_manifest_string)
            elseif cc = '(' then
               if last_manifest_string.once_flag then
                  error_handler.add_position(current_position)
                  error_handler.append(em19)
                  error_handler.print_as_warning
               end
               Result := a_alias_parentheses(True, last_manifest_string)
            elseif cc = '[' then
               if last_manifest_string.once_flag then
                  error_handler.add_position(current_position)
                  error_handler.append(em19)
                  error_handler.print_as_warning
               end
               Result := a_alias_brackets(True, last_manifest_string)
            else
               skip_comments
               if cc = '.' then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Removed unexpected blank space(s) just before this dot (assume %
                      %you really want to apply a procedure using the previous STRING as target).")
                  error_handler.print_as_style_warning
                  if last_manifest_string.once_flag then
                     error_handler.add_position(current_position)
                     error_handler.append(em19)
                     error_handler.print_as_warning
                  end
                  next_char
                  Result := just_after_a_dot(True, last_manifest_string)
               elseif not skipped_new_line and then cc = '(' then
                  Result := a_alias_parentheses(True, last_manifest_string)
               elseif not skipped_new_line and then cc = '[' then
                  Result := a_alias_brackets(True, last_manifest_string)
               else
                  error_handler.add_position(last_manifest_string.start_position)
                  error_handler.add_position(current_position)
                  error_handler.append(once "Dot expected here because a manifest-string alone is not an instruction.")
                  error_handler.print_as_fatal_error
               end
            end
         elseif a_keyword_true then
            create {E_TRUE} last_expression.make(pos(start_line, start_column))
            if (start_line /= line) or else (column /= start_column + 4) or else (cc /= '.') then
               -- I do not want to allow a blank space after the dot here.
               error_handler.add_position(last_expression.start_position)
               error_handler.append(once "Instruction expected here. True alone is not an instruction.")
               error_handler.print_as_fatal_error
            end
            next_char
            Result := just_after_a_dot(True, last_expression)
         elseif a_keyword_false then
            create {E_FALSE} last_expression.make(pos(start_line, start_column))
            if (start_line /= line) or else (column /= start_column + 5) or else (cc /= '.') then
               -- I do not want to allow a blank space after the dot here.
               error_handler.add_position(last_expression.start_position)
               error_handler.append(once "Instruction expected here. False alone is not an instruction.")
               error_handler.print_as_fatal_error
            end
            next_char
            Result := just_after_a_dot(True, last_expression)
         elseif a_assignment_call_assigner(True) then
            Result := True
         else
            check
               not Result
            end
         end
         if Result then
            eiffel_parser_stamp := eiffel_parser_stamp + 1
            last_instruction.set_eiffel_parser_stamp(eiffel_parser_stamp)
         end
      ensure
         Result implies last_instruction /= Void
      end

   eiffel_parser_stamp: INTEGER

   a_loop: BOOLEAN
         --  ++ loop -> "from" compound
         --  ++         ["invariant"] assertion
         --  ++         ["variant" [identifier ":"] expression]
         --  ++         "until" expression
         --  ++         "loop" compound
         --  ++         "end"
         --  ++
      local
         l1, c1, l2, c2: INTEGER; loop_invariant: ASSERTION_LIST
         vc: LOOP_VARIANT; ue: EXPRESSION; i, lb: INSTRUCTION; hc, vc1, vc2: COMMENT
         al: FAST_ARRAY[ASSERTION]; tag_name: TAG_NAME
      do
         if a_keyword(fz_from) then
            Result := True
            l1 := start_line
            c1 := start_column
            i := a_compound1
            if a_keyword(fz_invariant) then
               l2 := start_line
               c2 := start_column
               hc := get_comment
               al := a_assertion
               if hc /= Void or else al /= Void then
                  create loop_invariant.make(pos(l2, c2), hc, al)
               end
            end
            if a_keyword(fz_variant) then
               vc1 := get_comment
               if a_tag_mark then
                  tag_name := last_tag_mark
               end
               vc2 := get_comment
               if a_expression then
                  create vc.make(vc1, tag_name, vc2, last_expression)
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "Variant (INTEGER) Expression Expected.")
                  error_handler.print_as_warning
               end
            end
            if a_keyword(fz_until) then
               if a_expression then
                  ue := last_expression
                  if ue.is_void then
                     error_handler.add_position(ue.start_position)
                     error_handler.append(once "Void is not a valid BOOLEAN expression (just after keyword %"until%" of a loop).")
                     error_handler.print_as_fatal_error
                  end
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "Boolean expression expected (until).")
                  error_handler.print_as_fatal_error
               end
            else
               error_handler.add_position(current_position)
               error_handler.append(once "Keyword %"until%" expected (in a loop).")
               error_handler.print_as_fatal_error
            end
            if cc = ';' then
               error_handler.add_position(current_position)
               error_handler.append(em24)
               error_handler.print_as_style_warning
               ok := skip1(';')
            end
            if not a_keyword(fz_loop) then
               error_handler.add_position(current_position)
               error_handler.append(once "Keyword %"loop%" expected (in a loop).")
               error_handler.print_as_warning
            end
            lb := a_compound2(once "loop body", fz_end)
            create {LOOP_INSTRUCTION} last_instruction.make(pos(l1, c1), i, loop_invariant, vc, ue, lb)
         end
      end

   a_new_export_list
         --  ++ new_export_list -> ["export" {new_export_item ";" ...}]
         --  ++ new_export_item -> clients "all" |
         --  ++                    clients feature_list
         --  ++
      local
         export_list: EXPORT_LIST; sp: POSITION; clients: CLIENT_LIST; items: ARRAY[EXPORT_ITEM]
         new_export_item: EXPORT_ITEM; state: INTEGER
      do
         if a_keyword(fz_export) then
            from
               sp := pos(start_line, start_column)
            until
               state > 3
            loop
               inspect
                  state
               when 0 then
                  -- Waiting for a `clients'.
                  if cc = '{' then
                     clients := a_clients
                     state := 1
                  elseif cc = ';' then
                     error_handler.add_position(current_position)
                     error_handler.append(em24)
                     error_handler.print_as_style_warning
                     ok := skip1(';')
                  else
                     if items /= Void then
                        create export_list.make(sp, items)
                        last_parent_edge.set_export(export_list)
                     end
                     state := 4
                  end
               when 1 then
                  -- `clients' read.
                  if a_keyword(fz_all) then
                     create new_export_item.make_all(clients)
                     if items = Void then
                        create items.with_capacity(2, 1)
                     end
                     items.add_last(new_export_item)
                     state := 2
                  else
                     if a_feature_name_list then
                        create new_export_item.make(clients, last_feature_name_list)
                        if items = Void then
                           create items.with_capacity(2, 1)
                        end
                        items.add_last(new_export_item)
                        state := 2
                     else
                        state := 3
                     end
                  end
               when 2 then
                  -- Waiting ";" before next one.
                  if skip1(';') then
                     state := 0
                  elseif cc = '{' then
                     error_handler.add_position(current_position)
                     error_handler.append(em6)
                     error_handler.print_as_warning
                     state := 0
                  else
                     if items /= Void then
                        create export_list.make(sp, items)
                        last_parent_edge.set_export(export_list)
                     end
                     state := 4
                  end
               when 3 then
                  -- Error.
                  error_handler.add_position(current_position)
                  error_handler.append(em11)
                  error_handler.print_as_fatal_error
               end
            end
         end
      end

   a_parent_list
         --  ++ inherit_text -> ["external" ***]
         --  ++                 ["inherit" {parent ";" ...}]
         --  ++                 ["insert" {parent ";" ...} ]
         --  ++
      local
         inherit_hc, insert_hc: COMMENT; inherit_list, insert_list, add_list: FAST_ARRAY[PARENT_EDGE]
         insert_flag, is_expanded: BOOLEAN; keyword_position: POSITION; native: NATIVE; alias_tag: MANIFEST_STRING
      do
         keyword_position := pos(start_line, start_column)
         if a_keyword(fz_external) then
            if not (last_class_text.is_expanded or else last_class_text.is_deferred) then
               error_handler.append(once "Classes with an external type must be expanded or deferred.")
               error_handler.add_position(keyword_position)
               error_handler.print_as_error
            end
            native := a_external_specification
            alias_tag := a_external_name
            last_class_text.set_external_type(create {EXTERNAL_TYPE}.make(native, alias_tag, keyword_position))
         end
         if a_keyword(fz_inherit) then
            from
               keyword_position := pos(start_line, start_column)
               is_expanded := last_class_text.is_expanded
               if is_expanded then
                  error_handler.append(once "Replaced %"inherit%" with %"insert%". An expanded class cannot inherit from other classes, it can only have an %"insert%" clause.")
                  error_handler.add_position(keyword_position)
                  error_handler.print_as_warning
                  create insert_list.with_capacity(4)
                  add_list := insert_list
                  insert_hc := get_comment
               else
                  create inherit_list.with_capacity(4)
                  add_list := inherit_list
                  inherit_hc := get_comment
               end
               insert_flag := a_keyword(fz_insert)
            until
               insert_flag or else not a_parent_edge(is_expanded)
            loop
               add_list.add_last(last_parent_edge)
               ok := skip1(';')
               last_parent_edge.set_comment(get_comment)
               insert_flag := a_keyword(fz_insert)
            end
            if add_list.is_empty then
               error_handler.append(once "No parent after %"inherit%" keyword (an empty list is not allowed here).")
               error_handler.add_position(keyword_position)
               error_handler.print_as_fatal_error
            end
         end
         if insert_flag or else a_keyword(fz_insert) then
            from
               keyword_position := pos(start_line, start_column)
               if insert_hc = Void then
                  insert_hc := get_comment
               else
                  insert_hc.append(get_comment)
               end
               if insert_list = Void then
                  create insert_list.with_capacity(4)
               end
            until
               not a_parent_edge(True)
            loop
               insert_list.add_last(last_parent_edge)
               ok := skip1(';')
               last_parent_edge.set_comment(get_comment)
            end
            if insert_list.is_empty then
               error_handler.append(once "No parent after %"insert%" keyword (an empty list is not allowed here).")
               error_handler.add_position(keyword_position)
               error_handler.print_as_fatal_error
            end
         end
         last_class_text.create_parent_lists_using(inherit_hc, inherit_list, insert_hc, insert_list)
      end

   a_parent_edge (is_insert_flag: BOOLEAN): BOOLEAN
         --  ++ parent -> static_type_mark
         --  ++           ["rename" rename_list]
         --  ++           new_export_list
         --  ++           ["undefine" feature_name_list]
         --  ++           ["redefine" feature_name_list]
         --  ++           ["end"]
         --  ++
      local
         needs_end: BOOLEAN
      do
         if a_keyword(fz_expanded) then
            error_handler.add_position(pos(start_line, start_column))
            if is_insert_flag then
               error_handler.append(once "There is no need for the %"expanded%" keyword in an %"insert%" clause.%
                                         %This keyword will be ignored.")
               error_handler.print_as_warning
            else
               error_handler.append(once "You are probably trying to use the new inherit/insert mechanism. %
                                         %With Liberty Eiffel, this can be achieved thanks to the new %"insert%" clause. %
                                         %The new %"insert%" clause comes just after the traditional %"inherit%" clause with %
                                         %a similar syntax.")
               error_handler.print_as_fatal_error
            end
         elseif a_keyword(fz_reference) then
            error_handler.add_position(pos(start_line, start_column))
            error_handler.append(once "Unexpected %"reference%" keyword.")
            error_handler.print_as_fatal_error
         end
         if a_type_mark(False) then
            Result := True
            if last_type_mark.is_formal_generic then
               error_handler.add_position(last_type_mark.start_position)
               error_handler.append(once "Cannot use a formal generic argument as a valid parent.")
               error_handler.print_as_fatal_error
            end
            valid_parent_edge_type_check(last_type_mark)
            create last_parent_edge.make(is_insert_flag, last_type_mark)
            if a_keyword(fz_rename) then
               a_rename_list
               if cc = ';' then
                  error_handler.add_position(current_position)
                  error_handler.append(once "Unexpected %";%" to end rename list (deleted).")
                  error_handler.print_as_style_warning
                  ok := skip1(';')
               end
               needs_end := True
            end
            a_new_export_list
            if a_keyword(fz_undefine) then
               if a_feature_name_list then
                  last_parent_edge.set_undefine(last_feature_name_list)
               end
               needs_end := True
            end
            if a_keyword(fz_redefine) then
               if a_feature_name_list then
                  last_parent_edge.set_redefine(last_feature_name_list)
               end
               needs_end := True
            end
            if a_keyword(once "select") then
               error_handler.append(once "The old %"select%" option of the %"inherit%" clause is now obsolete. %
                                    %You have to update your code with the new %"insert%" mechanism. %
                                    %With Liberty Eiffel, this can be achieved thanks to the new %"insert%" clause. %
                                    %The new %"insert%" clause comes just after the traditional %"inherit%" clause with %
                                    %a similar syntax.")
               error_handler.add_position(pos(start_line, start_column))
               error_handler.print_as_fatal_error
            end
            if a_keyword(fz_rename) or else a_keyword(fz_export) or else a_keyword(fz_undefine) or else a_keyword(fz_redefine) then
               error_handler.add_position(pos(start_line, start_column))
               error_handler.append(once "Inheritance option not at a correct place. The correct order is: %"rename... export... %
          %undefine... redefine...%".")
               error_handler.print_as_fatal_error
            end
            if a_keyword(fz_end) then
               if cc = end_of_text then
                  -- This was actually the end of the class:
                  go_back_at(start_line, start_column)
               else
                  needs_end := False
               end
            end
            if needs_end then
               error_handler.add_position(current_position)
               error_handler.append(once "Added missing %"end%" keyword to terminate inherit/insert parent.")
               error_handler.print_as_warning
            end
         end
      end

   a_alias (fn: like last_feature_name): BOOLEAN
         --  ++ alias -> "alias" "%"" unary "%""
         --  ++          "alias" "%"" free_operator "%""
         --  ++
      local
         sp: POSITION
      do
         if a_keyword(fz_alias) then
            sp := pos(start_line, start_column)
            if cc = '%"' then
               next_char
            else
               error_handler.add_position(current_position)
               error_handler.append(once "Character '%%%"' inserted after %"alias%".")
               error_handler.print_as_warning
            end
            if a_binary(sp) then
               fn.name_alias := last_feature_name
               last_feature_name.name_alias := fn
               last_feature_name := fn
            elseif a_unary(sp) then
               fn.name_alias := last_feature_name
               last_feature_name.name_alias := fn
               last_feature_name := fn
            elseif a_free_operator_definition(freeop_alias, sp) then
               fn.name_alias := last_feature_name
               last_feature_name.name_alias := fn
               last_feature_name := fn
            else
               error_handler.add_position(current_position)
               error_handler.append(once "Alias operator name expected.")
               error_handler.print_as_fatal_error
            end
            if not skip1('%"') then
               error_handler.add_position(current_position)
               error_handler.append(once "Character '%%%"' inserted.")
               error_handler.print_as_warning
            end
         end
      end

   a_prefix: BOOLEAN
         --  ++ prefix -> "prefix" "%"" unary "%""
         --  ++           "prefix" "%"" free_operator "%""
         --  ++
      local
         sp: POSITION
      do
         if a_keyword(fz_prefix) then
            sp := pos(start_line, start_column)
            Result := True
            if cc = '%"' then
               next_char
            else
               error_handler.add_position(current_position)
               error_handler.append(once "Added missing '%%%"' after %"prefix%".")
               error_handler.print_as_warning
            end
            if a_unary(sp) then
            elseif a_free_operator_definition(freeop_prefix, sp) then
            else
               error_handler.add_position(current_position)
               error_handler.append(once "Prefix operator name expected.")
               error_handler.print_as_fatal_error
            end
            if not skip1('%"') then
               error_handler.add_position(current_position)
               error_handler.append(once "Added missing '%%%"'.")
               error_handler.print_as_warning
            end
         end
      end

   a_procedure_call: BOOLEAN
         --  ++ procedure_call -> [actuals] r10 |
         --  ++                   ^
         --  ++
      local
         sfn: FEATURE_NAME; implicit_current: IMPLICIT_CURRENT
      do
         sfn := token_buffer.to_feature_name
         create implicit_current.make(sfn.start_position)
         Result := a_r10(True, implicit_current, sfn, a_actuals)
      end

   a_rename_list
         --  ++ rename_list -> {rename_pair "," ...}
         --  ++
      do
         from
         until
            not a_rename_pair
         loop
            ok := skip1(',')
         end
      end

   a_rename_pair: BOOLEAN
         --  ++ rename_pair -> identifier "as" identifier
         --  ++
      local
         name1: FEATURE_NAME; rename_pair: RENAME_PAIR; l, c: INTEGER
      do
         l := line
         c := column
         if a_feature_name then
            name1 := last_feature_name
            if a_keyword(fz_as) then
               if a_feature_name then
                  Result := True
                  create rename_pair.make(name1, last_feature_name)
                  last_parent_edge.add_rename(rename_pair)
               elseif a_expression then
                  error_handler.add_position(last_expression.start_position)
                  error_handler.append(once "Cannot use ")
                  error_handler.add_expression(last_expression)
                  error_handler.append(once " to rename a feature. (Feature name expected.)")
                  error_handler.print_as_fatal_error
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "Second identifier of a %"rename%" pair expected.")
                  error_handler.print_as_fatal_error
               end
            else
               go_back_at(l, c)
            end
         end
      end

   a_routine (expect_routine: BOOLEAN): FEATURE_TEXT
         --  ++ routine -> [indexing]
         --  ++            ["obsolete" manifest_string]
         --  ++            ["require" ["else"] assertion]
         --  ++            ["local" entity_declaration_list]
         --  ++            routine_body
         --  ++            ["ensure" ["then"] assertion]
         --  ++            ["rescue" compound]
         --  ++            "end"
         --  ++
      local
         sp: POSITION; hc, ec: COMMENT; al: FAST_ARRAY[ASSERTION]; else_flag, then_flag, expect_body: BOOLEAN; resc: INSTRUCTION; l, c: INTEGER
      do
         l := line
         c := column
         expect_body := expect_routine
         a_indexing(tmp_feature, Void)
         if a_keyword(fz_obsolete) then
            if a_manifest_string(True) then
               last_manifest_string.set_once_flag(True)
               tmp_feature.set_obsolete_mark(last_manifest_string)
               expect_body := True
            else
               error_handler.add_position(current_position)
               error_handler.append(once "Obsolete manifest string expected.")
               error_handler.print_as_fatal_error
            end
         end
         tmp_feature.set_header_comment(get_comment)
         if a_keyword(fz_require) then
            sp := pos(start_line, start_column)
            else_flag := a_keyword(fz_else)
            hc := get_comment
            tmp_feature.set_require(sp, else_flag, hc, a_assertion)
            expect_body := True
         end
         if a_keyword(fz_local) then
            a_local_var_list
            expect_body := True
         end
         Result := a_routine_body(expect_body)
         if Result = Void then
            go_back_at(l, c)
         else
            if a_keyword(fz_ensure) then
               sp := pos(start_line, start_column)
               inside_ensure_flag := True
               then_flag := a_keyword(fz_then)
               hc := get_comment
               al := a_assertion
               if hc /= Void or else al /= Void then
                  Result.set_ensure_assertion(create {ENSURE_ASSERTION}.make(sp, then_flag, hc, al))
               end
               inside_ensure_flag := False
            end
            if a_keyword(fz_rescue) then
               inside_rescue_flag := True
               resc := a_compound2(fz_rescue, fz_end)
               if not no_rescue then
                  Result.set_rescue_compound(resc)
               end
               inside_rescue_flag := False
            elseif a_keyword(fz_end) then
               if ace.sedb then
                  sp := pos(start_line, start_column)
                  Result.set_sedb_trace_before_exit(sp)
               end
            else
               error_handler.add_position(current_position)
               if skip2(':', '=') or else skip3(':', ':', '=') or else skip2('?', '=') then
                  error_handler.append(once "Such an expression cannot be on the left-hand side of an assignment %
                  %operator. A dot can never be used for the left-hand side part of an assignment operator. %
                  %Valid left-hand side can be Result, some local or the name of an attribute of Current. %
                  %See also http://wiki.liberty-eiffel.org/index.php/Syntax_diagrams#Writable for details.")
                  error_handler.print_as_fatal_error
               else
                  error_handler.append(once "A routine must be ended with %"end%".")
                  error_handler.print_as_warning
               end
            end
            ok := skip1(';')
            ec := get_comment
            if ec /= Void then
               Result.anonymous_feature.set_end_comment(ec)
            end
            local_vars := Void
         end
      ensure
         expect_routine implies Result /= Void
      end

   a_routine_body (expected: BOOLEAN): FEATURE_TEXT
         --  ++ routine_body -> "deferred" |
         --  ++                 "external" external |
         --  ++                 "do" compound ( "then" expression )? |
         --  ++                 "once" compound ( "then" expression )? |
         --  ++                 "attribute"
         --  ++
      local
         l, c: INTEGER
      do
         l := line
         c := column
         if a_keyword(fz_deferred) then
            last_class_text.set_is_deferred
            Result := tmp_feature.as_deferred_routine
         elseif a_keyword(fz_external) then
            Result := a_external
         elseif a_keyword(fz_do) then
            tmp_feature.set_routine_body(a_compound1)
            if a_keyword(fz_then) then
               if a_expression then
                  tmp_feature.set_routine_then(last_expression)
               else
                  error_handler.add_position(current_position)
                  error_handler.append("Expression expected.")
                  error_handler.print_as_fatal_error
               end
            end
            Result := tmp_feature.as_procedure_or_function
         elseif a_keyword(fz_once) then
            tmp_feature.set_routine_body(a_compound1)
            if a_keyword(fz_then) then
               if a_expression then
                  tmp_feature.set_routine_then(last_expression)
               else
                  error_handler.add_position(current_position)
                  error_handler.append("Expression expected.")
                  error_handler.print_as_fatal_error
               end
            end
            Result := tmp_feature.as_once_routine
         elseif a_keyword(fz_then) then
            if a_expression then
               tmp_feature.set_routine_then(last_expression)
            else
               error_handler.add_position(current_position)
               error_handler.append("Expression expected.")
               error_handler.print_as_fatal_error
            end
            Result := tmp_feature.as_procedure_or_function
         elseif a_keyword(once "attribute") then
            Result := tmp_feature.as_writable_attribute
         elseif expected then
            error_handler.add_position(current_position)
            error_handler.append("Routine body expected.")
            error_handler.print_as_fatal_error
         else
            go_back_at(l, c)
         end
      ensure
         expected implies Result /= Void
      end

   a_r1 (left_part: like last_expression)
         --  ++ r1 -> "implies" e1 r1 |
         --  ++       ^
         --  ++
      local
         infix_implies: CALL_INFIX_IMPLIES; sp: POSITION
      do
         if a_keyword(as_implies) then
            sp := pos(start_line, start_column)
            if a_e1 then
               create infix_implies.make(left_part, sp, last_expression)
               a_r1(infix_implies)
            else
               error_handler.add_position(sp)
               error_handler.append(once "Expression expected after 'implies'.")
               error_handler.print_as_error
            end
         else
            last_expression := left_part
         end
      end

   a_r2 (left_part: like last_expression)
         --  ++ r2 -> "or else" e2 r2 |
         --  ++       "or" e2 r2 |
         --  ++       "xor" e2 r2 |
         --  ++       ^
         --  ++
      local
         infix_or_else: CALL_INFIX_OR_ELSE; infix_or: CALL_INFIX_OR; infix_xor: CALL_INFIX_XOR; sp: POSITION
      do
         if a_keyword(as_or) then
            sp := pos(start_line, start_column)
            if a_keyword(fz_else) then
               if a_e2 then
                  create infix_or_else.make(left_part, sp, last_expression)
                  a_r2(infix_or_else)
               else
                  err_exp(sp, False, as_or_else)
               end
            else
               if a_e2 then
                  create infix_or.make(left_part, sp, last_expression)
                  a_r2(infix_or)
               else
                  err_exp(sp, False, as_or)
               end
            end
         elseif a_keyword(as_xor) then
            sp := pos(start_line, start_column)
            if a_e2 then
               create infix_xor.make(left_part, sp, last_expression)
               a_r2(infix_xor)
            else
               err_exp(sp, False, as_xor)
            end
         else
            last_expression := left_part
         end
      end

   a_r3 (left_part: like last_expression)
         --  ++ r3 -> "and then" e3 r3 |
         --  ++       "and" e3 r3 |
         --  ++       ^
         --  ++
      local
         infix_and_then: CALL_INFIX_AND_THEN; infix_and: CALL_INFIX_AND; sp: POSITION
      do
         if a_keyword(as_and) then
            sp := pos(start_line, start_column)
            if a_keyword(fz_then) then
               if a_e3 then
                  create infix_and_then.make(left_part, sp, last_expression)
                  a_r3(infix_and_then)
               else
                  err_exp(sp, False, as_and_then)
               end
            else
               if a_e3 then
                  create infix_and.make(left_part, sp, last_expression)
                  a_r3(infix_and)
               else
                  err_exp(sp, False, as_and)
               end
            end
         else
            last_expression := left_part
         end
      end

   a_r4 (left_part: like last_expression)
         --  ++ r4 -> "=" e4 r4 |
         --  ++       "/=" e4 r4 |
         --  ++       "<=" e4 r4 |
         --  ++       "<" e4 r4 |
         --  ++       ">=" e4 r4 |
         --  ++       ">" e4 r4 |
         --  ++       ^
         --  ++
      require
         left_part /= Void
      local
         call_infix: CALL_INFIX; built_in_eq_neq: BUILT_IN_EQ_NEQ; sp: POSITION
      do
         if skip1('=') then
            sp := pos(start_line, start_column)
            if a_e4 then
               void_current_comparison_check(left_part, last_expression)
               create built_in_eq_neq.make_eq(left_part, sp, last_expression)
               a_r4(built_in_eq_neq)
            else
               err_exp(sp, False, as_eq)
            end
         elseif skip2('/', '=') then
            sp := pos(start_line, start_column)
            if a_e4 then
               void_current_comparison_check(left_part, last_expression)
               create built_in_eq_neq.make_neq(left_part, sp, last_expression)
               a_r4(built_in_eq_neq)
            else
               err_exp(sp, False, as_neq)
            end
         elseif skip2('<', '=') then
            sp := pos(start_line, start_column)
            if a_e4 then
               create {CALL_INFIX_LE} call_infix.make(left_part, sp, last_expression)
               a_r4(call_infix)
            else
               err_exp(sp, False, as_le)
            end
         elseif skip2('>', '=') then
            sp := pos(start_line, start_column)
            if a_e4 then
               create {CALL_INFIX_GE} call_infix.make(left_part, sp, last_expression)
               a_r4(call_infix)
            else
               err_exp(sp, False, as_ge)
            end
         elseif skip1('<') then
            sp := pos(start_line, start_column)
            if a_e4 then
               create {CALL_INFIX_LT} call_infix.make(left_part, sp, last_expression)
               a_r4(call_infix)
            else
               err_exp(sp, False, as_lt)
            end
         elseif skip1unless2('>', '>') then
            sp := pos(start_line, start_column)
            if a_e4 then
               create {CALL_INFIX_GT} call_infix.make(left_part, sp, last_expression)
               a_r4(call_infix)
            else
               err_exp(sp, False, as_gt)
            end
         else
            last_expression := left_part
         end
      end

   a_r5 (left_part: like last_expression)
         --  ++ r5 -> "+" e5 r5 |
         --  ++       "-" e5 r5 |
         --  ++       ^
         --  ++
      local
         infix_plus: CALL_INFIX_PLUS; infix_minus: CALL_INFIX_MINUS; sp: POSITION
      do
         if skip1('+') then
            sp := pos(start_line, start_column)
            no_void_check(left_part, once "Void cannot be the left-hand side of the binary %"+%" operator.")
            if a_e5 then
               create infix_plus.make(left_part, sp, last_expression)
               a_r5(static_simplify(infix_plus))
            else
               err_exp(sp, False, as_plus)
            end
         elseif skip1('-') then
            sp := pos(start_line, start_column)
            no_void_check(left_part, once "Void cannot be the left-hand side of the binary %"-%" operator.")
            if a_e5 then
               create infix_minus.make(left_part, sp, last_expression)
               a_r5(static_simplify(infix_minus))
            else
               err_exp(sp, False, as_minus)
            end
         else
            last_expression := left_part
         end
      end

   a_r6 (left_part: like last_expression)
         --  ++ r6 -> "*" e6 r6 |
         --  ++       "//" e6 r6 |
         --  ++       "\\" e6 r6 |
         --  ++       "/" e6 r6 |
         --  ++       ^
         --  ++
      local
         infix_times: CALL_INFIX_TIMES; infix_int_div: CALL_INFIX_INT_DIV; infix_int_rem: CALL_INFIX_INT_REM
         infix_div: CALL_INFIX_DIV; sp: POSITION
      do
         if skip1('*') then
            sp := pos(start_line, start_column)
            no_void_check(left_part, once "Void cannot be the left-hand side of the binary %"*%" operator.")
            if a_e6 then
               create infix_times.make(left_part, sp, last_expression)
               a_r6(static_simplify(infix_times))
            else
               err_exp(sp, False, as_muls)
            end
         elseif skip2('/', '/') then
            sp := pos(start_line, start_column)
            no_void_check(left_part, once "Void cannot be the left-hand side of the binary %"//%" operator.")
            if a_e6 then
               create infix_int_div.make(left_part, sp, last_expression)
               a_r6(static_simplify(infix_int_div))
            else
               err_exp(sp, False, as_slash_slash)
            end
         elseif skip2('\', '\') then
            sp := pos(start_line, start_column)
            no_void_check(left_part, once "Void cannot be the left-hand side of the binary %"\\%" operator.")
            if a_e6 then
               create infix_int_rem.make(left_part, sp, last_expression)
               a_r6(static_simplify(infix_int_rem))
            else
               err_exp(sp, False, as_backslash_backslash)
            end
         elseif skip1unless2('/', '=') then
            sp := pos(start_line, start_column)
            if a_e6 then
               create infix_div.make(left_part, sp, last_expression)
               a_r6(infix_div)
            else
               err_exp(sp, False, as_slash)
            end
         else
            last_expression := left_part
         end
      end

   a_r7 (left_part: like last_expression)
         --  ++ r7 -> "^" e7 r7 |
         --  ++       ^
         --  ++
      local
         sp: POSITION
      do
         if skip1('^') then
            sp := pos(start_line, start_column)
            no_void_check(left_part, once "Void cannot be the left-hand side of the binary %"^%" operator.")
            if a_e7 then
               a_r7(last_expression)
               create {CALL_INFIX_POWER} last_expression.make(left_part, sp, last_expression)
               last_expression := static_simplify(last_expression)
            else
               err_exp(sp, False, as_pow)
            end
         else
            last_expression := left_part
         end
      end

   a_r8 (left_part: like last_expression)
         --  ++ r8 -> free_operator e8 r8 |
         --  ++       ^
         --  ++
      local
         infix_name: FEATURE_NAME; infix_freeop: CALL_INFIX_FREEOP
      do
         if a_free_operator_usage(freeop_infix) then
            if left_part.is_void then
               error_handler.add_position(left_part.start_position)
               error_handler.add_position(last_feature_name.start_position)
               error_handler.append(once "Void cannot be the left-hand side of infix operator %"")
               error_handler.append(last_feature_name.to_string)
               error_handler.append(once "%".")
               error_handler.print_as_fatal_error
            end
            infix_name := last_feature_name
            if a_e8 then
               create infix_freeop.make(left_part, infix_name, last_expression)
               a_r8(infix_freeop)
            else
               err_exp(infix_name.start_position, False, infix_name.to_string)
            end
         else
            last_expression := left_part
         end
      end

   a_r10 (do_instruction: BOOLEAN; t: EXPRESSION; fn: FEATURE_NAME; eal: EFFECTIVE_ARG_LIST): BOOLEAN
         --  ++ r10 -> "." after_a_dot |
         --  ++        "(" alias_parentheses |
         --  ++        "[" alias_brackets |
         --  ++        ^
         --  ++
      local
         c, l: INTEGER
      do
         c := column
         l := line
         if skip1('.') then
            if t /= Void and then t.is_void then
               error_handler.add_position(t.start_position)
               error_handler.append(once "Void is not a valid target (i.e. just before a dot).")
               error_handler.print_as_fatal_error
            end
            Result := just_after_a_dot(do_instruction, to_call(t, fn, eal))
         elseif not skipped_new_line and then cc = '(' then
            if t /= Void and then t.is_void then
               error_handler.add_position(t.start_position)
               error_handler.append(once "Void is not a valid target (i.e. just before an alias %"()%").")
               error_handler.print_as_fatal_error
            end
            Result := a_alias_parentheses(do_instruction, to_call(t, fn, eal))
         elseif not skipped_new_line and then cc = '[' then
            if t /= Void and then t.is_void then
               error_handler.add_position(t.start_position)
               error_handler.append(once "Void is not a valid target (i.e. just before an alias %"[]%").")
               error_handler.print_as_fatal_error
            end
            Result := a_alias_brackets(do_instruction, to_call(t, fn, eal))
         elseif do_instruction then
            last_instruction := to_proc_call(t, fn, eal)
            if last_instruction /= Void then
               Result := True
            end
         else
            last_instruction := Void
            last_expression := to_call(t, fn, eal)
            Result := True
         end
         if not Result then
            go_back_at(l, c)
         end
      end

   a_tag_mark: BOOLEAN
         --  ++ tag_mark -> identifier ":"
         --  ++
      local
         l, c: INTEGER
      do
         l := line
         c := column
         if a_ordinary_feature_name_or_local_name then
            if skip1(':') then
               Result := True
               last_tag_mark := token_buffer.to_tag_name
            else
               go_back_at(l, c)
            end
         end
      end

   a_type_mark (for_client_list: BOOLEAN): BOOLEAN
         --  ++ type_mark -> static_type_mark |
         --  ++              formal_generic_type_mark |
         --  ++              "like" "Current" |
         --  ++              "like" feature_name |
         --  ++              "like" argument |
         --  ++              "separate" static_type_mark
         --  ++
      local
         sp: POSITION; argument_name_ref: ARGUMENT_NAME_REF
      do
         Result := True
         if a_keyword(fz_like) then
            sp := pos(start_line, start_column)
            if a_keyword_current then
               create {LIKE_CURRENT_TYPE_MARK} last_type_mark.make(sp)
            elseif a_infix then
               create {LIKE_FEATURE_TYPE_MARK} last_type_mark.make(sp, last_feature_name)
            elseif a_prefix then
               create {LIKE_FEATURE_TYPE_MARK} last_type_mark.make(sp, last_feature_name)
            elseif a_ordinary_feature_name_or_local_name then
               if a_argument then
                  argument_name_ref ::= last_expression
                  create {LIKE_ARGUMENT_TYPE_MARK} last_type_mark.make(sp, argument_name_ref)
               else
                  create {LIKE_FEATURE_TYPE_MARK} last_type_mark.make(sp, token_buffer.to_feature_name)
               end
            else
               error_handler.add_position(current_position)
               error_handler.append(once "Anchor expected. An anchor could be `Current', %
               %a feature name or an argument name.")
               error_handler.print_as_fatal_error
            end
         elseif a_keyword(fz_expanded) then
            error_handler.add_position(pos(start_line, start_column))
            error_handler.add_position(current_position)
            error_handler.append(once "No more %"expanded%" keyword allowed here. The obsolete %"expanded FOO%" %
            %notation is no longer accepted.")
            error_handler.print_as_fatal_error
         elseif a_keyword(fz_reference) then
            error_handler.add_position(pos(start_line, start_column))
            error_handler.add_position(current_position)
            error_handler.append(once "No more %"reference%" keyword allowed. The obsolete %"reference FOO%" %
            %notation is no longer accepted. Just use the REFERENCE class instead.")
            error_handler.print_as_fatal_error
         elseif a_keyword(fz_separate) then
            error_handler.add_position(pos(start_line, start_column))
            error_handler.append(once "The SCOOP attempt implementation has been abandoned (December 2006). ")
            error_handler.append(once "The %"separate%" keyword is still a reserved keyword in case of a new implementation attempt...")
            error_handler.print_as_fatal_error
         elseif a_formal_generic_type_mark then
            last_type_mark := last_formal_generic_type_mark
         elseif a_static_type_mark(for_client_list) then
            -- `last_type_mark' already set.
         else
            Result := False
         end
      end

feature {TOKEN_BUFFER}
   pos (l, c: INTEGER): POSITION
      do
         Result.set(l, c, current_id, last_class_text)
      end

feature {}
   valid_parent_edge_type_check (type_mark: TYPE_MARK)
         -- Check that no anchored type are used.
      require
         type_mark /= Void
      local
         i: INTEGER; gl: ARRAY[TYPE_MARK]
      do
         if type_mark.is_anchored then
            error_handler.add_position(type_mark.start_position)
            error_handler.append(once "Cannot use anchored type mark definition as a valid parent.")
            error_handler.print_as_fatal_error
         elseif type_mark.is_formal_generic then
         elseif type_mark.is_generic then
            from
               gl := type_mark.generic_list
               i := gl.lower
            until
               i > gl.upper
            loop
               valid_parent_edge_type_check(gl.item(i))
               i := i + 1
            end
         end
      end

   inside_function_precursor_check (exp: EXPRESSION)
      do
         if not inside_function_flag then
            error_handler.append(once "Inside a procedure, a Precursor call must be a procedure call %
            %(not a function call).")
            error_handler.add_position(exp.start_position)
            error_handler.print_as_fatal_error
         end
      end

   a_unary (sp: POSITION): BOOLEAN
         --  ++ unary -> "not" | "+" | "-"
         --  ++
      do
         if a_keyword(as_not) then
            create last_feature_name.prefix_name(not_name, sp)
            Result := True
         elseif skip1('+') then
            create last_feature_name.prefix_name(plus_name, sp)
            Result := True
         elseif skip1('-') then
            create last_feature_name.prefix_name(minus_name, sp)
            Result := True
         end
      end

   a_when_part (manifest_string_flag: INTEGER; when_clause: WHEN_CLAUSE): INTEGER
         --  ++ when_part -> "when" {when_part_item "," ...} then compound
         --  ++
         --  ++ when_part_item -> constant ".." constant |
         --  ++                   constant
         --  ++
         --  ++ constant -> character_constant | integer_constant | identifier
         --  ++
      require
         manifest_string_flag.in_range(-1, 1)
      local
         state: INTEGER; constant: EXPRESSION
      do
         from
            Result := manifest_string_flag
         until
            state > 3
         loop
            inspect
               state
            when 0 then
               -- Separator read, waiting a constant or "then".
               if a_keyword(fz_then) then
                  if constant /= Void then
                     Result := when_clause.parser_add_value(Result, constant)
                  else
                     error_handler.append(once "Empty %"when%" clause in %"inspect%" statement.")
                     error_handler.add_position(pos(start_line, start_column))
                     error_handler.print_as_fatal_error
                  end
                  when_clause.set_compound(a_compound1)
                  state := 4
               elseif an_allowed_expression_in_when_of_inspect then
                  constant := last_expression
                  state := 1
               elseif cc = ',' then
                  error_handler.add_position(current_position)
                  error_handler.append(em12)
                  error_handler.print_as_style_warning
                  ok := skip1(',')
               else
                  error_handler.add_position(current_position)
                  error_handler.append(em4)
                  error_handler.print_as_fatal_error
               end
            when 1 then
               -- First constant read.
               if a_keyword(fz_then) then
                  if constant /= Void then
                     Result := when_clause.parser_add_value(Result, constant)
                  end
                  when_clause.set_compound(a_compound1)
                  state := 4
               elseif skip2('.', '.') then
                  state := 2
                  inspect
                     Result
                  when 1 then
                     error_handler.add_position(pos(start_line, start_column))
                     error_handler.append(once "Inside an %"inspect%" statement for type STRING, %
                                          %the slice notation %"..%" is not allowed.")
                     error_handler.print_as_fatal_error
                  when -1, 0 then
                     Result := -1
                  end
               elseif skip1(',') then
                  Result := when_clause.parser_add_value(Result, constant)
                  constant := Void
                  state := 0
               else
                  error_handler.add_position(current_position)
                  error_handler.append(em4)
                  error_handler.print_as_fatal_error
               end
            when 2 then
               -- ".." read.
               if an_allowed_expression_in_when_of_inspect then
                  when_clause.add_slice(constant, last_expression)
                  constant := Void
                  state := 3
               else
                  error_handler.add_position(current_position)
                  error_handler.append(em4)
                  error_handler.print_as_fatal_error
               end
            when 3 then
               -- Slice read.
               if skip1(',') then
                  state := 0
               elseif a_keyword(fz_then) then
                  when_clause.set_compound(a_compound1)
                  state := 4
               elseif an_allowed_expression_in_when_of_inspect then
                  constant := last_expression
                  error_handler.add_position(token_buffer.start_position)
                  error_handler.append(em5)
                  error_handler.print_as_warning
                  state := 1
               else
                  error_handler.add_position(current_position)
                  error_handler.append(em4)
                  error_handler.print_as_fatal_error
               end
            end
         end
      ensure
         valid_manifest_string_flag: (Result = -1) or else (Result = 1)
      end

   a_writable: BOOLEAN
         -- Which is Result, some local variable or some writable attribute name.
         -- The `Result' is made available in `last_expression'
      local
         sp: POSITION; l, c: INTEGER
      do
         if a_keyword_result then
            sp := pos(start_line, start_column)
            if inside_function_flag then
               create {RESULT} last_expression.make(sp)
            else
               error_handler.add_position(sp)
               error_handler.append(em14)
               error_handler.print_as_fatal_error
            end
            Result := True
         else
            l := line
            c := column
            if a_ordinary_feature_name_or_local_name then
               if a_local_name_ref then
                  Result := True
               elseif a_argument then
                  go_back_at(l, c)
                  check
                     not Result
                  end
               else
                  last_expression := token_buffer.to_writable_attribute_name
                  Result := True
               end
            end
         end
      end

   mandatory_writable: EXPRESSION
         -- Skip and return the writable which is mandatory here.
      do
         if a_writable then
            Result := last_expression
         elseif a_keyword_current then
            error_handler.add_position(pos(start_line, start_column))
            error_handler.append(once "Writable entity expected here (`Current' is not writable).")
            error_handler.print_as_fatal_error
         elseif a_ordinary_feature_name_or_local_name and then a_argument then
            error_handler.add_position(last_expression.start_position)
            error_handler.append(once "Writable entity expected here. Argument ")
            error_handler.add_expression(last_expression)
            error_handler.append(once " is not writable.")
            error_handler.print_as_fatal_error
         else
            error_handler.add_position(current_position)
            error_handler.append(once "Writable entity expected here.")
            error_handler.print_as_fatal_error
         end
      ensure
         Result /= Void
      end

   to_call (t: EXPRESSION; fn: FEATURE_NAME; eal: EFFECTIVE_ARG_LIST): EXPRESSION
      require
         t /= Void
      do
         if fn = Void then
            check
               eal = Void
            end
            Result := t
         elseif eal = Void then
            create {FUNCTION_CALL_0} Result.make(t, fn)
         elseif eal.count = 1 then
            create {FUNCTION_CALL_1} Result.make(t, fn, eal)
         else
            create {FUNCTION_CALL_N} Result.make(t, fn, eal)
         end
      end

   to_proc_call (t: EXPRESSION; fn: FEATURE_NAME; eal: EFFECTIVE_ARG_LIST): PROCEDURE_CALL
      do
         if fn = Void then
            error_handler.add_position(current_position)
            error_handler.append(once "An expression has a result value. This is not an instruction.")
            error_handler.print_as_fatal_error
         elseif eal = Void then
            create {PROCEDURE_CALL_0} Result.make(t, fn)
         elseif eal.count = 1 then
            create {PROCEDURE_CALL_1} Result.make(t, fn, eal)
         else
            create {PROCEDURE_CALL_N} Result.make(t, fn, eal)
         end
      end

   a_ordinary_feature_name_or_local_name: BOOLEAN
         -- Is there some name here which looks like an ordinary feature name or which looks like an ordinary local
         -- variable name (`Result' is not an ordinary local name). If such a name is detected, the corresponding
         -- identifier is made available in `token_buffer'.
      local
         backward_column: INTEGER; stop, lower_case_letter_encountered, may_be_a_keyword: BOOLEAN
         not_an_identifier: BOOLEAN
      do
         if cc.is_letter then
            from
               lower_case_letter_encountered := cc.is_lower
               backward_column := column
               may_be_a_keyword := True
               token_buffer.reset(line, backward_column)
               token_buffer.extend(cc)
            until
               stop
            loop
               next_char
               inspect
                  cc
               when 'a' .. 'z' then
                  lower_case_letter_encountered := True
                  token_buffer.extend(cc)
               when 'A' .. 'Z' then
                  if lower_case_letter_encountered then
                     error_handler.add_position(pos(line, column))
                     error_handler_append_info_about_feature_name
                     error_handler.print_as_fatal_error
                  else
                     not_an_identifier := True
                     stop := True
                  end
               when '0' .. '9', '_' then
                  may_be_a_keyword := False
                  token_buffer.extend(cc)
               else
                  stop := True
               end
            end
            if not_an_identifier then
               cc := token_buffer.buffer.first
               column := backward_column
               check
                  not Result
               end
            elseif may_be_a_keyword and then token_buffer.isa_keyword then
               cc := token_buffer.buffer.first
               column := backward_column
               check
                  not Result
               end
            else
               Result := True
               skip_comments
            end
         end
      end

   a_non_allowed_very_strange_identifier: BOOLEAN
         -- Is there some name here which looks like a very strange identifier (not `a_ordinary_feature_name_or_local_name'
         -- and not `a_class_name' and not a keyword). If such a weird name is detected, the corresponding identifier
         -- is made available in the `token_buffer'. The `current_position' is never changed whatever the Result. In case
         -- of a True `Result', the `error_handler' is automatically preloaded with the beginning of the error message.
      local
         backward_column: INTEGER; stop, lower_case_letter_encountered, upper_case_letter_encountered, may_be_a_keyword: BOOLEAN
      do
         if cc.is_letter then
            from
               if cc.is_lower then
                  lower_case_letter_encountered := True
                  may_be_a_keyword := True
               else
                  upper_case_letter_encountered := True
               end
               backward_column := column
               token_buffer.reset(line, backward_column)
               token_buffer.extend(cc)
            until
               stop
            loop
               next_char
               inspect
                  cc
               when 'a' .. 'z' then
                  lower_case_letter_encountered := True
                  token_buffer.extend(cc)
               when 'A' .. 'Z' then
                  upper_case_letter_encountered := True
                  may_be_a_keyword := False
                  token_buffer.extend(cc)
               when '0' .. '9', '_' then
                  may_be_a_keyword := False
                  token_buffer.extend(cc)
               else
                  stop := True
               end
            end
            -- In any case, we go back:
            cc := token_buffer.buffer.first
            column := backward_column
            if not lower_case_letter_encountered then
               -- It may be a valid class name:
               check
                  not Result
               end
            elseif may_be_a_keyword and then token_buffer.isa_keyword then
               -- Well, that's a keyword:
               check
                  not Result
               end
            elseif not upper_case_letter_encountered then
               -- It may be a valid `a_ordinary_feature_name_or_local_name':
               check
                  not Result
               end
            else
               error_handler.add_position(current_position)
               error_handler.append(once "%"")
               error_handler.append(token_buffer.buffer)
               error_handler.append(once "%" is not valid identifier. For a better readability Liberty Eiffel _is_ case %
               %sensitive. Hence %"")
               error_handler.append(token_buffer.buffer)
               error_handler.append(once "%" cannot be a valid class name (only upper case letters are allowed in class names). %"")
               error_handler.append(token_buffer.buffer)
               error_handler.append(once "%" cannot be a valid feature name or a valid local name (only lower case letters are %
               %allowed here). Furthermore %"")
               error_handler.append(token_buffer.buffer)
               error_handler.append(once "%" is not valid keyword.%"")
               Result := True
            end
         end
      end

   show_nb (nb: INTEGER; tail: STRING)
      do
         if nb > 0 then
            echo.w_put_string(fz_error_stars)
            echo.w_put_integer(nb)
            echo.w_put_string(tail)
            if nb > 1 then
               echo.w_put_character('s')
            end
            echo.w_put_string(once ".%N")
         end
      end

   tmp_feature: TMP_FEATURE

   faof: FAST_ARRAY[FEATURE_TEXT]
      once
         create Result.with_capacity(256)
      end

   err_exp (sp: POSITION; prefix_flag: BOOLEAN; operator: STRING)
         -- When an error occurs in the right hand side of some `operator'.
      local
         msg: STRING
      do
         msg := "Right hand side expression of "
         if prefix_flag then
            msg.append(fz_prefix)
         else
            msg.append(fz_infix)
         end
         msg.append(" %"")
         msg.append(operator)
         msg.append("%" expected.")
         error_handler.add_position(sp)
         error_handler.append(msg)
         error_handler.print_as_fatal_error
      end

   expression_with_comment (e: EXPRESSION): EXPRESSION
         -- There is some following comment, `e' may be wrapped
         -- inside some EXPRESSION_WITH_COMMENT object.
      local
         c: COMMENT
      do
         c := get_comment
         if c = Void or else c.count = 0 then
            Result := e
         else
            create {EXPRESSION_WITH_COMMENT} Result.make(e, c)
         end
      end

   unknown_external_language (external_tag: MANIFEST_STRING)
      do
         error_handler.add_position(external_tag.start_position)
         error_handler.append(once "Unknown external language specification.")
         error_handler.print_as_fatal_error
      end

   unused_once_warning_check
      do
         if last_manifest_string.once_flag then
            error_handler.add_position(last_manifest_string.start_position)
            error_handler.append(em18)
            error_handler.print_as_warning
         end
      end

   create_infix_prefix (freeop: INTEGER_8; l, c: INTEGER)
      require
         freeop.in_range(freeop_prefix, freeop_alias)
      local
         operator: HASHED_STRING
      do
         operator := string_aliaser.hashed_string(buffer)
         inspect
            freeop
         when freeop_prefix then
            create last_feature_name.prefix_name(operator, pos(l, c))
         when freeop_infix then
            create last_feature_name.infix_name(operator, pos(l, c))
         when freeop_alias then
            create last_feature_name.alias_name(operator, pos(l, c))
         end
      end

   anchored_creation_check (type: TYPE_MARK)
      do
         if type.is_anchored then
            if type.is_like_current then
               -- Liberty Eiffel relaxed rule because there is no risk at all
               -- to allow create {like Current}.
            else
               error_handler.add_position(type.start_position)
               error_handler.append(once "Explicit creation/create type mark should not be anchored.")
               error_handler.print_as_warning
            end
         end
      end

   void_current_comparison_check (e1, e2: EXPRESSION)
      require
         e1 /= Void
         e2 /= Void
      do
         void_current_comparison_check_(e1, e2)
         void_current_comparison_check_(e2, e1)
      end

   void_current_comparison_check_ (e1, e2: EXPRESSION)
      do
         -- Forbid comparison of `Current' with Void (may be useful for beginners):
         if e1.is_current and then e2.is_void then
            error_handler.add_position(e1.start_position)
            error_handler.add_position(e2.start_position)
            error_handler.append(once "In an object-oriented language, the receiver of a call is always associated to %
                                 %some existing object (i.e. `Current' is never Void). Hence, such a weird %
                                 %comparison is not allowed.")
            error_handler.print_as_fatal_error
         end
      end

   a_precursor_type_mark (sp: POSITION): TYPE_MARK
         -- To continue the work after the first '{'.
      do
         if not a_type_mark(False) then
            error_handler.add_position(current_position)
            error_handler.append(em32)
            error_handler.print_as_fatal_error
         else
            Result := last_type_mark
            if not Result.is_static then
               error_handler.add_position(sp)
               error_handler.add_position(Result.start_position)
               error_handler.add_position(current_position)
               error_handler.append(once "A Precursor type mark annotation must not be anchored.")
               error_handler.print_as_fatal_error
            elseif not skip1('}') then
               error_handler.add_position(current_position)
               error_handler.append(em36)
               error_handler.print_as_fatal_error
            end
         end
      ensure
         Result /= Void
      end

   a_keyword_precursor: BOOLEAN
      do
         Result := a_keyword(as_precursor) or else a_keyword(once "precursor")
         -- Stay relax Dominique ;-)
      end

   no_static_simplify: BOOLEAN
      once
         Result := smart_eiffel.pretty_flag or else smart_eiffel.short_or_class_check_flag
      end

   static_simplify (expression: EXPRESSION): EXPRESSION
      require
         expression /= Void
      do
         if no_static_simplify then
            Result := expression
         else
            Result := expression.static_simplify
         end
      ensure
         Result /= Void
      end

   manifest_just_after_a_dot (sign_flag: CHARACTER; do_instruction: BOOLEAN; target: EXPRESSION): BOOLEAN
      require
         target /= Void
      do
         Result := just_after_a_dot(do_instruction, target)
         if target.extra_bracket_flag then
            error_handler.add_position(target.start_position)
            error_handler.append(once "Because of the usual low priority of prefix minus, `-foo.bar' is %
            %actually equivalent to `-(foo.bar)'. In order to avoid a possible mistake here, it is mandatory %
            %for you to add extra parentheses here. You can wrap ")
            error_handler.add_expression(target)
            error_handler.append(once " or the whole expression as well. It's up to you to decide now.")
            error_handler.print_as_fatal_error
         end
      end

   a_keyword_void: BOOLEAN
      do
         if a_keyword(as_void) then
            Result := True
         elseif a_keyword(once "void") then
            error_handler.add_position(pos(start_line, start_column))
            error_handler.append(once "Replaced misspelled %"Void%".")
            error_handler.print_as_warning
            Result := True
         end
      end

   a_keyword_result: BOOLEAN
      do
         if a_keyword(as_result) then
            Result := True
         elseif a_keyword(once "result") then
            error_handler.add_position(pos(start_line, start_column))
            error_handler.append(once "Replaced misspelled %"Result%".")
            error_handler.print_as_warning
            Result := True
         end
      end

   a_keyword_current: BOOLEAN
      do
         if a_keyword(as_current) then
            Result := True
         elseif a_keyword(once "current") then
            error_handler.add_position(pos(start_line, start_column))
            error_handler.append(once "Replaced misspelled %"Current%".")
            error_handler.print_as_warning
            Result := True
         end
      end

   a_keyword_true: BOOLEAN
      do
         if a_keyword(fz_true) then
            Result := True
         elseif a_keyword(once "true") then
            error_handler.add_position(pos(start_line, start_column))
            error_handler.append(once "Replaced misspelled %"True%".")
            error_handler.print_as_warning
            Result := True
         end
      end

   a_keyword_false: BOOLEAN
      do
         if a_keyword(fz_false) then
            Result := True
         elseif a_keyword(once "false") then
            error_handler.add_position(pos(start_line, start_column))
            error_handler.append(once "Replaced misspelled %"False%".")
            error_handler.print_as_warning
            Result := True
         end
      end

   no_void_check (expression: EXPRESSION; msg: STRING)
      require
         expression /= Void
         msg /= Void
      do
         if expression.is_void then
            error_handler.add_position(expression.start_position)
            error_handler.append(msg)
            error_handler.print_as_fatal_error
         end
      end

feature {}
   make
      do
         create tmp_feature.initialize
         tmp_feature.done
      end

   unused_tmp_features: STACK[TMP_FEATURE]
      once
         create Result.make
      end

end -- class EIFFEL_PARSER
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://liberty-eiffel.blogspot.com - liberty-eiffel.blogspot.com
-- ------------------------------------------------------------------------------------------------------------------------------
