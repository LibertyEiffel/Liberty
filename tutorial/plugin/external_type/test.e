class TEST

create {}
   make

feature {}
   make
      local
         uint: UNSIGNED_INT_WRAPPER
      do
         create uint.from_integer_64({INTEGER_64 42})
         io.put_string("The (unsigned) answer is: ")
         io.put_integer(uint.as_integer_64)
         io.put_new_line
      end

end -- class TEST
