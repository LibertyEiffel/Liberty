indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GDA developers
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

	wrapped_version: "3.0.1"

deferred class GDA_DATA_MODEL_ROW
	-- GdaDataModelRow, base implementation for other objects to
	-- implement the GdaDataModel interface based on the usage of
	
	-- This class is not intended to be instanciated directly, but to
	-- be inherited.

inherit
	GDA_OBJECT
	GDA_DATA_MODEL

feature -- Command text 
	command_text: STRING is 
		do
			Result:=string_property_from_pspec(command_text_pspec)
		end

	set_command_text (a_text: STRING) is
		do
			set_string_property_from_pspec(command_text_pspec,a_text)
		end

feature {} -- TODO: properties
	--   "command-type"             gint                  : Read / Write
	--   "read-only"                gboolean              : Read / Write
	--
	--
	--
	--  The "command-text" property
	--
	--   "command-text"             gchararray            : Read / Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "command-type" property
	--
	--   "command-type"             gint                  : Read / Write
	--
	--   Allowed values: [0,5]
	--
	--   Default value: 5
	--
	--   --------------------------------------------------------------------------
	--
	--  The "read-only" property
	--
	--   "read-only"                gboolean              : Read / Write
	--
	--   Default value: FALSE

feature {} -- Property names
	command_text_property_name: STRING is "command-text"
	command_type_property_name: STRING is "command-type"
	read_only_property_name: STRING is "read-only"
feature {} -- Properties parameter specification
	command_text_pspec: G_PARAM_SPEC is
			-- "command-text" gchararray            : Read / Write
		require has_property (command_text_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),command_text_property_name.to_external))
		end

	command_type_pspec: G_PARAM_SPEC is
			-- "command-type" gint                  : Read / Write
		require has_property (command_type_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),command_type_property_name.to_external))
		end

	read_only_pspec: G_PARAM_SPEC is
			-- "read-only" gboolean              : Read / Write
		require has_property (read_only_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),read_only_property_name.to_external))
		end

end -- class GDA_DATA_MODEL_ROW
