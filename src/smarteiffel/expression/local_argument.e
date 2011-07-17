-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class LOCAL_ARGUMENT
	--
	-- Common root to handle local variables (LOCAL_NAME) or formal
	-- argument names (ARGUMENT_NAME).
	--

inherit
	NAME

feature {ANY}
	start_position: POSITION
			-- Of the first character of the name.

	is_void: BOOLEAN is False

	is_manifest_string: BOOLEAN is False

	is_current: BOOLEAN is False

	is_implicit_current: BOOLEAN is False

	is_result: BOOLEAN is False

	is_static: BOOLEAN is False

	to_string: STRING is
		deferred
		end

	rank: INTEGER is
			-- in the corresponding flat list.
		deferred
		ensure
			Result >= 1
		end

	frozen use_current (type: TYPE): BOOLEAN is
		do
		end

	frozen to_key: STRING is
		do
			Result := to_string
		end

	frozen precedence: INTEGER is
		do
			Result := atomic_precedence
		end

	frozen pretty_target (indent_level: INTEGER) is
		do
			pretty_printer.put_string(to_string)
			pretty_printer.put_character('.')
		end

	frozen short (type: TYPE) is
		local
			i: INTEGER; c: CHARACTER
		do
			short_printer.hook("Ban")
			from
				i := 1
			until
				i > to_string.count
			loop
				c := to_string.item(i)
				if c = '_' then
					short_printer.hook_or("Uan", "_")
				else
					short_printer.put_character(c)
				end
				i := i + 1
			end
			short_printer.hook("Aan")
		end

	frozen short_target (type: TYPE) is
		do
			short(type)
			short_printer.put_dot
		end

invariant
	not start_position.is_unknown

end -- class LOCAL_ARGUMENT
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
