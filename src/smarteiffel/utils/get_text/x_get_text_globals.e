class X_GET_TEXT_GLOBALS

insert
   GLOBALS

feature {}
   messages: SET[HASHED_STRING]
      once
         create {HASHED_SET[HASHED_STRING]} Result.make
      end

   number_messages: DICTIONARY[STRING, HASHED_STRING]
      once
         create {HASHED_DICTIONARY[STRING, HASHED_STRING]} Result.make
      end

end -- class X_GET_TEXT_GLOBALS
