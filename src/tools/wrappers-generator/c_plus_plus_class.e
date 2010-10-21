class C_PLUS_PLUS_CLASS
	-- A "Class" node of an XML file made by gccxml representing a C++ class.

	-- Beware class names includes templates, so they may be like "QFlags<Qt::MouseButton>" escaped as "QFlags%lt;Qt::MouseButton&gt;". C++ and therefore also GccXml does not  

inherit 
	CONTEXTED_NODE
	NAMED_NODE
	COMPOSED_NODE
	IDENTIFIED_NODE
	FILED_NODE
	STORABLE_NODE
	TYPED_NODE
	WRAPPER_CLASS
	-- This node also has those fields: demangled, size, align, bases

insert NAME_CONVERTER

creation make

feature 
	store is
		do
			create {LINKED_LIST[C_FIELD]} fields.make
			types.put(Current,id)
			if is_named then
				symbols.put(Current,c_string_name)
			end
			composed_types.put(Current,id)
		end

	is_fundamental: BOOLEAN is False

	is_void: BOOLEAN is False

	has_wrapper: BOOLEAN is False

	c_type: STRING is
		do
			if is_artificial then
				Result := once "class"
			else
				Result := once ""
			end
		end

	wrapper_type: STRING is 
		do
			debug 
				print(once 
				"C_PLUS_PLUS_CLASS.wrapper_type requires creation%
				% of external/expanded types.")
			end
			not_yet_implemented -- Result := class_name
		end

	is_to_be_emitted: BOOLEAN is
		do
			Result:= is_named and then (is_public or has_assigned_name) and then is_in_main_namespace and then 
			(global or else headers.has(c_file.c_string_name))
		end

	emit_wrapper is
		-- TODO: unimplemented
	do

	end

	is_artificial: BOOLEAN is
		do
			Result := attributes.has(once U"artificial") and then attributes.at(once U"artificial").is_equal(once U"1")
		end

	suffix: STRING is "_CLASS"
	
	class_inherits: STRING is "%N%Ninsert STANDARD_C_LIBRARY_TYPES%N%N"
	-- TODO: the above reference to STANDARD_C_LIBRARY_TYPES creates requires
	-- to wrap standard C library using a file called
	-- "standard-c-library.gcc-xml"; allow the user to specify its name,
end -- class C_PLUS_PLUS_CLASS

-- Copyright 2010 Paolo Redaelli

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
