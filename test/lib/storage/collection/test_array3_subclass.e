class TEST_ARRAY3_SUBCLASS
-- similar test for ARRAY3 subclassing to ticket #44278:
-- https://savannah.gnu.org/bugs/index.php?44278

inherit
   EIFFELTEST_TOOLS
   
create {ANY}
	make
-------------------------------------------------------------------------------
feature {ANY} -- Public features

	a3sub: AUX_ARRAY3[INTEGER]
	a3: ARRAY3[INTEGER]
	make is
		do
			create a3sub.makea3(1,2,1,2,1,2)
         a3sub.put(1,1,1,1)
         a3sub.put(2,1,1,2)
         a3sub.put(3,1,2,1)
         a3sub.put(4,1,2,2)
         a3sub.put(5,2,1,1)
         a3sub.put(6,2,1,2)
         a3sub.put(7,2,2,1)
         a3sub.put(8,2,2,2)

         a3 := a3sub

         label_assert("correct dynamic type", a3sub ?:= a3.sub_collection3(1,1,1,1,1,1))

         label_assert("correct content 1", a3.item(1, 1, 1) = 1)
         label_assert("correct content 2", a3.item(1, 1, 2) = 2)
         label_assert("correct content 3", a3.item(1, 2, 1) = 3)
         label_assert("correct content 4", a3.item(1, 2, 2) = 4)
         label_assert("correct content 5", a3.item(2, 1, 1) = 5)
         label_assert("correct content 6", a3.item(2, 1, 2) = 6)
         label_assert("correct content 7", a3.item(2, 2, 1) = 7)
         label_assert("correct content 8", a3.item(2, 2, 2) = 8)

		end
	
-------------------------------------------------------------------------------
end -- class TEST_ARRAY3_SUBCLASS
