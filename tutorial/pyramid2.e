class PYRAMID2
   --
   -- Run faster than pyramid.e
   --

insert
   ARGUMENTS
      redefine print_on
      end

create {ANY}
   make

feature {}
   pyramid: ARRAY2[INTEGER]

   used: ARRAY[BOOLEAN] -- Already used numbers in `pyramid'.

   make
      local
         size: INTEGER
      do
         if argument_count = 0 then
            io.put_string("Size of the pyramid %
                          % (a small number greater than 1) : ")
            io.flush
            io.read_integer
            io.put_new_line
            size := io.last_integer
         else
            size := argument(1).to_integer
         end
         io.put_string("I am working...%N")
         fill(size)
      end

   fill (size: INTEGER)
         -- Fill in a `pyramid' of `size' elements.
      require
         size > 1
      do
         create used.make(1, (size + 1) * size // 2)
         create pyramid.make(1, size, 1, size)
         if solution(1) then
            print_on(std_output)
         else
            io.put_string("Sorry I can't find a solution.%N")
         end
      end

   put (value, line, column: INTEGER)
         -- Update `pyramid' and `used'.
      do
         used.put(True, value)
         pyramid.put(value, line, column)
      end

   remove (line, column: INTEGER)
         -- Update `pyramid' and `used'.
      do
         if pyramid.item(line, column) /= 0 then
            used.put(False, pyramid.item(line, column))
            pyramid.put(0, line, column)
         end
      end

   solution (column: INTEGER): BOOLEAN
         -- Search a solution using a back-tracking algorithm.
      local
         nb, i: INTEGER
      do
         if column > pyramid.upper1 then
            Result := True
         else
            from
               nb := used.upper
            until
               Result or nb = 0
            loop
               if not used.item(nb) then
                  Result := fill_column(column, nb)
               end
               if not Result then
                  from
                     i := pyramid.lower1
                  until
                     pyramid.item(i, column) = 0 or else i > pyramid.upper1
                  loop
                     remove(i, column)
                     i := i + 1
                  end
               end

               nb := nb - 1
            end
         end
      end

   fill_column (col, val: INTEGER): BOOLEAN
      local
         v, i: INTEGER
      do
         from
            i := 2
            put(val, 1, col)
         until
            i > col or Result
         loop
            v := (pyramid.item(i - 1, col - 1) - pyramid.item(i - 1, col)).abs
            if used.item(v) then
               Result := True
            else
               put(v, i, col)
               i := i + 1
            end
         end
         if Result then
            from
            until
               i < used.lower
            loop
               remove(i, col)
               i := i - 1
            end
            Result := False
         else
            Result := solution(col + 1)
         end
      end

feature {ANY}
   print_on (file: OUTPUT_STREAM)
         -- Display the pyramid to the standard output.
      local
         line, column: INTEGER; blanks: STRING
      do
         from
            file.put_string("%NSolution found : %N")
            line := pyramid.lower1
            create blanks.make(0)
         until
            line > pyramid.upper1
         loop
            file.put_string(blanks)
            from
               column := pyramid.lower2
            until
               column > pyramid.upper2
            loop
               if pyramid.item(line, column) /= 0 then
                  file.put_integer(pyramid.item(line, column))
                  file.put_string(" ")
               end
               column := column + 1
            end

            file.put_new_line
            line := line + 1
            blanks.add_last(' ')
         end
      end

end -- class PYRAMID2
