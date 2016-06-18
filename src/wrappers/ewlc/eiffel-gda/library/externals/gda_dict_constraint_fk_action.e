-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DICT_CONSTRAINT_FK_ACTION
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = constraint_fk_action_cascade) or else 
				(a_value = constraint_fk_action_set_null) or else 
				(a_value = constraint_fk_action_set_default) or else 
				(a_value = constraint_fk_action_set_value) or else 
				(a_value = constraint_fk_action_no_action))
		end


feature {ANY} -- Setters
	default_create, set_cascade
		do
			value := constraint_fk_action_cascade
		end

	set_set_null
		do
			value := constraint_fk_action_set_null
		end

	set_set_default
		do
			value := constraint_fk_action_set_default
		end

	set_set_value
		do
			value := constraint_fk_action_set_value
		end

	set_no_action
		do
			value := constraint_fk_action_no_action
		end


feature {ANY} -- Queries
	is_cascade: BOOLEAN
		do
			Result := (value=constraint_fk_action_cascade)
		end

	is_set_null: BOOLEAN
		do
			Result := (value=constraint_fk_action_set_null)
		end

	is_set_default: BOOLEAN
		do
			Result := (value=constraint_fk_action_set_default)
		end

	is_set_value: BOOLEAN
		do
			Result := (value=constraint_fk_action_set_value)
		end

	is_no_action: BOOLEAN
		do
			Result := (value=constraint_fk_action_no_action)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	constraint_fk_action_cascade: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_FK_ACTION_CASCADE"
		end

	constraint_fk_action_set_null: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_FK_ACTION_SET_NULL"
		end

	constraint_fk_action_set_default: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_FK_ACTION_SET_DEFAULT"
		end

	constraint_fk_action_set_value: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_FK_ACTION_SET_VALUE"
		end

	constraint_fk_action_no_action: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_FK_ACTION_NO_ACTION"
		end


end

