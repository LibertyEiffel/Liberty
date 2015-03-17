class AUX_WJ01A0

create {ANY}
   make

feature {ANY}
   make (s: STRING)
      do
         x0 := s
         if x0 /= Void then
            x0 := s.twin
         end
      end

   x0: STRING

end -- class AUX_WJ01A0
