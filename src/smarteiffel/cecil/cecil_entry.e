-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CECIL_ENTRY

inherit
   CODE

creation {CECIL_FILE}
   make

feature {ANY}
   c_name: STRING
         -- The external C name used to call the Eiffel code (as given in -cecil file).

   target_type_mark: TYPE_MARK
         -- The one which is written in the -cecil file (i.e. its `start_position' is in the -cecil
         -- file). Obviously, it is a static one (i.e. with no anchors).

   feature_name: FEATURE_NAME
         -- Of the feature to be called (also the one of the -cecil file with its correct
         -- `start_position').

   is_creation: BOOLEAN
         -- True if the function must call a creation procedure and return the created object (as
         -- given in the -cecil file).

   code: CODE
         -- The `code' to be called from C.

   target_type: TYPE
         -- Alias of `target_type_mark.type'. Static `target_type' of the target of the feature to be called.

   feature_stamp: FEATURE_STAMP -- *** VIRER??? ***
         -- The corresponding one of `target_type' and `feature_name'.

   start_position: POSITION is
      do
         Result := feature_name.start_position
      end

   accept (visitor: CECIL_ENTRY_VISITOR) is
      do
         visitor.visit_cecil_entry(Current)
      end

   specialize_in (type: TYPE): like Current is
      do
         check
            False
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      do
         check
            False
         end
      end

   specialize_2 (type: TYPE): EXPRESSION is
      do
         check
            False
         end
      end

   adapt_for (type: TYPE): like Current is
      do
         check
            False
         end
      end

   use_current (type: TYPE): BOOLEAN is
      do
         if code /= Void then
            Result := code.use_current(type)
         end
      end

   safety_check (type: TYPE) is
      do
         if code /= Void then
            code.safety_check(type)
         end
      end

   collect (type: TYPE): TYPE is
      local
         fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE
      do
         if code /= Void then
            Result := code.collect(type)
         end
         fs := target_type.lookup(feature_name)
         af := fs.anonymous_feature(target_type)
         assignment_handler.from_external(target_type, af.arguments, af.result_type)
         if is_creation then
            if target_type.canonical_type_mark.class_text_name.to_string = as_typed_internals then
               error_handler.add_position(target_type_mark.start_position)
               error_handler.append(once "The type for a creation procedure cannot be INTERNALS.%N")
               error_handler.print_as_fatal_error
            end
            if target_type.is_deferred then
               error_handler.add_position(target_type_mark.start_position)
               error_handler.append(once "The type for a creation procedure cannot be deferred.%N")
               error_handler.print_as_fatal_error
            end
         end
      end

   has_been_specialized: BOOLEAN is
      do
         -- cannot return False since it is used in some assertions (see `collect')
         Result := True
      end

   side_effect_free (type: TYPE): BOOLEAN is
      do
         check
            False
         end
      end

   pretty (indent_level: INTEGER) is
      do
         check
            False
         end
      end

feature {ANY}
   anonymous_feature: ANONYMOUS_FEATURE is
      local
         fs: FEATURE_STAMP
      do
         fs := target_type.lookup(feature_name)
         Result := fs.anonymous_feature(target_type)
      ensure
         Result /= Void
      end

feature {CECIL_FILE}
   get_started (cecil_file: CECIL_FILE) is
         -- Called only once to initialize `target_type', `code' and `feature_stamp'.
      require
         cecil_file /= Void
         target_type = Void
         feature_stamp = Void
         may_report_an_error: error_handler.is_empty
      local
         dummy: BOOLEAN; fs: FEATURE_STAMP; fake_target: FAKE_TARGET
      do
         target_type := target_type_mark.type
         if not target_type.valid_feature_name(feature_name) then
            error_handler.add_position(target_type_mark.start_position)
            error_handler.add_position(feature_name.start_position)
            error_handler.append(once "Unknown feature name ")
            error_handler.append(feature_name.to_string)
            error_handler.append(once " in type ")
            error_handler.append(target_type.name.to_string)
            error_handler.append(once ".")
            error_handler.print_as_error
            error_handler.append(once "Error while loading features of cecil path file %"")
            error_handler.append(cecil_file.path)
            error_handler.append(once "%".")
            error_handler.print_as_fatal_error
         end
         if is_creation then
            if target_type_mark.class_text.creation_clause_list = Void then
               fs := any_default_create_fs.resolve_static_binding_for(smart_eiffel.type_any, target_type)
               if not fs.name.is_equal(feature_name) then
                  error_handler.append(once "Type ")
                  error_handler.append(target_type.name.to_string)
                  error_handler.append(once " has no creation list. You must use the default creation method %
                                       %(named `default_create' in class ANY, or just omit the method name).")
                  error_handler.add_position(target_type_mark.start_position)
                  error_handler.add_position(feature_name.start_position)
                  error_handler.print_as_fatal_error
               end
            else
               dummy := target_type_mark.class_text.has_creation_check(feature_name, feature_name.start_position, Void)
               check
                  dummy
               end
            end
         end
         fs := target_type.lookup(feature_name)
         create fake_target.make(target_type_mark.start_position, target_type_mark)
         code := fs.fake_feature_call(target_type_mark.start_position, fake_target, target_type)
         on_echo(cecil_file)
      ensure
         target_type /= Void
         feature_stamp /= Void
         code /= Void
         may_report_an_error: error_handler.is_empty
      end

feature {ANONYMOUS_FEATURE, CODE}
   simplify (type: TYPE): CODE is
      do
         check
            False
         end
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         check
            False
         end
      end

feature {ANY}
   on_echo (cecil_file: CECIL_FILE) is
      do
         if is_creation then
            echo.put_string(once "%Tcreate {")
         else
            echo.put_string(once "%T{")
         end
         echo.put_string(target_type.name.to_string)
         echo.put_string(once "}.")
         echo.put_string(feature_name.to_string)
         echo.put_string(once " (from -cecil %"")
         echo.put_string(cecil_file.path)
         echo.put_string(once "%").%N")
      end

   inline_dynamic_dispatch (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         check
            type.is_any
         end
         code_accumulator.open_new_context
         code.inline_dynamic_dispatch_(code_accumulator, type)
         code := code_accumulator.current_context_to_code
         code_accumulator.close_current_context
      end

feature {CECIL_POOL}
   run_feature: RUN_FEATURE is
      do
         Result := feature_stamp.run_feature_for(target_type)
      end

feature {}
   make (cn: like c_name; ttm: like target_type_mark; fn: like feature_name; c: like is_creation) is
      require
         cn /= Void
         ttm /= Void
         fn /= Void
      do
         c_name := cn
         target_type_mark := ttm
         feature_name := fn
         is_creation := c
      ensure
         c_name = cn
         target_type_mark = ttm
         feature_name = fn
         is_creation = c
      end

invariant
   c_name /= Void

   target_type_mark /= Void

   feature_name /= Void

end -- class CECIL_ENTRY
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
