-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class INTERNAL_C_LOCAL_LIST
   --
   -- To handle the list of INTERNAL_C_LOCAL actually used by the current pending C function.
   --

insert
   GLOBALS

feature {}
   internal_c_local_pool: FAST_ARRAY[INTERNAL_C_LOCAL]
         -- All allocated INTERNAL_C_LOCAL objects since the beginning. This array is only growing
         -- and its purpose is to avoid creating many new INTERNAL_C_LOCAL objects for each
         -- new `pending_c_function' run.
      once
         create Result.with_capacity(32)
      end

feature {C_PRETTY_PRINTER}
   lock_local (stamps_stack: FAST_ARRAY[INTEGER]; type: TYPE; tag: STRING): INTERNAL_C_LOCAL
         -- Reuse some un-locked variable or add/create a new one.
      require
         not stamps_stack.is_empty
         type /= Void
         not tag.is_empty
      local
         i: INTEGER; internal_c_local: INTERNAL_C_LOCAL
      do
         from
            i := internal_c_local_pool.lower
         until
            (Result /= Void) or else (i > internal_c_local_pool.upper)
         loop
            internal_c_local := internal_c_local_pool.item(i)
            Result := internal_c_local.lock_local(stamps_stack, type, tag)
            i := i + 1
         end
         if Result = Void then
            -- We must create a new object:
            create Result.make(stamps_stack.last, type, tag)
            internal_c_local_pool.add_last(Result)
         end
      ensure
         Result /= Void
      end

   declaration_dump (out_c: TEXT_FILE_WRITE)
      local
         i: INTEGER; stop: BOOLEAN; internal_c_local: INTERNAL_C_LOCAL; buffer: STRING
      do
         buffer := once "........... unique buffer ..............."
         buffer.clear_count
         from
            i := internal_c_local_pool.lower
         until
            stop or else (i > internal_c_local_pool.upper)
         loop
            internal_c_local := internal_c_local_pool.item(i)
            stop := internal_c_local.declaration_dump(buffer)
            if not stop then
               declared_tmp_counter := declared_tmp_counter + 1
            end
            i := i + 1
         end
         if not buffer.is_empty then
            out_c.put_string(once "/*[INTERNAL_C_LOCAL list*/%N")
            out_c.put_string(buffer)
            out_c.put_string(once "/*INTERNAL_C_LOCAL list]*/%N")
         end
      end

   declared_tmp_counter: INTEGER

   echo_information
      do
         echo.put_string("Declared INTERNAL_C_LOCAL: ")
         echo.put_integer(declared_tmp_counter)
         echo.put_string(" using range tmp0 .. tmp")
         echo.put_integer(internal_c_local_pool.upper)
         echo.put_string(".%N")
      end

end -- class INTERNAL_C_LOCAL_LIST
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

