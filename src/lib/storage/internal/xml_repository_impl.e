-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class XML_REPOSITORY_IMPL[O_ -> STORABLE]
	--
	-- Implementation of the XML store and retrieval
	--
	-- Schema:
	--
	--   <!DOCTYPE repository [
	--
	--   <!ELEMENT repository (layout | reference | embedded | basic)* >
	--   <!ATTLIST repository version CDATA #REQUIRED >
	--
	--   <!ELEMENT layout (reference | embedded | basic | array)* >
	--   <!ATTLIST layout type CDATA #REQUIRED >
	--   <!ATTLIST layout ref ID #REQUIRED >
	--
	--   <!ELEMENT reference (EMPTY) >
	--   <!ATTLIST reference name CDARA #REQUIRED >
	--   <!ATTLIST reference ref IDREF #REQUIRED >
	--
	--   <!ELEMENT embedded (reference | embedded | basic | array)* >
	--   <!ATTLIST embedded name CDATA #REQUIRED >
	--   <!ATTLIST embedded type CDATA #REQUIRED >
	--
	--   <!ELEMENT basic (EMPTY) >
	--   <!ATTLIST basic name #REQUIRED >
	--   <!ATTLIST basic type #REQUIRED >
	--   <!ATTLIST basic value #REQUIRED >
	--
	--   <!ELEMENT array (reference | embedded | basic)* >
	--   <!ATTLIST array name CDATA #REQUIRED >
	--   <!ATTLIST array type CDATA #REQUIRED >
	--   <!ATTLIST array capacity CDATA #REQUIRED >
	--
	--   ] >
	--
inherit
	XML_CALLBACKS
	REPOSITORY_IMPL[O_]

insert
	UNICODE_CHARACTERS

feature {} -- Implementation of update
	update_name: STRING is ""

	update_ref: STRING is ""

	update_type: STRING is ""

	update_value: STRING is ""

	update_capacity: STRING is ""

	update_version: STRING is ""

	xml: XML_PARSER is
		once
			create Result.make
		end

	do_update (in_stream: INPUT_STREAM) is
		do
			xml.connect_to(in_stream.url)
			xml.parse(Current)
		end

	last_line: INTEGER is
		do
			Result := xml.line
		end

	last_column: INTEGER is
		do
			Result := xml.column
		end

feature {}
	open_nodes: FAST_ARRAY[STRING] is
		once
			create Result.with_capacity(4)
		end

