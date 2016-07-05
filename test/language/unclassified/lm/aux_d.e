class AUX_D

inherit
   AUX_A [INTEGER]

create {ANY}
   make

-------------------------------------------------------------------------------
feature {ANY}     -- Public features

   make is
      do
         array_make(0, 3)
      end
   
   
-------------------------------------------------------------------------------
end         -- class AUX_D
