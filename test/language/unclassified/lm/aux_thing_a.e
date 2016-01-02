class AUX_THING_A

inherit
   AUX_FRAME[REAL]
      rename
         make as frame_make
      redefine
         is_special
      end

create {ANY}
   make, frame_make

feature {ANY}
   make
      do
         io.put_string ("AUX_THING_A.make%N")
         frame_make
         upper := 4
      end

   is_special(i: INTEGER): BOOLEAN
      do
         Result := i = 1
      end
end

