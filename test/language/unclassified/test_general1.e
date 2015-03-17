-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_GENERAL1

create {}
   make

feature {ANY}
   any: ABSTRACT_STRING

   ai8: ARRAY[INTEGER_8]

   ai: ARRAY[INTEGER]

   ar: ARRAY[REAL]

   d: DICTIONARY[STRING, STRING]

   cat: CAT

   dog: DOG

   make
      local
         i: INTEGER
      do
         -- Testing `generating_type' ----------------------------- :
         assert(generating_type.is_equal("TEST_GENERAL1"))
         create ai.make(1, 2)
         assert(("ARRAY[INTEGER_32]").is_equal(ai.generating_type))
         create ai8.make(1, 2)
         assert(("ARRAY[INTEGER_8]").is_equal(ai8.generating_type))
         create ar.make(1, 2)
         assert(("ARRAY[REAL_64]").is_equal(ar.generating_type))
         create {HASHED_DICTIONARY[STRING, STRING]} d.make
         assert(d.generating_type.is_equal("HASHED_DICTIONARY[STRING,STRING]"))
         assert(i.generating_type.is_equal("INTEGER_32"))
         assert(i.force_to_real_32.generating_type.is_equal("REAL_32"))
         assert(i.to_real_64.generating_type.is_equal("REAL_64"))
         assert(i.digit.generating_type.is_equal("CHARACTER"))
         assert(i.to_string.generating_type.is_equal("STRING"))
         assert(i.to_string.to_integer.generating_type.is_equal("INTEGER_32"))
         any := i.to_string
         assert(any.generating_type.is_equal("STRING"))
         -- INTEGER does not conform to ANY (Vincent Croizier, 02/11/2004)
         --any := i
         --assert(any.generating_type.has_prefix("reference INTEGER"))
         assert(i.generating_type.has_prefix("INTEGER"))
         -- Testing `generator' ----------------------------------- :
         assert(generator.is_equal("TEST_GENERAL1"))
         assert(("ARRAY").is_equal(ai.generator))
         assert(("ARRAY").is_equal(ar.generator))
         assert(d.generator.is_equal("HASHED_DICTIONARY"))
         assert(i.generator.is_equal("INTEGER_32"))
         assert(i.force_to_real_32.generator.is_equal("REAL_32"))
         assert(i.to_real_64.generator.is_equal("REAL_64"))
         assert(i.to_real_64.generating_type.is_equal("REAL_64"))
         assert(i.digit.generator.is_equal("CHARACTER"))
         assert(i.to_string.generator.is_equal("STRING"))
         any := i.to_string
         assert(any.generator.is_equal("STRING"))
         -- INTEGER does not conform to ANY (Vincent Croizier, 02/11/2004)
         --any := i
         --assert(any.generator.is_equal("INTEGER_32"))
         --assert(any.generating_type.is_equal("reference INTEGER"))
         assert(i.generating_type.is_equal("INTEGER_32"))
         -- Testing `object_size' --------------------------------- :
         create cat
         create dog
         assert(1.object_size >= True.object_size)
         assert('a'.object_size = 1)
         assert(dog.object_size = cat.object_size)
         assert(object_size > i.object_size)
         -- *** Correctly rejected *** (Dom. nov 10th 2004) *** any := dog
         assert(dog.object_size /= any.object_size)
         -- Testing `same_dynamic_type' --------------------------- :
         assert(same_dynamic_type(Current))
         assert(ai8.same_dynamic_type({ARRAY[INTEGER_8] 1, << 1, 2 >> }))
         assert(ai.same_dynamic_type({ARRAY[INTEGER] 1, << 1, 2 >> }))
         assert(ar.same_dynamic_type({ARRAY[REAL] 1, << 0.5 >> }))
         -- *** ARRAY[INTEGER] doesn't conform to ARRAY[REAL] (Vincent Croizier, 05/11/2004) ***
         -- assert(not ar.same_dynamic_type(ai))
         assert(d.same_dynamic_type(d.twin))
         i := 7
         assert(i.to_string.same_dynamic_type("foo"))
         -- INTEGER does not conform to ANY (Vincent Croizier, 02/11/2004)
         --any := i
         --assert(any.same_dynamic_type(i))
         -- ARRAY[REAL] does not conform to ANY
         --any := ar
         --assert(any.same_dynamic_type(ar))
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            sedb_breakpoint
            std_output.put_string("TEST_GENERAL1: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            --std_output.put_string("Yes%N")
         end
      end

   cpt: INTEGER

end -- class TEST_GENERAL1
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
