-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_DEAD_CODE01
   -- Bug report from Philippe Ribet
   -- Unused attribute has not to be in generated structure
   -- This code will always fail with debug on! (So never try to make it
   -- run with -debug ;-)

create {}
   make

feature {}
   make
      local
         addr1: POINTER; local_debug: STRING; addr2: POINTER; addr3: POINTER; aux: AUX_DEAD_CODE01
         exit_code: INTEGER
      do
         debug
            local_debug := "Local debug information"
            debug_info := "Debug attribute"
         end
         addr1 := get_address($addr1)
         addr2 := get_address($addr2)
         addr3 := get_address($addr3)
         create aux.make
         -- debug_info attribute is not in the structure of the object
         if object_size /= aux.object_size then
            std_error.put_string("Error in class ")
            std_error.put_string(generator)
            std_error.put_string(": debug_info attribute should not be included in the structure of the object.%N")
            exit_code := exit_code + 1
         end
         -- local_debug local variable is not declared
         if addr1.hash_code - addr2.hash_code /= addr2.hash_code - addr3.hash_code then
            std_error.put_string("Error in class ")
            std_error.put_string(generator)
            std_error.put_string(": local_debug local variable should not be declared in the generated C code.%N")
            exit_code := exit_code + 2
         end
         die_with_code(exit_code)
      end

   debug_info: STRING

   get_address (p: POINTER): POINTER
      do
         Result := p
      end

end -- class TEST_DEAD_CODE01
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
