-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class CALL_0
   --
   -- For calls without argument (only Current).
   --

inherit
   FUNCTION_CALL

feature {ANY}
   arg_count: INTEGER 0

   frozen arguments: EFFECTIVE_ARG_LIST
      do
      end

   set_arguments (a: like arguments)
      do
         check
            a = Void
         end
      end

   specialize_in (type: TYPE): like Current
         ----------- Duplicate code call_0/proc_call_0  -----------
      local
         fs: like feature_stamp; t: like target
      do
         t := target.specialize_in(type)
         if target.is_current then
            fs := type.search(feature_name)
            if fs = Void then
               smart_eiffel.unknown_feature_fatal_error(target, type, feature_name)
            end
            if feature_stamp = Void then
               feature_stamp := fs
            end
         end
         Result := current_or_twin_init(t, fs)
      ensure then
         target.is_current = old target.is_current
         to_save_memory: target.is_current implies feature_stamp /= Void
         Result.target.is_current implies Result.feature_stamp.has_type(type)
         Result /= Current implies Result.feature_stamp /= feature_stamp or else Result.target /= target
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
         ----------- Duplicate code call_0/proc_call_0  -----------
      local
         t: like target; fs: like feature_stamp
      do
         check
            target.is_current implies feature_stamp.has_type(parent_type)
         end
         if target.is_current then
            check
               target = target.specialize_thru(parent_type, parent_edge, new_type)
            end
            fs := feature_stamp.specialize_thru(parent_type, parent_edge, new_type)
            t := target
            check
            -- if this fail, it's probably the sign of some missing specializations
               fs.has_type(new_type)
            end
         else
            t := target.specialize_thru(parent_type, parent_edge, new_type)
            -- fs determined by specialize_and_check
         end
         Result := current_or_twin_init(t, fs)
      ensure then
         target.is_current = old target.is_current
         to_save_memory: target.is_current implies feature_stamp /= Void
         Result.target.is_current implies Result.feature_stamp.has_type(new_type)
         Result /= Current implies Result.feature_stamp /= feature_stamp or else Result.target /= target
      end

   specialize_and_check (type: TYPE): EXPRESSION
         --|*** PH/Dom(22/01/04) Improvement: save the result of
         --|"target.declaration_type.search(feature_name)" because it
         --|will not change. Hope the memory penalty is not too big
         --|for the computing time saved.
         ----------- Duplicate code call_0/proc_call_0  -----------
         --|*** Except for the `function_check' calls (Dom. march 28th 2004) ***
      local
         fs: like feature_stamp; t: like target; target_type, target_declaration_type: TYPE
         af: ANONYMOUS_FEATURE; args: EFFECTIVE_ARG_LIST
         res: like Current; call_1: FUNCTION_CALL_1
      do
         if target.is_current then
            check
               target = target.specialize_and_check(type)
               feature_stamp.has_anonymous_feature_for(type)
            end
            target_type := type
            af := feature_stamp.anonymous_feature(type)
            if function_check(type, af) then
               if arguments_0 = Void then
                  create arguments_0.make(start_position)
               end
               args := arguments_0.specialize_and_check(type, af, type, True)
               if args = arguments_0 then
                  Result := Current
               else
                  create call_1.make(target, feature_name, args)
                  call_1.set_feature_stamp(feature_stamp)
                  Result := call_1.specialize_and_check(type)
               end
            else
               Result := Current
            end
         else
            t := target.specialize_and_check(type)
            target_declaration_type := t.declaration_type
            fs := target_declaration_type.search(feature_name) -- *** OBSOLETE *** Dom march 15th 2006 ***
            if fs = Void then
               smart_eiffel.unknown_feature_fatal_error(target, target_declaration_type, feature_name)
            end
            target_type := t.resolve_in(type)
            fs := fs.resolve_static_binding_for(target_declaration_type, target_type)
            af := fs.anonymous_feature(target_type)
            if af = Void then
               if not target.is_implicit_current then
                  error_handler.add_position(target.start_position)
               end
               error_handler.add_position(feature_name.start_position)
               error_handler.append(once "Missing anonymous feature for this call.")
               error_handler.print_as_internal_error
            end
            if function_check(type, af) then
               if arguments_0 = Void then
                  create arguments_0.make(start_position)
               end
               args := arguments_0.specialize_and_check(type, af, target_type, True)
               if args /= arguments_0 then
                  create call_1.make(t, feature_name, args)
                  call_1.set_feature_stamp(fs)
                  call_1.standard_check_export_and_obsolete_calls(type, target_type, af)
                  Result := call_1.specialize_and_check(type)
               end
            end
            if Result = Void then
               if feature_stamp = Void then
                  feature_stamp := fs
               end
               res := current_or_twin_init(t, fs)
               res.standard_check_export_and_obsolete_calls(type, target_type, af)
               check
                  feature_stamp /= Void
                  res.feature_stamp /= Void
                  res.feature_stamp.has_type(res.target.resolve_in(type))
               end
               Result := res
            end
         end
      end

   frozen simplify (type: TYPE): EXPRESSION
      local
         t: like target; target_type: TYPE; af: ANONYMOUS_FEATURE; inline_memo: INLINE_MEMO
         external_function: EXTERNAL_FUNCTION
      do
         if simplify_limit_reached then
            Result := Current
         else
            t := target.simplify(type)
            if t.is_void then
               smart_eiffel.magic_count_increment
               target_type := target.resolve_in(type)
               af := feature_stamp.anonymous_feature(target_type)
               external_function ?= af
               if external_function /= Void and then
                  external_function.first_name.to_string = as_to_pointer
                then
                  -- For this special case, the Void target is allowed? --|*** (Dom. july 12th 2004) ***
                  create {NULL_POINTER} Result.make(start_position, resolve_in(type).canonical_type_mark)
               else
                  create {VOID_CALL} Result.make(start_position, feature_stamp, target_type)
               end
            else
               target_type := t.resolve_in(type)
               af := feature_stamp.anonymous_feature(target_type)
               if af = Void then
                  error_handler.add_position(start_position)
                  error_handler.append(once " Context type was ")
                  error_handler.append(type.name.to_string)
                  error_handler.print_as_internal_error
               end
               -- Attempt to inline first:
               inline_memo := af.inline_expression_0(type, feature_stamp, feature_name.start_position,
                                                     target_type, t, resolve_in(type))
               if inline_memo /= Void then
                  Result := inline_memo.expression
                  smart_eiffel.dispose_inline_memo(inline_memo)
               else
                  -- And finally, the general scheme:
                  Result := current_or_twin_init(t, feature_stamp)
               end
            end
         end
      end

feature {}
   simplify_limit_reached: BOOLEAN
         -- To avoid possible infinite inlinings during simplify.
      local
         c: FUNCTION_CALL; stop: BOOLEAN; nested_calls_counter: INTEGER
      do
         if c ?:= target then
            from
               c ::= target
               check
                  c /= Void
               end
            until
               stop
            loop
               if c ?:= c.target then
                  c ::= c.target
                  check
                     c /= Void
                  end
                  nested_calls_counter := nested_calls_counter + 1
                  if nested_calls_counter > 50 then
                     -- Well, so many nested CALLs is likely to be only possible with
                     -- some infinite inlining chain.
                     stop := True
                     Result := True
                     echo.put_string(once "Symplify interrupted (infinite inlining?) in CALL_0.%N")
                  end
               else
                  stop := True
               end
            end
         end
      end

   current_or_twin_init (t: like target; fs: like feature_stamp): like Current
      do
         if t = target and then feature_stamp = fs then
            Result := Current
         else
            Result := twin
            Result.set_target(t)
            Result.set_feature_stamp(fs)
         end
      end

   arguments_0: EFFECTIVE_ARG_LIST_0

feature {EFFECTIVE_ROUTINE}
   frozen inline_with (new_target: EXPRESSION): like Current
      require
         new_target /= Void
      do
         Result := twin
         Result.set_target(new_target)
      end

feature {WHEN_ITEM}
   frozen manifest_expression (type: TYPE): MANIFEST_EXPRESSION
      do
         check
            target.is_current
         end
         Result := type.find_manifest_expression_for(feature_stamp, feature_name)
      end

end -- class CALL_0
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
