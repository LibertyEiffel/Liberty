class PARKING_SIMULATOR
   --
   -- Main command-loop to simulate the PARKING example (compile and run this file).
   --

create {ANY}
   make

feature {}
   make
      local
         parking: PARKING; command: STRING; price: REAL; i, value: INTEGER; stop: BOOLEAN; split: ARRAY[STRING]
      do
         from
            create parking.make({ARRAY[LEVEL] 1, << create {LEVEL}.make(10), create {LEVEL}.make(8), create {LEVEL}.make(4) >> })
            io.put_string("%NParking simulator command loop.%N%N")
            io.put_string(help_text)
         until
            stop
         loop
            io.put_string(once "Type your command: ")
            io.flush
            io.read_line
            command := io.last_string.twin
            command.left_adjust
            command.right_adjust
            inspect
               command
            when "q", "Q", "quit" then
               stop := True
            when "a", "A" then
               value := parking.arrival
               if value > 0 then
                  io.put_string("Arrival of car #" + value.to_string + ".%N")
               else
                  io.put_string("No more places to park (no vacancy).%N")
               end
            when "?", "h", "help" then
               io.put_string(help_text)
            when "T" then
               parking.clock.display_on(io)
            when "c" then
               io.put_string("Number of cars in the parking: " + parking.occupied_slot_count.to_string + "%N")
            when "H" then
               io.put_string("Parking hour price: $" + parking.hour_price.to_string_format(3) + "%N")
            else
               split := command.split
               inspect
                  split.first
               when "l", "L" then
                  i := integer_from(split.last)
                  if error_flag then
                     error_flag := False
                  elseif i < parking.lower_level then
                     io.put_string("Level number too small.%N")
                  elseif i > parking.upper_level then
                     io.put_string("Level number too big.%N")
                  else
                     -- No error:
                     io.put_string("Number of cars in level " + i.to_string + ": " + parking.level_occupied_slot_count(i).to_string + "%N")
                  end
               when "t" then
                  i := integer_from(split.last)
                  if error_flag then
                     error_flag := False
                  elseif i <= 0 then
                     io.put_string("It is not a valid time (negative).%N")
                  else
                     -- No error:
                     parking.add_time(i)
                  end
               when "H" then
                  price := real_from(split.last)
                  if error_flag then
                     error_flag := False
                  elseif price <= 0 then
                     io.put_string("It is not a valid price.%N")
                  else
                     -- No error:
                     parking.set_hour_price(price)
                  end
               when "d" then
                  i := integer_from(split.last)
                  if error_flag then
                     error_flag := False
                  elseif i <= 0 then
                     io.put_string("Car number too small.%N")
                  else
                     -- No error:
                     price := parking.departure(i)
                     if price < 0 then
                        io.put_string("This car is probably outside of the parking.%N")
                     else
                        io.put_string("The price paid by this car is $" + price.to_string_format(2) + "%N")
                     end
                  end
               else
                  io.put_string("Unknown Command: %"" + command + "%"%N")
               end
            end
         end
         io.put_string("Bye.%N")
      end

   error_flag: BOOLEAN -- Used to signal an input error.

   integer_from (string: STRING): INTEGER
      require
         string /= Void
      do
         if string.is_integer then
            Result := string.to_integer
         else
            error_flag := True
            io.put_string("%"" + string + "%" is not an integer value.%N")
         end
      end

   real_from (string: STRING): REAL
      require
         string /= Void
      do
         if string.is_real then
            Result := string.to_real
         else
            error_flag := True
            io.put_string("%"" + string + "%" is not an real value.%N")
         end
      end

   help_text: STRING "{
            Commands:
            ------------------------------------
            ?        display this help
            q        Quit this simulator
            T        display current Time
            t <i>    add <i> minutes to the current time
            a        Arrival of a new car into the parking
            d <i>    Departure of the car number <i>
            l <i>    number of cars at Level <i>
            H [<x>]  display / change Hour parking price with <x>
            c        total Count of cars in the whole parking
            ------------------------------------

                         }"

end -- class PARKING_SIMULATOR
