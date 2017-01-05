-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class GLOBALS
--
-- Global Tools for the Liberty Eiffel system.
--

insert
   ALIASED_STRING_LIST
   FROZEN_STRING_LIST

feature {ANY}
   frozen smart_eiffel: SMART_EIFFEL
      once
         create Result
      end

   frozen eiffel_parser: EIFFEL_PARSER
      once
         create Result.make
      end

   frozen ace: ACE
      once
         create Result
      end

   frozen ini_parser: INI_PARSER
      once
         create Result.serc
      end

   frozen plugin_config: INI_PARSER
      once
         create Result.plugin
      end

   frozen error_handler: ERROR_HANDLER
      once
         create Result
      end

   frozen string_aliaser: STRING_ALIASER
      once
         create Result.make
      end

   frozen cpp: C_PRETTY_PRINTER
      once
         create Result.make
      end

   frozen pretty_printer: PRETTY_PRINTER
      once
         create Result.make
      end

   frozen mini_buffer: MINI_BUFFER
      once
         create Result
      end

   nb_errors: INTEGER
      do
         Result := error_handler.error_counter
      ensure
         Result >= 0
      end

   frozen system_tools: SYSTEM_TOOLS
      once
         create Result.make
      end

   frozen introspection_handler: INTROSPECTION_HANDLER
      once
         create Result.make
      end

   frozen assignment_test_pool: ASSIGNMENT_TEST_POOL
      once
         create Result.make
      end

   frozen precomputable_routine_detector: PRECOMPUTABLE_ROUTINE_DETECTOR
      once
         create Result.make
      end

   frozen feature_accumulator: FEATURE_ACCUMULATOR
      once
         create Result.make
      end

   frozen live_type_extra_collectors: FAST_ARRAY[LIVE_TYPE_EXTRA_COLLECTOR]
      once
         create Result.make(0)
      end

feature {ACE}
   is_launcher: BOOLEAN
         -- If True, the clusters list will not be retrieved (it means that the tool is only used to start
         -- other tools; it does not load classes itself)
      do
         Result := is_launcher_memory.item
      end

feature {SE, COMPILE}
   set_launcher
      do
         is_launcher_memory.set_item(True)
      ensure
         is_launcher
      end

feature {}
   is_launcher_memory: REFERENCE[BOOLEAN]
      once
         create Result
      end

feature {SMART_EIFFEL, SYSTEM_TOOLS, VISITOR}
   frozen parser_buffer: PARSER_BUFFER
      once
         create Result.make
      end

