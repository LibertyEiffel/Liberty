class BAD_CLOSURE01

create {}
   make

feature {}
   make is
      local
         a: INTEGER
      do
         (
            agent is
               do
                  a := 5
               end
         ).call([])
      end

end -- class BAD_CLOSURE01
