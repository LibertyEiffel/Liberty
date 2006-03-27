indexing
	description: "external features of G_QUARK"
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class G_QUARK_EXTERNALS
feature {NONE} -- external calls

	-- typedef     GQuark;-- typedef guint32 GQuark;


	g_quark_from_string (string: POINTER): INTEGER_32 is
		external "C use <glib.h>"
		end

	g_quark_from_static_string (string: POINTER): INTEGER_32 is
		obsolete "As far as I know Eiffel program cannot feed static strings to underlying C code. Use g_quark_from_string instead."
		external "C use <glib.h>"
		end

	g_quark_to_string (quark: INTEGER_32): POINTER is
		external "C use <glib.h>"
		end

	g_quark_try_string (string: POINTER): INTEGER_32 is
		external "C use <glib.h>"
		end

	g_intern_string (string: POINTER): INTEGER_32 is
		external "C use <glib.h>"
		end

	g_intern_static_string (string: POINTER): INTEGER_32 is
		external "C use <glib.h>"
		end 
end
