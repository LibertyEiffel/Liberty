indexing
	description: "Access to $struct C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_PARAMETER_LIST_SOURCE_STRUCT

insert ANY undefine copy, is_equal end

feature {} -- Structure getter/setter calls
-- GdaParameterListSource

-- typedef struct {
-- 	GdaDataModel   *data_model;   /* Can't be NULL */
-- 	GSList         *nodes;        /* list of #GdaParameterListNode for which source_model == @data_model */

-- 	/* displayed columns in 'data_model' */
--         gint            shown_n_cols;
--         gint           *shown_cols_index;

--         /* columns used as a reference (corresponding to PK values) in 'data_model' */
--         gint            ref_n_cols;
--         gint           *ref_cols_index;
-- } GdaParameterListSource;

	get_data_model (a_struct: POINTER): POINTER is
		external "C struct GdaParameterListSource get data_model use <libgda/libgda.h>"
		end

	set_data_model (a_struct: POINTER; a_data_model: POINTER) is
		external "C struct GdaParameterListSource set data_model use <libgda/libgda.h>"
		end

	get_nodes (a_struct: POINTER): POINTER is
		external "C struct GdaParameterListSource get nodes use <libgda/libgda.h>"
		end

	set_nodes (a_struct: POINTER; a_nodes: POINTER) is
		external "C struct GdaParameterListSource set nodes use <libgda/libgda.h>"
		end

	get_shown_n_cols (a_struct: POINTER): INTEGER is
		external "C struct GdaParameterListSource get shown_n_cols use <libgda/libgda.h>"
		end

	set_shown_n_cols (a_struct: POINTER; a_shown_n_cols: INTEGER) is
		external "C struct GdaParameterListSource set shown_n_cols use <libgda/libgda.h>"
		end

	get_shown_cols_index (a_struct: POINTER): POINTER is
		external "C struct GdaParameterListSource get shown_cols_index use <libgda/libgda.h>"
		end

	set_shown_cols_index (a_struct: POINTER; a_shown_cols_index: POINTER) is
		external "C struct GdaParameterListSource set shown_cols_index use <libgda/libgda.h>"
		end

	get_ref_n_cols (a_struct: POINTER): INTEGER is
		external "C struct GdaParameterListSource get ref_n_cols use <libgda/libgda.h>"
		end

	set_ref_n_cols (a_struct: POINTER; a_ref_n_cols: INTEGER) is
		external "C struct GdaParameterListSource set ref_n_cols use <libgda/libgda.h>"
		end

	get_ref_cols_index (a_struct: POINTER): POINTER is
		external "C struct GdaParameterListSource get ref_cols_index use <libgda/libgda.h>"
		end

	set_ref_cols_index (a_struct: POINTER; a_ref_cols_index: POINTER) is
		external "C struct GdaParameterListSource set ref_cols_index use <libgda/libgda.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaParameterListSource)"
		end

end
