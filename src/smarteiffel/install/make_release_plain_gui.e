-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MAKE_RELEASE_PLAIN_GUI

inherit
	MAKE_RELEASE_GUI

creation {MAKE_RELEASE}
	make

feature {MAKE_RELEASE, MAKE_RELEASE_JOB}
	start (job: MAKE_RELEASE_JOB) is
		local
			stack: LOOP_STACK
		do
			create stack.make
			stack.add_job(job)
			stack.run
			die(0)
		end

	set_title (a_message: STRING) is
		do
			echo.put_string(a_message)
			echo.put_character('%N')
		end

	set_action (a_message: STRING) is
		do
			echo.put_string(a_message)
			echo.put_character('%N')
		end

	set_progress (a_value, a_max: INTEGER; a_message: STRING) is
		do
			echo.put_string(a_message)
			echo.put_string(once " (")
			echo.put_integer(a_value)
			echo.put_string(once " of ")
			echo.put_integer(a_max)
			echo.put_string(once ")%N")
		end

	die (death_code: INTEGER) is
		do
			die_with_code(death_code)
		end

	run_command (a_command: STRING): INTEGER is
		local
			s: SYSTEM
		do
			Result := s.execute_command(a_command)
		end

feature {}
	make is
		do
		end

end -- class MAKE_RELEASE_PLAIN_GUI
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
