-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_GEOMETRIC_POINT_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_x (a_structure: POINTER; a_value: REAL_64) is
		external "C struct GdaGeometricPoint set x use <library/externals/all-gda-includes.h>"
		end

	low_level_set_y (a_structure: POINTER; a_value: REAL_64) is
		external "C struct GdaGeometricPoint set y use <library/externals/all-gda-includes.h>"
		end

feature {} -- Low-level queries
	get_x (a_structure: POINTER): REAL_64 is
		external "C struct GdaGeometricPoint get x use <library/externals/all-gda-includes.h>"
		end

	get_y (a_structure: POINTER): REAL_64 is
		external "C struct GdaGeometricPoint get y use <library/externals/all-gda-includes.h>"
		end

end
