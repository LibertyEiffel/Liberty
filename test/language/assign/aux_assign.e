expanded class AUX_ASSIGN
   -- A precise value coupled with its precomputed approximation.
   --
   -- Used to show the usage of setters features, kwno as 

insert
   ANY
      redefine out_in_tagged_out_memory, fill_tagged_out_memory
      end

feature {ANY}
   value: INTEGER

   precise: REAL_64

   set_value (a_value: INTEGER) assign value
      do
         value := a_value
         precise := a_value.to_real_64
      end

   set_precise (a_value: REAL_64) assign precise
      do
         precise := a_value
         value := a_value.force_to_integer_32
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.clear_count
         tagged_out_memory.append("AUX_ASSIGN[" + precise.out + " ~ " + value.out + "]")
      end

   fill_tagged_out_memory
      do
         tagged_out_memory.clear_count
         tagged_out_memory.append("AUX_ASSIGN[" + precise.out + " ~ " + value.out + "]")
      end

end -- class AUX_ASSIGN
