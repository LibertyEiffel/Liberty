class PARTIALLY_FILLED_STRING

inherit
   ABSTRACT_STRING
      redefine
         infix "#", out_in_tagged_out_memory
      end

create {ABSTRACT_STRING}
   from_string_and_arg

feature {ANY}
   infix "#" (a_argument: ABSTRACT_STRING): ABSTRACT_STRING
      do
         check
            not_filled: storage.count < storage.capacity
         end
         put_arg(a_argument)
         Result := Current
      ensure
         Result = Current
         storage.last = a_argument
      end

   out_in_tagged_out_memory
      local
         i, save_i, accu, state: INTEGER; c: CHARACTER
      do
         from
            i := template.lower
         until
            i > template.upper
         loop
            c := template.item(i)
            inspect
               state
            when 0 then
               if c = '#' then
                  state := 1
               else
                  tagged_out_memory.extend(c)
               end
            when 1 then
               if c = '(' then
                  save_i := i
                  state := 2
                  accu := 0
               elseif c = '#' then
                  tagged_out_memory.extend('#')
                  state := 0
               else
                  tagged_out_memory.extend('#')
                  i := i - 1
                  state := 0
               end
            when 2 then
               if c = ')' then
                  if not storage.valid_index(accu - 1) then
                     tagged_out_memory.extend('#')
                     tagged_out_memory.extend('(')
                     i := save_i
                  elseif storage.item(accu - 1) = Void then
                     tagged_out_memory.append(once "Void")
                  else
                     storage.item(accu - 1).out_in_tagged_out_memory
                  end
                  state := 0
               elseif c.is_digit then
                  accu := accu * 10 + c.decimal_value
               else
                  tagged_out_memory.extend('#')
                  tagged_out_memory.extend('(')
                  i := save_i
                  state := 0
               end
            end
            i := i + 1
         end
      end

   fill_tagged_out_memory
      do
         out_in_tagged_out_memory
      end

   count: INTEGER
      do
         Result := memory.count
      end

   item (a_index: INTEGER): CHARACTER
      do
         Result := memory.item(a_index)
      end

   substring (start_index, end_index: INTEGER): like Current
      do
         create Result.from_string_and_arg(once "#(1)", memory.substring(start_index, end_index))
      end

   occurrences (c: CHARACTER): INTEGER
      do
         Result := memory.occurrences(c)
      end

   copy (other: like Current)
      local
         i: INTEGER
      do
         from_string_and_arg(other.template, other.storage.first)
         from
            i := other.storage.lower + 1
         until
            i > other.storage.upper
         loop
            put_arg(other.storage.item(i))
            i := i + 1
         end
      end

feature {ANY}
   is_equal (other: ABSTRACT_STRING): BOOLEAN
      do
         Result := memory.is_equal(other)
      end

   hash_code: INTEGER
      do
         Result := memory.hash_code
      end

   same_as (other: ABSTRACT_STRING): BOOLEAN
      do
         Result := memory.same_as(other)
      end

   first: CHARACTER
      do
         Result := memory.first
      end

   last: CHARACTER
      do
         Result := memory.last
      end

   has, fast_has (c: CHARACTER): BOOLEAN
      do
         Result := memory.has(c)
      end

   index_of, fast_index_of (c: CHARACTER; start_index: INTEGER): INTEGER
      do
         Result := memory.index_of(c, start_index)
      end

   reverse_index_of, fast_reverse_index_of (c: CHARACTER; start_index: INTEGER): INTEGER
      do
         Result := memory.reverse_index_of(c, start_index)
      end

feature {ANY} -- Concatenation
   infix "&" (another: ABSTRACT_STRING): ABSTRACT_STRING
      do
         Result := Current | another
      end

feature {ANY} -- Iterating and other features
   intern: FIXED_STRING
      do
         Result := memory.intern
      end

feature {ANY} -- Interfacing with C string:
   to_external: POINTER
      do
         Result := memory.to_external
      end

feature {}
   put_arg (a_argument: ABSTRACT_STRING)
      do
         storage.add_last(a_argument)
         memory_ := Void
         debug
            debug_string := memory
         end
      ensure
         storage.last = a_argument
      end

feature {} -- Creation
   from_string_and_arg (a_string, a_argument: ABSTRACT_STRING)
      require
         a_string /= Void
         a_argument /= Void
      do
         template := a_string
         parse_template
         put_arg(a_argument)
      end

feature {}
   parse_template
      local
         i, accu, capacity, state: INTEGER; c: CHARACTER
      do
         from
            i := template.lower
         until
            i > template.upper
         loop
            c := template.item(i)
            inspect
               state
            when 0 then
               if c = '#' then
                  state := 1
               end
            when 1 then
               if c = '(' then
                  state := 2
                  accu := 0
               else
                  state := 0
               end
            when 2 then
               if c = ')' then
                  if capacity < accu then
                     capacity := accu
                  end
                  state := 0
               elseif c.is_digit then
                  accu := accu * 10 + c.decimal_value
               else
                  state := 0
               end
            end
            i := i + 1
         end
         if storage /= Void then
            storage.with_capacity(capacity)
         else
            create storage.with_capacity(capacity)
         end
      end

feature {ANY}
   recycle
      do
         memory_ := Void
         storage.clear_count
      end

feature {PARTIALLY_FILLED_STRING}
   template: ABSTRACT_STRING
   storage: FAST_ARRAY[ABSTRACT_STRING]

feature {}
   memory_, memory__: STRING

   memory: STRING
      do
         -- There is only one memory string ever created per PARTIALLY_FILLED_STRING.
         -- This feature ensures that by using two attributes:
         --  * `memory_' keeps the string when already calculated (set to Void when dirty)
         --  * `memory__' keeps the one and only ever created instance
         Result := memory_
         if Result = Void then
            lock_tagged_out
            tagged_out_memory.clear_count
            out_in_tagged_out_memory
            Result := memory__
            if Result = Void then
               Result := tagged_out_memory.twin
               memory__ := Result
            else
               Result := memory__
               Result.copy(tagged_out_memory)
            end
            unlock_tagged_out
            memory_ := Result
         end
      end

invariant
   storage /= Void

end -- class PARTIALLY_FILLED_STRING