feature {ANY}
   frozen id_provider: ID_PROVIDER
      once
         create Result.make
      end

   frozen manifest_string_pool: MANIFEST_STRING_POOL
      once
         create Result
      end

   frozen manifest_generic_pool: MANIFEST_GENERIC_POOL
      once
         create Result
      end

   frozen once_routine_pool: ONCE_ROUTINE_POOL
      once
         create Result
      end

   frozen agent_pool: AGENT_POOL
      once
         create Result
      end

   frozen cecil_pool: CECIL_POOL
      do
         Result := cecil_pool_memory.item
      end

   frozen cecil_pool_memory: REFERENCE[CECIL_POOL]
      once
         create Result
      end

   frozen set_cecil_pool
      once
         cecil_pool_memory.set_item(create {CECIL_POOL})
      ensure
         cecil_pool /= Void
      end

   frozen short_printer: SHORT_PRINTER
      once
         create Result.make
      end

   frozen echo: ECHO
      once
         create Result.make
      end

   frozen assignment_handler: ASSIGNMENT_HANDLER
      once
         create Result
      end

   frozen thread_pool: THREAD_POOL
      once
         create Result
      end

   frozen exceptions: EXCEPTIONS

   frozen exceptions_handler: EXCEPTIONS_HANDLER
      once
         create Result.make
      end

   nb_warnings: INTEGER
      do
         Result := error_handler.warning_counter
      ensure
         Result >= 0
      end

   tmp_path: STRING
      once
         create Result.make(512)
      end

   tmp_file_read: TEXT_FILE_READ
      once
         create Result.make
      end

   class_any: CLASS_TEXT
      local
         cn: CLASS_NAME
      once
         create cn.unknown_position(string_aliaser.hashed_string(as_any), False)
         Result := smart_eiffel.class_text(cn)
      end

   frozen omitted_client_list: CLIENT_LIST
         -- (To avoid multiple creation(s).)
      once
         create Result.omitted
      end

   any_default_create_fs: FEATURE_STAMP
      once
         Result := smart_eiffel.type_any.feature_stamp_of(default_create_name)
         if Result = Void then
            error_handler.append(once "Feature `default_create' not found in class ANY. %
                                 %Really, you should not try to write or modify the ANY class provided with Liberty Eiffel.")
            error_handler.print_as_fatal_error
         end
      end

   any_default_rescue_fs: FEATURE_STAMP
      once
         Result := smart_eiffel.type_any.feature_stamp_of(default_rescue_name)
         if Result = Void then
            error_handler.append(once "Feature `default_rescue' not found in class ANY. %
                                 %Really, you should not try to write or modify the ANY class provided with Liberty Eiffel.")
            error_handler.print_as_fatal_error
         end
      end

   any_copy_fs: FEATURE_STAMP
      once
         Result := smart_eiffel.type_any.feature_stamp_of(copy_name)
         if Result = Void then
            error_handler.append(once "Feature `copy' not found in class ANY. %
                                 %Really, you should not try to write or modify the ANY class provided with Liberty Eiffel.")
            error_handler.print_as_fatal_error
         end
      end

   any_is_equal_fs: FEATURE_STAMP
      once
         Result := smart_eiffel.type_any.feature_stamp_of(is_equal_name)
         if Result = Void then
            error_handler.append(once "Feature `is_equal' not found in class ANY. %
                                 %Really, you should not try to write or modify the ANY class provided with Liberty Eiffel.")
            error_handler.print_as_fatal_error
         end
      end

   any_deep_twin_fs: FEATURE_STAMP
      once
         Result := smart_eiffel.type_any.feature_stamp_of(deep_twin_name)
         if Result = Void then
            error_handler.append(once "Feature `deep_twin' not found in class ANY. %
                                 %Really, you should not try to write or modify the ANY class provided with Liberty Eiffel.")
            error_handler.print_as_fatal_error
         end
      end

   any_is_deep_equal_fs: FEATURE_STAMP
      once
         Result := smart_eiffel.type_any.feature_stamp_of(is_deep_equal_name)
         if Result = Void then
            error_handler.append(once "Feature `is_deep_equal' not found in class ANY. %
                                 %Really, you should not try to write or modify the ANY class provided with Liberty Eiffel.")
            error_handler.print_as_fatal_error
         end
      end

   boolean_and_then_fs: FEATURE_STAMP
      local
         tb: TYPE; fn: FEATURE_NAME
      once
         tb := smart_eiffel.type_boolean
         create fn.infix_name(and_then_name, tb.class_text.name.start_position)
         Result := tb.lookup(fn)
      end

   manifest_make_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_manifest_make)
      end

   manifest_put_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_manifest_put)
      end

   manifest_semicolon_check_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_manifest_semicolon_check)
      end

   manifest_initialize_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_manifest_initialize)
      end

   calloc_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_calloc)
      end

   put_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_put)
      end

   item_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_item)
      end

   is_empty_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_is_empty)
      end

   make_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_make)
      end

   from_external_sized_copy_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_from_external_sized_copy)
      end

   count_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_count)
      end

   storage_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_storage)
      end

   capacity_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_capacity)
      end

   storage_lower_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_storage_lower)
      end

   mark_item_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_mark_item)
      end

   mark_native_arrays_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_mark_native_arrays)
      end

   and_then_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_and_then)
      end

   or_else_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_or_else)
      end

   twin_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_twin)
      end

   copy_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_copy)
      end

   is_equal_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_is_equal)
      end

   deep_twin_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_deep_twin)
      end

   deep_twin_from_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_deep_twin_from)
      end

   is_deep_equal_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_is_deep_equal)
      end

   deep_memcmp_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_deep_memcmp)
      end

   se_atexit_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_se_atexit)
      end

   default_rescue_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_default_rescue)
      end

   default_create_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_default_create)
      end

   flush_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_flush)
      end

   clear_all_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_clear_all)
      end

   from_pointer_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_from_pointer)
      end

   no_errors: BOOLEAN
      do
         Result := nb_errors = 0
      end

   character_coding (c: CHARACTER; str: STRING)
         -- Append in `str' the Eiffel coding of the character (Table in chapter 25 of ETL, page 423).
         -- When  the % letter notation exists, it is returned in priority: '%N' gives "%N", '%T'
         -- gives "%T", etc.
         -- When % letter notation does not exists (not in the ETL table), numbered coding
         -- used ("%/1/", "%/2/" etc).
      local
         special: CHARACTER
      do
         inspect
            c
         when '%A' then
            special := 'A'
         when '%B' then
            special := 'B'
         when '%C' then
            special := 'C'
         when '%D' then
            special := 'D'
         when '%F' then
            special := 'F'
         when '%H' then
            special := 'H'
         when '%L' then
            special := 'L'
         when '%N' then
            special := 'N'
         when '%Q' then
            special := 'Q'
         when '%R' then
            special := 'R'
         when '%S' then
            special := 'S'
         when '%T' then
            special := 'T'
         when '%U' then
            special := 'U'
         when '%V' then
            special := 'V'
         when '%%' then
            special := '%%'
         when '%'' then
            special := '%''
         when '%"' then
            special := '"'
         when '%(' then
            special := '('
         when '%)' then
            special := ')'
         when '%<' then
            special := '<'
         when '%>' then
            special := '>'
         else
         end
         str.extend('%%')
         if special = '%U' then
            str.extend('/')
            c.code.append_in(str)
            str.extend('/')
         else
            str.extend(special)
         end
      end

   eiffel_suffix: STRING ".e"
         -- Eiffel Source file suffix.

   c_suffix: STRING ".c"
         -- C files suffix.

   h_suffix: STRING ".h"
         -- Heading C files suffix.

   c_plus_plus_suffix: STRING ".cpp"
         -- C++ files suffix.

   backup_suffix: STRING ".bak"
         -- Backup suffix for command `pretty'.

   class_suffix: STRING ".class"

   dot_precedence: INTEGER 12
         -- The highest precedence value according to ETL.

   atomic_precedence: INTEGER 13
         -- Used for atomic elements.

   append_u1 (str: STRING; u1: INTEGER)
      require
         --|*** u1.in_range(-128, +127) -- *** Don't know how it can work .... *** (Dom sept 10th 2004) ***
      do
         str.extend(u1.to_character)
      end

   append_u2 (str: STRING; u2: INTEGER)
      require
         --|*** u2.in_range(0, 65535) -- *** Don't know how it can work .... *** (Dom sept 10th 2004) ***
      do
         append_u1(str, u2 // 256)
         append_u1(str, u2 \\ 256)
      end

   append_u4 (str: STRING; u4: INTEGER)
      require
         --|*** u4.in_range(0, Maximum_integer) -- *** Don't know how it can work .... *** (Dom sept 10th 2004) ***
      do
         append_u2(str, u4 // 65536)
         append_u2(str, u4 \\ 65536)
      end

   is_install: BOOLEAN
      do
         Result := install_memory.item
      end

   set_install
      do
         install_memory.set_item(True)
      ensure
         is_install
      end

   install_memory: REFERENCE[BOOLEAN]
      once
         create Result
      end

   unrelated_code: INTEGER_8 0
   inserts_code: INTEGER_8 1
   inherits_code: INTEGER_8 2

   strings: STRING_RECYCLING_POOL
      once
         create Result.make
      end

feature {} -- an option to minimize generic types
   shrink_generic_types: BOOLEAN
      do
         Result := shrink_generic_types_memory.item
      end

   shrink_generic_types_memory: REFERENCE[BOOLEAN]
         -- Set the item to True if you want less generic type duplication
      once
         create Result
      end

end -- class GLOBALS
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
