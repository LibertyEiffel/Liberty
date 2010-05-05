class TEST_WOJ03 -- To complete TEST_WOJ01 (D.Colnet):
-- From: Wolfgang Jansen <wolfgang@agnld.uni-potsdam.de>
creation make
	
feature
	
   make is
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
	
   assert(b: BOOLEAN) is
      do
			cpt := cpt + 1
			if not b then
				sedb_breakpoint
				std_output.put_string("TEST_WOJ03: ERROR Test # ")
				std_output.put_integer(cpt)
				std_output.put_string("%N")
			end;
      end;
   
   cpt: INTEGER
   
end
