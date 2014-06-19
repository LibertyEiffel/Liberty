--
-- Originally written by Cyril ADRIAN and Antony LE LABOUSSE
--
class SPREAD_ILLNESS
   -- To compile type command : compile SPREAD_ILLNESS make
   --
   -- Also try Optimised version adding options "-boost -O2"
   --

create {ANY}
   make

feature {}
   world1, world2: ARRAY2[INTEGER_8]

   empty: INTEGER_8 1

   healthy: INTEGER_8 0

   di: ARRAY[INTEGER_8]
      once
         Result := {ARRAY[INTEGER_8] 1, << -1, -1, -1, 0, 1, 1, 1, 0 >> }
      end

   dj: ARRAY[INTEGER_8]
      once
         Result := {ARRAY[INTEGER_8] 1, << -1, 0, 1, 1, 1, 0, -1, -1 >> }
      end

   error_msg: STRING "Error : do it again !%N"

   yes_or_no (question: STRING; default_answer: BOOLEAN): BOOLEAN
      do
         io.put_string(question)
         io.put_string(once "(y/n)? ")
         if default_answer then
            io.put_string(once "[y]")
         else
            io.put_string(once "[n]")
         end

         io.flush
         io.read_line
         io.last_string.to_lower
         if io.last_string.is_empty then
            Result := default_answer
         elseif io.last_string.first = 'y' then
            Result := True
         elseif io.last_string.first = 'n' then
         else
            Result := yes_or_no(question, default_answer)
         end
      end

feature {}
   make
         -- Try to spreads an illness through a set of people.
      local
         day: INTEGER; fed_up: BOOLEAN
      do
         from
            day := 1
            first_day
         until
            fed_up
         loop
            io.put_string(once "Day #")
            io.put_integer(day)
            io.put_new_line
            display
            fed_up := yes_or_no("Exit spread_illness", False)
            day := day + 1
            next_day
         end
      end

   first_day
         -- Create the world in the 1st day's state.
      local
         i, j: INTEGER; ill_state: INTEGER_8; ok: BOOLEAN
      do
         if yes_or_no("Default First World", True) then
            world1 := {ARRAY2[INTEGER_8] 1, 18, 1, 18, << 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                                                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 >> }
         else
            io.put_string(once "World size: ")
            io.flush
            io.read_integer
            create world1.make(1, io.last_integer, 1, io.last_integer)
            io.put_string(once "%Ne)mpty, i)ll with number of days, h)ealthy%N%N")
            from
               i := world1.lower1
            until
               i > world1.upper1
            loop
               from
                  j := world1.lower2
               until
                  j > world1.upper2
               loop
                  from
                     ok := False
                  until
                     ok
                  loop
                     io.put_string(once "State of [")
                     io.put_integer(i)
                     io.put_character(',')
                     io.put_integer(j)
                     io.put_string(once "] : ")
                     io.flush
                     io.read_word
                     inspect
                        io.last_string.first
                     when 'E', 'e' then
                        if io.last_string.count /= 1 then
                           io.put_string(error_msg)
                        else
                           world1.put(empty, i, j)
                           ok := True
                        end
                     when 'H', 'h' then
                        if io.last_string.count /= 1 then
                           io.put_string(error_msg)
                        else
                           world1.put(healthy, i, j)
                           ok := True
                        end
                     when 'I', 'i' then
                        ok := True
                        io.flush
                        io.read_integer
                        ill_state := io.last_integer.to_integer_8
                        ill_state := ill_state.max(1)
                        ill_state := ill_state.min(4)
                        world1.put(-ill_state, i, j)
                     else
                        io.put_string(error_msg)
                     end
                  end
                  j := j + 1
               end
               i := i + 1
            end
         end
         world2 := world1.twin
      end

   display
         -- Displays current `world2'.
      local
         i, j: INTEGER
      do
         io.put_string(once "+-")
         from
            i := world1.lower1
         until
            i > world1.upper1
         loop
            io.put_string(once "--")
            i := i + 1
         end

         io.put_string(once "+%N")
         from
            i := world1.lower1
         until
            i > world1.upper1
         loop
            io.put_string(once "| ")
            from
               j := world1.lower2
            until
               j > world1.upper2
            loop
               inspect
                  world2.item(i, j)
               when empty then
                  io.put_character(' ')
               when healthy then
                  io.put_character('O')
               else
                  io.put_character((-world2.item(i, j)).digit)
               end
               io.put_character(' ')
               j := j + 1
            end

            io.put_string(once "|%N")
            i := i + 1
         end

         io.put_string(once "+-")
         from
            i := world1.lower1
         until
            i > world1.upper1
         loop
            io.put_string(once "--")
            i := i + 1
         end

         io.put_string(once "+%N")
      end

   next_day
         -- `world1' and `world2' are swapped.
      local
         i, j: INTEGER
      do
         world1.copy(world2)
         from
            i := world1.lower1
         until
            i > world1.upper1
         loop
            from
               j := world1.lower2
            until
               j > world1.upper2
            loop
               inspect
                  world1.item(i, j)
               when empty then
               when healthy then
                  spread(i, j)
               else
                  cure_or_die(i, j)
               end
               j := j + 1
            end
            i := i + 1
         end
      end

feature {}
   cure_or_die (i, j: INTEGER)
         -- When ill, inspects if must be death or more ill or cured.
      do
         inspect
            -world1.item(i, j)
         when 1 then
            world2.put(-2, i, j)
         when 2 then
            die(i, j)
         when 3 then
            world2.put(-4, i, j)
         when 4 then
            world2.put(healthy, i, j)
         end
      end

   die (i, j: INTEGER)
         -- When two days ill, dies or more ill ?
      local
         d, k: INTEGER
      do
         from
            d := 1
         variant
            9 - d
         until
            d > 8
         loop
            if v(i + di.item(d), j + dj.item(d)) <= -2 then
               k := k + 1
            end
            d := d + 1
         end
         if k >= 4 then
            world2.put(empty, i, j)
         else
            world2.put(-3, i, j)
         end
      end

   spread (i, j: INTEGER)
         -- spread the illness ?
      local
         d: INTEGER
      do
         from
            d := 1
         variant
            10 - d
         until
            d = 9
         loop
            if ill(i + di @ d, j + dj @ d) then
               world2.put(-1, i, j)
               d := 9
            else
               d := d + 1
            end
         end
      end

   ill (i, j: INTEGER): BOOLEAN
         -- Is there someone is ill at `i', `j'.
      do
         Result := v(i, j) < 0
      end

   v (i, j: INTEGER): INTEGER
         -- Gives `empty' when out of range or the
         -- value in `world1'
      do
         if world1.lower1 <= i and then i <= world1.upper1 and (world1.lower2 <= j and then j <= world1.upper2) then
            Result := world1.item(i, j)
         else
            Result := empty
         end
      end

end -- class SPREAD_ILLNESS
