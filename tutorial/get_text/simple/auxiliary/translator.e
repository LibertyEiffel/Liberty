class TRANSLATOR

inherit
   GNU_GET_TEXT
      rename init_in_current_working_directory as init
      end

create {ANY}
   init

feature {ANY}
   text_domain: STRING "simple_example"

end -- class TRANSLATOR
