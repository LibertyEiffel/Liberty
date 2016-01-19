-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_HISTOGRAM2D_PDF_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_histogram2d_pdf_struct_set_nx (a_structure: POINTER; a_value: like size_t) is
			-- Setter for nx field of GSL_HISTOGRAM2D_PDF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_pdf_struct_set_nx"
		}"
		end

	gsl_histogram2d_pdf_struct_set_ny (a_structure: POINTER; a_value: like size_t) is
			-- Setter for ny field of GSL_HISTOGRAM2D_PDF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_pdf_struct_set_ny"
		}"
		end

	gsl_histogram2d_pdf_struct_set_xrange (a_structure: POINTER; a_value: POINTER) is
			-- Setter for xrange field of GSL_HISTOGRAM2D_PDF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_pdf_struct_set_xrange"
		}"
		end

	gsl_histogram2d_pdf_struct_set_yrange (a_structure: POINTER; a_value: POINTER) is
			-- Setter for yrange field of GSL_HISTOGRAM2D_PDF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_pdf_struct_set_yrange"
		}"
		end

	gsl_histogram2d_pdf_struct_set_sum (a_structure: POINTER; a_value: POINTER) is
			-- Setter for sum field of GSL_HISTOGRAM2D_PDF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_pdf_struct_set_sum"
		}"
		end

feature {} -- Low-level queries

	gsl_histogram2d_pdf_struct_get_nx (a_structure: POINTER): like size_t is
			-- Query for nx field of GSL_HISTOGRAM2D_PDF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_pdf_struct_get_nx"
		}"
		end

	gsl_histogram2d_pdf_struct_get_ny (a_structure: POINTER): like size_t is
			-- Query for ny field of GSL_HISTOGRAM2D_PDF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_pdf_struct_get_ny"
		}"
		end

	gsl_histogram2d_pdf_struct_get_xrange (a_structure: POINTER): POINTER is
			-- Query for xrange field of GSL_HISTOGRAM2D_PDF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_pdf_struct_get_xrange"
		}"
		end

	gsl_histogram2d_pdf_struct_get_yrange (a_structure: POINTER): POINTER is
			-- Query for yrange field of GSL_HISTOGRAM2D_PDF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_pdf_struct_get_yrange"
		}"
		end

	gsl_histogram2d_pdf_struct_get_sum (a_structure: POINTER): POINTER is
			-- Query for sum field of GSL_HISTOGRAM2D_PDF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram2d_pdf_struct_get_sum"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_histogram2d_pdf"
		}"
		end

end -- class GSL_HISTOGRAM2D_PDF_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

