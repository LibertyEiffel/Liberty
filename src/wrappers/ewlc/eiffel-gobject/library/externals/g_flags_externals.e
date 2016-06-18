note
	description: "External calls for G_FLAGS"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class G_FLAGS_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	g_type_is_flags (type: POINTER)
		external "C macro use <glib-object.h>"
		alias "G_TYPE_IS_FLAGS"
		end

	g_flags_class (a_class: POINTER)
		external "C macro use <glib-object.h>"
		alias "G_FLAGS_CLASS"
		end

	g_is_flags_class (a_class: POINTER)
		external "C macro use <glib-object.h>"
		alias "G_IS_FLAGS_CLASS"
		end

	g_flags_class_type (a_class: POINTER)
		external "C macro use <glib-object.h>"
		alias "G_FLAGS_CLASS_TYPE"
		end

	g_flags_class_type_name (a_class: POINTER)
		external "C macro use <glib-object.h>"
		alias "G_FLAGS_CLASS_TYPE_NAME"
		end

	g_flags_get_first_value (a_flags_class: POINTER; a_value: INTEGER): POINTER is -- GFlagsValue* 
			-- TODO: `a_value' should be a NATURAL, since it is a guint
		external "C macro use <glib-object.h>"
		end
	
	g_flags_get_value_by_name (a_flags_class: POINTER; a_const_name: POINTER): POINTER is -- GFlagsValue*
		external "C macro use <glib-object.h>"
		end
	
	g_flags_get_value_by_nick (a_flags_class: POINTER; a_const_nick: POINTER): POINTER is -- GFlagsValue*
		external "C macro use <glib-object.h>"
		end
	
	g_flags_register_static (a_const_name: POINTER; some_const_static_gflagsvalues: POINTER): INTEGER is -- GType
		external "C macro use <glib-object.h>"
		end
	
end
