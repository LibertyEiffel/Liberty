indexing
	description: "Access to $struct C structure"
	copyright: "Copyright (C) 2007 $EWLC_developer, $original_copyright_holder"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_STATUS_EVENT_STRUCT
	-- TODO: Entirely!

feature {} -- Structure getter/setter calls
	--  GdaTransactionStatusEvent
	--
	-- typedef struct {
	--         GdaTransactionStatus         *trans;
	--         GdaTransactionStatusEventType type;
	--         union {
	--                 gchar                *svp_name; /* save point name if this event corresponds to a new save point */
	--                 gchar                *sql;      /* SQL to store SQL queries in transactions */
	--                 GdaTransactionStatus *sub_trans;/* sub transaction event */
	--         } pl;
	--         GdaConnectionEvent           *conn_event;
	--
	--         gpointer  reserved1;
	--         gpointer  reserved2;
	-- } GdaTransactionStatusEvent;
	--

	-- 	get_$field (a_struct: POINTER): $type is
	-- 		external "C struct $struct get $field use <$include>"
	-- 		end
	
	-- 	set_$field (a_struct: POINTER; a_$field: $type) is
	-- 		external "C struct $struct set $field use <$include>"
	-- 		end
	
feature -- size
	-- 	struct_size: INTEGER is
	-- 		external "C inline use <$include>"
	-- 		alias "sizeof($struct)"
	-- 		end
end
