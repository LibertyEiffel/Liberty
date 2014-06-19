class TEST_WOJ02
   -- To complete TEST_WOJ01 (D.Colnet):
   -- From: Wolfgang Jansen <wolfgang@agnld.uni-potsdam.de>

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      do
         -- (2) Use expanded types:
         create r_exp.set_item(exp)
         assert(r_exp /= Void)
         --***       def := exp -- *** No more expanded into reference Dom Nov 18th 2004 ***
         --***       assert(def /= Void)
         --***       def.set(123)

         exp.set(4)
         assert(exp.n = 4)
         exp := exp.twin -- twin on a user expanded type !
         assert(exp.n = 4)
      end

   def: AUX_WOJ01_DEF

   exp: AUX_WOJ01_EXP

   r_exp: REFERENCE[AUX_WOJ01_EXP]

end -- class TEST_WOJ02
