class C_STRUCT
	-- A "Struct" node of an XML file made by gccxml.
inherit 
	GCCXML_NODE 
	CONTEXTED_NODE
	COMPOSED_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE
	STORABLE_NODE
	TYPED_NODE
	WRAPPED_BY_A_CLASS

insert NAME_CONVERTER

creation make

feature 
	store is
		do
			create {LINKED_LIST[C_FIELD]} fields.make
			types.put(Current,id)
			composed_types.put(Current,id)
			structures.fast_put(Current,id)
		end
	
	is_fundamental: BOOLEAN is False

	is_void: BOOLEAN is False

	has_wrapper: BOOLEAN is False

	c_type: STRING is "struct"
	
	wrapper_type: STRING is 
		do
			debug 
				print(once 
				"C_STRUCT.wrapper_type requires creation%
				% of external/expanded types; currently returning an empty string")
			end
			not_yet_implemented -- Result := class_name
		end

	emit_wrapper is
		-- Emit a reference wrapper for Current C structure.

		-- A reference wrapper handles the structure as a memory area referred by a pointer.
		-- An expanded wrapper is an expanded Eiffel type that is the actual C structure. This require the usage  of "external types" 
	local path: POSIX_PATH_NAME
	do
		if is_named and then (is_public or has_assigned_name) and then is_in_main_namespace and then is_to_be_emitted (c_file.c_string_name) then
			if on_standard_output then
					log(once "Outputting wrapper for struct @(1) on standard output.%N", <<c_string_name>>)
		 		output := std_output
		 	else
		 		create path.make_from_string(directory)
		 		path.add_last(class_name.as_lower+once ".e")
				log(once "Struct @(1) to @(2) in @(3)%N",
				<<c_string_name, class_name, path.to_string>>)
				create {TEXT_FILE_WRITE} output.connect_to(path.to_string)
			end
			-- if members.for_all(agent {}.has_wrapper) then -- it is surely wrappable
			emit_header
			emit_members
			emit_size
			emit_footer
			output.flush
			output.disconnect
		else
			if is_anonymous then log_string(once "Skipping anonymous structure at line "+line.out+".%N")
			else log(once "Struct @(1) skipped%N", <<c_string_name>>)
			end
			
		end
	end

	emit_header is
		-- Append the header of Current structure to `buffer'.
	do
		buffer.append(automatically_generated_header)
		buffer.append(deferred_class)
		buffer.append(class_name)
		-- TODO: emit_description(class_descriptions.reference_at(class_name))
		buffer.append(struct_inherits)
		buffer.put_message(once "%T@(1)%N",<<settings.typedefs>>)
		buffer.print_on(output)
	end

	emit_members is
		-- local
		--	members: UNICODE_STRING; members_iter: ITERATOR[UNICODE_STRING]; field: XML_COMPOSITE_NODE
		do
			if fields/=Void and then not fields.is_empty then
				setters.reset; queries.reset
				setters.append(setters_header)
				queries.append(queries_header)
				fields.do_all(agent {C_FIELD}.append_getter_and_setter(class_name))
				setters.print_on(output)
				queries.print_on(output)
			else
				output.put_string(once "%T-- Fieldless structure%N")
				log(once "Struct @(1) have no fields%N", <<c_string_name>>)
			end
		end

	emit_size is
		-- Append to `output' the `struct_size' query for Current.
	do 
		-- buffer.reset
		buffer.put_message(once 
		"feature -- Structure size%N%
		%	struct_size: like size_t is%N%
		%		external %"plug_in%"%N%
		%		alias %"{%N%
		%			location: %".%"%N%
		%			module_name: %"plugin%"%N%
		%			feature_name: %"sizeof_@(1)%"%N%
		%		}%"%N%
		%		end%N%N",
		<<c_string_name>>)
		buffer.print_on(output)
		("#define sizeof_"+c_string_name+" (sizeof(struct "+c_string_name+"))%N").print_on(include)
	end

	emit_footer is
		do
			buffer.append(once "end -- class ")
			buffer.append(class_name)
			buffer.append_new_line
			buffer.append(automatically_generated_header)
			buffer.print_on(output)
		end

	suffix: STRING is "_STRUCT"
	
	struct_inherits: STRING is "%N%Ninherit ANY undefine is_equal, copy end%Ninsert STANDARD_C_LIBRARY_TYPES%N"

	-- Note: the above reference to STANDARD_C_LIBRARY_TYPES creates requires to wrap standard C library using a file called "standard-c-library.gcc-xml" 
-- invariant name.is_equal(once U"Struct")
end -- class C_STRUCT

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
