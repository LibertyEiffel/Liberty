class GCCXML_TREE
	-- A partially validated representation of an XML file made by gccxml

	-- Effective heirs will emit wrappers using the plugin machanism.
inherit XML_TREE redefine make, new_node, open_node end

insert 
	SHARED_COLLECTIONS
	EXCEPTIONS
	FILE_TOOLS

creation make

feature 
	make (url: URL) is
		do
			create renamed.make
			create moved.make
			Precursor(url)
		end

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

	renamed: HASHED_DICTIONARY[STRING,STRING]
		-- Names of symbols and the actual Liberty name they will get. The original name is the key, the value is the renamed name.

	moved: HASHED_DICTIONARY[STRING,STRING]
	-- The symbols that will wrapped anyway regarderless of the provided
	-- headers files, together with the Liberty class they will actually be
	-- wrapped in. When a symbol is wrapped with in a class of its own, i.e. an
	-- enumeration, a struct, a union and so on, the value will not be taken in
	-- count.

	read_moved_from (a_name: STRING) is
		-- Read the file with `a_name' and fills `a_dictionary'. For each line the
		-- first word will be used as key, the second as value. The rest of the
		-- line is ignored and may be considered comment.
		-- Used to read the list of renamed symbols and moved functions.
	require
		a_name/=Void
		file_exists(a_name)
		is_file(a_name) 
	do
		read(moved,a_name)
	end
	
feature {} -- Implementation
	read (a_dictionary: HASHED_DICTIONARY[STRING,STRING]; a_name: STRING) is
		-- Read the file with `a_name' and fills `a_dictionary'. For each line the
		-- first word will be used as key, the second as value. The rest of the
		-- line is ignored and may be considered comment.
		-- Used to read the list of renamed symbols and moved functions.
	require
		a_dictionary/=Void
		a_name/=Void
		file_exists(a_name)
		is_file(a_name) 
	local file: TEXT_FILE_READ; symbol, value: STRING; words: STRING_INPUT_STREAM 
	do
		create file.connect_to(a_name)
		check file.is_connected end
		from file.read_line 
		until file.end_of_input loop
			create words.from_string(file.last_string)
			words.read_word
			if not words.last_string.is_empty then
				symbol := words.last_string.twin
				words.read_word
				if not words.last_string.is_empty then
					value := words.last_string.twin
				end
				-- Issueing words.skip_remainder_of_line is useless
			end
			-- -- This is a most inefficient way to obtain the first two words!
			-- if words/=Void and then words.count>=2 then
			-- 	original_name := words.first
			-- 	new_name := words.item(words.lower+1)
			-- 	a_dictionary.put(new_name, original_name)
			-- end
			file.read_line
		end
	end


invariant
	renamed /= Void
	moved /= Void
end -- class GCCXML_TREE

-- Copyright 2008,2009,2010 Paolo Redaelli

-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.
