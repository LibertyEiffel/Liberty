class GCCXML_TREE
	-- A partially validated representation of an XML file made by gccxml

	-- Effective heirs will emit wrappers using the plugin machanism.
inherit XML_TREE redefine new_node, open_node end

insert 
	SHARED_COLLECTIONS
	EXCEPTIONS
	FILE_TOOLS

creation make

feature 
	new_node (node_name: UNICODE_STRING; line, column: INTEGER): XML_COMPOSITE_NODE is
		do
			inspect node_name.as_utf8
			when "Argument" then create {C_ARGUMENT} Result.make(node_name,line,column)
			when "ArrayType" then create {C_ARRAY_TYPE} Result.make(node_name,line,column)
			when "Base" then create {XML_COMPOSITE_NODE} Result.make(node_name, line, column)
			when "Class" then create {XML_COMPOSITE_NODE} Result.make(node_name, line, column)
			when "Constructor" then create {C_CONSTRUCTOR} Result.make(node_name,line,column)
			when "Converter" then create {XML_COMPOSITE_NODE} Result.make(node_name, line, column)

			when "CvQualifiedType" then create {C_QUALIFIED_TYPE} Result.make(node_name,line,column)
			when "Destructor" then create {XML_COMPOSITE_NODE} Result.make(node_name, line, column)

			when "Ellipsis" then create {C_ELLIPSIS} Result.make(node_name, line, column)
			when "Enumeration" then create {C_ENUM} Result.make(node_name, line, column)
			when "EnumValue" then create {C_ENUM_VALUE} Result.make(node_name, line, column)
			when "Field" then create {C_FIELD} Result.make(node_name, line, column)
			when "File" then create {C_FILE} Result.make(node_name, line, column)
			when "Function" then create {C_FUNCTION} Result.make(node_name, line, column)
			when "FunctionType" then create {C_FUNCTION_TYPE} Result.make(node_name, line, column)
			when "FundamentalType" then create {C_FUNDAMENTAL_TYPE} Result.make(node_name, line, column)
			when "GCC_XML" then create {GCC_XML} Result.make(node_name,line,column)
			when "Method" then create {XML_COMPOSITE_NODE} Result.make(node_name, line, column)

			when "Namespace" then create {C_NAMESPACE} Result.make(node_name,line,column)
			when "OffsetType" then create {XML_COMPOSITE_NODE} Result.make(node_name, line, column)

			when "OperatorFunction" then create {XML_COMPOSITE_NODE} Result.make(node_name, line, column)

			when "OperatorMethod" then create {XML_COMPOSITE_NODE} Result.make(node_name, line, column)

			when "PointerType" then create {C_POINTER_TYPE} Result.make(node_name, line, column)
			when "ReferenceType" then create {C_REFERENCE_TYPE} Result.make(node_name, line, column)
			when "Struct" then create {C_STRUCT} Result.make(node_name, line, column)
			when "Typedef" then create {C_TYPEDEF} Result.make(node_name, line, column)
			when "Union" then create {C_UNION} Result.make(node_name, line, column)
			when "Variable" then create {C_VARIABLE} Result.make(node_name, line, column)
			else 
				raise(node_name.as_utf8+" does not have an GCCXML_NODE")
				-- create {XML_COMPOSITE_NODE} Result.make(node_name, line, column)
			end
			-- TODO: turn this into an inspect when UNICODE_STRING will be comparable
		end

	open_node (node_name: UNICODE_STRING; line, column: INTEGER) is
		local storable: STORABLE_NODE 
		do
			Precursor (node_name, line, column)
			-- debug print_node ("Opening: ",open_nodes.top) end
			storable ?= open_nodes.top 
			if storable/=Void then storable.store end
		end

feature {ANY}
	read_flags_from (a_file_name: STRING) is
		-- Read the list of enumeration that shall be wrapped as flags from the
		-- file named `a_file_name'.
	require
		a_file_name/=Void
		file_exists(a_file_name)
		is_file(a_file_name) 
	do
		flags.add_from_file(a_file_name)
	end

	read_avoided_from (a_file_name: STRING) is
		-- Read from the file named `a_file_name' the list of symbols that will
		-- be avoided, i.e. not wrapped. 
	require
		a_file_name/=Void
		file_exists(a_file_name)
		is_file(a_file_name) 
	do
		avoided.add_from_file(a_file_name)
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

