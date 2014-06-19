class TEST_WOJ01
   -- From: Wolfgang Jansen <wolfgang@agnld.uni-potsdam.de>

create {}
   make

feature {ANY}
   make
      do
         create ref.make
         -- (1) Use refence types:
         def := ref
         def.set(-99)
         def := ref.twin
         -- (2) Use expanded types:

         create r_exp.set_item(exp)
         def.set(123)
         exp := exp.twin -- twin on a user expanded type !
      end

   def: AUX_WOJ01_DEF

   ref: AUX_WOJ01_REF

   exp: AUX_WOJ01_EXP

   r_exp: REFERENCE[AUX_WOJ01_EXP]

end -- class TEST_WOJ01
