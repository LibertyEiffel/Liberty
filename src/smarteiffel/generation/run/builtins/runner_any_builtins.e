-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_ANY_BUILTINS
   --
   -- builtins for ANY
   --

inherit
   RUNNER_UNTYPED_BUILTINS

create {RUNNER_MEMORY}
   make

feature {RUNNER_MEMORY}
   new (processor: RUNNER_PROCESSOR): RUNNER_OBJECT
      do
         check
            False
         end
      end

feature {}
   call_ (processor: RUNNER_PROCESSOR): BOOLEAN
      do
         inspect
            processor.current_frame.name.to_string
         when "generating_type" then
            builtin_generating_type(processor)
            Result := True
         when "generator" then
            builtin_generator(processor)
            Result := True
         when "same_dynamic_type" then
            builtin_same_dynamic_type(processor)
            Result := True
         when "is_equal", "standard_is_equal" then
            builtin_is_equal(processor)
            Result := True
         when "is_deep_equal" then
            builtin_is_deep_equal(processor)
            Result := True
         when "twin", "standard_twin" then
            builtin_twin(processor)
            Result := True
         when "copy", "standard_copy" then
            builtin_copy(processor)
            Result := True
         when "deep_twin" then
            builtin_deep_twin(processor)
            Result := True
         when "trace_switch" then
            builtin_trace_switch(processor)
            Result := True
         when "sedb_breakpoint" then
            builtin_break(processor)
            Result := True
         when "die_with_code" then
            builtin_die_with_code(processor)
            Result := True
         when "to_pointer" then
            builtin_to_pointer(processor)
            Result := True
         when "is_basic_expanded_type" then
            builtin_is_basic_expanded_type(processor)
            Result := True
         when "object_size" then
            builtin_object_size(processor)
            Result := True
         when "c_inline_h" then
            builtin_c_inline_h(processor)
            Result := True
         when "c_inline_c" then
            builtin_c_inline_c(processor)
            Result := True
         when "print_run_time_stack" then
            builtin_print_run_time_stack(processor)
            Result := True
         when "to_internals" then
            builtin_to_internals(processor)
            Result := True
         else
            check
               not Result
            end
         end
      end

feature {}
   builtin_generating_type (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_manifest_string(processor.current_frame.target.type.name.to_string, True))
      end

   builtin_generator (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_manifest_string(processor.current_frame.target.type.class_text.name.to_string, True))
      end

   builtin_same_dynamic_type (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_boolean(processor.current_frame.target.type = processor.current_frame.arguments.first.type))
      end

   builtin_is_equal (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_boolean(processor.current_frame.target.builtin_is_equal(processor.current_frame.arguments.first)))
      end

   builtin_is_deep_equal (processor: RUNNER_PROCESSOR)
      do
         break --| **** TODO
      end

   builtin_twin (processor: RUNNER_PROCESSOR)
      local
         object: RUNNER_OBJECT
      do
         object := processor.new_object(processor.current_frame.type_of_current)
         object.builtin_copy(processor.current_frame.target)
         processor.current_frame.set_return(object)
      end

   builtin_copy (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.target.builtin_copy(processor.current_frame.arguments.first)
      end

   builtin_deep_twin (processor: RUNNER_PROCESSOR)
      do
         break --| **** TODO
      end

   builtin_trace_switch (processor: RUNNER_PROCESSOR)
      do
         break --| **** TODO
      end

   builtin_break (processor: RUNNER_PROCESSOR)
      do
         break --| **** TODO
      end

   builtin_die_with_code (processor: RUNNER_PROCESSOR)
      local
         exit_code: RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         exit_code ::= processor.current_frame.arguments.first
         die_with_code(exit_code.item.to_integer_32)
      end

   builtin_to_pointer (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_pointer(processor.current_frame.target.builtin_to_pointer))
      end

   builtin_is_basic_expanded_type (processor: RUNNER_PROCESSOR)
      do
         break --| **** TODO
      end

   builtin_object_size (processor: RUNNER_PROCESSOR)
      do
         break --| **** TODO
      end

   builtin_c_inline_h (processor: RUNNER_PROCESSOR)
      do
         break --| **** TODO
      end

   builtin_c_inline_c (processor: RUNNER_PROCESSOR)
      do
         break --| **** TODO
      end

   builtin_print_run_time_stack (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.print_stack(std_output)
      end

   builtin_to_internals (processor: RUNNER_PROCESSOR)
      do
         break --| **** TODO
      end

feature {}
   make (a_type: like type)
      require
         a_type /= Void
      do
         type := a_type
      ensure
         type = a_type
      end

feature {RUNNER_FACET}
   type: TYPE

end -- class RUNNER_ANY_BUILTINS
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
