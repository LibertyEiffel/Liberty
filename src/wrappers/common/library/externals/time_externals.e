-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class TIME_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	asctime (a_tp: POINTER): POINTER is
 		-- asctime
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "asctime"
		}"
		end

	asctime_r (a_tp: POINTER; a_buf: POINTER): POINTER is
 		-- asctime_r
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "asctime_r"
		}"
		end

	clock: INTEGER_64 is
 		-- clock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clock()"
		}"
		end

	clock_getcpuclockid (a_pid: INTEGER_32; a_clock_id: POINTER): INTEGER_32 is
 		-- clock_getcpuclockid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clock_getcpuclockid"
		}"
		end

	clock_getres (a_clock_id: INTEGER_32; a_res: POINTER): INTEGER_32 is
 		-- clock_getres
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clock_getres"
		}"
		end

	clock_gettime (a_clock_id: INTEGER_32; a_tp: POINTER): INTEGER_32 is
 		-- clock_gettime
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clock_gettime"
		}"
		end

	clock_nanosleep (a_clock_id: INTEGER_32; a_flags: INTEGER_32; a_req: POINTER; a_rem: POINTER): INTEGER_32 is
 		-- clock_nanosleep
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clock_nanosleep"
		}"
		end

	clock_settime (a_clock_id: INTEGER_32; a_tp: POINTER): INTEGER_32 is
 		-- clock_settime
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clock_settime"
		}"
		end

	ctime (a_timer: POINTER): POINTER is
 		-- ctime
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ctime"
		}"
		end

	ctime_r (a_timer: POINTER; a_buf: POINTER): POINTER is
 		-- ctime_r
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ctime_r"
		}"
		end

	-- `hidden' variable __daylight skipped.
	daylight: INTEGER_32 is
 		-- daylight
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "daylight"
		}"
		end

	address_of_daylight: POINTER is
 		-- Address of daylight
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&daylight"
		}"
		end

	set_daylight (a_value: INTEGER_32) is
		-- Set variable daylight value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_daylight"
		}"
		end

	difftime (a_time1: INTEGER_64; a_time0: INTEGER_64): REAL_64 is
 		-- difftime
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "difftime"
		}"
		end

	dysize (a_year: INTEGER_32): INTEGER_32 is
 		-- dysize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dysize"
		}"
		end

	getdate (a_string: POINTER): POINTER is
 		-- getdate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getdate"
		}"
		end

	getdate_err: INTEGER_32 is
 		-- getdate_err
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getdate_err"
		}"
		end

	address_of_getdate_err: POINTER is
 		-- Address of getdate_err
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&getdate_err"
		}"
		end

	set_getdate_err (a_value: INTEGER_32) is
		-- Set variable getdate_err value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_getdate_err"
		}"
		end

	getdate_r (a_string: POINTER; a_resbufp: POINTER): INTEGER_32 is
 		-- getdate_r
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getdate_r"
		}"
		end

	gmtime (a_timer: POINTER): POINTER is
 		-- gmtime
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmtime"
		}"
		end

	gmtime_r (a_timer: POINTER; a_tp: POINTER): POINTER is
 		-- gmtime_r
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmtime_r"
		}"
		end

	localtime (a_timer: POINTER): POINTER is
 		-- localtime
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "localtime"
		}"
		end

	localtime_r (a_timer: POINTER; a_tp: POINTER): POINTER is
 		-- localtime_r
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "localtime_r"
		}"
		end

	mktime (a_tp: POINTER): INTEGER_64 is
 		-- mktime
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mktime"
		}"
		end

	nanosleep (a_requested_time: POINTER; a_remaining: POINTER): INTEGER_32 is
 		-- nanosleep
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nanosleep"
		}"
		end

	stime (a_when_external: POINTER): INTEGER_32 is
 		-- stime
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "stime"
		}"
		end

	strftime (a_s: POINTER; a_maxsize: NATURAL_64; a_format: POINTER; a_tp: POINTER): NATURAL_64 is
 		-- strftime
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strftime"
		}"
		end

	strftime_l (a_s: POINTER; a_maxsize: NATURAL_64; a_format: POINTER; a_tp: POINTER; a_loc: POINTER): NATURAL_64 is
 		-- strftime_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strftime_l"
		}"
		end

	strptime (a_s: POINTER; a_fmt: POINTER; a_tp: POINTER): POINTER is
 		-- strptime
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strptime"
		}"
		end

	strptime_l (a_s: POINTER; a_fmt: POINTER; a_tp: POINTER; a_loc: POINTER): POINTER is
 		-- strptime_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strptime_l"
		}"
		end

	time (a_timer: POINTER): INTEGER_64 is
 		-- time
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "time"
		}"
		end

	timegm (a_tp: POINTER): INTEGER_64 is
 		-- timegm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timegm"
		}"
		end

	timelocal (a_tp: POINTER): INTEGER_64 is
 		-- timelocal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timelocal"
		}"
		end

	timer_create (a_clock_id: INTEGER_32; an_evp: POINTER; a_timerid: POINTER): INTEGER_32 is
 		-- timer_create
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timer_create"
		}"
		end

	timer_delete (a_timerid: POINTER): INTEGER_32 is
 		-- timer_delete
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timer_delete"
		}"
		end

	timer_getoverrun (a_timerid: POINTER): INTEGER_32 is
 		-- timer_getoverrun
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timer_getoverrun"
		}"
		end

	timer_gettime (a_timerid: POINTER; a_value: POINTER): INTEGER_32 is
 		-- timer_gettime
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timer_gettime"
		}"
		end

	timer_settime (a_timerid: POINTER; a_flags: INTEGER_32; a_value: POINTER; an_ovalue: POINTER): INTEGER_32 is
 		-- timer_settime
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timer_settime"
		}"
		end

	timezone: INTEGER_64 is
 		-- timezone
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timezone"
		}"
		end

	address_of_timezone: POINTER is
 		-- Address of timezone
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&timezone"
		}"
		end

	set_timezone (a_value: INTEGER_64) is
		-- Set variable timezone value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_timezone"
		}"
		end

	-- `hidden' variable __timezone skipped.
	tzname: POINTER is
 		-- tzname
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tzname"
		}"
		end

	address_of_tzname: POINTER is
 		-- Address of tzname
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&tzname"
		}"
		end

	set_tzname (a_value: POINTER) is
		-- Set variable tzname value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_tzname"
		}"
		end

	-- `hidden' variable __tzname skipped.
	tzset is
 		-- tzset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tzset()"
		}"
		end


end -- class TIME_EXTERNALS
