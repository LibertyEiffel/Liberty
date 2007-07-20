indexing
	description: "Access to GdaTime C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_TIME_STRUCT

inherit ANY undefine is_equal, copy end


feature {} -- Structure getter/setter calls
--  typedef struct {
--          gushort hour;
--          gushort minute;
--          gushort second;
--          glong timezone; /* # of seconds to the east UTC */
--  } GdaTime;

	--          gushort hour;
	get_hour (a_struct: POINTER): INTEGER_16 is
			-- TODO: should be NATURAL_16 since it is gushort. It shouldn't harm since its allowable values should fit INTEGER_8
		external "C struct GdaTime get hour use <libgda/libgda.h>"
		end

	set_hour (a_struct: POINTER; a_hour: INTEGER_16) is
			-- TODO: a_hour should be NATURAL_16 since it is gushort. It shouldn't harm since its allowable values should fit INTEGER_8
		external "C struct GdaTime set hour use <libgda/libgda.h>"
		end

--          gushort minute;
	get_minute (a_struct: POINTER): INTEGER_16 is
			-- TODO: should be NATURAL_16 since it is gushort. It shouldn't harm since its allowable values should fit INTEGER_8
		external "C struct GdaTime get minute use <libgda/libgda.h>"
		end

	set_minute (a_struct: POINTER; a_minute: INTEGER_16) is
			-- TODO: a_minute should be NATURAL_16 since it is gushort. It shouldn't harm since its allowable values should fit INTEGER_8
		external "C struct GdaTime set minute use <libgda/libgda.h>"
		end

--          gushort second;
	get_second (a_struct: POINTER): INTEGER_16 is
			-- TODO: should be NATURAL_16 since it is gushort. It shouldn't harm since its allowable values should fit INTEGER_8
		external "C struct GdaTime get second use <libgda/libgda.h>"
		end

	set_second (a_struct: POINTER; a_second: INTEGER_16) is
			-- TODO: a_second should be NATURAL_16 since it is gushort. It shouldn't harm since its allowable values should fit INTEGER_8
		external "C struct GdaTime set second use <libgda/libgda.h>"
		end

	--          glong timezone; /* # of seconds to the east UTC */
	get_timezone (a_struct: POINTER): INTEGER is
		external "C struct GdaTime get timezone use <libgda/libgda.h>"
		end

	set_timezone (a_struct: POINTER; a_timezone: INTEGER) is
		external "C struct GdaTime set timezone use <libgda/libgda.h>"
		end

feature {} -- size

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaTime)"
		end

end
