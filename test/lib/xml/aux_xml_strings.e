expanded class AUX_XML_STRINGS

feature {}
   string_twin (unicode: UNICODE_STRING): UNICODE_STRING
      do
         if string_pool.is_empty then
            Result := unicode.twin
         else
            Result := string_pool.item
            Result.copy(unicode)
         end
      end

   string_pool: RECYCLING_POOL[UNICODE_STRING]
      once
         create Result.make
      end

end -- class AUX_XML_STRINGS
