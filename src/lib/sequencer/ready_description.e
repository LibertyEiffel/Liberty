-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class READY_DESCRIPTION
obsolete "Please use EVENTS_SET instead"

inherit
	EVENTS_SET
		export
			{ANY} after, at, when_data, is_data, when_free, is_free, when_connection, is_connection
		end

creation {ANY}
	make

feature {ANY}
	after_from_now (timeout_ms: INTEGER) is
			-- `timeout_ms' is the max time in milliseconds to wait from now.
		require
			timeout_ms >= 0
			not queryable
		local
			t: TIME_EVENTS
		do
			expect(t.in_time(timeout_ms))
		end

	when_binary_data (file: BINARY_FILE_READ) is
		require
			file /= Void
			file.is_connected
			not queryable
		do
			when_data(file)
		end

	is_binary_data (file: BINARY_FILE_READ): BOOLEAN is
		require
			file /= Void
			file.is_connected
			queryable
		do
			Result := is_data(file)
		end

end -- class READY_DESCRIPTION
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
