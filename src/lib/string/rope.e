class ROPE
   --
   -- A string of characters allowing for efficient concatenation.
   --
   -- See also FIXED_STRING and STRING
   -- http://en.wikipedia.org/Rope_(computer_science) and
   -- http://pcplus.techradar.com/node/3079/

   -- Known bugs: using out with temporary
inherit ABSTRACT_STRING redefine new_iterator, infix "<" end

creation {ANY} from_strings

feature -- Creation
   from_strings (first_string, second_string: ABSTRACT_STRING) is
   do
      left := first_string
      right := second_string
      separation := left.count
   end

   copy (another: like Current) is
   do
      left:=another.left
      right:=another.right
      separation:=another.separation
   end

feature
   count: INTEGER is
      do
         Result := left.count +right.count
      end

   item (an_index: INTEGER): CHARACTER is
      -- Random access is an O(count) operation for a ROPE.
      do
         if an_index<=separation
         then Result := left.item(an_index)
         else Result := right.item(an_index-separation)
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

feature {ANY}
   infix "<" (other: ABSTRACT_STRING): BOOLEAN is
      local ci, oi: ITERATOR[CHARACTER]
      do
         from
            ci:=new_iterator; ci.start
            oi:=other.new_iterator; oi.start
         until (ci.is_off or oi.is_off) or else ci.item/=oi.item
         loop ci.next; oi.next
         end
         -- TODO: turn this if statement into something more concise.
         if ci.is_off then
            if oi.is_off then Result := False
            else Result := True
            end
         else
            if oi.is_off then Result := False
            else Result := (ci.item < oi.item)
            end
         end
      end

   is_equal (other: ABSTRACT_STRING): BOOLEAN is
      -- O(min(count,other.count))
      local ci,oi: ITERATOR[CHARACTER]
      do
         if count=other.count then
            from
               Result := True
               ci:=new_iterator; ci.start
               oi:=other.new_iterator; oi.start
            until ci.is_off or else ci.item/=oi.item
            loop ci.next; oi.next
            end
         else Result:=False
         end
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
         until (ci.is_off or oi.is_off) or else ci.item.same_as(oi.item)
         loop ci.next; oi.next
         end
         Result := ci.is_off and oi.is_off
      end

   first: CHARACTER is
      do
         Result:=left.first
      end

   last: CHARACTER is
      do
         Result:=right.last
      end

   has, fast_has (c: CHARACTER): BOOLEAN is
      local i: ITERATOR[CHARACTER]
      do
         from i:=new_iterator; i.start until not (Result or i.is_off)
         loop
            Result := (i.item=c)
            i.next
         end
      end

   index_of, fast_index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
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


   reverse_index_of, fast_reverse_index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
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
         create {ITERATOR_ON_ROPE} Result.make(Current)
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
feature {ABSTRACT_STRING,ITERATOR_ON_ROPE} -- Implementation
   separation: INTEGER
      -- The index where
   left,right: ABSTRACT_STRING
      -- The left and right part of the ROPE
invariant
   left/=Void
   right/=Void
   separation=left.count
end -- class ROPE
