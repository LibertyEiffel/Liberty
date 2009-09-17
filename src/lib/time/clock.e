expanded class CLOCK

feature {ANY}
	value: INTEGER is
			-- Get the CPU clock periods if available (-1 if not).
		do
			Result := basic_clock
		end
	
	periods_per_second: INTEGER is
			--  The number of clock periods per seconds.
		require
			value >= 0
		do
			Result := basic_clock_per_sec
		end
	
feature {}
	basic_clock: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "time/clock"
			feature_name: "basic_clock"
			}"
		end
	
	basic_clock_per_sec: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "time/clock"
			feature_name: "basic_clock_per_sec"
			}"
		end
	
end -- class CLOCK
