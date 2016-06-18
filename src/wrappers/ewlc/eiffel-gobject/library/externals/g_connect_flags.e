note
	description: "enum GConnectFlags -- The connection flags are used to specify the behaviour of a signal's connection."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"


deferred class G_CONNECT_FLAGS

inherit ANY undefine is_equal, copy end

feature {ANY}
	are_valid_connect_flags (some_flags: INTEGER): BOOLEAN
		do
			Result:=(some_flags & (g_connect_after | g_connect_swapped)).to_boolean
		end
   g_connect_after: INTEGER
			-- whether the handler should be called before or after the
			-- default handler of the signal.
		external "C macro use <glib-object.h>"
		alias "G_CONNECT_AFTER"
		end
	
	g_connect_swapped: INTEGER
		-- whether the instance and data should be swapped when calling
		-- the handler.
		external "C macro use <glib-object.h>"
		alias "G_CONNECT_SWAPPED"
		end
end
