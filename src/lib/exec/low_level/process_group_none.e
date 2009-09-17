class PROCESS_GROUP_NONE

inherit
	PROCESS_GROUP

creation {PROCESS_FACTORY}
	make

feature {ANY}
	wait: PROCESS is
		do
		end

	finished: PROCESS is
		do
		end

	count: INTEGER is 0

	capacity: INTEGER is 0

feature {}
	make is
		do
		end

end -- class PROCESS_GROUP_NONE
