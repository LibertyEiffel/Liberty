class AUX_DEEP_TWIN
-- helper for TEST_DEEP_TWIN
   
create {ANY}
   make

feature {ANY}
   make(str: STRING) is
      do
         item := str
      end

   item: STRING

end -- AUX_DEEP_TWIN
