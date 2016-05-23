class KNIGHT
   --
   -- The classic KNIGHT problem on a N times N square chessboard. The knight have to pass on
   -- all places of the chessboard once a time. For instance, here is solution for a 7 X 7
   -- chessboard, knight starting at position <1,1>:
   --
   --            1   28   37   24    3   26   17
   --           36   39    2   27   18   11    4
   --           29   42   23   38   25   16    9
   --           40   35   30   19   10    5   12
   --           43   22   41   32   15    8   47
   --           34   31   20   45   48   13    6
   --           21   44   33   14    7   46   49
   --

insert
   ARGUMENTS
      redefine print_on
      end

create {ANY}
   make

feature {}
   make
      local
         size, line, column: INTEGER
      do
         if argument_count >= 1 and then argument(1).is_integer then
            size := argument(1).to_integer
         end
         if not size.in_range(chess_minimum, chess_maximum) then
            size := ask("Chess-board size: ", chess_minimum, chess_maximum)
         end

         if argument_count >= 2 and then argument(2).is_integer then
            line := argument(2).to_integer
         end

         if not line.in_range(1, size) then
            line := ask("Start line: ", 1, size)
         end

         if argument_count >= 3 and then argument(3).is_integer then
            column := argument(3).to_integer
         end

         if not column.in_range(1, size) then
            column := ask("Start column: ", 1, size)
         end

         knight(size, line, column)
      end

   chess_minimum: INTEGER 3

   chess_maximum: INTEGER 24

   chessboard: ARRAY2[INTEGER]

   nb_tries: INTEGER

   line_move: FAST_ARRAY[INTEGER]
      once
         Result := {FAST_ARRAY[INTEGER] << -2, -1, 1, 2, 2, 1, -1, -2 >> }
      end

   column_move: FAST_ARRAY[INTEGER]
      once
         Result := {FAST_ARRAY[INTEGER] << 1, 2, 2, 1, -1, -2, -2, -1 >> }
      end

   knight (size, line, column: INTEGER)
      require
         size >= 3
         1 <= line
         line <= size
         1 <= column
         column <= size
      do
         create chessboard.make(1, size, 1, size)
         chessboard.put(1, line, column)
         if solution(line, column) then
            Current.print_on(std_output)
         else
            io.put_string("Sorry, there is no solution.%N")
         end

         io.put_string("%NNumber of tries : ")
         io.put_integer(nb_tries)
         io.put_new_line
      end

   solution (line, column: INTEGER): BOOLEAN
      local
         value, i: INTEGER
      do
         if chessboard.count = chessboard.item(line, column) then
            Result := True
         else
            from
               i := line_move.lower
               value := chessboard.item(line, column)
            until
               Result or else i > line_move.upper
            loop
               Result := try(line + line_move.item(i), column + column_move.item(i), value)
               i := i + 1
            end
         end
      end

   try (line, column, value: INTEGER): BOOLEAN
         -- Try to place the knight by used cross back-tracking method.
      do
         nb_tries := nb_tries + 1
         if chessboard.valid_index(line, column) then
            if chessboard.item(line, column) = 0 then
               chessboard.put(value + 1, line, column)
               Result := solution(line, column)
               if not Result then
                  chessboard.put(0, line, column)
               end
            end
         end
      end

   ask (s: STRING; min, max: INTEGER): INTEGER
         -- Ask for question `s' until the answer is in range `min' `max'.
      local
         stop: BOOLEAN
      do
         from
         until
            stop
         loop
            io.put_string(s)
            io.flush
            io.read_integer
            Result := io.last_integer
            if Result < min then
               io.put_string("Value too small.%N")
            elseif max < Result then
               io.put_string("Value too big.%N")
            else
               stop := True
            end
         end
      end

feature {ANY}
   print_on (file: OUTPUT_STREAM)
         -- Display the chessboard.
      local
         line, column: INTEGER; separator: STRING
      do
         from
            create separator.make_filled(' ', 3 * chessboard.upper1 + 1)
            separator.fill_with('-')
            separator.extend('%N')
            file.put_string(separator)
            line := chessboard.lower1
         until
            line > chessboard.upper1
         loop
            from
               column := chessboard.lower2
            until
               column > chessboard.upper2
            loop
               if chessboard.item(line, column) < 10 then
                  file.put_string("| ")
               else
                  file.put_character('|')
               end
               file.put_integer(chessboard.item(line, column))
               column := column + 1
            end
            file.put_string("|%N")
            file.put_string(separator)
            line := line + 1
         end
      end

end -- class KNIGHT
