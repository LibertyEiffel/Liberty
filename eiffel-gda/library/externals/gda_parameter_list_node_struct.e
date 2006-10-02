indexing
	description: "Access to $(Foo) C structure"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class _STRUCT
feature {} -- Structure getter/setter calls
	get_$field (a_struct: POINTER): $type is
		external "C struct $struct get $field use <>"
		end

	set_$field (a_struct: POINTER; a_$field: $type) is
		external "C struct $struct set $field use <>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <$include>"
		alias "sizeof($struct)"
		end

end
GdaParameterListNode

typedef struct {
	GdaParameter   *param;         /* Can't be NULL */
	GdaDataModel   *source_model;  /* may be NULL if @param is free-fill */
	gint            source_column; /* unused is @source_model is NULL */
	guint           hint;
} GdaParameterListNode;
