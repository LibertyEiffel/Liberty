class DYNAMIC_DOMAIN_GET_TEXT[E_]

inherit
   DOMAIN_GET_TEXT[E_]

create {FILTER_GET_TEXT}
   make

feature {}
   make (domain_name: STRING; filtered_: like filtered)
      do
         text_domain := domain_name
         connect_to(filtered_)
      end

feature {ANY}
   text_domain: STRING

end -- class DYNAMIC_DOMAIN_GET_TEXT
