-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_VALUE_ATTRIBUTE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_value_attr_none) or else 
				(a_value = gda_value_attr_is_null) or else 
				(a_value = gda_value_attr_can_be_null) or else 
				(a_value = gda_value_attr_is_default) or else 
				(a_value = gda_value_attr_can_be_default) or else 
				(a_value = gda_value_attr_is_unchanged) or else 
				(a_value = gda_value_attr_actions_shown) or else 
				(a_value = gda_value_attr_data_non_valid) or else 
				(a_value = gda_value_attr_has_value_orig) or else 
				(a_value = gda_value_attr_no_modif) or else 
				(a_value = gda_value_attr_unused))
		end


feature {ANY} -- Setters
	default_create, set_none
		do
			value := gda_value_attr_none
		end

	set_is_null
		do
			value := gda_value_attr_is_null
		end

	set_can_be_null
		do
			value := gda_value_attr_can_be_null
		end

	set_is_default_external
		do
			value := gda_value_attr_is_default
		end

	set_can_be_default
		do
			value := gda_value_attr_can_be_default
		end

	set_is_unchanged
		do
			value := gda_value_attr_is_unchanged
		end

	set_actions_shown
		do
			value := gda_value_attr_actions_shown
		end

	set_data_non_valid
		do
			value := gda_value_attr_data_non_valid
		end

	set_has_value_orig
		do
			value := gda_value_attr_has_value_orig
		end

	set_no_modif
		do
			value := gda_value_attr_no_modif
		end

	set_unused
		do
			value := gda_value_attr_unused
		end


feature {ANY} -- Queries
	is_none: BOOLEAN
		do
			Result := (value=gda_value_attr_none)
		end

	is_is_null: BOOLEAN
		do
			Result := (value=gda_value_attr_is_null)
		end

	is_can_be_null: BOOLEAN
		do
			Result := (value=gda_value_attr_can_be_null)
		end

	is_is_default_external: BOOLEAN
		do
			Result := (value=gda_value_attr_is_default)
		end

	is_can_be_default: BOOLEAN
		do
			Result := (value=gda_value_attr_can_be_default)
		end

	is_is_unchanged: BOOLEAN
		do
			Result := (value=gda_value_attr_is_unchanged)
		end

	is_actions_shown: BOOLEAN
		do
			Result := (value=gda_value_attr_actions_shown)
		end

	is_data_non_valid: BOOLEAN
		do
			Result := (value=gda_value_attr_data_non_valid)
		end

	is_has_value_orig: BOOLEAN
		do
			Result := (value=gda_value_attr_has_value_orig)
		end

	is_no_modif: BOOLEAN
		do
			Result := (value=gda_value_attr_no_modif)
		end

	is_unused: BOOLEAN
		do
			Result := (value=gda_value_attr_unused)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_value_attr_none: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_VALUE_ATTR_NONE"
		end

	gda_value_attr_is_null: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_VALUE_ATTR_IS_NULL"
		end

	gda_value_attr_can_be_null: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_VALUE_ATTR_CAN_BE_NULL"
		end

	gda_value_attr_is_default: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_VALUE_ATTR_IS_DEFAULT"
		end

	gda_value_attr_can_be_default: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_VALUE_ATTR_CAN_BE_DEFAULT"
		end

	gda_value_attr_is_unchanged: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_VALUE_ATTR_IS_UNCHANGED"
		end

	gda_value_attr_actions_shown: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_VALUE_ATTR_ACTIONS_SHOWN"
		end

	gda_value_attr_data_non_valid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_VALUE_ATTR_DATA_NON_VALID"
		end

	gda_value_attr_has_value_orig: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_VALUE_ATTR_HAS_VALUE_ORIG"
		end

	gda_value_attr_no_modif: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_VALUE_ATTR_NO_MODIF"
		end

	gda_value_attr_unused: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_VALUE_ATTR_UNUSED"
		end


end

