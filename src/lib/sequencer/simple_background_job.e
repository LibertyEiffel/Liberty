-- See the Copyright notice at the end of this file.
--
class SIMPLE_BACKGROUND_JOB
	-- Describe job to be executed in the background, when there nothing
	-- more important to do. Such job is ready to run at any time.

inherit
	BACKGROUND_JOB

creation {ANY}
	set_work

feature {ANY}
	set_work (t: like task; tr: like task_restart; prio: INTEGER) is
			-- t has to return True while continue
		require
			t /= Void
			prio /= Minimum_integer
		do
			task := t
			task_restart := tr
			priority := prio
		ensure
			priority = prio
		end

feature {LOOP_ITEM}
	done: BOOLEAN

	continue is
		local
			cont: BOOLEAN
		do
			cont := task.item([])
			done := not cont
		end

	restart is
		do
			if task_restart /= Void then
				task_restart.call([])
			end
			done := False
		end

feature {}
	task: PREDICATE[TUPLE]

	task_restart: PROCEDURE[TUPLE]

end -- class SIMPLE_BACKGROUND_JOB
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
