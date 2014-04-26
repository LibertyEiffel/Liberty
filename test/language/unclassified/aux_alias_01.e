class AUX_ALIAS_01

feature {ANY}
   i: INTEGER

   add alias "+" (n: INTEGER): like Current is
      do
         i := i + n
         Result := Current
      ensure
         i = old i + n
         Result = Current
      end

   minus alias "-" (n: INTEGER): like Current is
      do
         i := i - n
         Result := Current
      ensure
         i = old i - n
         Result = Current
      end

   neg alias "-": like Current is
      do
         i := -i
         Result := Current
      ensure
         i = -(old i)
         Result = Current
      end

end
