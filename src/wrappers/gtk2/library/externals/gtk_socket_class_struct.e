-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_SOCKET_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_socket_class_struct_set_plug_added (a_structure: POINTER; a_value: POINTER) is
			-- Setter for plug_added field of GTK_SOCKET_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_class_struct_set_plug_added"
		}"
		end

	gtk_socket_class_struct_set_plug_removed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for plug_removed field of GTK_SOCKET_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_class_struct_set_plug_removed"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_socket_class_struct_get_plug_added (a_structure: POINTER): POINTER is
			-- Query for plug_added field of GTK_SOCKET_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_class_struct_get_plug_added"
		}"
		end

	gtk_socket_class_struct_get_plug_removed (a_structure: POINTER): POINTER is
			-- Query for plug_removed field of GTK_SOCKET_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_class_struct_get_plug_removed"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkSocketClass"
		}"
		end

end -- class GTK_SOCKET_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

