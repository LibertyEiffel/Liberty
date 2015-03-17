class TOWER

create {ANY}
   full, empty

feature {}
   t: ARRAY[INTEGER]

   top: INTEGER

feature {}
   full (n: INTEGER)
      require
         n >= 1
      local
         i: INTEGER
      do
         create t.make(1, n)
         from
            i := n
         until
            i = 0
         loop
            t.put(n - i + 1, i)
            i := i - 1
         end

         top := n
      ensure
         nb = n
         top = nb
         t.item(top) = 1
      end

   empty (n: INTEGER)
      require
         n >= 1
      do
         create t.make(1, n)
         top := 1
      ensure
         nb = n
         top = 1
      end

feature {HANOI}
   nb: INTEGER
      do
         Result := t.upper
      end

   show_a_discus (d: INTEGER; picture: STRING)
      require
         1 <= d
         d <= nb
         picture /= Void
      local
         nb_of_free_slots, nb_of_used_slots, i: INTEGER
      do
         nb_of_used_slots := t.item(d)
         nb_of_free_slots := nb - nb_of_used_slots
         from
            i := nb_of_free_slots
         until
            i = 0
         loop
            picture.extend(' ')
            i := i - 1
         end

         from
            i := nb_of_used_slots
         until
            i = 0
         loop
            picture.extend('=')
            i := i - 1
         end

         picture.extend('|')
         from
            i := nb_of_used_slots
         until
            i = 0
         loop
            picture.extend('=')
            i := i - 1
         end

         from
            i := nb_of_free_slots
         until
            i = 0
         loop
            picture.extend(' ')
            i := i - 1
         end
      end

   remove_discus: INTEGER
      do
         debug
            if t.item(top) = 0 then
               std_error.put_string("Error in 'remove_discus'.%N")
               crash
            end
         end
         Result := t.item(top)
         t.put(0, top)
         if top > 1 then
            top := top - 1
         end
      ensure
         top >= 1
      end

   add_discus (d: INTEGER)
      do
         debug
            if top = nb then
               std_error.put_string("Error in 'add_discus', %
                                    %the tower was already full.%N")
               crash
            end
            if d > t.item(top) then
               --	       std_error.put_string("Error in 'add_discus', the %
               --				    %discus you wanted to put is larger %
               --				    %than allowed.");
               --	       crash;
            end
         end
         if t.item(top) > d then
            top := top + 1
            t.put(d, top)
         end

         if t.item(top) = 0 then
            t.put(d, top)
         end
      ensure
         top <= nb
      end

end -- class TOWER
