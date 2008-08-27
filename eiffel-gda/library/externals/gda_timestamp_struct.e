-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_TIMESTAMP_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_year (a_structure: POINTER; a_value: INTEGER_16) is
		external "C struct GdaTimestamp set year use <libgda/libgda.h>"
		end

	low_level_set_month (a_structure: POINTER; a_value: INTEGER_16) is
		external "C struct GdaTimestamp set month use <libgda/libgda.h>"
		end

	low_level_set_day (a_structure: POINTER; a_value: INTEGER_16) is
		external "C struct GdaTimestamp set day use <libgda/libgda.h>"
		end

	low_level_set_hour (a_structure: POINTER; a_value: INTEGER_16) is
		external "C struct GdaTimestamp set hour use <libgda/libgda.h>"
		end

	low_level_set_minute (a_structure: POINTER; a_value: INTEGER_16) is
		external "C struct GdaTimestamp set minute use <libgda/libgda.h>"
		end

	low_level_set_second (a_structure: POINTER; a_value: INTEGER_16) is
		external "C struct GdaTimestamp set second use <libgda/libgda.h>"
		end

	low_level_set_fraction (a_structure: POINTER; a_value: INTEGER_32) is
		external "C struct GdaTimestamp set fraction use <libgda/libgda.h>"
		end

	low_level_set_timezone (a_structure: POINTER; a_value: INTEGER_32) is
		external "C struct GdaTimestamp set timezone use <libgda/libgda.h>"
		end

feature {} -- Low-level queries
	get_year (a_structure: POINTER): INTEGER_16 is
		external "C struct GdaTimestamp get year use <libgda/libgda.h>"
		end

	get_month (a_structure: POINTER): INTEGER_16 is
		external "C struct GdaTimestamp get month use <libgda/libgda.h>"
		end

	get_day (a_structure: POINTER): INTEGER_16 is
		external "C struct GdaTimestamp get day use <libgda/libgda.h>"
		end

	get_hour (a_structure: POINTER): INTEGER_16 is
		external "C struct GdaTimestamp get hour use <libgda/libgda.h>"
		end

	get_minute (a_structure: POINTER): INTEGER_16 is
		external "C struct GdaTimestamp get minute use <libgda/libgda.h>"
		end

	get_second (a_structure: POINTER): INTEGER_16 is
		external "C struct GdaTimestamp get second use <libgda/libgda.h>"
		end

	get_fraction (a_structure: POINTER): INTEGER_32 is
		external "C struct GdaTimestamp get fraction use <libgda/libgda.h>"
		end

	get_timezone (a_structure: POINTER): INTEGER_32 is
		external "C struct GdaTimestamp get timezone use <libgda/libgda.h>"
		end

end
