indexing
	description: "Access to GdaDate C structure"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_DATE_STRUCT

inherit ANY undefine is_equal, copy end


feature {} -- Structure getter/setter calls
	--  typedef struct {
	--          gshort year;
	--          gushort month;
	--          gushort day;
	--  } GdaDate;

	get_year (a_struct: POINTER): INTEGER_16 is
		external "C struct GdaDate get year use <libgda/libgda.h>"
		end
	
	set_year (a_struct: POINTER; a_year: INTEGER_16) is
		external "C struct GdaDate set year use <libgda/libgda.h>"
		end

	get_month (a_struct: POINTER): INTEGER_16 is
		obsolete "should be NATURAL_16"
		external "C struct GdaDate get month use <libgda/libgda.h>"
		end

	set_month (a_struct: POINTER; a_month: INTEGER_16) is
		obsolete "a _month should be NATURAL_16"
		external "C struct GdaDate set month use <libgda/libgda.h>"
		end

	get_day (a_struct: POINTER): INTEGER_16 is
		obsolete "should be NATURAL_16"
		external "C struct GdaDate get day use <libgda/libgda.h>"
		end

	set_day (a_struct: POINTER; a_day: INTEGER_16) is
		obsolete "a_day should be NATURAL_16"
		external "C struct GdaDate set day use <libgda/libgda.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDate)"
		end
end
