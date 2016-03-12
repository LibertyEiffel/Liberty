class AUX_S2

inherit
   STRING
      redefine
         make_from_string
      end
   
create {ANY}
   make_from_string

feature {ANY}
   make_from_string(model: STRING)
      do
         io.put_line("AUX_S2.make_from_string")
         Precursor(model)
      end

end
