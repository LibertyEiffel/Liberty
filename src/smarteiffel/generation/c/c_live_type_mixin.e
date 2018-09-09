-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class C_LIVE_TYPE_MIXIN

insert
   C_COMPILATION_MIXIN
      undefine
         is_equal
      end
   SINGLETON

feature {ANY}
   is_compiled (live_type: LIVE_TYPE): BOOLEAN
      require
         live_type /= Void
      do
         Result := compiled.fast_has(live_type)
      end

feature {}
   compile_live_type (live_type: LIVE_TYPE)
      require
         live_type /= Void
      do
         if live_type.at_run_time and then not is_compiled(live_type) then
            set_compiled(live_type)
            do_compile(live_type)
         end
      end

   do_compile (live_type: LIVE_TYPE)
      require
         live_type /= Void
         live_type.at_run_time
      deferred
      end

feature {}
   set_compiled (live_type: LIVE_TYPE)
      require
         live_type /= Void
         not is_compiled(live_type)
      do
         compiled.fast_add(live_type)
      ensure
         is_compiled(live_type)
      end

   compiled: HASHED_SET[LIVE_TYPE]

   make
      do
         create compiled.make
      end

end -- class C_LIVE_TYPE_MIXIN
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
