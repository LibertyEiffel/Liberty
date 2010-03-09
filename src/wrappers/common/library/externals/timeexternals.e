-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class TIMEEXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	difftime (a_time1: INTEGER_64; a_time0: INTEGER_64): REAL_64 is
 		-- difftime (node at line 223)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "difftime"
		}"
		end

	timegm (a_tp: POINTER): INTEGER_64 is
 		-- timegm (node at line 465)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timegm"
		}"
		end

	ctime_r (a_timer: POINTER; a_buf: POINTER): POINTER is
 		-- ctime_r (node at line 514)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ctime_r"
		}"
		end

	gmtime (a_timer: POINTER): POINTER is
 		-- gmtime (node at line 753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmtime"
		}"
		end

	getdate_r (a_string: POINTER; a_resbufp: POINTER): INTEGER_32 is
 		-- getdate_r (node at line 819)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getdate_r"
		}"
		end

	clock_getres (a_clock_id: INTEGER_32; a_res: POINTER): INTEGER_32 is
 		-- clock_getres (node at line 823)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clock_getres"
		}"
		end

	timelocal (a_tp: POINTER): INTEGER_64 is
 		-- timelocal (node at line 1198)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timelocal"
		}"
		end

	clock_settime (a_clock_id: INTEGER_32; a_tp: POINTER): INTEGER_32 is
 		-- clock_settime (node at line 1234)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clock_settime"
		}"
		end

	strptime_l (a_s: POINTER; a_fmt: POINTER; a_tp: POINTER; a_loc: POINTER): POINTER is
 		-- strptime_l (node at line 1332)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strptime_l"
		}"
		end

	timer_delete (a_timerid: POINTER): INTEGER_32 is
 		-- timer_delete (node at line 1364)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timer_delete"
		}"
		end

	asctime (a_tp: POINTER): POINTER is
 		-- asctime (node at line 1411)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "asctime"
		}"
		end

	localtime (a_timer: POINTER): POINTER is
 		-- localtime (node at line 1434)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "localtime"
		}"
		end

	clock_gettime (a_clock_id: INTEGER_32; a_tp: POINTER): INTEGER_32 is
 		-- clock_gettime (node at line 1607)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clock_gettime"
		}"
		end

	strptime (a_s: POINTER; a_fmt: POINTER; a_tp: POINTER): POINTER is
 		-- strptime (node at line 1611)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strptime"
		}"
		end

	strftime_l (a_s: POINTER; a_maxsize: NATURAL_64; a_format: POINTER; a_tp: POINTER; a_loc: POINTER): NATURAL_64 is
 		-- strftime_l (node at line 1668)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strftime_l"
		}"
		end

	tzset is
 		-- tzset (node at line 1775)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tzset()"
		}"
		end

	clock_getcpuclockid (a_pid: INTEGER_32; a_clock_id: POINTER): INTEGER_32 is
 		-- clock_getcpuclockid (node at line 1884)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clock_getcpuclockid"
		}"
		end

	localtime_r (a_timer: POINTER; a_tp: POINTER): POINTER is
 		-- localtime_r (node at line 2123)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "localtime_r"
		}"
		end

	clock: INTEGER_64 is
 		-- clock (node at line 2365)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clock()"
		}"
		end

	clock_nanosleep (a_clock_id: INTEGER_32; a_flags: INTEGER_32; a_req: POINTER; a_rem: POINTER): INTEGER_32 is
 		-- clock_nanosleep (node at line 2550)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clock_nanosleep"
		}"
		end

	getdate (a_string: POINTER): POINTER is
 		-- getdate (node at line 2597)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getdate"
		}"
		end

	dysize (a_year: INTEGER_32): INTEGER_32 is
 		-- dysize (node at line 2633)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dysize"
		}"
		end

	stime (a_when_external: POINTER): INTEGER_32 is
 		-- stime (node at line 2640)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "stime"
		}"
		end

	timer_create (a_clock_id: INTEGER_32; an_evp: POINTER; a_timerid: POINTER): INTEGER_32 is
 		-- timer_create (node at line 2708)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timer_create"
		}"
		end

	nanosleep (a_requested_time: POINTER; a_remaining: POINTER): INTEGER_32 is
 		-- nanosleep (node at line 2764)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nanosleep"
		}"
		end

	timer_settime (a_timerid: POINTER; a_flags: INTEGER_32; a_value: POINTER; an_ovalue: POINTER): INTEGER_32 is
 		-- timer_settime (node at line 2865)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timer_settime"
		}"
		end

	timer_getoverrun (a_timerid: POINTER): INTEGER_32 is
 		-- timer_getoverrun (node at line 2881)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timer_getoverrun"
		}"
		end

	time (a_timer: POINTER): INTEGER_64 is
 		-- time (node at line 3136)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "time"
		}"
		end

	strftime (a_s: POINTER; a_maxsize: NATURAL_64; a_format: POINTER; a_tp: POINTER): NATURAL_64 is
 		-- strftime (node at line 3154)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strftime"
		}"
		end

	ctime (a_timer: POINTER): POINTER is
 		-- ctime (node at line 3233)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ctime"
		}"
		end

	timer_gettime (a_timerid: POINTER; a_value: POINTER): INTEGER_32 is
 		-- timer_gettime (node at line 3342)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timer_gettime"
		}"
		end

	mktime (a_tp: POINTER): INTEGER_64 is
 		-- mktime (node at line 3358)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mktime"
		}"
		end

	asctime_r (a_tp: POINTER; a_buf: POINTER): POINTER is
 		-- asctime_r (node at line 3483)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "asctime_r"
		}"
		end

	gmtime_r (a_timer: POINTER; a_tp: POINTER): POINTER is
 		-- gmtime_r (node at line 3487)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmtime_r"
		}"
		end


end -- class TIMEEXTERNALS
