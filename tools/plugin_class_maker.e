class PLUGIN_CLASS_MAKER

inherit CLASS_MAKER

creation with_location_and_module 

feature
	with_location_and_module (a_location, a_module: STRING) is
		do
			not_yet_implemented
		end

	emit_function (a_node: XML_NODE; a_name: STRING) is
		do	
			not_yet_implemented
		end

	emit_structure (a_node: XML_NODE; structure_name: STRING) is
		do	
			not_yet_implemented
		end

	emit_enumeration (a_node: XML_NODE; a_name: STRING) is
		do
			not_yet_implemented
		end
feature
	location: STRING
	module: STRING
end
