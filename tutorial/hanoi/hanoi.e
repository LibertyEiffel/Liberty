class HANOI
   --
   -- The classic Tower of Hanoi game.
   --
   -- Compile with:
   --    compile -o hanoi hanoi -boost
   -- Run with:
   --    hanoi
   --

insert
   ARGUMENTS
      redefine out_in_tagged_out_memory
      end

create {ANY}
   make

feature {}
   nb: INTEGER

   tower1, tower2, tower3: TOWER

feature {ANY}
   make
      do
         if argument_count = 0 then
            io.put_string("Number of disks: ")
            io.flush
            io.read_integer
            nb := io.last_integer
         elseif argument_count /= 1 then
            io.put_string("Usage: hanoi <NumberOfDiscus>%N")
            die_with_code(exit_failure_code)
         elseif argument(1).is_integer then
            nb := argument(1).to_integer.max(1)
         else
            io.put_string("hanoi: bad argument (not an integer)%N")
            die_with_code(exit_failure_code)
         end
         create tower1.full(nb)
         create tower2.empty(nb)
         create tower3.empty(nb)
         io.put_string("Situation at the beginning:%N")
         move(nb, tower1, tower2, tower3)
         io.put_string("Situation at the end:%N")
         print_on(io)
      end

   move (how_many: INTEGER; source, intermediate, destination: TOWER)
      local
         discus: INTEGER
      do
         if how_many > 0 then
            move(how_many - 1, source, destination, intermediate)
            print_on(io)
            discus := source.remove_discus
            destination.add_discus(discus)
            move(how_many - 1, intermediate, source, destination)
         end
      end

   out_in_tagged_out_memory
      local
         i: INTEGER
      do
         tagged_out_memory.extend('%N')
         from
            i := nb
         until
            i = 0
         loop
            tagged_out_memory.extend(' ')
            tower1.show_a_discus(i, tagged_out_memory)
            tagged_out_memory.extend(' ')
            tower2.show_a_discus(i, tagged_out_memory)
            tagged_out_memory.extend(' ')
            tower3.show_a_discus(i, tagged_out_memory)
            tagged_out_memory.extend('%N')
            i := i - 1
         end

         from
            i := (2 * (nb + 1) + 1) * 3 - 2
         until
            i = 0
         loop
            tagged_out_memory.extend('-')
            i := i - 1
         end

         tagged_out_memory.extend('%N')
      end

end -- class HANOI
