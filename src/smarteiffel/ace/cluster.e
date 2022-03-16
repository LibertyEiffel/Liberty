-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CLUSTER
   --
   -- A CLUSTER description. Such an object is created for each cluster
   -- entry of the ACE file in ACE file mode, but also for each directory of
   -- the loading path for the ordinary command line mode.
   --

inherit
   VISITABLE
      redefine is_equal
      end

insert
   GLOBALS
      redefine is_equal
      end
   ASSERTION_LEVEL_NUMBERING
      redefine is_equal
      end
   DEBUG_KEY_SUPPORT
      export {ACE, CLUSTER_VISITOR} add_default_debug_key
      redefine is_equal
      end

create {CLASSES_TREE}
   make

create {SMART_EIFFEL}
   for_pretty

feature {ACE}
   tree: CLASSES_TREE
         -- backlink to the classes tree

feature {ACE}
   remove (a_class_text: CLASS_TEXT)
      require
         a_class_text.cluster = Current
      do
         class_text_map.remove(a_class_text.name.hashed_name)
      end

feature {ACE, EIFFELDOC}
   class_text (class_name: CLASS_NAME; load: BOOLEAN): CLASS_TEXT
      require
         has(class_name.hashed_name)
      local
         hs: HASHED_STRING
      do
         hs := class_name.hashed_name
         Result := class_text_map.reference_at(hs)
         if Result = Void and then load then
            check
               pool.cluster_class(hs) /= Void
            end
            if parser_buffer_for(hs, class_name.allow_missing) then
               Result := smart_eiffel.analyze_class(class_name, Current)
            elseif not class_name.allow_missing then
               error_handler.add_position(class_name.start_position)
               error_handler.append(once "Could not load class in cluster ")
               error_handler.append(directory_path)
               error_handler.print_as_error
            end
         end
      end

feature {CLASSES_TREE}
   has (class_name: HASHED_STRING): BOOLEAN
      do
         Result := pool.has(class_name)
      end

   class_text_count: INTEGER
      do
         Result := pool.class_count
      end

   loaded_class_count: INTEGER
      do
         Result := class_text_map.count
      end

feature {ANY}
   for_all (action: PROCEDURE[TUPLE[CLASS_TEXT]])
      local
         i: INTEGER
      do
         from
            i := class_text_map.lower
         until
            i > class_text_map.upper
         loop
            action.call([class_text_map.item(i)])
            i := i + 1
         end
      end

   for_all_filtered (name_guard: PREDICATE[TUPLE[CLASS_NAME]]; action: PROCEDURE[TUPLE[CLASS_TEXT]])
      do
         pool.for_all_filtered(name_guard, action)
      end

feature {CLUSTER_POOL_DATA}
   do_action (class_name: CLASS_NAME; action: PROCEDURE[TUPLE[CLASS_TEXT]])
      do
         action.call([class_text(class_name, True)])
      end

feature {CLASS_TEXT}
   register_class_text (a_class_text: CLASS_TEXT)
      require
         a_class_text.cluster = Current
      do
         class_text_map.add(a_class_text, a_class_text.name.hashed_name)
      end

feature {}
   class_text_map: DICTIONARY[CLASS_TEXT, HASHED_STRING]

