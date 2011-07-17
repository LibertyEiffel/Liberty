-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class STATIC_TYPE_MARK
	--
	-- Some definition shared by True static type marks.
	--

inherit
	TYPE_MARK

feature {ANY}
	frozen is_static: BOOLEAN is True

	frozen has_been_specialized: BOOLEAN is True

	frozen specialize_in (new_type: TYPE) is
		do
		end

	frozen specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): TYPE_MARK is
		do
			Result := Current
		end

	frozen declaration_type: TYPE_MARK is
		do
			Result := Current
		end

	frozen to_static (new_type: TYPE): TYPE_MARK is
		do
			Result := Current
		end

	frozen signature_resolve_in (new_type: TYPE): TYPE is
		do
			Result := type
		end

end -- class STATIC_TYPE_MARK
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
