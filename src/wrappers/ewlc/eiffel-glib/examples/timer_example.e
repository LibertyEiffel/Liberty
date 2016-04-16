note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class TIMER_EXAMPLE

create {ANY} make
feature {ANY}
	timer: G_TIMER
	make is
		local t: REAL
		do
			create timer
			from  until timer.elapsed > 10.0
			loop
				if (timer.elapsed-t)>0.1 then
					t := timer.elapsed;
					(once "Elapsed ").print_on(std_output)
					timer.elapsed.print_on (std_output)
					(once " seconds%N").print_on(std_output)
				end
			end
		end
end	
				
