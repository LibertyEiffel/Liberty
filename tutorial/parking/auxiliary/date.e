class DATE
   --
   -- Special DATE class to fit with the PARKING example.
   --

create {ANY}
   make

feature {ANY}
   display_on (stream: OUTPUT_STREAM)
         -- To display `Current' on `stream'.
      local
         hour, m: INTEGER
      do
         if day > 0 then
            stream.put_string("day:")
            stream.put_integer(day)
            stream.put_character(' ')
         end
         m := min
         hour := m // 60
         m := m \\ 60
         stream.put_string("hour:")
         stream.put_integer(hour)
         stream.put_string(" minute:")
         stream.put_integer(m)
         if day_time then
            stream.put_string(" (day time)%N")
         else
            stream.put_string(" (night time)%N")
         end
      end

   minutes_to (after: DATE): INTEGER
         -- Count of minutes to go to `after'.
      require
         after >= Current
      do
         Result := (after.day - day) * 24 * 60 + (after.min - min)
      ensure
         Result >= 0
      end

   day_night_to (d2: DATE): TUPLE[INTEGER, INTEGER]
         --The `Result' is a couple of INTEGER where:
         --    Result.first: Night time.
         --    Result.second: Day time.
      require
         d2 >= Current
      local
         min_jour, min_nuit, save_day, save_min: INTEGER
      do
         save_day := day
         save_min := min
         from
         until
            Current.is_equal(d2)
         loop
            if day_time then
               min_jour := min_jour + 1
            else
               min_nuit := min_nuit + 1
            end
            add_time(1)
         end

         day := save_day
         min := save_min
         Result := [min_jour, min_nuit]
      ensure
         Result.first + Result.second = minutes_to(d2)
      end

   infix ">=" (d2: like Current): BOOLEAN
      require
         d2 /= Void
      do
         if day > d2.day then
            Result := True
         elseif day = d2.day then
            Result := min >= d2.min
         end
      end

   day_time: BOOLEAN
         -- Is it Sunny ?
      do
         Result := min >= 6 * 60 and min <= 22 * 60
      end

   nigth_time: BOOLEAN
         -- Is it the night ?
      do
         Result := not day_time
      end

feature {ANY} -- Modifications:
   make (vday, vmin: INTEGER)
      do
         day := vday
         min := vmin
      ensure
         day = vday
         min = vmin
      end

   add_time (nb_min: INTEGER)
      do
         min := min + nb_min
         if min >= 24 * 60 then
            day := day + min // (24 * 60)
            min := min \\ (24 * 60)
         end
      end

feature {DATE}
   day, min: INTEGER -- (No `hour' attribute because the number of hours is in `min' value.)

invariant
   day >= 0
   min.in_range(0, 24 * 60 - 1)

end -- class DATE
