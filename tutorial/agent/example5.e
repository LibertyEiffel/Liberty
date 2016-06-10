class EXAMPLE5
   --
   -- There is also a `for_all' routine in COLLECTION (i.e. ARRAY,
   -- FAST_ARRAY, LINKED_LIST, TWO_WAY_LINKED_LIST).
   -- You can watch the result using sedb, the Liberty Eiffel DeBugger.
   --

create {ANY}
   make

feature {ANY}
   make
      local
         my_array: ARRAY[INTEGER]; bool: BOOLEAN
      do
         my_array := {ARRAY[INTEGER] 1, << 2, 3, 4 >> }
         bool := my_array.for_all(agent greater_than(?, 1))
         sedb_breakpoint
         bool := my_array.for_all(agent greater_than(1, ?))
         sedb_breakpoint
         bool := my_array.exists(agent greater_than(4, ?))
         sedb_breakpoint
         bool := my_array.exists(agent greater_than(?, 4))
         sedb_breakpoint
      end

feature {}
   greater_than (item, value: INTEGER): BOOLEAN
      do
         Result := item > value
      end

end -- class EXAMPLE5
