class TEST_FI01

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   value: INTEGER_32 17
   callback_value: INTEGER

   make
      local
         a: FOREIGN_AGENT
         p: FOREIGN_PARAMETERS
         v: FOREIGN_TYPED_OBJECT[INTEGER_32]
      do
         -- Eiffel idiosyncracy: when calling an Eiffel feature, add Current's pointer as the first parameter
         create {FOREIGN_EXTERNAL_FUNCTION} a.make($callback, {FAST_ARRAY[FOREIGN_TYPE] << types.pointer, types.sint32 >>}, types.sint32)
         p.set({FAST_ARRAY[FOREIGN_OBJECT] << types.create_pointer(to_pointer), types.create_sint32(value) >>})

         v ::= a.item(p)

         assert(callback_value = value)
         assert(v.item = value)
      end

   types: FOREIGN_TYPES

   callback (v: like value): INTEGER
      do
         callback_value := v
         Result := v
      end

end
