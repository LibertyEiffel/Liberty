note
	description: "enum GSignalMatchType, the match types specify what g_signal_handlers_block_matched(), g_signal_handlers_unblock_matched() and g_signal_handlers_disconnect_matched() match signals by."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class G_SIGNAL_MATCH_TYPE

inherit ANY undefine is_equal, copy end

feature {} --  enum
	is_valid_signal_match_type (a_match_type: INTEGER): BOOLEAN is
		do
			Result:=(a_match_type & (g_signal_match_id |
											 g_signal_match_detail |
											 g_signal_match_closure |
											 g_signal_match_func |
											 g_signal_match_data	|
											 g_signal_match_unblocked)).to_boolean
		end

	g_signal_match_id: INTEGER is
			-- The signal id must be equal.
		external "C macro use <glib-object.h>"
		alias "G_SIGNAL_MATCH_ID"
		end

	g_signal_match_detail: INTEGER is
			-- The signal detail be equal.
		external "C macro use <glib-object.h>"
		alias "G_SIGNAL_MATCH_DETAIL"
		end

	g_signal_match_closure: INTEGER is
			-- The closure must be the same.
		external "C macro use <glib-object.h>"
		alias "G_SIGNAL_MATCH_CLOSURE"
		end

	g_signal_match_func: INTEGER is
			-- The C closure callback must be the same.
		external "C macro use <glib-object.h>"
		alias "G_SIGNAL_MATCH_FUNC"
		end

	g_signal_match_data: INTEGER is
			-- The closure data must be the same.
		external "C macro use <glib-object.h>"
		alias "G_SIGNAL_MATCH_DATA"
		end

	g_signal_match_unblocked: INTEGER is
			-- Only unblocked signals may matched.
		external "C macro use <glib-object.h>"
		alias "G_SIGNAL_MATCH_UNBLOCKED"
		end
end
