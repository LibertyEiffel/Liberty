note
	description: "Access to $struct C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_BINDING_SIGNAL_STRUCT
	--  GtkBindingSignal
	--
	-- typedef struct {
	--   GtkBindingSignal      *next;
	--   gchar                 *signal_name;
	--   guint                  n_args;
	--   GtkBindingArg         *args;
	-- } GtkBindingSignal;

feature {} -- Structure getter/setter calls
	-- 	get_$field (a_struct: POINTER): $type is
	-- 		external "C struct $struct get $field use <$include>"
	-- 		end
	
	-- 	set_$field (a_struct: POINTER; a_$field: $type) is
	-- 		external "C struct $struct set $field use <$include>"
	-- 		end
	
	--  GtkBindingSignal
	--
	-- typedef struct {
	--   GtkBindingSignal      *next;
	--   gchar                 *signal_name;
	--   guint                  n_args;
	--   GtkBindingArg         *args;
	-- } GtkBindingSignal;

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <$include>"
		alias "sizeof($struct)"
		end

end
