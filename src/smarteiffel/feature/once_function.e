-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ONCE_FUNCTION

inherit
   ONCE_ROUTINE
      redefine specialize_signature_in, specialize_signature_thru, hook_collect, hook_for,
         inline_expression_0
      end

creation {ANY}
   make

feature {ANY}
   side_effect_free (target_type: TYPE): BOOLEAN is
      do
      end

   inline_result: EXPRESSION

feature {CALL_0}
   inline_expression_0 (type: TYPE; feature_stamp: FEATURE_STAMP; call_site: POSITION
                        target_type: TYPE; target: EXPRESSION; return_type: TYPE): INLINE_MEMO is
      do
         if target.side_effect_free(type) and then
            target.non_void_no_dispatch_type(type) /= Void and then
            not use_current(target_type)
          then
            if inline_result = Void then
               inline_result := once_routine_pool.precomputable_function(feature_stamp, target_type, Current)
            end
            if inline_result /= Void then
               Result := smart_eiffel.get_inline_memo
               Result.set_expression(inline_result)
               smart_eiffel.magic_count_increment
            end
         end
      end

feature {ANY}
   result_type: TYPE_MARK

feature {ANONYMOUS_FEATURE_MIXER}
   specialize_signature_in (new_type: TYPE): like Current is
      local
         args: like arguments
      do
         result_type.specialize_in(new_type)
         if arguments /= Void then
            args := arguments.specialize_in(new_type)
         end
         if args = arguments then
            Result := Current
         else
            Result := twin
            Result.set_arguments(args)
         end
      end

   specialize_signature_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
         args: like arguments; rt: like result_type
      do
         rt := result_type.specialize_thru(parent_type, parent_edge, new_type)
         if arguments /= Void then
            args := arguments.specialize_thru(parent_type, parent_edge, new_type)
         end
         if result_type = rt and then args = arguments then
            Result := Current
         else
            Result := twin
            Result.set_arguments(args)
            Result.set_result_type(rt)
         end
      end

feature {}
   new_run_feature_for (t: TYPE; fn: FEATURE_NAME): RUN_FEATURE_6 is
      do
         create Result.for(t.live_type, Current, fn)
      end

feature {ANY}
   accept (visitor: ONCE_FUNCTION_VISITOR) is
      do
         visitor.visit_once_function(Current)
      end

feature {ONCE_FUNCTION}
   set_result_type (rt: like result_type) is
      require
         rt /= Void
      do
         result_type := rt
      end

feature {RUN_FEATURE} -- hooks for STD_OUTPUT.flush:
   hook_collect (t: TYPE) is
      local
         flush_type: TYPE
      do
         -- Create the STD_OUTPUT.flush feature
         if (class_text.name.to_string = as_any) and then first_name.to_string = as_std_output then
            flush_type := type_std_output.type
            flush_type := smart_eiffel.collect(flush_type, flush_type.feature_stamp_of(flush_name), True)
            check
               flush_is_a_procedure: flush_type = Void
            end
         end
      end

   hook_for (lt: LIVE_TYPE) is
      do
         --|*** rf: RUN_FEATURE; t: TYPE
         --| Make live STD_OUTPUT.flush
         --|*** *** Since the modification of Cyril about io, std_output is no
         --|    longer a once function !
         --|*** (Dom. June 13th 2004) ***
         --|*** if class_text.name.to_string = as_general and then first_name.to_string = as_std_output then
         --|*** t := result_type.resolve_in(lt.type)
         --|*** rf := t.live_type.at(t.name_from_string(as_flush))
         --|*** check rf /= Void end
         --|*** once_routine_pool.set_std_output_flush_atexit(rf)
         --|*** end
      end

feature {}
   make (fa: like arguments; rt: like result_type; om: like obsolete_mark; hc: like header_comment
      ra: like require_assertion; lv: like local_vars; rb: like routine_body) is
      require
         rt /= Void
      do
         if not rt.is_static then
            smart_eiffel.vffd7_fatal_error(rt.start_position)
         end
         make_effective_routine(fa, om, hc, ra, lv, rb)
         result_type := rt
      end

   try_to_undefine_aux (fn: FEATURE_NAME; bc: CLASS_TEXT): DEFERRED_ROUTINE is
      do
         create {DEFERRED_FUNCTION} Result.from_effective(fn, arguments, result_type, require_assertion, ensure_assertion, bc, permissions)
      end

   type_std_output: CLASS_TYPE_MARK is
         --|*** Could be better (see caller) ***
         --|*** (Dom Oct. 21th 2005)
      local
         hs: HASHED_STRING; bcn: CLASS_NAME
      once
         hs := string_aliaser.hashed_string(once "STD_OUTPUT")
         create bcn.unknown_position(hs)
         create Result.make(bcn)
      end

invariant
   result_type.is_static

end -- class ONCE_FUNCTION
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
-- Liberty Eiffel is based on SmartEiffel (Copyrights blow)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
