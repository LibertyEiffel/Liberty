-- compilation command line: se c perl_example_1.e
class PERL_EXAMPLE_1

create {ANY}
   make

feature {}
   make
      local
         perl: PERL
      do
         create perl.make
         io.flush -- All buffered Eiffel text is written before perl is writing.
         perl.instruction(once "use strict;print(%"Hello!\n%");")
         perl.instruction(once "[
                                print("Perl code in verbatim mode, even % character is allowed!\n");
                                                                                            ]")

         if perl.existant_variable(once "a") then
            io.put_string(once "$a does already exist.%N")
         else
            io.put_string(once "$a does not exist.%N")
         end

         io.put_string(once "Declaring $a%N")
         perl.instruction(once "$a = undef;") -- 'my' should not be used...

         if perl.existant_variable(once "a") then
            io.put_string(once "$a does exist.%N")
            if perl.defined_variable(once "a") then
               io.put_string(once "$a is defined%N")
            else
               io.put_string(once "$a is 'undef'%N")
            end
         else
            io.put_string(once "$a does not exist.%N")
         end

         io.put_string(once "Setting $a to 3*8.%N")
         perl.instruction(once "$a = 3*8;")

         if perl.defined_variable(once "a") then
            io.put_string(once "$a is defined%N")
            io.put_string(once "$a = ")
            perl.read_variable(once "a")
            io.put_integer(perl.last_integer)
            io.put_new_line
         else
            io.put_string(once "$a is 'undef'%N")
         end

         io.put_string(once "Using expression allows to get the %
                            %result without using variable, so polluting the %
                            %perl variable name space is avoided.%N%
                            %2^10=")

         perl.expression(once "2**10+0")
         -- "+0" converts to int and don't ask me why 2**10 is not treated as integer by perl 
         -- interpreter
         
         io.put_integer(perl.last_integer)
         io.put_new_line
         perl.destroy
      end

end -- class PERL_EXAMPLE_1
