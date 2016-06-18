-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_QUERY_FIELD_STATE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_entity_field_visible) or else 
				(a_value = gda_entity_field_invisible) or else 
				(a_value = gda_entity_field_any))
		end


feature {ANY} -- Setters
	default_create, set_gda_entity_field_visible
		do
			value := gda_entity_field_visible
		end

	set_gda_entity_field_invisible
		do
			value := gda_entity_field_invisible
		end

	set_gda_entity_field_any
		do
			value := gda_entity_field_any
		end


feature {ANY} -- Queries
	is_gda_entity_field_visible: BOOLEAN
		do
			Result := (value=gda_entity_field_visible)
		end

	is_gda_entity_field_invisible: BOOLEAN
		do
			Result := (value=gda_entity_field_invisible)
		end

	is_gda_entity_field_any: BOOLEAN
		do
			Result := (value=gda_entity_field_any)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_entity_field_visible: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_ENTITY_FIELD_VISIBLE"
		end

	gda_entity_field_invisible: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_ENTITY_FIELD_INVISIBLE"
		end

	gda_entity_field_any: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_ENTITY_FIELD_ANY"
		end


end

