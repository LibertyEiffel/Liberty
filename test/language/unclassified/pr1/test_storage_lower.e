class TEST_STORAGE_LOWER
   -- As of 2011-10-05 this test will run fine when compiled "plainly", i.e. with "compile test"
   -- When issuing "compile -boost test" or any other compiling flag it fails with something like:

   -- test1.c: In function ‘se_ms’:
   -- test1.c:3288:2: error: ‘T7’ has no member named ‘_storage_lower’
   -- test1.c: In function ‘se_string’:
   -- test1.c:3299:2: error: ‘T7’ has no member named ‘_storage_lower’

create {}
   make

feature {}
   make
         -- Testing
      do
         create a; create b; create c
         a.foo
         b.foo
         c.foo
      end

   a: A
   b: B
   c: C
end
