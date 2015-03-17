-- http://www.codinghorror.com/blog/2007/02/why-cant-programmers-program.html
class FIZZBUZZ

create {}
   make

feature {}
   make
      do
         (1|..|100).for_each(agent show(?))
      end

   show (i: INTEGER_8)
      do
         if i \\ 3 = 0 then
            if i \\ 5 = 0 then
               io.put_line("FizzBuzz")
            else
               io.put_line("Fizz")
            end
         elseif i \\ 5 = 0 then
            io.put_line("Buzz")
         else
            io.put_integer(i)
            io.put_new_line
         end
      end

end -- class FIZZBUZZ
