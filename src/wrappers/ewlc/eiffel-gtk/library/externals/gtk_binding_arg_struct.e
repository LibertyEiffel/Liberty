note
	description: "Access to $struct C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_BINDING_ARG_STRUCT
	--  GtkBindingArg

	-- typedef struct {
	--   GType          arg_type;
	--   union {
	--     glong        long_data;
	--     gdouble      double_data;
	--     gchar       *string_data;
	--   } d;
	-- } GtkBindingArg;

insert
	G_TYPES
	GLIB_BASIC_TYPES
	
feature {} -- Structure getter/setter calls

	-- typedef struct {
	get_arg_type (a_struct: POINTER): like g_type
			-- GType arg_type;
		external "C struct GtkBindingSet get arg_type use <gtk/gtk.h>"
		end

	set_arg_type (a_struct: POINTER; a_arg_type: like g_type )
		external "C struct GtkBindingSet set arg_type use <gtk/gtk.h>"
		end

	get_long_data (a_struct: POINTER): like glong
			-- glong long_data;
		external "C struct GtkBindingSet get d.long_data use <gtk/gtk.h>"
		end

	set_long_data (a_struct: POINTER; a_long_data: like glong)
		external "C struct GtkBindingSet set d.long_data use <gtk/gtk.h>"
		end

	get_double_data (a_struct: POINTER): REAL_64
			-- gdouble double_data;
		external "C struct GtkBindingSet get d.double_data use <gtk/gtk.h>"
		end

	set_double_data (a_struct: POINTER; a_double_data: REAL_64)
		external "C struct GtkBindingSet set d.double_data use <gtk/gtk.h>"
		end

	get_string_data (a_struct: POINTER): POINTER
			-- gchar *string_data;
		external "C struct GtkBindingSet get d.string_data use <gtk/gtk.h>"
		end

	set_string_data (a_struct: POINTER; a_string_data: POINTER)
		external "C struct GtkBindingSet set d.string_data use <gtk/gtk.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkBindingSet)"
		end

end
