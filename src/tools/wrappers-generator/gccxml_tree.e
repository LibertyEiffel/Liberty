class GCCXML_TREE
	-- A partially validated representation of an XML file made by gccxml

inherit XML_TREE redefine new_node, open_node end

insert SHARED_COLLECTIONS

create {CLASS_MAKER} make

feature 
	new_node (node_name: UNICODE_STRING; line, column: INTEGER): XML_COMPOSITE_NODE is
		do
			inspect node_name.as_utf8
			when "ArrayType" then create {C_ARRAY_TYPE} Result.make(node_name,line,column)
			when "CvQualifiedType" then create {C_QUALIFIED_TYPE} Result.make(node_name,line,column)
			when "Enumeration" then create {C_ENUM} Result.make(node_name, line, column)
			when "Field" then create {C_FIELD} Result.make(node_name, line, column)
			when "File" then create {C_FILE} Result.make(node_name, line, column)
			when "Function" then create {C_FUNCTION} Result.make(node_name, line, column)
			when "FunctionType" then create {C_FUNCTION_TYPE} Result.make(node_name, line, column)
			when "FundamentalType" then create {C_FUNDAMENTAL_TYPE} Result.make(node_name, line, column)
			when "PointerType" then create {C_POINTER_TYPE} Result.make(node_name, line, column)
			when "ReferenceType" then create {C_REFERENCE_TYPE} Result.make(node_name, line, column)
			when "Struct" then create {C_STRUCT} Result.make(node_name, line, column)
			when "Typedef" then create {C_TYPEDEF} Result.make(node_name, line, column)
			when "Union" then create {C_UNION} Result.make(node_name, line, column)
			when "Variable" then create {C_VARIABLE} Result.make(node_name, line, column)
			else create {XML_COMPOSITE_NODE} Result.make(node_name, line, column)
			end
		end

	open_node (node_name: UNICODE_STRING; line, column: INTEGER) is
		local storable: STORABLE_NODE 
		do
			Precursor (node_name, line, column)
			-- debug print_node ("Opening: ",open_nodes.top) end
			storable ?= open_nodes.top 
			if storable/=Void then storable.store end
		end
	
feature {} -- Auxiliary call
	print_node (a_label: STRING; a_node: XML_COMPOSITE_NODE) is
		local i: INTEGER
		do
			print(a_label+a_node.name.as_utf8+": "+a_node.out+"[")
			from i:=1 until i>a_node.attributes_count loop
				print(a_node.attribute_value(i).as_utf8)
				print(once ", ")
				i:=i+1
			end
			print(once "].%N")
		end
end -- class GCCXML_TREE

