class FUNCTIONS
	-- Functions grouped by the file they are defined into.

inherit HASHED_DICTIONARY[LINKED_LIST[C_FUNCTION], UNICODE_STRING]

creation make

feature 
	store (a_function: C_FUNCTION) is
		-- Store `a_function' into Current, creating the container list if necessary.
		require a_function/=Void
		local list: LINKED_LIST[C_FUNCTION]; an_id: UNICODE_STRING
		do
			an_id := a_function.file_id 
			list := reference_at (an_id)
			if list=Void then 
				create list.make
				add(list, an_id)
			end
			list.add_last(a_function)
		end
end	
