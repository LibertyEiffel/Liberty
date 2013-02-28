-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_GRAVITY_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_gravity_to_rotation (a_gravity: INTEGER): REAL_64 is
 		-- pango_gravity_to_rotation (node at line 508)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_gravity_to_rotation"
		}"
		end

	pango_gravity_get_for_script_and_width (a_script: INTEGER; a_wide: INTEGER_32; a_base_gravity: INTEGER; a_hint: INTEGER): INTEGER is
 		-- pango_gravity_get_for_script_and_width (node at line 7645)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_gravity_get_for_script_and_width"
		}"
		end

	pango_gravity_get_for_matrix (a_matrix: POINTER): INTEGER is
 		-- pango_gravity_get_for_matrix (node at line 7809)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_gravity_get_for_matrix"
		}"
		end

	pango_gravity_get_for_script (a_script: INTEGER; a_base_gravity: INTEGER; a_hint: INTEGER): INTEGER is
 		-- pango_gravity_get_for_script (node at line 10579)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_gravity_get_for_script"
		}"
		end


end -- class PANGO_GRAVITY_EXTERNALS
