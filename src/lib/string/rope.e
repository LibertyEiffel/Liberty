class ROPE
   --
   -- A string of characters allowing for efficient concatenation.
   --
   -- See also FIXED_STRING and STRING

inherit ABSTRACT_STRING redefine new_iterator end

creation --from_strings, 
	{ANY} concatenating

feature -- Creation
	concatenating (a_string, another: ABSTRACT_STRING) is
	do
		content := a_string
		next := another
	end

	copy (another: like Current) is
	do
		content:=another.content
		next:=another.next
	end

feature 
	count: INTEGER is
		do
			Result:= content.count+next.count
		end

	item (an_index: INTEGER): CHARACTER is
		-- Random access is an O(count) operation for a ROPE.
		do
			if an_index<content.count then Result := content.item(an_index)
			else Result := next.item(an_index-content.count)
			end
		end

	substring (start_index, end_index: INTEGER): like Current is
		do
			not_yet_implemented
		end
	
	occurrences (c: CHARACTER): INTEGER is
		local i: ITERATOR[CHARACTER]
		do
			from i:=new_iterator; i.start until not i.is_off
			loop
				if i.item=c then Result:=Result+1 end
				i.next
			end
		end
	
	is_equal (other: ABSTRACT_STRING): BOOLEAN is
		-- O(min(count,other.count))
		local ci,oi: ITERATOR[CHARACTER]
		do
			from 
				ci:=new_iterator; ci.start
				oi:=other.new_iterator; oi.start
			until not (ci.is_off or oi.is_off) and then ci.item=oi.item 
			loop ci.next; oi.next
			end
			Result := ci.is_off and oi.is_off
		end

	hash_code: INTEGER is
		do
			Result := computed_hash_code
		end

	same_as (other: ABSTRACT_STRING): BOOLEAN is
		-- O(min(count,other.count))
		local ci,oi: ITERATOR[CHARACTER]
		do
			from 
				ci:=new_iterator; ci.start
				oi:=other.new_iterator; oi.start
			until not (ci.is_off or oi.is_off) and then ci.item.to_lower=oi.item 
			loop ci.next; oi.next
			end
			Result := ci.is_off and oi.is_off
		end


	first: CHARACTER is
		do
			Result:=content.first
		end

	last: CHARACTER is
		do
			Result:=next.last
		end

	has (c: CHARACTER): BOOLEAN is
		local i: ITERATOR[CHARACTER]
		do
			from i:=new_iterator; i.start until not (Result or i.is_off)
			loop
				Result := (i.item=c)
				i.next
			end
		end

	index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
		local n: INTEGER; i: ITERATOR[CHARACTER]
		do

			from 
				i:=new_iterator
				-- Reach start_index
				from n:=lower; i.start until n>=start_index
				loop i.next; n:=n+1
				end
			until i.item/=c or else not i.is_off
			loop i.next; n:=n+1
			end
		end

		
	reverse_index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
		do
			not_yet_implemented
		end

feature -- Concatenation
	infix "&" (another: ABSTRACT_STRING): ABSTRACT_STRING is
		-- A newly allocated string containing Current and `another'
		-- concatenated. Implementation may choose any effective heir of
		-- ABSTRACT_STRING.
	do
		not_yet_implemented
	end

feature -- Iterating and other features
	new_iterator: ITERATOR[CHARACTER] is
		do
			-- create {ITERATOR_ON_ROPE} Result.make(Current)
		end
	
	intern: FIXED_STRING is
		do
			not_yet_implemented
		end
feature {ANY} -- Printing:
	fill_tagged_out_memory is
		do
			not_yet_implemented
		end

feature {ANY} -- Interfacing with C string:
	to_external: POINTER is
		do
			not_yet_implemented
		end
feature 
	recycle is
		do
			not_yet_implemented
		end
feature {ROPE} -- Implementation
	content, next: ABSTRACT_STRING

end -- class ROPE 
