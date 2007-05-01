indexing
	description: "Access to GdaMoney C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_MONEY_STRUCT

inherit ANY undefine is_equal, copy end


feature {} -- Structure getter/setter calls
--  typedef struct {
--          gchar *currency;
--          gdouble amount;
--  } GdaMoney;

	get_currency (a_struct: POINTER): POINTER is
		external "C struct GdaMoney get currency use <libgda/libgda.h>"
		end

	set_currency (a_struct: POINTER; a_currency: POINTER) is
		external "C struct GdaMoney set currency use <libgda/libgda.h>"
		end

	get_amount (a_struct: POINTER): REAL is
		external "C struct GdaMoney get amount use <libgda/libgda.h>"
		end

	set_amount (a_struct: POINTER; a_amount: REAL) is
		external "C struct GdaMoney set amount use <libgda/libgda.h>"
		end

feature
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaMoney)"
		end

end
