class NUMBER_GET_TEXT_DECLARATION

inherit
   ABSTRACT_GET_TEXT_DECLARATION

create {ANY}
   make

feature {ANY}
   make (singular_position_: like singular_position; plural_position_: like plural_position;
         declaration_type_: like declaration_type)
      do
         singular_position := singular_position_
         plural_position := plural_position_
         declaration_type := declaration_type_
      ensure
         singular_position = singular_position_
         plural_position = plural_position_
         declaration_type = declaration_type_
      end

   called (position: POSITION; arguments: EFFECTIVE_ARG_LIST; current_type: TYPE)
      local
         string, value: STRING; hashed_string: HASHED_STRING
         singular, plural: EXPRESSION
      do
         echo.put_string(once "number_get_text call found ")
         echo.put_position(position)
         echo.put_new_line
         singular := arguments.expression(singular_position)
         string := track_manifest_string(singular, current_type)
         if string /= Void then
            plural := arguments.expression(plural_position)
            string := track_manifest_string(plural, current_type)
            if string /= Void then
               hashed_string := string_aliaser.hashed_string(string)
               value := number_messages.reference_at(hashed_string)
               if value /= Void implies value.is_equal(string) then
                  number_messages.put(string, hashed_string)
               else
                  not_yet_implemented
               end
            end
         end
      end

feature {}
   singular_position, plural_position: INTEGER

end -- class NUMBER_GET_TEXT_DECLARATION
