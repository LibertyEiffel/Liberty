class TEST_ARRAY2_SUBCLASS
-- similar test for ARRAY2 subclassing to ticket #44278:
-- https://savannah.gnu.org/bugs/index.php?44278

inherit
   EIFFELTEST_TOOLS
   
create {ANY}
	make
-------------------------------------------------------------------------------
feature {ANY}		-- Public features

	a2sub: AUX_ARRAY2[INTEGER]
	a2: ARRAY2[INTEGER]
	make is
		do
			create a2sub.makea2(1,2,1,2)
         a2sub.put(1,1,1)
         a2sub.put(2,1,2)
         a2sub.put(3,2,1)
         a2sub.put(4,2,2)

         a2 := a2sub

         label_assert("correct dynamic type", a2sub ?:= a2.sub_collection2(1,1,1,1))

         label_assert("correct content 1", a2.item(1, 1) = 1)
         label_assert("correct content 2", a2.item(1, 2) = 2)
         label_assert("correct content 3", a2.item(2, 1) = 3)
         label_assert("correct content 4", a2.item(2, 2) = 4)

		end
	
-------------------------------------------------------------------------------
end -- class TEST_ARRAY2_SUBCLASS
