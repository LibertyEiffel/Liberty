-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AVL

inherit
	EIFFELTEST_TOOLS

creation {ANY}
	make

feature {}
	make is
		do
			test_dictionary
			test_set
		end

	test_dictionary is
		local
			dico: AVL_DICTIONARY[STRING, STRING]
		do
			create dico.make
			dico.add("W", "B")
			dico.add("X", "A")
			dico.add("Z", "@")
			dico.add("Y", "C")
			assert(dico.at("B").same_as("W"))
			assert(dico.at("A").same_as("X"))
			assert(dico.at("C").same_as("Y"))
			assert(dico.at("@").same_as("Z"))
		end

	test_set is
		local
			set: AVL_SET[STRING]
		do
			create set.make
			set.add("B")
			set.add("A")
			set.add("@")
			set.add("C")
			assert(set.has("@"))
			assert(set.has("A"))
			assert(set.has("B"))
			assert(set.has("C"))
		end

end -- class TEST_AVL
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
