class B

create {ANY}
   make

feature {ANY}
   s, s1: SIGNAL_1[INTEGER] --declare variable of SIGNAL type, never inherit form SIGNAL.

   j: INTEGER

feature {}
   make
      do
         create s.make
         create s1.make
      end

feature {ANY}
   test (counter: INTEGER)
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > counter
         loop
            s.emit(i)
            i := i + 1
         end
      end

   test_direct_0 (counter: INTEGER)
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > counter
         loop
            i := i + 1
         end
      end

   test_direct_1 (counter: INTEGER)
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > counter
         loop
            foo(i)
            i := i + 1
         end
      end

   test_direct_2 (counter: INTEGER)
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > counter
         loop
            foo(i)
            foo(i)
            i := i + 1
         end
      end

   test_direct_3 (counter: INTEGER)
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > counter
         loop
            foo(i)
            foo(i)
            foo(i)
            i := i + 1
         end
      end

   foo (k: INTEGER)
      do
         j := k + 1
      end

end -- class B
