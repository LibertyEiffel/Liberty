indexing
	description: "External calls for "
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class _EXTERNALS

feature {} -- External calls

	gda_transaction_new (a_name: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_transaction_get_isolation_level (a_transaction:POINTER): INTEGER is
		external "C use <libgda/libgda.h>"
		end

	gda_transaction_set_isolation_level (a_transaction:POINTER, a_level: INTEGER) is
		external "C use <libgda/libgda.h>"
		end
	
	gda_transaction_get_name (a_transaction:POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end
	
	gda_transaction_set_name (a_transaction, a_name: POINTER) is
		external "C use <libgda/libgda.h>"
		end
	
feature -- size

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaTransaction)"
		end
end
