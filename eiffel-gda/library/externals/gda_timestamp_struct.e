indexing
	description: "Access to GdaTimestamp C structure"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_TIMESTAMP_STRUCT

inherit ANY undefine is_equal, copy end


feature {} -- Structure getter/setter calls

--  typedef struct {
--          gshort year;
--          gushort month;
--          gushort day;
--          gushort hour;
--          gushort minute;
--          gushort second;
--          gulong fraction;
--          glong timezone; /* # of seconds to the east UTC */
--  } GdaTimestamp;

	get_year (a_struct: POINTER): INTEGER_16 is
		external "C struct GdaTimestamp get year use <libgda/libgda.h>"
		end
	
	set_year (a_struct: POINTER; a_year: INTEGER_16) is
		external "C struct GdaTimestamp set year use <libgda/libgda.h>"
		end

	get_month (a_struct: POINTER): INTEGER_16 is
			-- TODO: should be NATURAL_16
		external "C struct GdaTimestamp get month use <libgda/libgda.h>"
		end

	set_month (a_struct: POINTER; a_month: INTEGER_16) is
			-- TODO: a _month should be NATURAL_16
		external "C struct GdaTimestamp set month use <libgda/libgda.h>"
		end

	get_day (a_struct: POINTER): INTEGER_16 is
			-- TODO: should be NATURAL_16
		external "C struct GdaTimestamp get day use <libgda/libgda.h>"
		end

	set_day (a_struct: POINTER; a_day: INTEGER_16) is
			-- TODO: a_day should be NATURAL_16
		external "C struct GdaTimestamp set day use <libgda/libgda.h>"
		end

	--          gushort hour;
	get_hour (a_struct: POINTER): INTEGER_16 is
			-- TODO: should be NATURAL_16 since it is gushort. It shouldn't harm since its allowable values should fit INTEGER_8
		external "C struct GdaTimestamp get hour use <libgda/libgda.h>"
		end

	set_hour (a_struct: POINTER; a_hour: INTEGER_16) is
			-- TODO: a_hour should be NATURAL_16 since it is gushort. It shouldn't harm since its allowable values should fit INTEGER_8
		external "C struct GdaTimestamp set hour use <libgda/libgda.h>"
		end

--          gushort minute;
	get_minute (a_struct: POINTER): INTEGER_16 is
			-- TODO: should be NATURAL_16 since it is gushort. It shouldn't harm since its allowable values should fit INTEGER_8
		external "C struct GdaTimestamp get minute use <libgda/libgda.h>"
		end

	set_minute (a_struct: POINTER; a_minute: INTEGER_16) is
			-- TODO: a_minute should be NATURAL_16 since it is gushort. It shouldn't harm since its allowable values should fit INTEGER_8
		external "C struct GdaTimestamp set minute use <libgda/libgda.h>"
		end

--          gushort second;
	get_second (a_struct: POINTER): INTEGER_16 is
			-- TODO: should be NATURAL_16 since it is gushort. It shouldn't harm since its allowable values should fit INTEGER_8
		external "C struct GdaTimestamp get second use <libgda/libgda.h>"
		end

	set_second (a_struct: POINTER; a_second: INTEGER_16) is
			-- TODO: a_second should be NATURAL_16 since it is gushort. It shouldn't harm since its allowable values should fit INTEGER_8
		external "C struct GdaTimestamp set second use <libgda/libgda.h>"
		end

	--          glong timezone; /* # of seconds to the east UTC */
	get_timezone (a_struct: POINTER): INTEGER is
		external "C struct GdaTimestamp get timezone use <libgda/libgda.h>"
		end

	set_timezone (a_struct: POINTER; a_timezone: INTEGER) is
		external "C struct GdaTimestamp set timezone use <libgda/libgda.h>"
		end

end
