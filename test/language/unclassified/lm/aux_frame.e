class AUX_FRAME[G]

create
   make

feature {ANY}
   make
      do
         io.put_string ("AUX_FRAME.make%N")
      end

   try_it: like Current
      do
         create Result.make  -- this is dynamically bound to the renamed version frame_make in the subclasses. This line only compiles if AUX_FRAME.make (or any renamed and/or redefined version of it) is a creation prcedure for all subclasses.
      end

   is_special(i: INTEGER) : BOOLEAN
      do
      end

   upper: INTEGER

end -- class FRAME

