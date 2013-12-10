class BAD_CLOSURE02

create {}
   make

feature {}
   make is
      local
         a: INTEGER
      do
         (
            agent is
               local
                  a: INTEGER
               do
                  a := 5
               end
         ).call([])
      end

end -- class BAD_CLOSURE02
