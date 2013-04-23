class AUX_ASSIGN02

insert
   ANY
      redefine
         default_create
      end

feature {ANY}
   infix "+" (value: INTEGER): INTEGER is
      do
         if values.fast_has(value) then
            Result := values.fast_at(value)
         end
      end

   set_item (res, val: INTEGER) assign infix "+" is
      do
         values.put(res, val)
      ensure
         Current + val = res
      end

feature {}
   values: HASHED_DICTIONARY[INTEGER, INTEGER]

   default_create is
      do
         create values.make
      end

end
