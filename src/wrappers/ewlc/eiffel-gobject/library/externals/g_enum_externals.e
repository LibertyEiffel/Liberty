note
	description: "External calls for G_ENUM"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class G_ENUM_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	g_enum_class_type (a_class: POINTER)
		external "C macro use <glib-object.h>"
		alias "G_ENUM_CLASS_TYPE"
		end

	g_enum_class_type_name (a_class: POINTER)
		external "C macro use <glib-object.h>"
		alias "G_ENUM_CLASS_TYPE_NAME"
		end

	g_type_is_enum (a_type: POINTER)
		external "C macro use <glib-object.h>"
		alias "G_TYPE_IS_ENUM"
		end

	g_enum_class (a_class: POINTER)
		external "C macro use <glib-object.h>"
		alias "G_ENUM_CLASS"
		end

	g_is_enum_class (a_class: POINTER)
		external "C macro use <glib-object.h>"
		alias "G_IS_ENUM_CLASS"
		end

	g_enum_get_value (an_enum_class: POINTER; a_value: INTEGER): POINTER is -- GEnumValue*
		external "C macro use <glib-object.h>"
		end

	g_enum_get_value_by_name (an_enum_class: POINTER; a_const_name: POINTER): POINTER is -- GEnumValue*
		external "C macro use <glib-object.h>"
		end
	
	g_enum_get_value_by_nick (an_enum_class: POINTER; a_const_nick: POINTER): POINTER is -- GEnumValue*
		external "C macro use <glib-object.h>"
		end

	g_enum_register_static (a_const_name: POINTER; some_const_static_values: POINTER)  is -- GType
		external "C macro use <glib-object.h>"
		end

	g_enum_complete_type_info (a_g_enum_type: INTEGER; a_gtypeinfo: POINTER;
										some_const_genumvalues: POINTER)
		external "C macro use <glib-object.h>"
		end
end
