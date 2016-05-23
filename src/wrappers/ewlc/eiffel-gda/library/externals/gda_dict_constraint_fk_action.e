-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DICT_CONSTRAINT_FK_ACTION
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = constraint_fk_action_cascade) or else 
				(a_value = constraint_fk_action_set_null) or else 
				(a_value = constraint_fk_action_set_default) or else 
				(a_value = constraint_fk_action_set_value) or else 
				(a_value = constraint_fk_action_no_action))
		end


feature {ANY} -- Setters
	default_create, set_cascade is
		do
			value := constraint_fk_action_cascade
		end

	set_set_null is
		do
			value := constraint_fk_action_set_null
		end

	set_set_default is
		do
			value := constraint_fk_action_set_default
		end

	set_set_value is
		do
			value := constraint_fk_action_set_value
		end

	set_no_action is
		do
			value := constraint_fk_action_no_action
		end


feature {ANY} -- Queries
	is_cascade: BOOLEAN is
		do
			Result := (value=constraint_fk_action_cascade)
		end

	is_set_null: BOOLEAN is
		do
			Result := (value=constraint_fk_action_set_null)
		end

	is_set_default: BOOLEAN is
		do
			Result := (value=constraint_fk_action_set_default)
		end

	is_set_value: BOOLEAN is
		do
			Result := (value=constraint_fk_action_set_value)
		end

	is_no_action: BOOLEAN is
		do
			Result := (value=constraint_fk_action_no_action)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	constraint_fk_action_cascade: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_FK_ACTION_CASCADE"
		end

	constraint_fk_action_set_null: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_FK_ACTION_SET_NULL"
		end

	constraint_fk_action_set_default: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_FK_ACTION_SET_DEFAULT"
		end

	constraint_fk_action_set_value: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_FK_ACTION_SET_VALUE"
		end

	constraint_fk_action_no_action: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "CONSTRAINT_FK_ACTION_NO_ACTION"
		end


end

