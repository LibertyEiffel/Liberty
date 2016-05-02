-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class CODE_PRINTER
   --
   -- A code generator.
   --

insert
   GLOBALS
   CODE_CONTEXT_CONSTANTS

feature {}
   procedure_count: INTEGER

   function_count: INTEGER

   precursor_routine_count: INTEGER

   real_procedure_count: INTEGER

   real_function_count: INTEGER

   static_expression_count: INTEGER

feature {SMART_EIFFEL}
   compile
         -- The real output is done here
      deferred
      end

feature {ANY}
   incr_real_procedure_count
      do
         real_procedure_count := real_procedure_count + 1
      end

   incr_procedure_count
      do
         procedure_count := procedure_count + 1
      end

   incr_real_function_count
      do
         real_function_count := real_function_count + 1
      end

   incr_function_count
      do
         function_count := function_count + 1
      end

   incr_precursor_routine_count
      do
         precursor_routine_count := precursor_routine_count + 1
      end

feature {} -- Context stacks:
   top: INTEGER
         -- Index for top of followings stacks.

   context_stack: FAST_ARRAY[CODE_CONTEXT]
         -- The indicating stack. It contains only one
         -- of the following unique code.
      once
         create Result.make(stack_first_size)
      end

   stack_top: CODE_CONTEXT
      require
         context_stack.valid_index(top)
      do
         Result := context_stack.item(top)
      ensure
         Result.valid
      end

   stack_first_size: INTEGER 12

   stack_push (code: INTEGER)
         -- Push the `code' and resize all stacks if needed.
      local
         new_size: INTEGER; ctx: CODE_CONTEXT
      do
         top := top + 1
         if top > context_stack.upper then
            new_size := context_stack.upper * 2
            if new_size > 1024 then
               stack_overflow
            end
            context_stack.resize(new_size)
         end
         check
            context_stack.item(top) = Void or else not context_stack.item(top).valid
         end
         ctx := reserve_context(code)
         check
            context_stack.fast_has(ctx) implies context_stack.fast_first_index_of(ctx) >= top
         end
         context_stack.put(ctx, top)
      ensure
         stack_top.valid
         old top = top - 1
      end

   unused_contexts: ARRAY[FAST_ARRAY[CODE_CONTEXT]]

   reserve_context (code: INTEGER): CODE_CONTEXT
      local
         free_contexts: FAST_ARRAY[CODE_CONTEXT]
      do
         if unused_contexts = Void then
            Result := new_context(code)
         elseif unused_contexts.valid_index(code) then
            free_contexts := unused_contexts.item(code)
            if free_contexts = Void or else free_contexts.is_empty then
               Result := new_context(code)
            else
               Result := free_contexts.last
               free_contexts.remove_last
            end
         else
            Result := new_context(code)
         end
         Result.reserve
      ensure
         Result.code = code
         Result.valid
      end

   free_context (ctx: CODE_CONTEXT)
      require
         ctx.valid
      local
         code: INTEGER; free_contexts: FAST_ARRAY[CODE_CONTEXT]
      do
         code := ctx.code
         ctx.free
         if unused_contexts = Void then
            create unused_contexts.make(code, code)
            create free_contexts.with_capacity(stack_first_size)
            unused_contexts.put(free_contexts, code)
         elseif unused_contexts.valid_index(code) then
            free_contexts := unused_contexts.item(code)
            if free_contexts = Void then
               create free_contexts.with_capacity(stack_first_size)
               unused_contexts.force(free_contexts, code)
            end
         else
            create free_contexts.with_capacity(stack_first_size)
            unused_contexts.force(free_contexts, code)
         end
         free_contexts.add_last(ctx)
      ensure
         not ctx.valid
      end

feature {ANY}
   pop
      local
         st: like stack_top
      do
         check
            stack_top.valid
         end
         st := stack_top
         check
            st.valid
            check_top(st)
         end
         top := top - 1
         free_context(st)
      ensure
         old top = top + 1
         context_stack.valid_index(top) implies stack_top.valid
-- ***         not (old stack_top).valid
-- *** Well, at time being, the previous assertion cannot be compiled....
-- *** Dom. june 8th 2008 ***
      end

feature {}
   check_top (st: like stack_top): BOOLEAN
         -- To make checks coherent, the stack must be cleaned
      do
         Result := context_stack.fast_first_index_of(st) = top
         context_stack.put(Void, top)
         Result := Result and then not context_stack.fast_has(st)
      end

feature {PRECURSOR_CALL}
   push_direct (rf: RUN_FEATURE; type: TYPE; target: EXPRESSION; args: EFFECTIVE_ARG_LIST)
      require
         rf /= Void
         type /= Void
      do
         stack_push(C_direct_call)
         stack_top.set_type(type)
         stack_top.set_anonymous_feature(rf.base_feature)
         stack_top.set_target(target)
         stack_top.set_effective_arguments(args)
      end

feature {PRECURSOR_CALL}
   push_precursor (type: TYPE; rf: RUN_FEATURE; args: EFFECTIVE_ARG_LIST)
      require
         rf /= Void
      do
         stack_push(C_precursor)
         stack_top.set_type(type)
         stack_top.set_anonymous_feature(rf.base_feature)
         stack_top.set_effective_arguments(args)
      end

feature {RUN_FEATURE_3}
   stack_not_full: BOOLEAN
      do
         Result := top < 50
      end

feature {}
   stack_overflow
      local
         i: INTEGER; type: TYPE; af: ANONYMOUS_FEATURE; rtm: STRING; rtma: FAST_ARRAY[STRING]
      do
         error_handler.append(once "Infinite inlining loop (bad recursion ??). ")
         from
            i := top - 1
         until
            i < context_stack.lower
         loop
            type := context_stack.item(i).type
            af := context_stack.item(i).anonymous_feature
            if af /= Void then
               error_handler.add_position(af.start_position)
               rtm := type.name.to_string
               if rtma = Void then
                  create rtma.with_capacity(top)
                  rtma.add_last(rtm)
                  error_handler.append(rtm)
               elseif rtma.fast_has(rtm) then
                  -- Already printed...
               else
                  rtma.add_last(rtm)
                  error_handler.append(once ", ")
                  error_handler.append(rtm)
               end
            end
            i := i - 1
         end
         error_handler.append(once ",...")
         error_handler.print_as_fatal_error
      end

feature {}
   new_context (code: INTEGER): CODE_CONTEXT
      do
         inspect
            code
         when C_direct_call then
            create {CODE_CONTEXT_DIRECT_CALL} Result
         when C_create_instruction then
            create {CODE_CONTEXT_CREATE_INSTRUCTION} Result
         when C_create_expression then
            create {CODE_CONTEXT_CREATE_EXPRESSION} Result
         when C_inside_twin then
            create {CODE_CONTEXT_INSIDE_TWIN} Result
         when C_precursor then
            create {CODE_CONTEXT_PRECURSOR} Result
         when C_inside_some_wrapper then
            create {CODE_CONTEXT_INSIDE_SOME_WRAPPER} Result
         end
      ensure
         not Result.valid
      end

end -- class CODE_PRINTER
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
