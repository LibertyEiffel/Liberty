class LEVEL

create {ANY}
   make

feature {ANY}
   occupied_slot_count: INTEGER
      -- Total count of occupied places in the `Current' level.

   free_slot_count: INTEGER
         -- Total count of free places in the `Current' level.
      do
         Result := car_slots.count - occupied_slot_count
      end

   capacity: INTEGER
         -- Of the level.
      do
         Result := car_slots.count
      end

   is_full: BOOLEAN
         -- Is this level full?
      do
         Result := occupied_slot_count = capacity
      end

feature {ANY} -- Modifications:
   make (max_cars: INTEGER)
      require
         max_cars > 0
      do
         create car_slots.make(1, max_cars)
         occupied_slot_count := 0
      ensure
         occupied_slot_count = 0
      end

   arrival (car: CAR)
      require
         car /= Void
         not is_full
      local
         i: INTEGER
      do
         from
            i := car_slots.lower
         until
            car_slots.item(i) = Void
         loop
            i := i + 1
         end
         car_slots.put(car, i)
         occupied_slot_count := occupied_slot_count + 1
      ensure
         occupied_slot_count >= old occupied_slot_count + 1
      end

   departure (car_number: INTEGER; departure_time: DATE; hour_price: REAL): REAL
         -- Gives price to pay or -1 when car is not at this level.
      require
         car_number > 0
      local
         i: INTEGER; car: CAR
      do
         from
            i := car_slots.lower
         until
            car /= Void or else i > car_slots.upper
         loop
            car := car_slots.item(i)
            if car /= Void and then car.number /= car_number then
               car := Void
            end

            i := i + 1
         end
         if car = Void then
            Result := -1
         else
            Result := car.price(departure_time, hour_price)
            check
               car_slots.item(i - 1) = car
            end
            car_slots.put(Void, i - 1)
            occupied_slot_count := occupied_slot_count - 1
         end
      end

feature {}
   car_slots: ARRAY[CAR]
      -- Memory of occupied slots of this level.

invariant
   occupied_slot_count.in_range(0, capacity)
   free_slot_count.in_range(0, capacity)
   occupied_slot_count + free_slot_count = capacity

end -- class LEVEL
