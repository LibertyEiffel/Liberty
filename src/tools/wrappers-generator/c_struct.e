class C_STRUCT
	-- A "Struct" node of an XML file made by gccxml.
inherit 
	COMPOSED_NODE -- hence also STORABLE_NODE  and a NAMED_NODE
		undefine compute_eiffel_name end -- using the definition made in WRAPPER_CLASS
	CONTEXTED_NODE 
	FILED_NODE
	IDENTIFIED_NODE
	TYPED_NODE
	WRAPPER_CLASS

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
				Result := once "struct"
			else
				Result := once ""
			end
		end

	wrapper_type: STRING is 
		do
			debug 
				print(once 
				"C_STRUCT.wrapper_type requires creation%
				% of external/expanded types; currently returning an empty string")
			end
			not_yet_implemented -- Result := eiffel_name
		end

	is_to_be_emitted: BOOLEAN is
		do
			Result:= is_named and then (is_public or has_assigned_name) and then namespace.is_main and then 
			(global or else headers.has(c_file.c_string_name))
		end
	emit_wrapper is
		-- Emit a reference wrapper for Current C structure.

		-- A reference wrapper handles the structure as a memory area referred by a pointer.
		-- An expanded wrapper is an expanded Eiffel type that is the actual C structure. This require the usage  of "external types" 
	local path: POSIX_PATH_NAME; filename: STRING
	do
		if is_to_be_emitted then
			create path.make_from_string(directory)
			path.add_last(eiffel_name.as_lower+once ".e")
			filename := path.to_string
			log(once "Struct @(1) to @(2) in @(3)%N",
			<<c_string_name, eiffel_name, filename>>)
			create {TEXT_FILE_WRITE} output.connect_to(filename)
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
		buffer.append(eiffel_name)
		-- TODO: emit_description(class_descriptions.reference_at(eiffel_name))
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
				fields.do_all(agent {C_FIELD}.append_getter_and_setter(eiffel_name))
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
		("#define sizeof_"+c_string_name+" (sizeof("+c_type+" "+c_string_name+"))%N").print_on(include)
		end

	emit_footer is
		do
			buffer.append(once "end -- class ")
			buffer.append(eiffel_name)
			buffer.append_new_line
			buffer.append(automatically_generated_header)
			buffer.print_on(output)
		end

	is_artificial: BOOLEAN is
		do
			Result := attributes.has(once U"artificial") and then attributes.at(once U"artificial").is_equal(once U"1")
		end

	suffix: STRING is "_STRUCT"
	
	struct_inherits: STRING is "%N%Ninsert STANDARD_C_LIBRARY_TYPES%N%N"
	-- TODO: the above reference to STANDARD_C_LIBRARY_TYPES creates requires
	-- to wrap standard C library using a file called
	-- "standard-c-library.gcc-xml"; allow the user to specify its name,
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
