deferred class FILTER_GET_TEXT[I_, O_]

inherit
   GET_TEXT[O_]

feature {ANY}
   message_locale: STRING
      do
         Result := filtered.message_locale
      end

   is_message_locale_set: BOOLEAN
      do
         Result := filtered.is_message_locale_set
      end

feature {FILTER_GET_TEXT}
   register_domain (domain_name: STRING)
      do
         filtered.register_domain(domain_name)
      end

feature {}
   filtered: GET_TEXT[I_]
      deferred
      ensure
         Result /= Void
      end

   filter_domain_if_needed (filtered_: like filtered): like filtered
         -- Return `filtered_' wrapped, if necessary, in a DYNAMIC_DOMAIN_GET_TEXT.
      require
         filtered_ /= Void
      do
         if filtered_.text_domain.is_equal(text_domain) then
            Result := filtered_
         else
            create {DYNAMIC_DOMAIN_GET_TEXT[I_]} Result.make(text_domain, filtered_)
         end
      ensure
         Result /= Void
         Result.text_domain.is_equal(text_domain)
         filtered_.text_domain.is_equal(text_domain) implies Result = filtered_
      end

end -- class FILTER_GET_TEXT
