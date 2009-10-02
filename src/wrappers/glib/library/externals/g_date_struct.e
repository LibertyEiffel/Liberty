-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_DATE_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gdate_struct_set_julian_days (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for julian_days field of GDate structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gdate_struct_set_julian_days"
		}"
		end

	gdate_struct_set_julian (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for julian field of GDate structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gdate_struct_set_julian"
		}"
		end

	gdate_struct_set_dmy (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for dmy field of GDate structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gdate_struct_set_dmy"
		}"
		end

	gdate_struct_set_day (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for day field of GDate structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gdate_struct_set_day"
		}"
		end

	gdate_struct_set_month (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for month field of GDate structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gdate_struct_set_month"
		}"
		end

	gdate_struct_set_year (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for year field of GDate structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gdate_struct_set_year"
		}"
		end

feature {} -- Low-level queries

	gdate_struct_get_julian_days (a_structure: POINTER): NATURAL_32 is
			-- Query for julian_days field of GDate structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gdate_struct_get_julian_days"
		}"
		end

	gdate_struct_get_julian (a_structure: POINTER): NATURAL_32 is
			-- Query for julian field of GDate structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gdate_struct_get_julian"
		}"
		end

	gdate_struct_get_dmy (a_structure: POINTER): NATURAL_32 is
			-- Query for dmy field of GDate structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gdate_struct_get_dmy"
		}"
		end

	gdate_struct_get_day (a_structure: POINTER): NATURAL_32 is
			-- Query for day field of GDate structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gdate_struct_get_day"
		}"
		end

	gdate_struct_get_month (a_structure: POINTER): NATURAL_32 is
			-- Query for month field of GDate structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gdate_struct_get_month"
		}"
		end

	gdate_struct_get_year (a_structure: POINTER): NATURAL_32 is
			-- Query for year field of GDate structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gdate_struct_get_year"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GDate"
		}"
		end

end