feature {XML_PARSER}
	with_attribute (attribute_name: UNICODE_STRING; attribute_value: UNICODE_STRING; line, column: INTEGER) is
		local
			error: STRING
		do
			inspect
				attribute_name.as_utf8
			when "name" then
				update_name.copy(attribute_value.as_utf8)
			when "type" then
				update_type.copy(attribute_value.as_utf8)
			when "ref" then
				update_ref.copy(attribute_value.as_utf8)
			when "value" then
				update_value.copy(attribute_value.as_utf8)
			when "capacity" then
				update_capacity.copy(attribute_value.as_utf8)
			when "version" then
				update_version.copy(attribute_value.as_utf8)
			else
				error := once ""
				error.copy(once "Unknown attribute: ")
				attribute_name.utf8_encode_in(error)
				fire_update_error(line, column, error)
			end
		end

	open_node (node_name: UNICODE_STRING; line, column: INTEGER) is
		local
			n, s, error: STRING; layout: REPOSITORY_LAYOUT
		do
			n := node_name.as_utf8
			s := strings.new_twin(n)
			open_nodes.add_last(s)
			layout := new_layout(n)
			update_layouts.push(layout)
			inspect
				n
			when "repository" then
				if not update_version.is_equal(version) then
					error := once ""
					error.copy(once "Incompatible versions: expected ")
					error.append(version)
					error.append(once " but got ")
					error.append(update_version)
					fire_update_error(line, column, error)
				end
				open_repository(layout, line, column)
			when "layout" then
				open_layout(update_type, update_ref, layout, line, column)
			when "reference" then
				open_reference(update_name, update_ref, layout, line, column)
			when "embedded" then
				open_embedded(update_name, update_type, layout, line, column)
			when "basic" then
				open_basic(update_name, update_type, update_value, layout, line, column)
			when "array" then
				open_array(update_name, update_type, update_capacity.to_integer, layout, line, column)
			else
				error := once ""
				error.copy(once "Unknown node: ")
				node_name.utf8_encode_in(error)
				fire_update_error(line, column, error)
			end
			clear_attributes
		end

	close_node (node_name: UNICODE_STRING; line, column: INTEGER) is
		local
			error: STRING
		do
			strings.recycle(open_nodes.last)
			open_nodes.remove_last
			inspect
				node_name.as_utf8
			when "repository" then
				close_repository(line, column)
			when "layout" then
				close_layout(line, column)
			when "reference" then
				close_reference(line, column)
			when "embedded" then
				close_embedded(line, column)
			when "basic" then
				close_basic(line, column)
			when "array" then
				close_array(line, column)
			else
				error := once ""
				error.copy(once "Unknown node: ")
				node_name.utf8_encode_in(error)
				fire_update_error(line, column, error)
			end
		end

	open_close_node (node_name: UNICODE_STRING; line, column: INTEGER) is
		do
			open_node(node_name, line, column)
			close_node(node_name, line, column)
		end

	current_node: UNICODE_STRING is
		do
			Result := once U""
			Result.clear_count
			if not Result.utf8_decode_from(open_nodes.last) then
				Result := Void
			end
		end

	xml_header (line, column: INTEGER) is
		do
			clear_attributes
		end

	processing_instruction (a_target, a_data: UNICODE_STRING) is
		do
			fire_update_error(last_line, last_column, once "Unexpected processing instruction")
		end

	entity (a_entity: UNICODE_STRING; line, column: INTEGER): UNICODE_STRING is
		do
			fire_update_error(line, column, once "Unexpected entity")
		end

	data (a_data: UNICODE_STRING; line, column: INTEGER) is
		local
			i: INTEGER; break: BOOLEAN
		do
			from
				i := a_data.lower
			until
				i > a_data.upper or else break
			loop
				if not is_separator(a_data.item(i)) then
					fire_update_error(line, column, once "Separator expected")
				end
				i := i + 1
			end
		end

	parse_error (line, column: INTEGER; message: STRING) is
		do
			at_error := True
			fire_update_error(line, column, message)
		end

	at_error: BOOLEAN

