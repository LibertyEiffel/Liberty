-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_REVERSE_ASSIGNMENT

insert
   EIFFELTEST_TOOLS

creation {ANY}
   make

feature {ANY}
   string: STRING

   animal: ANIMAL

   cat: CAT

   dog: DOG

   any: ANY

   array_integer: ARRAY[INTEGER]

   array_any: ARRAY[ANY]

   make is
      do
         any := "foo"
         assert(any /= Void)
         string ?= any
         assert(string /= Void)
         assert(any = string)
         cat ?= any
         assert(cat = Void)
         create cat
         any := cat
         assert(cat = any)
         -- *** Correctly rejected *** (Dom. nov 10th 2004) *** dog ?= any
         assert(dog = Void)
         cat ?= any
         assert(cat = any)
         animal := cat
         cat ?= animal
         assert(cat = animal)
         assert(cat /= Void)
         animal := Void
         cat ?= animal
         assert(cat = Void)
      end

end -- class TEST_REVERSE_ASSIGNMENT
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
