-- -*- mode: eiffel -*-
-- $Id: sumcol-se.code,v 1.57 2008-03-14 00:00:52 igouy-guest Exp $
-- http://www.bagley.org/~doug/shootout/
class SUMCOL

insert
	ARGUMENTS

create {ANY}
	make

feature {ANY}
	make
		local
			sum: INTEGER
		do
			sum := 0
			from
				std_input.read_line
			until
				std_input.end_of_input
			loop
				sum := sum + std_input.last_string.to_integer
				std_input.read_line
			end
			std_output.put_integer(sum)
			std_output.put_new_line
		end

end -- class SUMCOL
