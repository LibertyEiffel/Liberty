class AUX_ASSIGN02

insert
   ANY
      redefine
         default_create
      end

feature {ANY}
   infix "+" (value: INTEGER): INTEGER
      do
         if values.fast_has(value) then
            Result := values.fast_at(value)
         end
      end

   set_item (res, val: INTEGER) assign infix "+"
      do
         values.put(res, val)
      ensure
         Current + val = res
      end

feature {}
   values: HASHED_DICTIONARY[INTEGER, INTEGER]

   default_create
      do
         create values.make
      end

end
