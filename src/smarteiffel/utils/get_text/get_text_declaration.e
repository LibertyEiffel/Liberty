class GET_TEXT_DECLARATION

inherit
   ABSTRACT_GET_TEXT_DECLARATION

create {ANY}
   make

feature {ANY}
   make (message_position_: like message_position; declaration_type_: like declaration_type)
      do
         message_position := message_position_
         declaration_type := declaration_type_
      ensure
         message_position = message_position_
         declaration_type = declaration_type_
      end

   called (position: POSITION; arguments: EFFECTIVE_ARG_LIST; current_type: TYPE)
      local
         string: STRING; message: EXPRESSION
      do
         echo.put_string(once "get_text call found ")
         echo.put_position(position)
         echo.put_new_line
         message := arguments.expression(message_position)
         string := track_manifest_string(message, current_type)
         if string /= Void then
            messages.add(string_aliaser.hashed_string(string))
         end
      end

feature {}
   message_position: INTEGER

end -- class GET_TEXT_DECLARATION
