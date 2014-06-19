class CAR

create {PARKING}
   make

feature {ANY}
   number: INTEGER
      -- The number of the CAR.

   arrival_time: DATE
      -- Of this CAR in the parking.

   price (departure_time: DATE; hour_price: REAL): REAL
         -- Compute the price to pay according to `departure_time' and `hour_price'.
      require
         departure_time >= arrival_time
      local
         nb_min: TUPLE[INTEGER, INTEGER]
      do
         nb_min := arrival_time.day_night_to(departure_time)
         Result := (hour_price / 4 * nb_min.second + hour_price * nb_min.first) / 60
      end

feature {}
   make (n: like number; at: like arrival_time)
      require
         n > 0
         at /= Void
      do
         number := n
         arrival_time := at
      ensure
         number = n
         arrival_time = at
      end

end -- class CAR
