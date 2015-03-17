class PARKING

create {ANY}
   make

feature {ANY}
   lower_level: INTEGER
         -- The actual lowest level number.
      do
         Result := level_list.lower
      end

   upper_level: INTEGER
         -- The actual upper most level number.
      do
         Result := level_list.upper
      end

   hour_price: REAL
      -- The day time price to pay per hour.

   clock: DATE
      -- The parking `clock'.

   occupied_slot_count: INTEGER
         -- Total number of cars inside the parking.
      local
         i: INTEGER
      do
         from
            i := lower_level
         until
            i > upper_level
         loop
            Result := Result + level_occupied_slot_count(i)
            i := i + 1
         end
      end

   level_occupied_slot_count (level_number: INTEGER): INTEGER
         -- Total number of cars in the given `level_number'.
      require
         level_number.in_range(lower_level, upper_level)
      do
         Result := level_list.item(level_number).occupied_slot_count
      ensure
         Result >= 0
      end

feature {ANY} -- Modifications:
   arrival: INTEGER
         -- Arrival of a new car. The `Result' is the number of the new car or 0 when the parking is full.
      local
         i: INTEGER; car: CAR
      do
         from
            i := lower_level
         until
            i > upper_level or else not level_list.item(i).is_full
         loop
            i := i + 1
         end
         if i > upper_level or else level_list.item(i).is_full then
            Result := 0
         else
            last_car_number := last_car_number + 1
            create car.make(last_car_number, clock.twin)
            level_list.item(i).arrival(car)
            Result := last_car_number
         end
      ensure
         Result >= 0
      end

   departure (car: INTEGER): REAL
         -- Gives the price to pay or -1 when cannot be found in the parking.
      require
         car > 0
      local
         i: INTEGER; stop: BOOLEAN; c: like clock
      do
         from
            i := lower_level
            stop := level_list.count <= 0
            Result := -1
            c := clock.twin
         until
            stop
         loop
            Result := level_list.item(i).departure(car, c, hour_price)
            i := i + 1
            stop := Result >= 0 or i > upper_level
         end
      end

   add_time (incr: INTEGER)
      do
         clock.add_time(incr)
      end

   set_hour_price (hp: REAL)
      require
         hp >= 0
      do
         hour_price := hp
      ensure
         hour_price = hp
      end

feature {}
   default_hour_price: REAL 1.50

   make (ll: like level_list)
      require
         ll /= Void
      do
         sedb_breakpoint
         create clock.make(0, 360)
         hour_price := default_hour_price
         level_list := ll
      ensure
         hour_price = default_hour_price
         level_list = ll
         last_car_number = 0
      end

   level_list: ARRAY[LEVEL]

   last_car_number: INTEGER
      -- Used to give different numbers for cars.

invariant
   valid_price: hour_price >= 0
   clock /= Void
   last_car_number >= 0
   level_list /= Void

end -- class PARKING
