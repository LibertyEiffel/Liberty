class EXAMPLE6
   --
   -- It is also possible to call infix operators as delayed calls.
   --

create {ANY}
   make

feature {ANY}
   make
      local
         delayed_code: FUNCTION[TUPLE[CHARACTER], BOOLEAN]
      do
         delayed_code := agent 'a' < ?
         print(delayed_code.item(['b']).to_string + "%N")
         delayed_code := agent {CHARACTER} < 'b'
         print(delayed_code.item(['a']).to_string + "%N")
      end

end -- class EXAMPLE6
