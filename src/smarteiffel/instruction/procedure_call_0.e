-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class PROCEDURE_CALL_0
   --
   -- For procedure calls without argument (only Current).
   --

inherit
   PROCEDURE_CALL

creation {ANY}
   make

feature {ANY}
   arg_count: INTEGER is 0

   arguments: EFFECTIVE_ARG_LIST is
      do
      end

   set_arguments (a: like arguments) is
      do
         check
            a = Void
         end
      end

   specialize_in (type: TYPE): like Current is
         ----------- Duplicate code call_0/proc_call_0  -----------
      local
         t: like target; fs: like feature_stamp
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
         if t = target and then feature_stamp = fs then
            Result := Current
         else
            Result := twin
            Result.set_target(t)
            Result.set_feature_stamp(fs)
         end
      ensure then
         target.is_current = old target.is_current
         to_save_memory: target.is_current implies feature_stamp /= Void
         Result.target.is_current implies Result.feature_stamp.has_type(type)
         Result /= Current implies Result.feature_stamp /= feature_stamp or else Result.target /= target
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
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
            if fs = feature_stamp then
               Result := Current
            else
               Result := twin
               Result.set_feature_stamp(fs)
            end
         else
            t := target.specialize_thru(parent_type, parent_edge, new_type)
            if t = target then
               Result := Current
            else
               Result := twin
               Result.set_target(t)
               Result.set_feature_stamp(Void)
            end
         end
      ensure then
         target.is_current = old target.is_current
         to_save_memory: target.is_current implies feature_stamp /= Void
         Result.target.is_current implies Result.feature_stamp.has_type(new_type)
         Result /= Current implies Result.feature_stamp /= feature_stamp or else Result.target /= target
      end

   specialize_2 (type: TYPE): like Current is
         ----------- Duplicate code call_0/proc_call_0  -----------
         --|*** Except for the `procedure_and_argument_count_check' call (Dom. march 28th 2004) ***
      local
         fs: like feature_stamp; t: like target; target_type, target_declaration_type: TYPE; af: ANONYMOUS_FEATURE
      do
         if target.is_current then
            check
               target = target.specialize_2(type)
               feature_stamp.has_anonymous_feature_for(type)
            end
            target_type := type
            af := feature_stamp.anonymous_feature(type)
            procedure_and_argument_count_check(af, Void)
            Result := Current
         else
            t := target.specialize_2(type)
            target_type := t.resolve_in(type)
            target_declaration_type := t.declaration_type
            fs := target_declaration_type.search(feature_name) -- *** OBSOLETE *** Dom march 15th 2006 ***
            if fs = Void then
               smart_eiffel.unknown_feature_fatal_error(target, target_declaration_type, feature_name)
            end
            fs := fs.resolve_static_binding_for(target_declaration_type, target_type)
            af := fs.anonymous_feature(target_type)
            procedure_and_argument_count_check(af, Void)
            if feature_stamp = Void then
               feature_stamp := fs
            end
            if t = target and then feature_stamp = fs then
               Result := Current
            else
               Result := twin
               Result.set_target(t)
               Result.set_feature_stamp(fs)
            end
         end
         Result.standard_check_export_and_obsolete_calls(type, target_type, af)
         check
            feature_stamp /= Void
            Result.feature_stamp /= Void
            Result.feature_stamp.has_type(Result.target.resolve_in(type))
         end
      end

   frozen simplify (type: TYPE): INSTRUCTION is
      local
         t: like target; target_type: TYPE; af: ANONYMOUS_FEATURE; inline_memo: INLINE_MEMO
         proc_call_0: PROCEDURE_CALL_0
      do
         t := target.simplify(type)
         if t.is_void then
            smart_eiffel.magic_count_increment
            target_type := target.resolve_in(type)
            create {VOID_PROC_CALL} Result.make(start_position, feature_stamp, target_type)
         else
            target_type := t.resolve_in(type)
            af := feature_stamp.anonymous_feature(target_type)
            -- Attemp to inline first:
            inline_memo := af.inline_instruction_0(type, target_type, t)
            if inline_memo /= Void then
               Result := inline_memo.instruction
               smart_eiffel.dispose_inline_memo(inline_memo)
            else
               -- And finally, the general scheme:
               if t /= target then
                  proc_call_0 := twin
                  proc_call_0.set_target(t)
                  Result := proc_call_0
               else
                  Result := Current
               end
            end
         end
      end
      --|*** if ace.no_check then
      --|*** -- Do nothing in order to track Void target as well.
      --|*** elseif target.side_effect_free then
      --|*** if smart_eiffel.is_ready then
      --|*** rf := run_feature
      --|*** run_time_set := rf.live_type.run_time_set
      --|*** if run_time_set.count = 1 then
      --|*** rf := run_time_set.first.dynamic_feature(rf)
      --|*** if rf.side_effect_free then
      --|*** container.remove(index)
      --|*** end
      --|*** end
      --|*** end
      --|*** end

   compile_to_jvm (type: TYPE) is
      do
         not_yet_implemented
      end

   accept (visitor: PROCEDURE_CALL_0_VISITOR) is
      do
         visitor.visit_procedure_call_0(Current)
      end

feature {EFFECTIVE_ROUTINE}
   frozen inline_with (new_target: EXPRESSION): like Current is
      require
         new_target /= Void
      do
         Result := twin
         Result.set_target(new_target)
      end

feature {}
   make (t: like target; fn: like feature_name) is
      require
         t /= Void
         fn /= Void
      do
         target := t
         feature_name := fn
      ensure
         target = t
         feature_name = fn
      end

invariant
   arguments = Void

end -- class PROCEDURE_CALL_0
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
