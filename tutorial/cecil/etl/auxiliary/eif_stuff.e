expanded class EIF_STUFF
   --
   -- To simulate `eif_adopt' and `eif_wean' from ETL.
   --

feature {ANY}
   adopted: FAST_ARRAY[ABSTRACT_STRING]
      once
         create Result.with_capacity(16)
      end

   adopt (object: ABSTRACT_STRING)
         -- A reference to object is stored in `adopted' to avoid
         -- its collection at GC time.
      do
         if not adopted.fast_has(object) then
            adopted.add_last(object)
         end
      end

   wean (object: ABSTRACT_STRING)
         -- Remove the reference to `object' in adopted.
      local
         i: INTEGER
      do
         i := adopted.fast_first_index_of(object)
         if adopted.valid_index(i) then
            adopted.put(Void, i)
            adopted.put(adopted.last, i)
            adopted.remove_last
         end
      end

end -- class EIF_STUFF
