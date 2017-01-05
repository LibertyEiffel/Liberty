-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class RUNNER_UNTYPED_BUILTINS
   --
   -- a collection of builtins tools
   --

insert
   RUNNER_FACET

feature {RUNNER_FACET}
   call (processor: RUNNER_PROCESSOR)
      do
         if not do_call(processor) then
            processor.set_exception(exceptions.System_level_type_error, once "Unknown builtin")
         end
      end

   type: TYPE
      deferred
      end

feature {RUNNER_UNTYPED_BUILTINS}
   do_call (processor: RUNNER_PROCESSOR): BOOLEAN
      local
         i: INTEGER
      do
         Result := call_(processor)
         if parents /= Void then
            from
               i := parents.lower
            until
               Result or else i > parents.upper
            loop
               Result := parents.item(i).do_call(processor)
               i := i + 1
            end
         end
      end

feature {}
   call_ (processor: RUNNER_PROCESSOR): BOOLEAN
      deferred
      end

feature {RUNNER_MEMORY}
   add_parent (a_parent: RUNNER_UNTYPED_BUILTINS)
      require
         a_parent /= Void
         a_parent.type = type
      do
         if parents = Void then
            create parents.with_capacity(1)
         end
         if not parents.fast_has(a_parent) then
            parents.add_last(a_parent)
         end
      ensure
         parents.fast_occurrences(a_parent) = 1
      end

   new (processor: RUNNER_PROCESSOR): RUNNER_OBJECT
      require
         processor /= Void
      deferred
      ensure
         Result.processor = processor
         Result.type = type
         Result.builtins = Current
      end

feature {}
   parents: FAST_ARRAY[RUNNER_UNTYPED_BUILTINS]

invariant
   type /= Void

end -- class RUNNER_UNTYPED_BUILTINS
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
