-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_EXP_NODE_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = xml_exp_empty) or else 
				(a_value = xml_exp_forbid) or else 
				(a_value = xml_exp_atom) or else 
				(a_value = xml_exp_seq) or else 
				(a_value = xml_exp_or) or else 
				(a_value = xml_exp_count))
		end


feature {ANY} -- Setters
	default_create, set_empty is
		do
			value := xml_exp_empty
		end

	set_forbid is
		do
			value := xml_exp_forbid
		end

	set_atom is
		do
			value := xml_exp_atom
		end

	set_seq is
		do
			value := xml_exp_seq
		end

	set_or is
		do
			value := xml_exp_or
		end

	set_count is
		do
			value := xml_exp_count
		end


feature {ANY} -- Queries
	is_empty: BOOLEAN is
		do
			Result := (value=xml_exp_empty)
		end

	is_forbid: BOOLEAN is
		do
			Result := (value=xml_exp_forbid)
		end

	is_atom: BOOLEAN is
		do
			Result := (value=xml_exp_atom)
		end

	is_seq: BOOLEAN is
		do
			Result := (value=xml_exp_seq)
		end

	is_or: BOOLEAN is
		do
			Result := (value=xml_exp_or)
		end

	is_count: BOOLEAN is
		do
			Result := (value=xml_exp_count)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_exp_empty: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_EXP_EMPTY"
		end

	xml_exp_forbid: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_EXP_FORBID"
		end

	xml_exp_atom: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_EXP_ATOM"
		end

	xml_exp_seq: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_EXP_SEQ"
		end

	xml_exp_or: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_EXP_OR"
		end

	xml_exp_count: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_EXP_COUNT"
		end


end

