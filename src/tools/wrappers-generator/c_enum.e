class C_ENUM
	-- An "Enumeration" XML node in a file made by gccxml representing a C
	-- enum.
	
	-- TODO: Currently wrapper_type is "INTEGER"; this assumes two
	-- conditions:
	
	-- 1 - any enum value is actually an int; 
	-- 2 - INTEGER has the same size of int

	-- As far as I know this condition shall apply on all architectures.
inherit 
	IDENTIFIED_NODE
	FILED_NODE
	STORABLE_NODE
	TYPED_NODE
	WRAPPER_CLASS

creation make

feature 
	store is
		do
			if is_named then
				symbols.put(Current,c_string_name)
			end
			types.put(Current,id)
		end

	has_wrapper: BOOLEAN is True
	wrapper_type: STRING is "INTEGER"

	is_fundamental: BOOLEAN is False

	is_void: BOOLEAN is False

	is_to_be_emitted: BOOLEAN is True
	
	emit_wrapper is
		local 
			filename: STRING; path: POSIX_PATH_NAME
		do
			if is_public then
				if on_standard_output then 
					log(once "Outputting enum @(1) as @(2) on standard output.%N",
					<<c_name.to_utf8, class_name>>)
					output := std_output
				else
					create path.make_from_string(directory)
					path.add_last(class_name.as_lower+once ".e")
					filename := path.to_string
					log(once "Wrapping enum @(1) as @(2) on @(3)",
					<<c_name.to_utf8, class_name, filename>>)
					create {TEXT_FILE_WRITE} output.connect_to(filename)
				end
				emit_header
				emit_items
				emit_footer
				output.flush
				output.disconnect
			else log(once "Skipping enum `@(1)'.%N",<<c_name.as_utf8>>)
			end
		end

	emit_header is
		do
			buffer.reset_with(automatically_generated_header)
			buffer.append(expanded_class)
			buffer.append(class_name)
			buffer.append_new_line
			buffer.append(once "%N-- TODO emit_description(class_descriptions.reference_at(an_enum_name))%N")
			buffer.append(once "%Ninsert ENUM%N%Ncreation default_create%N")
			buffer.print_on(output)
		end
			
	emit_items is
		do
			if children_count>0 then
				if flags.has(class_name) then 
					log_string(once ", forcefully wrapped as flag.%N")
					append_flag_items
				elseif have_flags_values then 
					log_string(once ", as flag.%N")
					append_flag_items
				else 
					log_string(once ", as an enumeration.%N")
					append_enumeration_items
				end
			else log_string(once "... fieldless.%N")
			end
			output.put_line(once "feature -- Validity")
			validity_query.print_on(output)
			output.put_line(once "feature -- Setters")
			setters.print_on(output)
			output.put_line(once "feature -- Queries")
			queries.print_on(output)
			output.put_line(once "feature {WRAPPER, WRAPPER_HANDLER} -- Low level values")
			low_level_values.print_on(output)
		end

	emit_footer is
		do
			buffer.put_message("%Nend -- class @(1)%N",<<class_name>>)
			buffer.print_on(output)
		end
		
	suffix: STRING is "_ENUM"
	
	prefix_length: INTEGER 
		-- The length of the longest common prefix of the enumeration - either plain or flag-like - currently being wrapped.

	have_flags_values: BOOLEAN is
		-- Can the values of `an_enumeration' be used as flags? They can be
		-- used as flags when they are different powers of 2, i.e.  setting
		-- each a different bit, and there is no zero value.
	require has_children: children_count>0
	local
		i, flags_so_far, value: INTEGER; enum_value: C_ENUM_VALUE
	do
		from i := 1; Result := True
		until Result = False or else i > children_count
		loop
			enum_value ?= child(i)
			if enum_value/= Void then
				value := enum_value.value.to_integer
				if value > 0 and then value.is_a_power_of_2 and flags_so_far & value = 0 then
					-- value is valid and indipendent from other values so far.
					flags_so_far := flags_so_far | value
				else Result := False
				end
			else log(once "Warning: Enum node (line @(1)) has at least a value that is not an EnumValue!", <<line.out>>)
			end
			i := i+1
		end
	end

feature -- Emitting "normal" enumeration
	append_enumeration_items is
		require has_children: values.count>0
		local i: INTEGER; 
		do
			if values.count > 1 then prefix_length := longest_prefix
			else prefix_length := 0
			end
			initialize_validity_query
			setters.reset_with(once "%Tdefault_create,%N")
			values.first.append_to_buffers
			if values.count>1 then
				from i := values.lower+1
				until i > values.upper
				loop
					append_separators 
					values.item(i).append_to_buffers
					i := i + 1
				end
			end
			finalize_validity_query

		end
	initialize_validity_query is
		do
			validity_query.reset_with
			(once "	is_valid_value (a_value: INTEGER): BOOLEAN is%N%
			%		do%N%
			%			Result := (")
		ensure
			validity_query_grew: validity_query.count > old validity_query.count
		end

	finalize_validity_query is
		do
			validity_query.append(once ")%N%T%Tend%N%N")
		ensure
			validity_query_grew: validity_query.count > old validity_query.count
		end

	append_separators is
			-- Append various separators to `validity_query', `queries' and
			-- `setters' buffers.
		do
			validity_query.append(once " or else%N%T%T%T%T")
		end

feature -- Emitting "flag" enumeration
	append_flag_items is
		require has_children: values.count>0
		local i: INTEGER; 
		do
			if values.count > 1 then prefix_length := longest_prefix
			else prefix_length := 0
			end

			initialize_flag_validity_query
			setters.reset_with(once "%Tdefault_create,%N")

			values.first.append_as_flag_to_buffers
			if values.count>1 then
				from i := 2
				until i > values.upper
				loop
					append_flag_separators 
					values.item(i).append_as_flag_to_buffers
					i := i + 1
				end
			
			end
			finalize_flag_validity_query
		end


	initialize_flag_validity_query is
		do
			validity_query.reset_with
			(once "	is_valid_value (a_value: INTEGER): BOOLEAN is%N%
			%		do%N%
			%			Result := (a_value & (")
		ensure
			validity_query_grew: validity_query.count > old validity_query.count
		end

	finalize_flag_validity_query is
		do
			validity_query.append(once ")).to_boolean%N%T%Tend%N%N")
		ensure
			validity_query_grew: validity_query.count > old validity_query.count
		end

	append_flag_separators is
			-- Append various separators to `validity_query', `queries' and
			-- `setters' buffers.
		do
			validity_query.append(once " | %N%T%T%T%T")
		end

	
feature {C_ENUM_VALUE} -- Implementation  
	shortest_length: INTEGER_32 is 
		-- The length of the shortest enumeration value
	local i: INTEGER
	do
		from i:=values.upper-1; Result:=values.last.c_name.count
		until i<values.lower loop
			Result:=Result.min(values.item(i).c_name.count)
			i:=i-1
		end
	end

	longest_prefix: INTEGER is
		-- The length of longest prefix common to all values of Current enumeration
		-- Useful to remove the common prefix of many enumeration values.
	require has_values: values.count > 1 
	local i, upper: INTEGER
	do
		from Result:=values.first.c_name.lower; upper:=shortest_length
		until Result>=upper or else not same_character_at_index(Result)
		loop Result:=Result+1
		end
		Result:=Result-1
		-- Used during development of this feature. Disabled because it's too verbose
		debug
			if verbose then
				print(once "'") print(values.first.c_name.as_utf8.substring(1,Result))
				print(once "'(") print(Result.to_string) print(once " characters) is longest common prefix of ") 
				from i:=values.lower until i>values.upper-1 loop
					print(values.item(i).c_name.out) print(once ", ")
					i:=i+1
				end
				print(values.last.c_string_name) print(once ".%N")
			end
		end
	ensure shorter_than_shortest_item: Result < shortest_length -- otherwise the shortest item will get an empty label  
	end

	values: FAST_ARRAY[C_ENUM_VALUE] is
		-- The C_ENUM_VALUE children of Current C_ENUM
	local a_value: C_ENUM_VALUE; i: INTEGER
	do
		if hidden_values=Void then
			create hidden_values.with_capacity(children_count)
			from i:=1 until i>children_count loop
				a_value?=child(i)
				if a_value/=Void then
					hidden_values.add_last(a_value)
				end
				i := i+1
			end
		end
		Result := hidden_values
	end

feature {} -- Implementation
	hidden_values: like values

	same_character_at_index (an_index: INTEGER): BOOLEAN is 
		-- Do all values have the same characters at `an_index' in their name?
	require 
		has_values: values.count>1
		an_index <= shortest_length
	local c: INTEGER_32; i: INTEGER
	do
		c := values.first.c_name.item(an_index) 
		--print(" (sc@"+an_index.out+": ")
		from i:=values.lower; Result:=True
		until not Result or else i>values.upper 
		loop
			Result := values.item(i).c_name.item(an_index) = c
			--print(values.item(i).c_name.item(an_index).to_character.out+",")
			i:=i+1
		end
		--print(")="+Result.out+" ")
	end
	--invariant name.is_equal(once U"Enumeration")
	
end -- class C_ENUM

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
