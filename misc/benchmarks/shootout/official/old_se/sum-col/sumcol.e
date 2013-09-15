-- -*- mode: eiffel -*-
-- $Id: sumcol-se.code,v 1.57 2008-03-14 00:00:52 igouy-guest Exp $
-- http://www.bagley.org/~doug/shootout/
class SUMCOL

insert
	ARGUMENTS

creation {ANY}
	make

feature {ANY}
	make is
		local
			sum: INTEGER
		do
			sum := 0
			from
				io.read_line
			until
				io.end_of_input
			loop
				sum := sum + io.last_string.to_integer
				io.read_line
			end
			std_output.put_integer(sum)
			std_output.put_character('%N')
		end

end -- class SUMCOL
