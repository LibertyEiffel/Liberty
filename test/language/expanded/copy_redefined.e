expanded class COPY_REDEFINED
   -- An expanded class that redefines copy feature

insert
   ANY
      redefine copy
      end

feature {ANY}
   value: INTEGER

   set (a_value: INTEGER)
      do
         value := a_value
      end

   copy (another: like Current)
      do
         value := another.value + 1
      ensure then
         definition: value = another.value + 1
      end

end -- class COPY_REDEFINED