feature {} -- Implementation of commit
	start_write (out_stream: OUTPUT_STREAM) is
		do
			out_stream.put_string(once "<?xml version='1.1'?>%N<repository version='")
			out_stream.put_string(version)
			out_stream.put_string(once "'>%N")
		end

	end_write (out_stream: OUTPUT_STREAM) is
		do
			out_stream.put_string(once "</repository>%N")
		end

	write_reference (reference, name: STRING; out_stream: OUTPUT_STREAM) is
		do
			out_stream.put_string(once "<reference name='")
			out_stream.put_string(name)
			out_stream.put_string(once "' ref='")
			out_stream.put_string(reference)
			out_stream.put_string(once "'/>%N")
		end

	start_layout (ref, type: STRING; out_stream: OUTPUT_STREAM) is
		do
			out_stream.put_string(once "<layout ref='")
			out_stream.put_string(ref)
			out_stream.put_string(once "' type='")
			out_stream.put_string(type)
			out_stream.put_string(once "'>%N")
		end

	end_layout (out_stream: OUTPUT_STREAM) is
		do
			out_stream.put_string(once "</layout>%N")
		end

	write_character_layout_object (internals: INTERNALS; name: STRING; out_stream: OUTPUT_STREAM) is
		local
			t: TYPED_INTERNALS[CHARACTER]; c: CHARACTER
		do
			t ::= internals
			c := t.object
			out_stream.put_string(once "<basic name='")
			out_stream.put_string(name)
			out_stream.put_string(once "' type='CHARACTER' value='")
			out_stream.put_integer(c.code)
			out_stream.put_string(once "'/>%N")
		end

	write_boolean_layout_object (internals: INTERNALS; name: STRING; out_stream: OUTPUT_STREAM) is
		local
			t: TYPED_INTERNALS[BOOLEAN]; c: BOOLEAN
		do
			t ::= internals
			c := t.object
			out_stream.put_string(once "<basic name='")
			out_stream.put_string(name)
			out_stream.put_string(once "' type='BOOLEAN' value='")
			out_stream.put_boolean(c)
			out_stream.put_string(once "'/>%N")
		end

	write_integer_8_layout_object (internals: INTERNALS; name: STRING; out_stream: OUTPUT_STREAM) is
		local
			t: TYPED_INTERNALS[INTEGER_8]; c: INTEGER_8
		do
			t ::= internals
			c := t.object
			out_stream.put_string(once "<basic name='")
			out_stream.put_string(name)
			out_stream.put_string(once "' type='INTEGER_8' value='")
			out_stream.put_integer(c)
			out_stream.put_string(once "'/>%N")
		end

	write_integer_16_layout_object (internals: INTERNALS; name: STRING; out_stream: OUTPUT_STREAM) is
		local
			t: TYPED_INTERNALS[INTEGER_16]; c: INTEGER_16
		do
			t ::= internals
			c := t.object
			out_stream.put_string(once "<basic name='")
			out_stream.put_string(name)
			out_stream.put_string(once "' type='INTEGER_16' value='")
			out_stream.put_integer(c)
			out_stream.put_string(once "'/>%N")
		end

	write_integer_32_layout_object (internals: INTERNALS; name: STRING; out_stream: OUTPUT_STREAM) is
		local
			t: TYPED_INTERNALS[INTEGER_32]; c: INTEGER_32
		do
			t ::= internals
			c := t.object
			out_stream.put_string(once "<basic name='")
			out_stream.put_string(name)
			out_stream.put_string(once "' type='INTEGER_32' value='")
			out_stream.put_integer(c)
			out_stream.put_string(once "'/>%N")
		end

	write_integer_64_layout_object (internals: INTERNALS; name: STRING; out_stream: OUTPUT_STREAM) is
		local
			t: TYPED_INTERNALS[INTEGER_64]; c: INTEGER_64
		do
			t ::= internals
			c := t.object
			out_stream.put_string(once "<basic name='")
			out_stream.put_string(name)
			out_stream.put_string(once "' type='INTEGER_64' value='")
			out_stream.put_integer(c)
			out_stream.put_string(once "'/>%N")
		end

	write_integer_layout_object (internals: INTERNALS; name: STRING; out_stream: OUTPUT_STREAM) is
		local
			t: TYPED_INTERNALS[INTEGER]; c: INTEGER
		do
			t ::= internals
			c := t.object
			out_stream.put_string(once "<basic name='")
			out_stream.put_string(name)
			out_stream.put_string(once "' type='INTEGER' value='")
			out_stream.put_integer(c)
			out_stream.put_string(once "'/>%N")
		end

	write_real_32_layout_object (internals: INTERNALS; name: STRING; out_stream: OUTPUT_STREAM) is
		local
			t: TYPED_INTERNALS[REAL_32]; c: REAL_32
		do
			t ::= internals
			c := t.object
			out_stream.put_string(once "<basic name='")
			out_stream.put_string(name)
			out_stream.put_string(once "' type='REAL_32' value='")
			out_stream.put_real(c)
			out_stream.put_string(once "'/>%N")
		end

	write_real_64_layout_object (internals: INTERNALS; name: STRING; out_stream: OUTPUT_STREAM) is
		local
			t: TYPED_INTERNALS[REAL_64]; c: REAL_64
		do
			t ::= internals
			c := t.object
			out_stream.put_string(once "<basic name='")
			out_stream.put_string(name)
			out_stream.put_string(once "' type='REAL_64' value='")
			out_stream.put_real(c)
			out_stream.put_string(once "'/>%N")
		end

	write_real_80_layout_object (internals: INTERNALS; name: STRING; out_stream: OUTPUT_STREAM) is
		local
			t: TYPED_INTERNALS[REAL_80]; c: REAL_80
		do
			t ::= internals
			c := t.object
			out_stream.put_string(once "<basic name='")
			out_stream.put_string(name)
			out_stream.put_string(once "' type='REAL_80' value='")
			out_stream.put_real(c.force_to_real_64)
			out_stream.put_string(once "'/>%N")
		end

	write_real_128_layout_object (internals: INTERNALS; name: STRING; out_stream: OUTPUT_STREAM) is
		local
			t: TYPED_INTERNALS[REAL_128]; c: REAL_128
		do
			t ::= internals
			c := t.object
			out_stream.put_string(once "<basic name='")
			out_stream.put_string(name)
			out_stream.put_string(once "' type='REAL_128' value='")
			out_stream.put_real(c.force_to_real_64)
			out_stream.put_string(once "'/>%N")
		end

	write_real_layout_object (internals: INTERNALS; name: STRING; out_stream: OUTPUT_STREAM) is
		local
			t: TYPED_INTERNALS[REAL]; c: REAL
		do
			t ::= internals
			c := t.object
			out_stream.put_string(once "<basic name='")
			out_stream.put_string(name)
			out_stream.put_string(once "' type='REAL' value='")
			out_stream.put_real(c)
			out_stream.put_string(once "'/>%N")
		end

	write_real_expanded_layout_object (internals: INTERNALS; name: STRING; out_stream: OUTPUT_STREAM) is
		local
			t: TYPED_INTERNALS[REAL_EXTENDED]; c: REAL_EXTENDED
		do
			t ::= internals
			c := t.object
			out_stream.put_string(once "<basic name='")
			out_stream.put_string(name)
			out_stream.put_string(once "' type='REAL_EXTENDED' value='")
			out_stream.put_real(c.force_to_real_64)
			out_stream.put_string(once "'/>%N")
		end

	write_array_layout_object (internals: INTERNALS; name: STRING; out_stream: OUTPUT_STREAM) is
		local
			type: STRING; f: INTEGER; int: INTERNALS
		do
			if internals.type_attribute_count > 0 then
				type := once ""
				type.copy(internals.type_generating_type)
				type.remove_prefix(once "NATIVE_ARRAY[")
				type.remove_suffix(once "]")
				out_stream.put_string(once "<array name='")
				out_stream.put_string(name)
				out_stream.put_string(once "' type='")
				out_stream.put_string(type)
				out_stream.put_string(once "' capacity='")
				out_stream.put_integer(internals.type_attribute_count)
				out_stream.put_string(once "'>%N")
				from
					f := 1
				until
					f > internals.type_attribute_count
				loop
					int := internals.object_attribute(f)
					if int = Void then
						write_reference_layout(Void, internals.type_attribute_name(f), out_stream)
					else
						if int.type_is_expanded then
							write_expanded(int, internals.type_attribute_name(f), out_stream)
						else
							write_reference_layout(int, internals.type_attribute_name(f), out_stream)
						end
					end
					f := f + 1
				end
				out_stream.put_string(once "</array>%N")
			end
		end

	start_embedded_layout (internals: INTERNALS; name: STRING; out_stream: OUTPUT_STREAM) is
		do
			out_stream.put_string(once "<embedded name='")
			out_stream.put_string(name)
			out_stream.put_string(once "' type='")
			out_stream.put_string(internals.type_generating_type)
			out_stream.put_string(once "'>%N")
		end

	end_embedded_layout (internals: INTERNALS; name: STRING; out_stream: OUTPUT_STREAM) is
		do
			out_stream.put_string(once "</embedded>%N")
		end

feature {} -- Internals
	frozen version: STRING is "1"

	clear_attributes is
		do
			update_name.clear_count
			update_ref.clear_count
			update_type.clear_count
			update_value.clear_count
			update_capacity.clear_count
			update_version.clear_count
		end

feature {} -- Default transient objects
	register_transient_objects is
		do
			transient.register(to_internals, once "Repository")
		end

	unregister_transient_objects is
		do
			transient.unregister(once "Repository")
		end

end -- class XML_REPOSITORY_IMPL
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
