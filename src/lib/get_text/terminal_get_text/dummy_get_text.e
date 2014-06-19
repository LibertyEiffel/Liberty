deferred class DUMMY_GET_TEXT

inherit
   NUMBER_GET_TEXT[STRING]
   TERMINAL_GET_TEXT[STRING]

feature {ANY}
   translation (message: STRING): STRING
      do
         Result := message
      end

   number_translation (message_1, message_other: STRING; n: INTEGER): like translation
      do
         if n = 1 then
            Result := message_1
         else
            Result := message_other
         end
      end

feature {FILTER_GET_TEXT}
   domain_translation (domain_name, message: STRING): like translation
      do
         Result := translation(message)
      end

   domain_number_translation (domain_name: STRING; message_1, message_other: STRING; n: INTEGER): like translation
      do
         Result := number_translation(message_1, message_other, n)
      end

   register_domain (domain_name: STRING)
      do
      end

feature {ANY}
   set_environment_variable (variable, value: STRING)
      local
         system: SYSTEM
      do
         system.set_environment_variable(variable, value)
      end

feature {ANY}
   set_message_locale (locale_name: like message_locale)
      do
         if message_locale = Void then
            message_locale := locale_name.twin
         else
            message_locale.copy(locale_name)
         end
      end

   set_default_message_locale
      do
         if message_locale = Void then
            message_locale := ""
         else
            message_locale.clear_count
         end
         message_locale.extend('c')
      end

   message_locale: STRING

   is_message_locale_set: BOOLEAN
      do
         Result := message_locale /= Void
      end

feature {ANY}
   is_text_domain_set: BOOLEAN
      do
         Result := text_domain /= Void and then not text_domain.is_empty
      end

   is_text_domain_set_up (domain_name: STRING): BOOLEAN
      do
         Result := True
      ensure
         Result
      end

feature {ANY}
   bind_text_domain_code_set (domain_name: like text_domain; code_set: like text_domain_code_set)
      do
         text_domain_code_sets.put(code_set, domain_name)
      end

   text_domain_code_set (domain_name: like text_domain): STRING
      do
         Result := text_domain_code_sets.reference_at(domain_name)
      end

feature {}
   text_domain_code_sets: DICTIONARY[like text_domain_code_set, like text_domain]

end -- class DUMMY_GET_TEXT
