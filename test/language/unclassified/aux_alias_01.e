class AUX_ALIAS_01

feature {ANY}
   i: INTEGER

   add alias "+" (n: INTEGER): like Current
      do
         i := i + n
         Result := Current
      ensure
         i = old i + n
         Result = Current
      end

   minus alias "-" (n: INTEGER): like Current
      do
         i := i - n
         Result := Current
      ensure
         i = old i - n
         Result = Current
      end

   neg alias "-": like Current
      do
         i := -i
         Result := Current
      ensure
         i = -(old i)
         Result = Current
      end

   item alias "[]" (index: INTEGER_8): INTEGER
      do
         Result := i |>> index
      end

   set_item (value: INTEGER; index: INTEGER_8) assign item
      do
         i := value |<< index
      ensure
         item(index) = value
      end

end
