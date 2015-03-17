class TEST_FIXED_STRING

insert
   EIFFELTEST_TOOLS
   STRING_HANDLER

create {}
   make

feature {}
   make
      local
         fs: FIXED_STRING; s: STRING; p: POINTER
      do
         s := "foo"
         fs := s.intern
         assert(s.is_equal(fs))

         fs := "foobar".intern.substring(2, 4)
         assert(fs.is_shared)
         assert(fs.is_equal("oob"))
         assert(fs.out.is_equal("oob"))
         assert(fs.substring(1, 1).is_equal("o"))

         fs.unshare
         assert(not fs.is_shared)
         assert(fs.is_equal("oob"))
         assert(fs.out.is_equal("oob"))
         assert(fs.substring(1, 1).is_equal("o"))

         fs := "riri fifi loulou".intern.substring(6, 9)
         assert(fs.is_equal("fifi"))
         assert(fs.is_shared)
         p := fs.to_external
         assert(not fs.is_shared)
         create s.from_external(p) -- NOTE: don't do that in real code! you'll end up with a shared storage with a way to change a fixed string
         assert(s.is_equal("fifi"))
      end

end -- class TEST_FIXED_STRING
