note
   test: "foo"

class TEST_INDEXING

create {}
   make

feature {}
   make
      note
         what: "the creation procedure"
      do
         check
            True
         note
            why: "why not?"
         end
      end

note
   end_of_class_note: "bar"

end -- class TEST_INDEXING
