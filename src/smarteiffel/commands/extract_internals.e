-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EXTRACT_INTERNALS

inherit
   CODE_PRINTER
      undefine is_equal
      end
   INTROSPECTION_HANDLER
      redefine
         make
      end
   CREATION_CLAUSE_LIST_VISITOR
      undefine is_equal
      end
   CREATION_CLAUSE_VISITOR
      undefine is_equal
      end

insert
   EXTERNAL_TOOL
      undefine is_equal
      end

create {}
   make

feature {ANY}
   make
      local
         plugin_factory: FAKE_PLUGIN_FACTORY
      do
         bootstrap
         set_cecil_pool
         create plugin_factory.make
         system_tools.set_plugin_factory(plugin_factory)
         smart_eiffel.compile(Current)
      end

   parse_arguments
      local
         argi: INTEGER; arg: STRING
      do
         search_for_verbose_flag
         from
            argi := 1
         until
            argi > argument_count
         loop
            arg := argument(argi)
            if is_help_flag(arg) then
            elseif is_verbose_flag(arg) then
            elseif is_version_flag(arg) then
            elseif is_flymake_mode_flag(arg) then
            elseif is_style_warning_flag(arg) then
            elseif is_no_warning_flag(arg) then
            elseif is_a_compilation_level_flag(arg) then
            elseif is_debug_flag(arg) then
            elseif is_cecil_flag(arg, argi) then
            elseif flag_match(fz_loadpath, arg) then
               if argi < argument_count then
                  system_tools.add_loadpath_file(argument(argi + 1))
                  argi := argi + 1
               else
                  echo.w_put_string(command_line_name)
                  echo.w_put_string(once ": missing loadpath file path after -loadpath flag.%N")
                  die_with_code(exit_failure_code)
               end
            elseif root_class_name = Void then
               root_class_name := arg
            elseif root_procedure_name = Void then
               root_procedure_name := arg
            end
            argi := argi + 1
         end
         if root_class_name = Void then
            system_tools.bad_use_exit(command_line_name, usage)
         end
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
         Result := is_version_flag(arg)
            or else is_flymake_mode_flag(arg)
            or else is_style_warning_flag(arg)
            or else is_no_warning_flag(arg)
            or else is_verbose_flag(arg)
      end

   compile
      local
         live_types: TRAVERSABLE[LIVE_TYPE]
         i: INTEGER
         live_type: LIVE_TYPE
         helper_name: STRING
         class_file_name, cecil_file_name, header_name: STRING
         class_stream, cecil_stream: TEXT_FILE_WRITE
         tm: TYPE_MARK
      do
         helper_name := ace.root_class_name.to_string.twin
         helper_name.append("_INTERNALS_HELPER")
         class_file_name := helper_name.as_lower
         cecil_file_name := class_file_name.twin
         header_name := cecil_file_name.twin
         class_file_name.append(".e")
         cecil_file_name.append(".se")
         header_name.append(".ih")
         create cecil_stream.connect_to(cecil_file_name)
         cecil_stream.put_string(header_name)
         cecil_stream.put_new_line
         create class_stream.connect_to(class_file_name)
         class_stream.put_string("expanded class ")
         class_stream.put_string(helper_name)
         class_stream.put_string("%N%Nobsolete%N%T%"You don't need to use ")
         class_stream.put_string(helper_name)
         class_stream.put_string(" anymore, ")
         class_stream.put_string(cecil_file_name)
         class_stream.put_string(" is enough%"%N%N%
%insert%N%
%   INTERNALS_HANDLER%N%N%
%feature%N%
%   storable_quit is%N%
%      do%N%
%         storable_quit_with_code(exit_success_code)%N%
%      end%N%N%
%   storable_quit_with_code (code: INTEGER) is%N%
%      do%N%
%         die_with_code(code)%N%
%      end%N%N%
%end -- class ")
         class_stream.put_string(helper_name)
         class_stream.put_new_line
         class_stream.disconnect
         live_types := smart_eiffel.live_type_map
         from
            i := live_types.lower
         until
            i > live_types.upper
         loop
            live_type := live_types.item(i)
            tm := live_type.canonical_type_mark
            if introspection_handler.is_introspected(tm) then
               put_live_fields(cecil_stream, live_type)
               if tm.is_native_array then
                  put_native_array_internals(cecil_stream, live_type)
               else
                  put_create_call(cecil_stream, live_type)
                  put_call(cecil_stream, live_type, as_to_internals, False)
               end
            end
            i := i + 1
         end
         cecil_stream.disconnect
      end

   valid_argument_for_ace_mode: STRING "Only the flags -verbose, -version, -help, and -flymake_mode are allowed in%N%
       %ACE file mode.%N"

   use_short_mode: BOOLEAN False

   usage: STRING "[
      Usage: extract_internals [options] <RootClass> <RootProcedure> ...
         or: extract_internals [options] <ACEfileName>.ace

      Generate object marshalling support files.

      Option summary:

      Information:
        -help               Display this help information
        -version            Display Liberty Eiffel version information
        -verbose            Display detailed information about what the program is
                             doing

      Warning levels:
        -style_warning      Print warnings about style violations
        -no_warning         Don't print any warnings

      Message styles:
        -flymake_mode       Display messages in a compact format suitable for
                             processing by tools such as Emacs' Flymake mode

   ]"

feature {}
   put_live_fields (cecil_stream: OUTPUT_STREAM; live_type: LIVE_TYPE)
      local
         wa: ARRAY[RUN_FEATURE_2]
         i: INTEGER
         rf: RUN_FEATURE_2
         name: STRING
      do
         echo.put_string(live_type.name.to_string)
         echo.put_new_line
         wa := live_type.writable_attributes
         if wa /= Void then
            from
               i := wa.lower
            until
               i > wa.upper
            loop
               rf := wa.item(i)
               name := rf.name.to_string
               put_call(cecil_stream, live_type, name, False)
               i := i + 1
            end
         end
      end

   put_native_array_internals (cecil_stream: OUTPUT_STREAM; live_type: LIVE_TYPE)
      local
         unknown_position: POSITION
         nai_lt: LIVE_TYPE
      do
         nai_lt := live_type.canonical_type_mark.typed_internals_type_mark(unknown_position).type.live_type
         put_call(cecil_stream, nai_lt, once "make_blank", True)
      end

   put_call (cecil_stream: OUTPUT_STREAM; live_type: LIVE_TYPE; name: STRING; is_creation: BOOLEAN)
      do
         cecil_stream.put_string(once "ih")
         if is_creation then
            cecil_stream.put_string(once "new")
         end
         cecil_stream.put_integer(live_type.id)
         cecil_stream.put_string(name)
         cecil_stream.put_character('%T')
         cecil_stream.put_string(live_type.name.to_string)
         cecil_stream.put_character('%T')
         cecil_stream.put_string(name)
         if is_creation then
            cecil_stream.put_string(once "%Tcreate")
         end
         cecil_stream.put_new_line
      end

   put_create_call (cecil_stream: OUTPUT_STREAM; live_type: LIVE_TYPE)
      local
         ccl: CREATION_CLAUSE_LIST; fs: FEATURE_STAMP; name: STRING
      do
         ccl := live_type.class_text.creation_clause_list
         if ccl = Void then
            fs := any_default_create_fs.resolve_static_binding_for(smart_eiffel.type_any, live_type.type)
            name := fs.name.to_string
         else
            name := ccl.list.first.procedure_list.first.to_string
         end
         put_call(cecil_stream, live_type, name, True)
      end

   tm_internals_handler: CLASS_TYPE_MARK
      local
         cn_internals_handler: CLASS_NAME
      once
         create cn_internals_handler.unknown_position(string_aliaser.hashed_string(as_internals_handler), False)
         create Result.make(cn_internals_handler)
      end

   creation_procedures (type_mark: TYPE_MARK): FAST_ARRAY[WEIGHTED_CREATION_PROCEDURE]
      require
         not_done_to_report_errors: error_handler.is_empty -- required by gives_permission_to
      local
         ccl: CREATION_CLAUSE_LIST
         list: FAST_ARRAY[CREATION_CLAUSE]
         type: TYPE
         creation_clause: CREATION_CLAUSE
         i, j: INTEGER
         procedure_list: FEATURE_NAME_LIST
         creation_name: FEATURE_NAME
         creation_feature_stamp: FEATURE_STAMP
         creation_feature_weight: WEIGHTED_CREATION_PROCEDURE
      do
         create Result.with_capacity(4)
         ccl := type_mark.class_text.creation_clause_list
         if ccl /= Void then
            list := ccl.list
            type := type_mark.type
            from
               i := list.lower
            until
               i > list.upper
            loop
               creation_clause := list.item(i)
               if creation_clause.clients.gives_permission_to(tm_internals_handler, type) then
                  procedure_list := creation_clause.procedure_list
                  if procedure_list /= Void then
                     from
                        j := 1
                     until
                        j > procedure_list.count
                     loop
                        creation_name := procedure_list.item(j)
                        if creation_name.to_string /= as_manifest_creation then
                           creation_feature_stamp := type.lookup(creation_name)
                           create creation_feature_weight.make(creation_feature_stamp, creation_name.to_string, type)
                           Result.add_last(creation_feature_weight)
                        end
                        j := j + 1
                     end
                  end
               end
               i := i + 1
            end
            (create {REVERSE_COLLECTION_SORTER[WEIGHTED_CREATION_PROCEDURE]}).sort(Result)
         end
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

   resolved_creations: FAST_ARRAY[STRING]
      once
         create Result.with_capacity(4096)
      end

   creation_pending: FAST_ARRAY[BOOLEAN]
      once
         create Result.with_capacity(4096)
      end

   resolved_creation (type: TYPE): STRING
      require
         type /= Void
      local
         type_id: INTEGER
      do
         type_id := type.id
         if resolved_creations.valid_index(type_id) then
            Result := resolved_creations.item(type_id)
         end
      end

   is_pending (type: TYPE): BOOLEAN
      require
         type /= Void
      local
         type_id: INTEGER
      do
         type_id := type.id
         if creation_pending.valid_index(type_id) then
            Result := creation_pending.item(type_id)
         end
      end

   set_pending (type: TYPE)
      require
         type /= Void
      local
         type_id: INTEGER
      do
         type_id := type.id
         creation_pending.force(True, type_id)
      end

feature {CREATION_CLAUSE_LIST}
   visit_creation_clause_list (visited: CREATION_CLAUSE_LIST)
      do
      end

feature {CREATION_CLAUSE}
   visit_creation_clause (visited: CREATION_CLAUSE)
      do
      end

end -- class EXTRACT_INTERNALS
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
