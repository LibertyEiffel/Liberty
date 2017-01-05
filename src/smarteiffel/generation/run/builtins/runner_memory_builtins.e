-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_MEMORY_BUILTINS
   --
   -- builtins for MEMORY
   --

inherit
   RUNNER_UNTYPED_BUILTINS

create {RUNNER_MEMORY}
   make

feature {RUNNER_MEMORY}
   new (processor: RUNNER_PROCESSOR): RUNNER_STRUCTURED_OBJECT
      do
         create Result.make(processor, type, Current)
      end

feature {}
   call_ (processor: RUNNER_PROCESSOR): BOOLEAN
      do
         inspect
            processor.current_frame.name.to_string
         when "collecting" then
            builtin_collecting(processor)
            Result := True
         when "collection_off" then
            builtin_collection_off(processor)
            Result := True
         when "collection_on" then
            builtin_collection_on(processor)
            Result := True
         when "full_collect" then
            builtin_full_collect(processor)
            Result := True
         when "collector_counter" then
            builtin_collector_counter(processor)
            Result := True
         else
            check
               not Result
            end
         end
      end

feature {}
   builtin_collecting (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_boolean(processor.memory.is_gc_started))
      end

   builtin_collection_off (processor: RUNNER_PROCESSOR)
      do
         processor.memory.stop_gc
      end

   builtin_collection_on (processor: RUNNER_PROCESSOR)
      do
         processor.memory.start_gc
      end

   builtin_full_collect (processor: RUNNER_PROCESSOR)
      do
         processor.memory.run_gc
      end

   builtin_collector_counter (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_integer_32(processor.memory.gc_count))
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

end -- class RUNNER_MEMORY_BUILTINS
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
