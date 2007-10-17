indexing
	description: "Access to GdaParameterListNode C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_PARAMETER_LIST_NODE_STRUCT

inherit ANY undefine is_equal, copy end


feature {} -- Structure getter/setter calls
-- GdaParameterListNode

-- typedef struct {
-- 	GdaParameter   *param;         /* Can't be NULL */
-- 	GdaDataModel   *source_model;  /* may be NULL if @param is free-fill */
-- 	gint            source_column; /* unused is @source_model is NULL */
-- 	guint           hint;
-- } GdaParameterListNode;

	-- GdaParameter   *param;         /* Can't be NULL */
	get_param (a_struct: POINTER): POINTER is
		external "C struct GdaParameterListNode get param use <libgda/libgda.h>"
		end

	set_param (a_struct: POINTER; a_param: POINTER) is
		external "C struct GdaParameterListNode set param use <libgda/libgda.h>"
		end

	-- GdaDataModel   *source_model;  /* may be NULL if @param is free-fill */
		get_source_model (a_struct: POINTER): POINTER is
		external "C struct GdaParameterListNode get source_model use <libgda/libgda.h>"
		end

	set_source_model (a_struct: POINTER; a_source_model: POINTER) is
		external "C struct GdaParameterListNode set source_model use <libgda/libgda.h>"
		end

	-- gint source_column; /* unused is @source_model is NULL */
		get_source_column (a_struct: POINTER): INTEGER is
		external "C struct GdaParameterListNode get source_column use <libgda/libgda.h>"
		end

	set_source_column (a_struct: POINTER; a_source_column: INTEGER) is
		external "C struct GdaParameterListNode set source_column use <libgda/libgda.h>"
		end

	-- guint hint;
	get_hint (a_struct: POINTER): INTEGER is
		external "C struct GdaParameterListNode get hint use <libgda/libgda.h>"
		ensure positive: Result >= 0
		end

	set_hint (a_struct: POINTER; a_hint: INTEGER) is
		require positive: a_hint >= 0
		external "C struct GdaParameterListNode set hint use <libgda/libgda.h>"
		end

feature {} -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaParameterListNode)"
		end

end
