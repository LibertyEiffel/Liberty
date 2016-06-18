-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DICT_CONSTRAINT_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = constraint_primary_key) or else 
				(a_value = constraint_foreign_key) or else 
				(a_value = constraint_unique) or else 
				(a_value = constraint_not_null) or else 
				(a_value = constraint_check_expr) or else 
				(a_value = constraint_check_in_list) or else 
				(a_value = constraint_check_setof_list) or else 
				(a_value = constraint_unknown))
		end


feature {ANY} -- Setters
	default_create, set_primary_key
		do
			value := constraint_primary_key
		end

	set_foreign_key
		do
			value := constraint_foreign_key
		end

	set_unique
		do
			value := constraint_unique
		end

	set_not_null
		do
			value := constraint_not_null
		end

	set_check_expr
		do
			value := constraint_check_expr
		end

	set_check_in_list
		do
			value := constraint_check_in_list
		end

	set_check_setof_list
		do
			value := constraint_check_setof_list
		end

	set_unknown
		do
			value := constraint_unknown
		end


feature {ANY} -- Queries
	is_primary_key: BOOLEAN
		do
			Result := (value=constraint_primary_key)
		end

	is_foreign_key: BOOLEAN
		do
			Result := (value=constraint_foreign_key)
		end

	is_unique: BOOLEAN
		do
			Result := (value=constraint_unique)
		end

	is_not_null: BOOLEAN
		do
			Result := (value=constraint_not_null)
		end

	is_check_expr: BOOLEAN
		do
			Result := (value=constraint_check_expr)
		end

	is_check_in_list: BOOLEAN
		do
			Result := (value=constraint_check_in_list)
		end

	is_check_setof_list: BOOLEAN
		do
			Result := (value=constraint_check_setof_list)
		end

	is_unknown: BOOLEAN
		do
			Result := (value=constraint_unknown)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	constraint_primary_key: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_PRIMARY_KEY"
		end

	constraint_foreign_key: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_FOREIGN_KEY"
		end

	constraint_unique: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_UNIQUE"
		end

	constraint_not_null: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_NOT_NULL"
		end

	constraint_check_expr: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_CHECK_EXPR"
		end

	constraint_check_in_list: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_CHECK_IN_LIST"
		end

	constraint_check_setof_list: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_CHECK_SETOF_LIST"
		end

	constraint_unknown: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_UNKNOWN"
		end


end

