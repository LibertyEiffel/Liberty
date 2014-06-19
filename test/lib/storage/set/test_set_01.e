class TEST_SET_01

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         avl: AVL_SET[INTEGER]
         i: ITERATOR[INTEGER]
      do
         create avl.make
         avl.add(1)
         avl.add(5)
         avl.add(2)
         avl.add(3)

         i := avl.new_iterator
         assert(i.item = 1)
         i.next
         assert(i.item = 2)
         i.next
         assert(i.item = 3)
         i.next
         assert(i.item = 5)
         i.next
         assert(i.is_off)
      end

end
