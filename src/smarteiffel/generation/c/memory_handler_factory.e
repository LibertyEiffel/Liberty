-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class MEMORY_HANDLER_FACTORY

feature {ANY}
   set_no_gc is
      do
         mode.set_item(Mode_off)
      end

   set_bdw_gc is
      do
         mode.set_item(Mode_bdw)
      end

   set_info_flag is
      do
         info.set_item(True)
      end

feature {C_PRETTY_PRINTER}
   create_memory_handler: MEMORY_HANDLER is
      do
         inspect
            mode.item
         when Mode_off then
            create {NO_GC} Result.make
         when Mode_bdw then
            create {BDW_GC} Result.make
         when Mode_standard then
            create {GC_HANDLER} Result.make
         end
         if info.item then
            Result.set_info_flag
         end
      end

   mode: REFERENCE[INTEGER] is
      once
         create Result.set_item(Mode_standard)
      end

   info: REFERENCE[BOOLEAN] is
      once
         create Result
      end

   Mode_standard: INTEGER is 0
   Mode_off: INTEGER is -1
   Mode_bdw: INTEGER is 1

end -- class MEMORY_HANDLER_FACTORY
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
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
