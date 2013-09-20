-- This file is part of Liberty Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_COMPLEX

insert
   EIFFELTEST_TOOLS
   COMPLEX_CONSTANTS
   PLATFORM

create {} make

feature {ANY}
   make is
         
      do
         a := a.one; b.set(-1.0, 0.0)
         ("i=#(1), i^1=#(2), i^2=#(3)%N" # &i # &(i^1) # &(i^2)).print_on(std_output)
         assert (i^1 = i)
         assert (i^2 = complex(-1.0,0.0)) --b)
         
         a.set(1.2, 1.1)
         b.set(1.2, 2.1)
         assert(a+i-i = a)
         assert(a+i = b)

         c.set(2.1, 3.3)
         d.set(3.1, 3.3)
         assert (b*c = complex(-4.41,8.37))
      
         create rnd.make
         10.times(agent test_random)
      rescue
         
      end

   rnd: PRESS_RANDOM_NUMBER_GENERATOR

   test_random is
      do
         a := random_complex(rnd)
         b := random_complex(rnd)
         c := random_complex(rnd)
         ("Testing with a="| &a | ", b=" | &b | ", c=" | &c|"%N").print_on(std_error);
         test_plus
         test_times
         test_plus_and_times
      end

   test_plus is
      local tmp1, tmp2: COMPLEX_64
      do
         label_assert ("C+0=c",   c + zero = c)
         label_assert ("c+d=d+c", (c+d) = (d+c))
         label_assert ("a+b+c=a+(b+c)", (a+b+c) ~= (a+(b+c)))
         tmp1 := a+b+c
         tmp2 := (a+(b+c))
         label_assert ("tmp1=tmp2",tmp1 ~= tmp2)
      end

   test_times is 
      do
         label_assert ("a*1=a",a*one = a)
         label_assert ("a*1~=a",(a*one) ~= a)
         label_assert ("c*d ~= d*c)", (c*d) ~= (d*c))
         label_assert ("a*b*c ~ a*(b*c)", (a*b*c) ~= (a*(b*c)))
      end

   test_plus_and_times is
      do
         label_assert ("(a+b)*c = a*c + b*c", ((a+b)*c) ~= (a*c + b*c))
      end

   a,b,c,d: COMPLEX_64

   random_complex (a_gen: RANDOM_NUMBER_GENERATOR): COMPLEX_64 is
      local re,im: REAL_64
      do
         a_gen.next; re := a_gen.last_real * 1000.0
         a_gen.next; im := a_gen.last_real * 1000.0
         Result.set(re,im)
      end

end -- class TEST_COMPLEX
