-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ENSURE_ASSERTION
	--
	-- To store a `ensure' or an `ensure then' assertion. 
	--

inherit
	ASSERTION_LIST
		rename make as assertion_list_make
		redefine
			compile_to_c, pretty
		end
	
creation {ANY}
	make

feature {ANY}
	is_ensure_then: BOOLEAN

	compile_to_c (type: TYPE) is
		local
			i: INTEGER; assertion: ASSERTION
		do
			if not is_always_true(type) then
				cpp.stop_recursive_assertion_opening(True)
				from
					i := list.lower
				until
					i > list.upper
				loop
					assertion := list.item(i)
					if not assertion.is_always_true(type) then
						assertion.compile_to_c_as_ensure(type)
					end
					i := i + 1
				end
				cpp.stop_recursive_assertion_closing(True)
			end
		end

	pretty (indent_level: INTEGER) is
		do
			check
				indent_level = 2
			end
			if is_ensure_then then
				pretty_print_with_tag(2, once "ensure then")
			else
				pretty_print_with_tag(2, once "ensure")
			end
		end

feature {}
	make (sp: like start_position; then_flag: BOOLEAN; hc: like header_comment; l: like list) is
		do
			assertion_list_make(sp, hc, l)
			is_ensure_then := then_flag
		ensure
			is_ensure_then = then_flag
		end

	check_assertion_mode: STRING is "ens"

end -- class ENSURE_ASSERTION
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
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
