class TEST_WOJ03
   -- To complete TEST_WOJ01 (D.Colnet):
   -- From: Wolfgang Jansen <wolfgang@agnld.uni-potsdam.de>

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         string: STRING
      do
         create ref.make
         string := ref.s
         def := ref
         def.set(-99)
         assert(string /= ref.s)
         def := ref.twin
         assert(def /= ref)
      end

   def: AUX_WOJ01_DEF

   ref: AUX_WOJ01_REF

end -- class TEST_WOJ03
