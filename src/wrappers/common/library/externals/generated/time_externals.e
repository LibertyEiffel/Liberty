-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class TIME_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	asctime (a_tp: POINTER): POINTER 

		-- function asctime (in 261 at line /usr/include/time.h)i
               -- asctime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "asctime"
               }"
               end

	asctime_r (a_tp: POINTER; a_buf: POINTER): POINTER 

		-- function asctime_r (in 272 at line /usr/include/time.h)i
               -- asctime_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "asctime_r"
               }"
               end

	clock: like long 

		-- function clock (in 189 at line /usr/include/time.h)i
               -- clock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clock"
               }"
               end

	clock_getcpuclockid (a_pid: INTEGER; a_clock_id: POINTER): INTEGER 

		-- function clock_getcpuclockid (in 358 at line /usr/include/time.h)i
               -- clock_getcpuclockid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clock_getcpuclockid"
               }"
               end

	clock_getres (a_clock_id: INTEGER; a_res: POINTER): INTEGER 

		-- function clock_getres (in 339 at line /usr/include/time.h)i
               -- clock_getres
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clock_getres"
               }"
               end

	clock_gettime (a_clock_id: INTEGER; a_tp: POINTER): INTEGER 

		-- function clock_gettime (in 342 at line /usr/include/time.h)i
               -- clock_gettime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clock_gettime"
               }"
               end

	clock_nanosleep (a_clock_id: INTEGER; a_flags: INTEGER; a_req: POINTER; a_rem: POINTER): INTEGER 

		-- function clock_nanosleep (in 353 at line /usr/include/time.h)i
               -- clock_nanosleep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clock_nanosleep"
               }"
               end

	clock_settime (a_clock_id: INTEGER; a_tp: POINTER): INTEGER 

		-- function clock_settime (in 345 at line /usr/include/time.h)i
               -- clock_settime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clock_settime"
               }"
               end

	ctime (a_timer: POINTER): POINTER 

		-- function ctime (in 264 at line /usr/include/time.h)i
               -- ctime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ctime"
               }"
               end

	ctime_r (a_timer: POINTER; a_buf: POINTER): POINTER 

		-- function ctime_r (in 276 at line /usr/include/time.h)i
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

		-- function difftime (in 195 at line /usr/include/time.h)i
               -- difftime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "difftime"
               }"
               end

	dysize (a_year: INTEGER): INTEGER 

		-- function dysize (in 325 at line /usr/include/time.h)i
               -- dysize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dysize"
               }"
               end

	getdate (a_string: POINTER): POINTER 

		-- function getdate (in 412 at line /usr/include/time.h)i
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

		-- function getdate_r (in 426 at line /usr/include/time.h)i
               -- getdate_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getdate_r"
               }"
               end

	gmtime (a_timer: POINTER): POINTER 

		-- function gmtime (in 239 at line /usr/include/time.h)i
               -- gmtime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gmtime"
               }"
               end

	gmtime_r (a_timer: POINTER; a_tp: POINTER): POINTER 

		-- function gmtime_r (in 249 at line /usr/include/time.h)i
               -- gmtime_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gmtime_r"
               }"
               end

	localtime (a_timer: POINTER): POINTER 

		-- function localtime (in 243 at line /usr/include/time.h)i
               -- localtime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "localtime"
               }"
               end

	localtime_r (a_timer: POINTER; a_tp: POINTER): POINTER 

		-- function localtime_r (in 254 at line /usr/include/time.h)i
               -- localtime_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "localtime_r"
               }"
               end

	mktime (a_tp: POINTER): like long 

		-- function mktime (in 199 at line /usr/include/time.h)i
               -- mktime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mktime"
               }"
               end

	nanosleep (a_requested_time: POINTER; a_remaining: POINTER): INTEGER 

		-- function nanosleep (in 334 at line /usr/include/time.h)i
               -- nanosleep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "nanosleep"
               }"
               end

	stime (a_when_external: POINTER): INTEGER 

		-- function stime (in 304 at line /usr/include/time.h)i
               -- stime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "stime"
               }"
               end

	strftime (a_s: POINTER; a_maxsize: like long_unsigned; a_format: POINTER; a_tp: POINTER): like long_unsigned 

		-- function strftime (in 205 at line /usr/include/time.h)i
               -- strftime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strftime"
               }"
               end

	strftime_l (a_s: POINTER; a_maxsize: like long_unsigned; a_format: POINTER; a_tp: POINTER; a_loc: POINTER): like long_unsigned 

		-- function strftime_l (in 223 at line /usr/include/time.h)i
               -- strftime_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strftime_l"
               }"
               end

	strptime (a_s: POINTER; a_fmt: POINTER; a_tp: POINTER): POINTER 

		-- function strptime (in 213 at line /usr/include/time.h)i
               -- strptime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strptime"
               }"
               end

	strptime_l (a_s: POINTER; a_fmt: POINTER; a_tp: POINTER; a_loc: POINTER): POINTER 

		-- function strptime_l (in 230 at line /usr/include/time.h)i
               -- strptime_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strptime_l"
               }"
               end

	time (a_timer: POINTER): like long 

		-- function time (in 192 at line /usr/include/time.h)i
               -- time
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "time"
               }"
               end

	timegm (a_tp: POINTER): like long 

		-- function timegm (in 319 at line /usr/include/time.h)i
               -- timegm
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "timegm"
               }"
               end

	timelocal (a_tp: POINTER): like long 

		-- function timelocal (in 322 at line /usr/include/time.h)i
               -- timelocal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "timelocal"
               }"
               end

	timer_create (a_clock_id: INTEGER; an_evp: POINTER; a_timerid: POINTER): INTEGER 

		-- function timer_create (in 363 at line /usr/include/time.h)i
               -- timer_create
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "timer_create"
               }"
               end

	timer_delete (a_timerid: POINTER): INTEGER 

		-- function timer_delete (in 368 at line /usr/include/time.h)i
               -- timer_delete
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "timer_delete"
               }"
               end

	timer_getoverrun (a_timerid: POINTER): INTEGER 

		-- function timer_getoverrun (in 380 at line /usr/include/time.h)i
               -- timer_getoverrun
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "timer_getoverrun"
               }"
               end

	timer_gettime (a_timerid: POINTER; a_value: POINTER): INTEGER 

		-- function timer_gettime (in 376 at line /usr/include/time.h)i
               -- timer_gettime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "timer_gettime"
               }"
               end

	timer_settime (a_timerid: POINTER; a_flags: INTEGER; a_value: POINTER; an_ovalue: POINTER): INTEGER 

		-- function timer_settime (in 371 at line /usr/include/time.h)i
               -- timer_settime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "timer_settime"
               }"
               end

	timespec_get (a_ts: POINTER; a_base: INTEGER): INTEGER 

		-- function timespec_get (in 386 at line /usr/include/time.h)i
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

		-- function tzset (in 293 at line /usr/include/time.h)i
               -- tzset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tzset"
               }"
               end


end -- class TIME_EXTERNALS