feature {}
   parser_buffer_for (a_name: HASHED_STRING; allow_missing: BOOLEAN): BOOLEAN
         -- The algorithm to search some class on the disk using the `a_name' key which is usually some simple
         -- class name using the standard notation, but which can also be any other kind of notation (even
         -- file path notation). When the `Result' is True, the `parser_buffer' is ready to be used.
      require
         not parser_buffer.is_ready
      local
         cluster: CLUSTER; entry: CLUSTER_CLASS; buffer: STRING
      do
         entry := pool.cluster_class(a_name)
         if entry /= Void then
            cluster := entry.cluster
            Result := prepare_parser_buffer_for(entry.path)
         end
         if not Result and then not allow_missing then
            echo.w_put_string("Unable to find file for class %"")
            echo.w_put_string(a_name.to_string)
            echo.w_put_string("%". ")
            buffer := once ""
            buffer.clear_count
            ace.view_in(buffer)
            echo.w_put_string(buffer)
         end
      end

   prepare_parser_buffer_for (file_path: STRING): BOOLEAN
         -- Try to prepare the `parser_buffer' assuming `file_path' is the path to a class of the `Current'
         -- cluster.
      require
         file_path /= Void
      do
         parser_buffer.load_file(file_path)
         Result := parser_buffer.is_ready
         if Result then
            parser_buffer.set_cluster(Current)
         end
      end

feature {ANY}
   accept (visitor: CLUSTER_VISITOR)
      do
         visitor.visit_cluster(Current)
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := other.directory_path = directory_path
      end

feature {CLASSES_TREE, CLUSTER_VISITOR}
   view_in (msg: STRING)
      local
         i: INTEGER
      do
         if name /= Void then
            msg.append(name)
            msg.extend(':')
         end
         msg.extend('%"')
         msg.append(directory_path)
         msg.extend('%"')
         msg.extend('%N')
         if ace.file_path /= Void then
            if include_list /= Void then
               msg.append("   include ")
               from
                  i := include_list.lower
               until
                  i > include_list.upper
               loop
                  msg.extend('%"')
                  msg.append(include_list.item(i))
                  msg.extend('%"')
                  msg.extend(';')
                  i := i + 1
               end
               msg.extend('%N')
            end
            if exclude_list /= Void then
               msg.append("   exclude ")
               from
                  i := exclude_list.lower
               until
                  i > exclude_list.upper
               loop
                  msg.extend('%"')
                  msg.append(exclude_list.item(i))
                  msg.extend('%"')
                  msg.extend(';')
                  i := i + 1
               end
               msg.extend('%N')
            end
            msg.append("   default assertion (")
            msg.append(level_name(default_assertion_level))
            msg.extend(')')
         end
         msg.extend('%N')
      end

   get_started (highest_encountered_level: INTEGER)
         -- Called after the parsing of the whole ACE file (or the whole command line).
      require
         highest_encountered_level.in_range(level_boost, level_all)
      do
         if default_assertion_level = level_boost then
            if highest_encountered_level > level_boost then
               default_assertion_level := level_no
            end
         end
      end

   show
      do
         if class_text_count > 0 then
            echo.put_string(once ": ")
            echo.put_integer(class_text_count)
            echo.put_string(once " class")
            if pool.class_count > 1 then
               echo.put_string(once "es")
            end
         end
      end

   pretty_in (txt: STRING)
         -- Performs the `ace_check' and also prepare in `txt' a pretty version
         -- of the Ace file as it is memorized (can be also used to pretty
         -- one's ACE file).
      require
         ace.file_path /= Void
      local
         i, l: INTEGER; basic_directory: BASIC_DIRECTORY; cn: CLASS_NAME
      do
         txt.append("   ")
         if name /= Void then
            txt.append(name)
            txt.append(": ")
         end
         txt.extend('%"')
         txt.append(directory_path)
         txt.extend('%"')
         basic_directory.connect_to(directory_path)
         txt.extend('%N')
         if basic_directory.is_connected then
            basic_directory.disconnect
         else
            txt.append(" --*** ERROR: directory %"")
            txt.append(directory_path)
            txt.append("%" not found or not readable ***%N")
         end
         if include_list /= Void then
            txt.append("      include ")
            from
               i := include_list.lower
            until
               i > include_list.upper
            loop
               txt.extend('%"')
               txt.append(include_list.item(i))
               txt.extend('%"')
               i := i + 1
               if i <= include_list.upper then
                  txt.extend(';')
               end
            end
            txt.extend('%N')
         end
         if exclude_list /= Void then
            txt.append("      exclude ")
            from
               i := exclude_list.lower
            until
               i > exclude_list.upper
            loop
               txt.extend('%"')
               txt.append(exclude_list.item(i))
               txt.extend('%"')
               i := i + 1
               if i <= exclude_list.upper then
                  txt.extend(';')
               end
            end
            txt.extend('%N')
         end
         txt.append("      default%N")
         txt.append("         assertion (")
         txt.append(level_name(default_assertion_level))
         txt.append(")%N")
         if default_trace /= '%U' then
            txt.append("         trace (")
            inspect
               default_trace
            when 'n' then
               txt.append("no")
            when 'y' then
               txt.append("yes")
            end
            txt.append(")%N")
         end
         if option_assertion_level /= Void then
            txt.append("      option%N")
         end
         if option_assertion_level /= Void then
            from
               i := option_assertion_level.lower
            until
               i > option_assertion_level.upper
            loop
               l := option_assertion_level.item(i)
               cn := option_assertion_level.key(i)
               txt.append("         assertion (")
               txt.append(level_name(l))
               txt.append("): ")
               txt.append(cn.to_string)
               txt.append("%N")
               if not parser_buffer_for(cn.hashed_name, True) then
                  error_handler.add_position(cn.start_position)
                  error_handler.append(once "No such class in this cluster.")
                  error_handler.print_as_error
               else
                  parser_buffer.release
               end
               i := i + 1
            end
         end
         txt.append("      end")
         if name /= Void then
            txt.append(" -- ")
            txt.append(name)
         end
         txt.extend('%N')
      end

   read_classes
      local
         bd: BASIC_DIRECTORY; ft: FILE_TOOLS; path, file_name: STRING; class_name: HASHED_STRING; entry: CLUSTER_CLASS
      do
         if directory_path.is_empty then
            bd.connect_to_current_working_directory
            path := once ""
            path.copy(bd.last_entry)
         else
            bd.connect_to(directory_path)
            path := directory_path
         end
         if bd.is_connected then
            from
               bd.read_entry
            until
               bd.end_of_input
            loop
               if bd.last_entry.has_suffix(once ".e") or else bd.last_entry.has_suffix(once ".E") then
                  file_name := once ""
                  file_name.copy(bd.last_entry)
                  if exclude_list = Void or else not exclude_list.has(file_name) then
                     bd.compute_file_path_with(path, file_name)
                     if ft.is_file(bd.last_entry) then
                        file_name.remove_tail(2)
                        file_name.to_upper
                        class_name := string_aliaser.hashed_string(file_name)
                        file_name := bd.last_entry
                        entry := pool.cluster_class(class_name)
                        if entry /= Void then
                           if not entry.path.is_equal(file_name) then
                              -- because foo.e and FOO.E can coexist in the same directory
                              error_handler.append(once "The definition of ")
                              error_handler.append(class_name.to_string)
                              error_handler.append(once " in ")
                              error_handler.append(entry.path)
                              error_handler.append(once " is hiding the definition in ")
                              error_handler.append(file_name)
                              error_handler.print_as_warning
                           end
                        else
                           pool.add_cluster_class(class_name, file_name.twin)
                        end
                     end
                  end
               end
               bd.read_entry
            end
            bd.disconnect
         end
      end

   include_parsing
      local
         i: INTEGER; fn: STRING
      do
         if include_list /= Void then
            from
               i := include_list.lower
            until
               i > include_list.upper
            loop
               fn := include_list.item(i)
               file_name_buffer.copy(fn)
               if not parser_buffer_load then
                  error_handler.append(once "Cannot find include %"")
                  error_handler.append(fn)
                  error_handler.append(once "%" in cluster %"")
                  error_handler.append(directory_path)
                  error_handler.append(once "%" (check your ACE file).")
                  error_handler.print_as_fatal_error
               end
               smart_eiffel.parse_include(fn)
               i := i + 1
            end
         end
      end

feature {ACE}
   set_default_trace (flag: BOOLEAN)
      do
         if flag then
            default_trace := 'y'
         else
            default_trace := 'n'
         end
      end

   set_default_assertion_level (level: INTEGER)
      require
         level.in_range(level_boost, level_all)
      do
         default_assertion_level := level
      ensure
         default_assertion_level = level
      end

   set_option_assertion_level (class_name: CLASS_NAME; level: INTEGER)
      require
         class_name /= Void
         level.in_range(level_boost, level_all)
      local
         cn: CLASS_NAME
      do
         if option_assertion_level = Void then
            create {HASHED_DICTIONARY[INTEGER, CLASS_NAME]} option_assertion_level.make
         end
         if option_assertion_level.has(class_name) then
            error_handler.add_position(class_name.start_position)
            cn := option_assertion_level.internal_key(class_name)
            error_handler.add_position(cn.start_position)
            error_handler.append(once "Same class name appears twice.")
            error_handler.print_as_fatal_error
         end
         option_assertion_level.put(level, class_name)
      end

   assertion_level_of (class_name: CLASS_NAME): INTEGER
      require
         class_name /= Void
      do
         check
            Result = level_not_computed -- Is actually 0.
         end
         if option_assertion_level /= Void then
            if option_assertion_level.has(class_name) then
               Result := option_assertion_level.at(class_name)
            end
         end
         if Result = level_not_computed then
            Result := default_assertion_level
            if Result = level_not_computed then
               Result := level_all
            end
         end
      ensure
         Result.in_range(level_boost, level_all)
      end

   add_option_debug_key (class_name: CLASS_NAME; key: STRING)
      require
         class_name /= Void
         not key.is_empty
      local
         fas: FAST_ARRAY[STRING]
      do
         if option_debug_keys = Void then
            create {HASHED_DICTIONARY[FAST_ARRAY[STRING], CLASS_NAME]} option_debug_keys.make
         end
         fas := option_debug_keys.reference_at(class_name)
         if fas = Void then
            create fas.with_capacity(4)
            option_debug_keys.add(fas, class_name)
         end
         fas.add_last(key)
      end

   debug_check (class_name: CLASS_NAME; e_debug: DEBUG_COMPOUND): BOOLEAN
      local
         fas: FAST_ARRAY[STRING]
      do
         if option_debug_keys = Void then
            if default_debug_keys = Void then
               Result := ace.default_debug(e_debug)
            else
               Result := match_debug_keys(e_debug, default_debug_keys)
            end
         else
            fas := option_debug_keys.reference_at(class_name)
            if fas /= Void then
               Result := match_debug_keys(e_debug, fas)
            elseif default_debug_keys = Void then
               Result := ace.default_debug(e_debug)
            else
               Result := match_debug_keys(e_debug, default_debug_keys)
            end
         end
      end

   add_option_trace (class_name: CLASS_NAME)
      require
         class_name /= Void
      do
         if option_trace = Void then
            create {HASHED_SET[CLASS_NAME]} option_trace.make
         end
         option_trace.add(class_name)
      end

   trace (class_name: CLASS_NAME): BOOLEAN
      do
         if option_trace = Void then
            Result := default_trace_or_ace_default_trace
         elseif option_trace.has(class_name) then
            Result := True
         else
            Result := default_trace_or_ace_default_trace
         end
      end

   include_add_last (file_name: STRING)
      require
         file_name /= Void
      do
         if include_list = Void then
            create include_list.with_capacity(16)
         end
         include_list.add_last(file_name)
      end

   exclude_add_last (file_name: STRING)
      require
         file_name /= Void
      do
         if exclude_list = Void then
            create exclude_list.with_capacity(16)
         end
         exclude_list.add_last(file_name)
      end

feature {ANY}
   name: STRING

   directory_path: STRING

feature {}
   default_assertion_level: INTEGER
         -- The default one for this cluster.

   default_trace: CHARACTER
         -- The default trace selection for this cluster ('%U'|'y'|'n').

   default_trace_or_ace_default_trace: BOOLEAN
         -- If any, gives the default trace of this `Current' cluster
         -- otherwise the `default_trace' of `ace'.
      do
         inspect
            default_trace
         when '%U' then
            Result := ace.default_trace
         when 'y' then
            Result := True
         when 'n' then
         end
      end

   option_assertion_level: DICTIONARY[INTEGER, CLASS_NAME]

   option_debug_keys: DICTIONARY[FAST_ARRAY[STRING], CLASS_NAME]

   option_trace: SET[CLASS_NAME]

   make (a_name: like name; path: like directory_path; a_tree: like tree)
      require
         a_name /= Void
         string_aliaser.registered_one(a_name)
         path /= Void
         a_tree /= Void
      do
         -- If you add a new attribute to CLUSTER, initialize it in `init' if it is also relevant for pretty.
         -- Initialize it here (in `make') otherwise.
         directory_path := path
         init(a_name, ace.default_assertion_level)
         ace.new_cluster(Current)
         tree := a_tree
         create {HASHED_DICTIONARY[TYPE, HASHED_STRING]} type_dictionary.make
         read_classes
      ensure
         directory_path /= Void
         string_aliaser.registered_one(directory_path)
      end

   parser_buffer_load: BOOLEAN
      do
         if directory_path.is_empty then
            path_buffer.copy(file_name_buffer)
         else
            path_buffer.copy(directory_path)
            system_tools.file_path(path_buffer, file_name_buffer)
         end
         parser_buffer.load_file(path_buffer)
         Result := parser_buffer.is_ready
         if Result then
            parser_buffer.set_cluster(Current)
         end
      end

   file_name_buffer: STRING
         -- Temporary buffer to store some file name like eg. "array.e".
      once
         create Result.make(64)
      end

   path_buffer: STRING
         -- Temporary buffer to store some file path like eg.
         -- "../lib/kernel/array.e".
      once
         create Result.make(256)
      end

   include_list: FAST_ARRAY[STRING]

   exclude_list: FAST_ARRAY[STRING]

   for_pretty
      do
         init(pretty_name, level_all)
      end

   pretty_name: STRING
      once
         Result := string_aliaser.string(once "pretty dummy cluster")
      ensure
         string_aliaser.registered_one(Result)
      end

   type_dictionary: DICTIONARY[TYPE, HASHED_STRING]

   pool: CLUSTER_POOL_DATA

   init (a_name: like name; assertion_level: like default_assertion_level)
      require
         a_name /= Void
         string_aliaser.registered_one(a_name)
      do
         name := a_name
         default_assertion_level := assertion_level
         create {HASHED_DICTIONARY[CLASS_TEXT, HASHED_STRING]} class_text_map.make
         create pool.make(Current)
      end

invariant
   name /= Void

end -- class CLUSTER
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
