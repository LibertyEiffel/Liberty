deferred class DOMAIN_GET_TEXT[E_]

inherit
   FILTER_GET_TEXT[E_, E_]

feature {}
   connect_to (filtered_: like filtered)
      require
         filtered_ /= Void
      do
         filtered := filtered_
         filtered.register_domain(text_domain)
      ensure
         filtered = filtered_
      end

feature {ANY}
   translation (message: STRING): E_
      do
         Result := filtered.domain_translation(text_domain, message)
      end

feature {FILTER_GET_TEXT}
   domain_translation (domain_name, message: STRING): like translation
      do
         Result := filtered.domain_translation(domain_name, message)
      end

feature {ANY}
   is_text_domain_set: BOOLEAN True

   is_text_domain_set_up (domain_name: STRING): BOOLEAN
      do
         Result := filtered.is_text_domain_set_up(domain_name)
      end

feature {ANY}
   text_domain_code_set (domain_name: like text_domain): STRING
      do
         Result := filtered.text_domain_code_set(domain_name)
      end

feature {}
   filtered: GET_TEXT[E_]

end -- class DOMAIN_GET_TEXT
