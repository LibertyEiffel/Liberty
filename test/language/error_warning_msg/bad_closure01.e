class BAD_CLOSURE01

create {}
   make

feature {}
   make
      local
         a: INTEGER
      do
         (
            agent
               do
                  a := 5
               end
         ).call([])
      end

end -- class BAD_CLOSURE01
