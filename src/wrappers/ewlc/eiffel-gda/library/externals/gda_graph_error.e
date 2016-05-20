-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_GRAPH_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_graph_xml_load_error))
		end


feature {ANY} -- Setters
	default_create, set_gda_graph_xml_load_error is
		do
			value := gda_graph_xml_load_error
		end


feature {ANY} -- Queries
	is_gda_graph_xml_load_error: BOOLEAN is
		do
			Result := (value=gda_graph_xml_load_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_graph_xml_load_error: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_GRAPH_XML_LOAD_ERROR"
		end


end

