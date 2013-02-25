-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_COVERAGE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_coverage_ref (a_coverage: POINTER): POINTER is
 		-- pango_coverage_ref (node at line 2018)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_coverage_ref"
		}"
		end

	pango_coverage_to_bytes (a_coverage: POINTER; a_bytes: POINTER; a_n_bytes: POINTER) is
 		-- pango_coverage_to_bytes (node at line 2788)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_coverage_to_bytes"
		}"
		end

	pango_coverage_from_bytes (a_bytes: POINTER; a_n_bytes: INTEGER_32): POINTER is
 		-- pango_coverage_from_bytes (node at line 4358)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_coverage_from_bytes"
		}"
		end

	pango_coverage_new: POINTER is
 		-- pango_coverage_new (node at line 5026)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_coverage_new()"
		}"
		end

	pango_coverage_set (a_coverage: POINTER; an_index: INTEGER_32; a_level: INTEGER) is
 		-- pango_coverage_set (node at line 5069)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_coverage_set"
		}"
		end

	pango_coverage_copy (a_coverage: POINTER): POINTER is
 		-- pango_coverage_copy (node at line 7929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_coverage_copy"
		}"
		end

	pango_coverage_max (a_coverage: POINTER; an_other: POINTER) is
 		-- pango_coverage_max (node at line 8831)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_coverage_max"
		}"
		end

	pango_coverage_unref (a_coverage: POINTER) is
 		-- pango_coverage_unref (node at line 9239)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_coverage_unref"
		}"
		end

	pango_coverage_get (a_coverage: POINTER; an_index: INTEGER_32): INTEGER is
 		-- pango_coverage_get (node at line 10369)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_coverage_get"
		}"
		end


end -- class PANGO_COVERAGE_EXTERNALS
