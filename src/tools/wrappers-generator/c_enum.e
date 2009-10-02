class C_ENUM
	-- An "Enumeration" XML node in a file made by gccxml representing a C
	-- enum.
	
	-- TODO: Currently wrapper_type is "INTEGER"; this assumes two
	-- conditions:
	
	-- 1 - any enum value is actually an int; 
	-- 2 - INTEGER has the same size of int

	-- As far as I know this condition shall apply on all architectures.
inherit 
	GCCXML_NODE -- redefine do_all end
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE
	STORABLE_NODE
	LIBERTY_TYPED
	WRAPPED_BY_A_CLASS

creation make

feature 
	store is
		do
			enumerations.put(Current,id)
			types.put(Current,id)
		end

	wrapper_type: STRING is "INTEGER"

	emit_wrapper is
		local 
			filename: STRING; path: POSIX_PATH_NAME
		do
			if is_public(c_name) then
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
		i: COUNT; flags_so_far, value: INTEGER; enum_value: C_ENUM_VALUE
	do
		from i.set(1) Result := True
		variant children_count - i.value
		until Result = False or else i > children_count
		loop
			enum_value ?= child(i.value)
			if enum_value/= Void then
				value := enum_value.value.to_integer
				if value > 0 and then value.is_a_power_of_2 and flags_so_far & value = 0 then
					-- value is valid and indipendent from other values so far.
					flags_so_far := flags_so_far | value
				else Result := False
				end
			else log(once "Warning: Enum node (line @(1)) has at least a value that is not an EnumValue!", <<line.out>>)
			end
			i.increment
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
			-- This is not useful filename := c_file.c_name.to_utf8
			initialize_validity_query
			setters.reset_with(once "%Tdefault_create,%N")
			values.first.append_to_buffers
			if values.count>1 then
				from i := 2
				until i >= values.count
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
				until i >= values.count
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
	longest_prefix: INTEGER is
		-- The length of longest prefix common to all values of Current enumeration
		-- Useful to remove the common prefix of many enumeration values.
	require has_values: values.count > 1 
	local char_idx, value_idx ,upper: INTEGER; c: INTEGER_32; found: BOOLEAN
		i: INTEGER; -- used in debug
	do
		-- Find the shortest name
		from value_idx:=values.lower; upper:=Maximum_integer
		until value_idx>values.upper loop
			upper := upper.min(values.item(value_idx).c_name.count)
			value_idx:=value_idx+1
		end
		-- Find the first index that have different character.
		from char_idx:=1
		until found or else char_idx>upper
		loop
			from 
				c:=values.first.c_name.item(char_idx)
				value_idx:=values.lower+1 
			until found or else value_idx>values.upper loop
				if c/=values.item(value_idx).c_name.item(char_idx) then 
					found:=True
					Result:=char_idx-1
				else value_idx:=value_idx+1
				end
			end
			char_idx := char_idx+1
		end
		debug
			print(once "Longest common prefix of ") 
			from print(values.first.c_value.out); i:=2 until i>=values.count loop
				print(once ", ") print(values.item(i).c_value.out)
				i:=i+1
			end
			-- Could bevalues.do_all(agent (x:C_ENUM_VALUE) do x.out.print_on(std_output) end) 
			print(once "is ") print(Result.to_string) 
			print(once " characters long `")
			print(values.first.c_name.as_utf8.substring(1,Result))
			print(once "'.%N")
		end
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
	--invariant name.is_equal(once U"Enumeration")
end

