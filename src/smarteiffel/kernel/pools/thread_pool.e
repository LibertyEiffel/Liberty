-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class THREAD_POOL
   --
   -- Singleton object in charge of threads.
   -- This singleton is shared via the GLOBALS.`thread_pool' once function.
   --

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON

feature {ANY}
   count: INTEGER
      do
         if thread_types /= Void then
            Result := thread_types.count
         end
      end

   type (i: INTEGER): TYPE
      require
         i.in_range(1, count)
      do
         Result := thread_types.key(i)
      end

   call (i: INTEGER): EXPRESSION
      require
         i.in_range(1, count)
      do
         Result := thread_types.item(i)
      end

feature {NATIVE_BUILT_IN}
   collect (t: like type; sp: POSITION)
      require
         not sp.is_unknown
         t.class_text.name.to_string = as_thread_context
      local
         rt: TYPE; c: EXPRESSION
      do
         echo.put_string(once "Collecting thread root call for type ")
         echo.put_line(t.canonical_type_mark.written_mark)
         if thread_types = Void then
            create thread_types.make
         end
         if thread_types.fast_has(t) then
            c := thread_types.fast_at(t)
         else
            c := create_call(t, sp)
            thread_types.add(c, t)
         end
         if c /= Void then -- because of simplify the call may become Void
            rt := c.collect(t)
         end
      end

feature {LIVE_TYPE}
   simplify (t: like type)
      require
         t.class_text.name.to_string = as_thread_context
      local
         c, cs: like call
      do
         if thread_types /= Void then
            c := thread_types.fast_reference_at(t)
            if c /= Void then
               cs := c.simplify(t)
               if cs /= c then
                  thread_types.fast_put(cs, t)
               end
            end
         end
      end

feature {}
   thread_types: HASHED_DICTIONARY[EXPRESSION, TYPE]

   create_call (t: TYPE; sp: POSITION): EXPRESSION
         -- synthetic call to the agent
      require
         not sp.is_unknown
      local
         fs_args: FEATURE_STAMP; tm_args: TYPE_MARK
         tuple_args_def: LOCAL_NAME_DEF; tuple_args_ref: LOCAL_NAME_REF
         lv: LOCAL_VAR_LIST
         aa: ASSIGNMENT_ATTEMPT; c: FUNCTION_CALL_1
      do
         create tuple_args_def.make(sp, once "tuple_args")
         fs_args := t.lookup(fn_args)
         tm_args := fs_args.anonymous_feature(t).result_type.resolve_in(t).canonical_type_mark
         create lv.make(sp, {ARRAY[DECLARATION] 1, << create {DECLARATION_1}.make(tuple_args_def, tm_args) >>})
         create tuple_args_ref.refer_to(sp, lv, 1, 0)
         create aa.make(tuple_args_ref, thread_args(sp), True)
         create c.make(thread_routine(sp), fn_item, tuple_to_arguments(tuple_args_ref, sp))
         check
            smart_eiffel.specializing_feature_local_var_list = Void
            smart_eiffel.specializing_closure_local_var_lists = Void
         end
         smart_eiffel.set_specializing_feature_variables(lv, Void)
         create {COMPOUND_EXPRESSION} Result.from_list({FAST_ARRAY[CODE] << aa.specialize_in(t).specialize_and_check(t), c.specialize_in(t).specialize_and_check(t) >>})
         smart_eiffel.set_specializing_feature_variables(Void, Void)
      end

   thread_routine (sp: POSITION): EXPRESSION
      require
         not sp.is_unknown
      local
         c: FUNCTION_CALL_0
      do
         create c.make(create {IMPLICIT_CURRENT}.make(sp), fn_thread)
         create c.make(c, fn_routine)
         Result := c
      end

   thread_args (sp: POSITION): EXPRESSION
      require
         not sp.is_unknown
      local
         c: FUNCTION_CALL_0
      do
         create c.make(create {IMPLICIT_CURRENT}.make(sp), fn_args)
         Result := c
      end

   tuple_to_arguments (tuple_args_ref: LOCAL_NAME_REF; sp: POSITION): EFFECTIVE_ARG_LIST
      require
         not sp.is_unknown
      do
         create {EFFECTIVE_ARG_LIST_N} Result.make_1(sp, tuple_args_ref)
      end

   fn_item: FEATURE_NAME
      once
         create Result.unknown_position(as_item)
      end

   fn_thread: FEATURE_NAME
      once
         create Result.unknown_position("thread")
      end

   fn_routine: FEATURE_NAME
      once
         create Result.unknown_position("routine")
      end

   fn_args: FEATURE_NAME
      once
         create Result.unknown_position("args")
      end

end -- class THREAD_POOL
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
