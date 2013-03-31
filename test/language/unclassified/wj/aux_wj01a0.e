class AUX_WJ01A0
creation make
feature
   make (s: STRING) is
      do
         x0 := s
         if x0 /= Void then
            x0 := s.twin
         end
      end
  x0: STRING;
end 
