-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class TIME_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	asctime (a_tp: POINTER): POINTER 

		-- function asctime (in `/usr/include/time.h')
               -- asctime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "asctime"
               }"
               end

	asctime_r (a_tp: POINTER; a_buf: POINTER): POINTER 

		-- function asctime_r (in `/usr/include/time.h')
               -- asctime_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "asctime_r"
               }"
               end

	clock: like long 

		-- function clock (in `/usr/include/time.h')
               -- clock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clock()"
               }"
               end

	clock_getcpuclockid (a_pid: INTEGER; a_clock_id: POINTER): INTEGER 

		-- function clock_getcpuclockid (in `/usr/include/time.h')
               -- clock_getcpuclockid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clock_getcpuclockid"
               }"
               end

	clock_getres (a_clock_id: INTEGER; a_res: POINTER): INTEGER 

		-- function clock_getres (in `/usr/include/time.h')
               -- clock_getres
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clock_getres"
               }"
               end

	clock_gettime (a_clock_id: INTEGER; a_tp: POINTER): INTEGER 

		-- function clock_gettime (in `/usr/include/time.h')
               -- clock_gettime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clock_gettime"
               }"
               end

	clock_nanosleep (a_clock_id: INTEGER; a_flags: INTEGER; a_req: POINTER; a_rem: POINTER): INTEGER 

		-- function clock_nanosleep (in `/usr/include/time.h')
               -- clock_nanosleep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clock_nanosleep"
               }"
               end

	clock_settime (a_clock_id: INTEGER; a_tp: POINTER): INTEGER 

		-- function clock_settime (in `/usr/include/time.h')
               -- clock_settime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clock_settime"
               }"
               end

	ctime (a_timer: POINTER): POINTER 

		-- function ctime (in `/usr/include/time.h')
               -- ctime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ctime"
               }"
               end

	ctime_r (a_timer: POINTER; a_buf: POINTER): POINTER 

		-- function ctime_r (in `/usr/include/time.h')
               -- ctime_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ctime_r"
               }"
               end

	-- `hidden' variable __daylight skipped.
	daylight: INTEGER
               -- daylight
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "daylight"
               }"
               end

       address_of_daylight: POINTER
               -- Address of daylight
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&daylight"
               }"
               end

       set_daylight (a_value: INTEGER)
               -- Set variable daylight value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_daylight"
               }"
               end

	difftime (a_time1: like long; a_time0: like long): REAL 

		-- function difftime (in `/usr/include/time.h')
               -- difftime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "difftime"
               }"
               end

	dysize (a_year: INTEGER): INTEGER 

		-- function dysize (in `/usr/include/time.h')
               -- dysize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dysize"
               }"
               end

	getdate (a_string: POINTER): POINTER 

		-- function getdate (in `/usr/include/time.h')
               -- getdate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getdate"
               }"
               end

	getdate_err: INTEGER
               -- getdate_err
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getdate_err"
               }"
               end

       address_of_getdate_err: POINTER
               -- Address of getdate_err
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&getdate_err"
               }"
               end

       set_getdate_err (a_value: INTEGER)
               -- Set variable getdate_err value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_getdate_err"
               }"
               end

	getdate_r (a_string: POINTER; a_resbufp: POINTER): INTEGER 

		-- function getdate_r (in `/usr/include/time.h')
               -- getdate_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getdate_r"
               }"
               end

	gmtime (a_timer: POINTER): POINTER 

		-- function gmtime (in `/usr/include/time.h')
               -- gmtime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gmtime"
               }"
               end

	gmtime_r (a_timer: POINTER; a_tp: POINTER): POINTER 

		-- function gmtime_r (in `/usr/include/time.h')
               -- gmtime_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gmtime_r"
               }"
               end

	localtime (a_timer: POINTER): POINTER 

		-- function localtime (in `/usr/include/time.h')
               -- localtime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "localtime"
               }"
               end

	localtime_r (a_timer: POINTER; a_tp: POINTER): POINTER 

		-- function localtime_r (in `/usr/include/time.h')
               -- localtime_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "localtime_r"
               }"
               end

	mktime (a_tp: POINTER): like long 

		-- function mktime (in `/usr/include/time.h')
               -- mktime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mktime"
               }"
               end

	nanosleep (a_requested_time: POINTER; a_remaining: POINTER): INTEGER 

		-- function nanosleep (in `/usr/include/time.h')
               -- nanosleep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "nanosleep"
               }"
               end

	stime (a_when_external: POINTER): INTEGER 

		-- function stime (in `/usr/include/time.h')
               -- stime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "stime"
               }"
               end

	strftime (a_s: POINTER; a_maxsize: like long_unsigned; a_format: POINTER; a_tp: POINTER): like long_unsigned 

		-- function strftime (in `/usr/include/time.h')
               -- strftime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strftime"
               }"
               end

	strftime_l (a_s: POINTER; a_maxsize: like long_unsigned; a_format: POINTER; a_tp: POINTER; a_loc: POINTER): like long_unsigned 

		-- function strftime_l (in `/usr/include/time.h')
               -- strftime_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strftime_l"
               }"
               end

	strptime (a_s: POINTER; a_fmt: POINTER; a_tp: POINTER): POINTER 

		-- function strptime (in `/usr/include/time.h')
               -- strptime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strptime"
               }"
               end

	strptime_l (a_s: POINTER; a_fmt: POINTER; a_tp: POINTER; a_loc: POINTER): POINTER 

		-- function strptime_l (in `/usr/include/time.h')
               -- strptime_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strptime_l"
               }"
               end

	time (a_timer: POINTER): like long 

		-- function time (in `/usr/include/time.h')
               -- time
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "time"
               }"
               end

	timegm (a_tp: POINTER): like long 

		-- function timegm (in `/usr/include/time.h')
               -- timegm
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "timegm"
               }"
               end

	timelocal (a_tp: POINTER): like long 

		-- function timelocal (in `/usr/include/time.h')
               -- timelocal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "timelocal"
               }"
               end

	timer_create (a_clock_id: INTEGER; an_evp: POINTER; a_timerid: POINTER): INTEGER 

		-- function timer_create (in `/usr/include/time.h')
               -- timer_create
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "timer_create"
               }"
               end

	timer_delete (a_timerid: POINTER): INTEGER 

		-- function timer_delete (in `/usr/include/time.h')
               -- timer_delete
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "timer_delete"
               }"
               end

	timer_getoverrun (a_timerid: POINTER): INTEGER 

		-- function timer_getoverrun (in `/usr/include/time.h')
               -- timer_getoverrun
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "timer_getoverrun"
               }"
               end

	timer_gettime (a_timerid: POINTER; a_value: POINTER): INTEGER 

		-- function timer_gettime (in `/usr/include/time.h')
               -- timer_gettime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "timer_gettime"
               }"
               end

	timer_settime (a_timerid: POINTER; a_flags: INTEGER; a_value: POINTER; an_ovalue: POINTER): INTEGER 

		-- function timer_settime (in `/usr/include/time.h')
               -- timer_settime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "timer_settime"
               }"
               end

	timespec_get (a_ts: POINTER; a_base: INTEGER): INTEGER 

		-- function timespec_get (in `/usr/include/time.h')
               -- timespec_get
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "timespec_get"
               }"
               end

	-- `hidden' variable __timezone skipped.
	timezone: like long
               -- timezone
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "timezone"
               }"
               end

       address_of_timezone: POINTER
               -- Address of timezone
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&timezone"
               }"
               end

       set_timezone (a_value: like long)
               -- Set variable timezone value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_timezone"
               }"
               end

	tzname: POINTER
               -- tzname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tzname"
               }"
               end

       address_of_tzname: POINTER
               -- Address of tzname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&tzname"
               }"
               end

       set_tzname (a_value: POINTER)
               -- Set variable tzname value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_tzname"
               }"
               end

	-- `hidden' variable __tzname skipped.
	tzset 

		-- function tzset (in `/usr/include/time.h')
               -- tzset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tzset()"
               }"
               end


end -- class TIME_EXTERNALS
