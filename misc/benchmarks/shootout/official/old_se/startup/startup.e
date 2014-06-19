-- -*- mode: eiffel -*-
-- $Id: hello-se.code,v 1.47 2008-03-14 00:00:50 igouy-guest Exp $
-- http://www.bagley.org/~doug/shootout/
class STARTUP

create {ANY}
	make

feature {ANY}
	make
		do
			std_output.put_string("hello world")
			std_output.put_new_line
		end

end -- class STARTUP
