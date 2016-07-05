class TEST_LM1
-- test provide by Laurie Moye, in ticket #44278:
-- https://savannah.gnu.org/bugs/index.php?44278

create {ANY}
   run
-------------------------------------------------------------------------------
feature {ANY}     -- Public features

   d_thing: AUX_D
   
   run is
      do
         create d_thing.make
      end
   
   
-------------------------------------------------------------------------------
end         -- class TEST_LM1
