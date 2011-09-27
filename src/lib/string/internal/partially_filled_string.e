class PARTIALLY_FILLED_STRING
inherit STRING redefine infix "#" end
creation {ABSTRACT_STRING} from_string_and_arg
creation {ANY}
   with_capacity, make, copy, make_empty, make_filled, from_external, from_external_copy,
   from_external_sized, from_external_sized_copy, make_from_string

feature {} -- Creation
	from_string_and_arg (a_string, an_argument: ABSTRACT_STRING; an_index: INTEGER) is
		require
			a_string/=Void
			an_argument/=Void
		local 
			i,l: INTEGER
			placeholder: STRING
		do
			make_from_string(a_string)
			create placeholder.with_capacity(5) -- Heuristic size that will never require resize
			placeholder.append(once "#("); an_index.append_in(placeholder)
			placeholder.add_last(')')
			l := placeholder.count

			from i := first_substring_index(placeholder)
			until not valid_index(i)
			loop
				replace_substring(an_argument,i,i+l-1)
				i := substring_index(placeholder,i+l)
			end

			next_argument := an_index+1
		end
feature 
	infix "#" (a_value: ABSTRACT_STRING): ABSTRACT_STRING is
		do
			create {PARTIALLY_FILLED_STRING} Result.from_string_and_arg(Current,a_value,next_argument)
		end
feature {} -- Implementation
	next_argument: INTEGER -- that will be filled whan invoking Current # "some string"
end


