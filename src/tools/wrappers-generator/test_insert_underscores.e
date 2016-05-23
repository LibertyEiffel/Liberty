class TEST_INSERT_UNDERSCORES

insert
   NAME_CONVERTER

create {ANY}
   test

feature {ANY}
   test
    local s: STRING
      do
         s:="CamelCase"
         insert_underscores(s)
         check
             s ~ "Camel_Case"
         end

         s:="Camel_Case"
         insert_underscores(s)
         check 
             s ~ "Camel_Case"
         end

         s := "IOChannel"
         insert_underscores(s)
         check
            s ~ "IOChannel"
         end
      end

end -- class TEST_INSERT_UNDERSCORES
