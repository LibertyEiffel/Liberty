-----------------------------------------------------------------------------
note
   title       : "C Code Bug";
   cluster     : "";
   project     : "";
   copyright   : "";
   author      : "Philipp Niedermaier";
   original    : "08.12.99";
   version     : "1.0";
-----------------------------------------------------------------------------

class TEST_PN1
-- From: "Philipp Niedermaier" <pn@cpg.de>

create {}
   make

-----------------------------------------------------------------------------

feature {}

-----------------------------------------------------------------------------

   make
      local
         point_array:     ARRAY[AUX_PN1]
      do
         create point_array.make (0, 1)
         c_code_bug (point_array)
      end

-----------------------------------------------------------------------------

   c_code_bug (points_p:   ARRAY[AUX_PN1])
      local
         a:       REAL
      do
         if points_p.item (0).y < 0 then
            a := points_p.item (0).x
         elseif points_p.item (0).y < 0 then
            a := points_p.item (0).x
         end
      end -- c_code_bug

-----------------------------------------------------------------------------

end
