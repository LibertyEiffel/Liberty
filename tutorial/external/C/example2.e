class EXAMPLE2
   --
   -- How to use the Eiffel $ operator which can be used to pass the address of
   -- an Eiffel feature (to be called later from C).
   --
   -- To compile this file:
   --
   --       compile example2 c_glue2.c
   --
   -- You may also prefer:
   --
   --       gcc -c c_glue.c
   --       compile example2 c_glue2.o
   --

create {ANY}
   make

feature {ANY}
   make
      local
         v: INTEGER
      do
         -- When a C function need to write some attribute:
         io.put_string("Example #0%N")
         write_integer_attribute($integer_attribute)
         io.put_integer(integer_attribute)
         io.put_new_line
         -- Call back of `procedure_1':
         io.put_string("Example #1%N")
         call_back_1(Current, $procedure_1)
         -- Call back of `function_1':
         io.put_string("Example #2%N")
         io.put_integer(call_back_2(Current, $function_1))
         io.put_new_line
         -- Call back of `function_2':
         io.put_string("Example #3%N")
         io.put_integer(call_back_3(Current, $function_2, "Eiffel STRING%N"))
         io.put_new_line
         -- Call back of `function_3':
         io.put_string("Example #4%N")
         io.put_integer(call_back_4(Current, $function_3, "Eiffel STRIN"))
         io.put_new_line
         -- Call back of `routine5':
         io.put_string("Example #5%N")
         call_back_5(Current, $routine5)
         io.put_new_line
         -- Call back of `once_routine6':
         io.put_string("Example #6%N")
         call_back_6(Current, $once_routine6)
         call_back_6(Current, $once_routine6)
         call_back_6(Current, $once_routine6)
         call_back_6(Current, $once_routine6)
         check
            integer_attribute = 6
         end
         -- Call back of `once_routine7':
         io.put_string("Example #7%N")
         v := call_back_7(Current, $once_routine7)
         check
            v = 10
         end
         v := call_back_7(Current, $once_routine7)
         check
            v = 10
         end
         io.put_integer(v)
         io.put_new_line
         -- Call back of `once_routine8':
         io.put_string("Example #8%N")
         v := call_back_7(Current, $once_routine8)
         check
            v = 10
         end
         v := call_back_7(Current, $once_routine8)
         check
            v = 10
         end
         io.put_integer(v)
         io.put_new_line
      end

feature {ANY}
   integer_attribute: INTEGER

feature {}
   write_integer_attribute (integer_pointer: POINTER)
         -- (Corresponding C function defined in c_glue2.c)
      external "C"
      end

   procedure_1
         -- A procedure which only needs `Current'.
      do
         io.put_string("From `procedure_1' :%N")
         io.put_integer(integer_attribute)
         io.put_new_line
      end

   call_back_1 (c: like Current; a_routine: POINTER)
         -- (Corresponding C function defined in c_glue2.c)
      external "C"
      end

   function_1: INTEGER
         -- A function which only needs `Current'.
      do
         Result := integer_attribute + 1
      end

   call_back_2 (c: like Current; a_routine: POINTER): INTEGER
         -- (Corresponding C function defined in c_glue2.c)
      external "C"
      end

   function_2 (s: STRING): INTEGER
         -- A function which needs `Current' and a STRING as argument.
      require
         s.count > 0
      do
         io.put_string(s)
         Result := integer_attribute + s.count
      end

   call_back_3 (c: like Current; a_routine: POINTER; str: STRING): INTEGER
         -- (Corresponding C function defined in c_glue2.c)
      external "C"
      end

   function_3 (s: STRING; c: CHARACTER): INTEGER
         -- A function which needs two arguments.
      require
         s.count > 0
      do
         s.extend(c)
         s.extend('%N')
         io.put_string(s)
         Result := s.count
      end

   call_back_4 (c: like Current; a_routine: POINTER; str: STRING): INTEGER
         -- (Corresponding C function defined in c_glue2.c)
      external "C"
      end

   routine5 (other: like Current)
         -- A procedure.
      require
         other = Current
      do
         io.put_integer(integer_attribute + other.integer_attribute)
      end

   call_back_5 (c: like Current; a_routine: POINTER)
         -- (Corresponding C function defined in c_glue2.c)
      external "C"
      end

   once_routine6
      once
         integer_attribute := integer_attribute + 4
         io.put_string("Only once routine6.%N")
      end

   call_back_6 (c: like Current; a_routine: POINTER)
         -- (Corresponding C function defined in c_glue2.c)
      external "C"
      end

   once_routine7: INTEGER
      once
         Result := integer_attribute + 4
      end

   call_back_7 (c: like Current; a_routine: POINTER): INTEGER
         -- (Corresponding C function defined in c_glue2.c)
      external "C"
      end

   once_routine8: INTEGER
         -- Just to check that such a pre-computable once
         -- function causes no pain.
      once
         Result := 10
      end

end -- class EXAMPLE2
