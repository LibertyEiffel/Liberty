-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_AGENT_OBJECT

inherit
   RUNNER_OBJECT

create {RUNNER_MEMORY}
   make

feature {ANY}
   builtins: RUNNER_UNTYPED_BUILTINS

   processor: RUNNER_PROCESSOR
   type: TYPE

   code: CODE
   target: RUNNER_OBJECT

   feature_stamp: FEATURE_STAMP

   is_initialized: BOOLEAN True

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "<agent>")
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := other = Current
      end

   upper: INTEGER
      do
         Result := operands.count
      end

   operand (a_rank: INTEGER): RUNNER_OBJECT
      require
         a_rank = -1 or else a_rank.in_range(1, upper)
      do
         if a_rank = -1 then
            Result := target
         else
            Result := operands.item(a_rank - 1)
         end
      ensure
         a_rank = -1 implies Result = target
      end

feature {RUNNER_UNTYPED_BUILTINS}
   builtin_to_pointer: POINTER
      do
         Result := to_pointer
      end

   builtin_copy (other: RUNNER_OBJECT)
      do
         not_yet_implemented
      end

   builtin_is_equal (other: RUNNER_OBJECT): BOOLEAN
      do
         not_yet_implemented
      end

feature {RUNNER_MEMORY}
   set_operand (a_rank: INTEGER; a_operand: RUNNER_OBJECT)
      require
         a_rank = -1 or else a_rank.in_range(1, upper)
      do
         if a_rank = -1 then
            target := a_operand
         else
            operands.put(a_operand, a_rank - 1)
         end
      ensure
         a_rank /= -1 implies operand(a_rank) = a_operand
         a_rank = -1 implies target = a_operand
      end

feature {RUNNER_FACET}
   copy_if_expanded: like Current
      do
         Result := Current
      end

   as_foreign_object: FOREIGN_OBJECT
      do
         not_yet_implemented
      end

feature {}
   make (a_processor: like processor; a_type: like type; a_code: like code; a_arg_count: INTEGER; a_feature_stamp: like feature_stamp; a_builtins: like builtins)
      require
         a_processor /= Void
         a_type.live_type /= Void
         a_arg_count >= 0
         a_feature_stamp /= Void
         a_builtins /= Void
      do
         processor := a_processor
         type := a_type
         code := a_code
         feature_stamp := a_feature_stamp
         builtins := a_builtins
         create operands.make(a_arg_count)
      ensure
         processor = a_processor
         type = a_type
         code = a_code
         feature_stamp = a_feature_stamp
         builtins = a_builtins
      end

   operands: FAST_ARRAY[RUNNER_OBJECT]

invariant
   type.live_type /= Void
   operands.count > 0

end -- class RUNNER_AGENT_OBJECT
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
