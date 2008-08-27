-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_TIME_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_hour (a_structure: POINTER; a_value: INTEGER_16) is
		external "C struct GdaTime set hour use <libgda/libgda.h>"
		end

	low_level_set_minute (a_structure: POINTER; a_value: INTEGER_16) is
		external "C struct GdaTime set minute use <libgda/libgda.h>"
		end

	low_level_set_second (a_structure: POINTER; a_value: INTEGER_16) is
		external "C struct GdaTime set second use <libgda/libgda.h>"
		end

	low_level_set_fraction (a_structure: POINTER; a_value: INTEGER_32) is
		external "C struct GdaTime set fraction use <libgda/libgda.h>"
		end

	low_level_set_timezone (a_structure: POINTER; a_value: INTEGER_32) is
		external "C struct GdaTime set timezone use <libgda/libgda.h>"
		end

feature {} -- Low-level queries
	get_hour (a_structure: POINTER): INTEGER_16 is
		external "C struct GdaTime get hour use <libgda/libgda.h>"
		end

	get_minute (a_structure: POINTER): INTEGER_16 is
		external "C struct GdaTime get minute use <libgda/libgda.h>"
		end

	get_second (a_structure: POINTER): INTEGER_16 is
		external "C struct GdaTime get second use <libgda/libgda.h>"
		end

	get_fraction (a_structure: POINTER): INTEGER_32 is
		external "C struct GdaTime get fraction use <libgda/libgda.h>"
		end

	get_timezone (a_structure: POINTER): INTEGER_32 is
		external "C struct GdaTime get timezone use <libgda/libgda.h>"
		end

end
