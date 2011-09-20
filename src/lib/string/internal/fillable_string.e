class FILLABLE_STRING
	-- A string of text made of fixed text and placeholdes 
	obsolete "[
	That was a tentative implementation. 
	The idea was to save the explicit allocation required by STRING_PRINTER which is used like 
		my_string_printer.put_message
		("@(1) is really a nice @(2)",
		<<"Eiffel", "programming language">>)

		Too bad that the idea behind FILLABLE_STRING is to scan the message
		during creation of Current creating a list of abstract strings
		(`pieces') holding the fixed pieces and the variable one.

		The variable ones would FILLABLE_ARGUMENTs, a heir of ABSTRACT_STRING
		implemented with a REFERENCE[LAZY_STRING]. The indexes arguments would
		be stored into array `placeholders_indexes'.

		So in the end I would save an explicit array allocation requiring a
		linked list and an array. Smart, isn't it? 

		Actually current implementation of arg, creating a new rope each time
		arg is invoked requires N allocation of a small object.
		]"

inherit ABSTRACT_STRING

creation make

feature 
	make (a_string: ABSTRACT_STRING; an_index: INTEGER; a_value: ABSTRACT_STRING) is
	do
		create pieces.make
		create placeholders.make
		initialize_with(a_string)
		-- the following is plainly wrong but you got the idea
		-- if placeholders.has(an_index) then
		-- 	placeholders.put(an_index,a_value)
		-- end
	end

	arg (an_index: INTEGER; a_value: ABSTRACT_STRING): like Current is
		do
			placeholdes.put(an_index,a_value)
			not_yet_implemented
			-- je tutto sbagliato, ye tutto da rifare.
		end

feature  {} -- Implementation
	initialize_with (a_string: ABSTRACT_STRING) is
		-- Initialize Current from `a_string'
	require a_string/=Void
	local 
		ch: CHARACTER -- or better like first or item
		state: INTEGER
		in_progress: STRING
		placeholder: FILLABLE_STRING_PLACEHOLDER
		i, backtrack_i, index: INTEGER
	do
		-- TODO: evaluate an eventual reimplementation using
		-- iterators. This implementation is taken from
		-- MESSAGE_FORMATTER
		create in_progress.make_empty
		from i:=a_string.lower; state:=normal_state
		until i>a_string.upper
		loop
			from 
			until i>a_string.upper
			loop
				ch := a_string.item(i)
				inspect state
				when print_state then 
					in_progress.append_character(ch)
					state := normal_state
				when normal_state then 
					if ch.is_equal(delimiter) then
						backtrack_i := i - 1
						state := after_delimeter_state
					else in_progress.append_character(ch)
					end
				when after_delimeter_state then 
					if ch.is_equal(delimiter) then 
						in_progress.append_character(ch)
						state := normal_state
					elseif ch.is_equal(opening_brace) then
						index := 0
						state := after_opening_brace_state
					else
						i := backtrack_i
						state := print_state 
					end
				when after_opening_brace_state then
					if ch.is_decimal_digit then
						index := 10*index + ch.decimal_value
					elseif ch.is_equal(closing_brace) then
						pieces.add_last(in_progress)
						create in_progress.make_empty
						create placeholder
						placeholders.put(index,placeholder)
						pieces.add_last(placeholder)
						state := normal_state
					else
						i := backtrack_i
						state := print_state
					end
				end
				i:=i+1
			end
		end

feature {} -- Implementation
	pieces: LINKED_LIST[ABSTRACT_STRING]
	placeholders_indexes: ARRAY[INTEGER]

	print_state, normal_state, after_delimeter_state, after_opening_brace_state: INTEGER is unique
	
	delimiter: CHARACTER is '#'
	opening_brace: CHARACTER is '('
	closing_brace: CHARACTER is ')'
end
