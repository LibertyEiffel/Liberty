-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_TYPES_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_units_to_double (an_i: INTEGER_32): REAL_64 is
 		-- pango_units_to_double (node at line 1642)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_units_to_double"
		}"
		end

	pango_units_from_double (a_d: REAL_64): INTEGER_32 is
 		-- pango_units_from_double (node at line 1863)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_units_from_double"
		}"
		end

	pango_extents_to_pixels (an_inclusive: POINTER; a_nearest: POINTER) is
 		-- pango_extents_to_pixels (node at line 7991)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_extents_to_pixels"
		}"
		end


end -- class PANGO_TYPES_EXTERNALS
