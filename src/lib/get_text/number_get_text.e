deferred class NUMBER_GET_TEXT[E_]

inherit
   GET_TEXT[E_]

feature {ANY}
   number_translation (message_1, message_other: STRING; n: INTEGER): like translation
      require
         message_1.is_ascii
         n >= 0
         is_text_domain_set
         is_message_locale_set
         is_text_domain_set_up(text_domain)
      deferred
      ensure
         Result.is_equal(domain_number_translation(text_domain, message_1, message_other, n))
      end

feature {FILTER_GET_TEXT}
   domain_translation (domain_name, message: STRING): like translation
      deferred
      ensure
         Result.is_equal(domain_number_translation(domain_name, message, message, 1))
      end

   domain_number_translation (domain_name: STRING; message_1, message_other: STRING; n: INTEGER): like translation
      require
         message_1.is_ascii
         n >= 0
         is_message_locale_set
         is_text_domain_set_up(domain_name)
      deferred
      end

end -- class NUMBER_GET_TEXT
