deferred class UNICODE_FROM_STRING_GET_TEXT
   -- Reads UNICODE_STRINGs from a catalog of UTF-8 encoded messages
   --

inherit
   FILTER_GET_TEXT[STRING, UNICODE_STRING]

feature {ANY}
   connect_to (filtered_: like filtered)
      require
         filtered_ /= Void
      do
         filtered := filter_domain_if_needed(filtered_)
      end

feature {ANY}
   translation (message: STRING): UNICODE_STRING
      local
         utf_8_string: STRING
      do
         utf_8_string := filtered.translation(message)
         Result := once U""
         if not Result.utf8_decode_from(utf_8_string) then
            not_yet_implemented
         end
      end

feature {FILTER_GET_TEXT}
   domain_translation (domain_name, message: STRING): like translation
      local
         utf_8_string: STRING
      do
         utf_8_string := filtered.domain_translation(domain_name, message)
         Result := once U""
         if not Result.utf8_decode_from(utf_8_string) then
            not_yet_implemented
         end
      end

feature {ANY}
   is_text_domain_set: BOOLEAN
      do
         Result := text_domain.is_equal(filtered.text_domain)
      end

   is_text_domain_set_up (domain_name: STRING): BOOLEAN
      local
         code_set: STRING
      do
         if filtered.is_text_domain_set_up(domain_name) then
            code_set := filtered.text_domain_code_set(domain_name)
            Result := code_set /= Void and then code_set.same_as("utf-8")
         end
      ensure
         Result implies filtered.text_domain_code_set(domain_name).same_as("utf-8")
      end

feature {ANY}
   text_domain_code_set (domain_name: like text_domain): STRING
      do
         Result := "UTF-32"
      end

feature {}
   filtered: GET_TEXT[STRING]

end -- class UNICODE_FROM_STRING_GET_TEXT
