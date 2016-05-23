-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MUTABLE_BIG_INTEGER
   --
   -- A class used to represent multiprecision integers that makes efficient use of allocated space
   -- by allowing a number to occupy only part of an array so that the arrays do not have to be
   -- reallocated as often. When performing an operation with many iterations the array used to
   -- hold a number is only reallocated when necessary and does not have to be the same size as
   -- the number it represents. A mutable number allows calculations to occur on the same number
   -- without having to create a new number for every step of the calculation as it occurs with
   -- NUMBERs.
   --

inherit
   HASHABLE
      redefine copy, fill_tagged_out_memory, out_in_tagged_out_memory
      end
   COMPARABLE
      redefine copy, fill_tagged_out_memory, out_in_tagged_out_memory, is_equal
      end

insert
   PLATFORM
      redefine copy, fill_tagged_out_memory, out_in_tagged_out_memory, is_equal
      end

create {ANY}
   from_integer, from_integer_64, from_string, copy

feature {ANY} -- Creation / initialization from INTEGER_32 or INTEGER_64:
   from_integer (value: INTEGER)
         -- Create or initialize `Current' using `value' as an initializer.
      do
         if capacity = 0 then
            storage := storage.calloc(4)
            capacity := 4
         end
         offset := 0
         if value > 0 then
            negative := False
            put(value, 0)
            integer_length := 1
         elseif value < 0 then
            negative := True
            put(#-value, 0)
            integer_length := 1
         else
            check
               value = 0
            end
            set_with_zero
         end
      ensure
         to_integer_32 = value
      end

   is_integer_32: BOOLEAN
         -- Does `Current' fit on an INTEGER_32?
      do
         if integer_length = 0 then
            Result := True
         elseif integer_length = 1 then
            if item(offset) > 0 then
               Result := True
            elseif negative then
               Result := item(offset) = 0x80000000
            end
         end
      ensure
         Result implies is_integer_64
         Result implies integer_length <= 1
      end

   to_integer_32: INTEGER
         -- Convert `Current' as a 32 bit INTEGER.
      require
         is_integer_32
      do
         if integer_length > 0 then
            Result := item(offset)
            if negative then
               Result := #-Result
            end
         end
      end

   from_integer_64 (value: INTEGER_64)
         -- Create or set `Current' using `value' as an initializer.
      local
         v32: INTEGER
      do
         if capacity < 2 then
            storage := storage.calloc(4)
            capacity := 4
         end
         if value > 0 then
            negative := False
            put(value.low_32, 0)
            offset := 0
            v32 := value.high_32
            if v32 = 0 then
               integer_length := 1
            else
               put(v32, 1)
               integer_length := 2
            end
         elseif value < 0 then
            negative := True
            put((#-value).low_32, 0)
            offset := 0
            v32 := (#-value).high_32
            if v32 = 0 then
               integer_length := 1
            else
               put(v32, 1)
               integer_length := 2
            end
         else
            check
               value = 0
            end
            set_with_zero
         end
      ensure
         to_integer_64 = value
      end

   is_integer_64: BOOLEAN
         -- Does `Current' fit on an INTEGER_64?
      do
         if integer_length <= 1 then
            Result := True
         elseif integer_length = 2 then
            if negative then
               if item(offset + 1) > 0 then
                  Result := True
               elseif item(offset) = 0 then
                  Result := item(offset + 1) = 0x80000000
               end
            else
               Result := item(offset + 1) > 0
            end
         end
      ensure
         not Result implies not is_integer_32
         Result implies integer_length <= 2
      end

   to_integer_64: INTEGER_64
         -- Convert `Current' as a INTEGER_64.
      require
         is_integer_64
      local
         v: INTEGER_64
      do
         inspect
            integer_length
         when 0 then
         when 1 then
            Result := unsigned_32_to_integer_64(item(offset))
            if negative then
               Result := -Result
            end
         when 2 then
            Result := unsigned_32_to_integer_64(item(offset))
            v := item(offset + 1)
            v := v.bit_shift_left(32)
            Result := Result.bit_xor(v)
            if negative then
               Result := #-Result
            end
         end
      end

feature {ANY} -- Creation / initialization from STRING:
   from_string (str: STRING)
         -- Create or initialize `Current' using `value' as an
         -- initializer. (value = [-][0-9]^+)
      local
         i: INTEGER; cc: CHARACTER; neg: BOOLEAN; ten: like Current
      do
         --|*** This feature should be improved one day... (Vincent Croizier, 25/12/2004)
         create ten.from_integer(10)
         from
            i := 1
         variant
            str.count - i
         until
            not str.item(i).is_separator
         loop
            i := i + 1
         end
         cc := str.item(i)
         i := i + 1
         if cc = '+' then
            cc := str.item(i)
            i := i + 1
         elseif cc = '-' then
            neg := True
            cc := str.item(i)
            i := i + 1
         end
         check
            cc.is_digit
         end
         from_integer(cc.value)
         from
         variant
            str.count - i
         until
            i > str.count
         loop
            cc := str.item(i)
            if cc.is_digit then
               multiply(ten)
               add_integer(cc.value)
            else
               check
                  cc.is_separator
               end
               i := str.count -- terminate the loop
            end
            i := i + 1
         end
         if neg then
            negate
         end
      end

feature {ANY} -- Conversion tool
   force_to_real_64: REAL_64
         -- only a tool
         -- unsigned conversion *** require ou changer export ? *** (Dom Oct 4th 2004) ***
      local
         i: INTEGER
      do
         from
            i := offset + integer_length - 1
         until
            i < offset or else Result > Maximum_real_64
         loop
            Result := Result * Real_base + unsigned_32_to_integer_64(storage.item(i)).force_to_real_64
            i := i - 1
         end
         if Result = Maximum_real_64 and then storage.item(offset) /= 0 then
            Result := Maximum_real_64 * 2
         end
         if negative then
            Result := -Result
         end
      end

feature {NUMBER}
   from_native_array (na: NATIVE_ARRAY[INTEGER]; cap: INTEGER; neg: BOOLEAN)
      require
         na.item(cap - 1) /= 0
      do
         negative := neg
         offset := 0
         integer_length := cap
         if cap > capacity then
            capacity := capacity_from_lower_bound(capacity, cap)
            storage := storage.calloc(capacity)
         end
         storage.slice_copy(0, na, 0, cap - 1)
      end

   to_integer_general_number: INTEGER_GENERAL_NUMBER
      local
         na: like storage
      do
         if is_integer_64 then
            create {INTEGER_64_NUMBER} Result.make(to_integer_64)
         else
            na := storage.calloc(integer_length)
            na.slice_copy(0, storage, offset, offset + integer_length - 1)
            create {BIG_INTEGER_NUMBER} Result.from_native_array(na, integer_length, negative)
         end
      end

feature {ANY} -- Addition:
   add (other: like Current)
         -- Add `other' into `Current'.
         --
         -- See also `add_integer', `add_integer_64', `add_natural'.
      require
         other /= Void
      do
         -- Choose the appropriate absolute operator depending on `Current' and `other' sign.
         if other.integer_length = 0 then
            -- Nothing to do, `Current' remains unchanged.
         elseif integer_length = 0 then
            -- `Current' is zero so simply copy the value of other
            Current.copy(other)
         elseif negative = other.negative then
            -- same sign
            add_magnitude(other)
         else
            -- different sign
            subtract_magnitude(other)
         end
      end

   add_to (other, res: like Current)
         -- Add `other' and `Current', and put the result in `res'.
      require
         other /= Void
         res /= Void
         res /= Current
         res /= other
      do
         --|*** Must be optimized later (Vincent Croizier, 15/07/04) ***
         res.copy(Current)
         res.add(other)
      end

   add_integer (other: INTEGER)
         -- Add `other' into `Current'.
      local
         inc: BOOLEAN; v, i, n: INTEGER
      do
         if other = 0 then
            -- Nothing to do, `Current' remains unchanged
         elseif integer_length = 0 then
            -- `Current' is null so simply copy the value of other
            from_integer(other)
         elseif negative = (other < 0) then
            -- Same sign
            if other < 0 then
               v := #-other
            else
               v := other
            end
            -- Add `v' into `storage'
            from
               inc := mbi_add(item(offset), v, storage_at(storage, offset))
               i := offset + 1
               n := offset + integer_length
            until
               not inc or else i >= n
            loop
               inc := mbi_inc(storage_at(storage, i))
               i := i + 1
            end
            if inc then
               check
                  i = n
               end
               -- Extend the number length by 1
               if n < capacity then
                  integer_length := integer_length + 1
                  put(1, n)
               else
                  -- It's good only if the reallocation initialize
                  -- `storage' with 0.
                  v := item(offset)
                  capacity := capacity * 2
                  storage := storage.calloc(capacity)
                  offset := 0
                  put(v, 0)
                  put(1, integer_length)
                  integer_length := integer_length + 1
               end
            end
            -- Different sign
         elseif integer_length = 1 then
            if other < 0 then
               v := #-other
            else
               v := other
            end
            if mbi_subtract(item(offset), v, storage_at(storage, offset)) then
               negative := not negative
               put(-item(offset), offset)
            end
            if item(offset) = 0 then
               integer_length := 0
               negative := False
            end
         else
            if other < 0 then
               v := #-other
            else
               v := other
            end
            if mbi_subtract(item(offset), v, storage_at(storage, offset)) then
               from
                  i := offset + 1
                  inc := mbi_dec(storage_at(storage, i))
                  n := offset + integer_length - 1
               until
                  not inc
               loop
                  check
                     i < n
                  end
                  i := i + 1
                  inc := mbi_dec(storage_at(storage, i))
               end
               if item(n) = 0 then
                  integer_length := integer_length - 1
               end
            end
         end
      end

   add_integer_64 (other: INTEGER_64)
         -- Add `other' into `Current'.
      do
         register1.from_integer_64(other)
         add(register1)
      end

   add_natural (other: like Current)
         -- Same behavior as `add', but this one works only when `Current'
         -- and `other' are both positive numbers and are both greater than
         -- zero. The only one advantage of using `add_natural' instead of the
         -- general `add' is the gain of efficiency.
      require
         not is_zero and not is_negative
         not other.is_zero and not other.is_negative
      do
         add_magnitude(other)
      end

feature {ANY} -- Subtract:
   subtract (other: like Current)
         -- Subtract `other' from `Current'.
      require
         other /= Void
      do
         if other = Current then
            set_with_zero
         elseif other.integer_length = 0 then
            -- nothing to do, `Current' remains unchanged
         elseif integer_length = 0 then
            -- current is null so simply copy the value of other, the sign is also fixed
            copy(other)
            negative := not other.negative
         elseif negative = other.negative then
            -- same sign
            subtract_magnitude(other)
         else
            -- different sign
            add_magnitude(other)
         end
      end

   subtract_to (other, res: like Current)
         -- Subtract `other' from `Current' and put it in `res'.
      require
         other /= Void
         res /= Void
         res /= Current
         res /= other
      do
         --|*** Must be optimized later (Vincent Croizier, 15/07/04) ***
         res.copy(Current)
         res.subtract(other)
      end

   subtract_integer (other: INTEGER)
      do
         if other = Minimum_integer then
            add_integer(1)
            add_integer(Maximum_integer)
         else
            add_integer(-other)
         end
      end

feature {ANY} -- To divide:
   divide (other: like Current)
         -- Put the quotient of the Euclidian division of
         -- `Current' by `other' in `Current'.
         -- (The contents of `other' is not changed.)
      require
         not other.is_zero
         other /= Current
      do
         -- `divide_with_remainder_to' already use `register1'.
         divide_with_remainder_to(other, register2)
      end

   mod (other: like Current)
         -- Put the remainder of the Euclidian division of
         -- `Current' by `other' in `Current'.
         -- (The contents of `other' is not changed.)
      require
         not other.is_zero
         other /= Current
      local
         quotient: like Current
      do
         --|*** Must be optimized (Vincent Croizier, 12/07/04) ***
         create quotient.from_integer(0)
         remainder_with_quotient_to(other, quotient)
      ensure
         not negative and abs_compare(other) = -1
      end

   divide_with_remainder_to (other, remainder: like Current)
         -- Euclidian division.
         -- Calculates the `quotient' and `remainder' of `Current'
         -- divided by `other'.
         -- Quotient is put in `Current'.
         -- (The contents of `other' is not changed.)
      require
         not other.is_zero
         remainder /= Void
         remainder /= other
         remainder /= Current
      do
         Current.remainder_with_quotient_to(other, remainder)
         Current.swap_with(remainder)
      ensure
         not remainder.negative and remainder.abs_compare(other) = -1
      end

   remainder_with_quotient_to (other, quotient: like Current)
         -- Euclidian division.
         -- Calculates the `quotient' and `remainder' of `Current'
         -- divided by `other'.
         -- Remainder is put in `Current'.
         -- (The contents of `other' is not changed.)
         --
         -- Note: Uses Algorithm D in Knuth section 4.3.1.
      require
         not other.is_zero
         quotient /= Void
         quotient /= other
         quotient /= Current
      local
         cmp, shift, dlen, qlen, j, k, v1, v2, u1, u2, rem: INTEGER; qhat, rhat, v2qhat_1, v2qhat_2, d_offset: INTEGER
         q_storage, d_storage: like storage; q_capacity: like capacity; current_negative, borrow: BOOLEAN
      do
         if integer_length = 0 then
            -- Dividend is zero:
            quotient.set_with_zero
            set_with_zero
         else
            current_negative := negative
            cmp := Current.abs_compare(other)
            if cmp < 0 then
               -- Dividend less than divisor:
               quotient.set_with_zero
               -- Sign correction
               set_negative(False)
               divide_sign_correction_bis(other, quotient, current_negative)
            elseif cmp = 0 then
               -- Dividend equal to divisor:
               if negative = other.negative then
                  quotient.from_integer(1)
               else
                  quotient.from_integer(-1)
               end
               set_with_zero
            elseif other.integer_length = 1 then
               -- Special case one word divisor:
               quotient.swap_with(Current)
               --|*** replace by "from_unsigned_integer" ? (Vincent Croizier)
               set_with_zero
               rem := quotient.divide_one_word(other.item(other.offset))
               if rem /= 0 then
                  put(rem, 0)
                  set_integer_length(1)
               else
                  check
                     is_zero
                  end
               end
               -- Sign correction
               divide_sign_correction_bis(other, quotient, current_negative)
            else
               -- Copy divisor storage to protect divisor:
               register1.copy(other)
               -- D1 normalize the divisor:
               shift := register1.normalize
               if shift /= 0 then
                  shift_left(shift)
               end
               -- D2 Initialize j:
               from
                  d_storage := register1.storage
                  d_offset := register1.offset
                  dlen := register1.integer_length
                  j := offset + integer_length - 1
                  u2 := storage.item(j)
                  k := register1.offset + dlen - 1
                  v1 := register1.item(k)
                  v2 := register1.item(k - 1)
                  if unsigned_greater_or_equal(u2, v1) then
                     k := integer_length - dlen
                     qlen := k + 1
                  else
                     qlen := integer_length - dlen
                     k := qlen - 1
                     j := j - 1
                     u1 := u2
                     u2 := storage.item(j)
                  end
                  -- Resize quotient if necessary
                  q_capacity := quotient.capacity
                  if q_capacity < qlen then
                     -- reallocation
                     q_capacity := capacity_from_lower_bound(q_capacity, qlen)
                     q_storage := storage.calloc(q_capacity)
                  else
                     q_storage := quotient.storage
                  end
                  -- To avoid invariant violation on `quotient'
                  quotient.set_with_zero
               until
                  k < 0
               loop
                  j := j - 1 -- D3 Calculate qhat - estimate qhat
                  if u1 = v1 then
                     qhat := ~0
                  else
                     qhat := mbi_divide(u1, u2, v1, $rhat) -- Correct qhat
                     if qhat = 0 then
                     else
                        v2qhat_1 := mbi_multiply(v2, qhat, $v2qhat_2)
                        if unsigned_greater_than(v2qhat_1, rhat) then
                           qhat := qhat - 1
                           if mbi_subtract(v2qhat_2, v2, $v2qhat_2) then
                              v2qhat_1 := v2qhat_1 - 1
                           end
                           if mbi_add(rhat, v1, $rhat) then
                           elseif unsigned_greater_than(v2qhat_1, rhat) then
                              qhat := qhat - 1
                           elseif j < 0 then
                              if v2qhat_1 = rhat and then v2qhat_2 /= 0 then
                                 qhat := qhat - 1
                              end
                           elseif v2qhat_1 = rhat and then unsigned_greater_than(v2qhat_2, storage.item(j)) then
                              qhat := qhat - 1
                           end
                        elseif j < 0 then
                           if v2qhat_1 = rhat and then v2qhat_2 /= 0 then
                              qhat := qhat - 1
                           end
                        elseif v2qhat_1 = rhat and then unsigned_greater_than(v2qhat_2, storage.item(j)) then
                           qhat := qhat - 1
                        end
                     end
                  end
                  -- D4 Multiply and subtract:
                  if qhat = 0 then
                     q_storage.put(0, k)
                  else
                     borrow := multiply_and_subtract(u1, qhat, d_storage, d_offset, storage, j - dlen + 2, dlen)
                     -- D5 Test remainder: Result is negative ?
                     if borrow then
                        -- D6 Add back
                        borrow := add_back(u1, d_storage, d_offset, storage, j - dlen + 2, dlen)
                        check
                           borrow
                        end
                        q_storage.put(qhat - 1, k)
                     else
                        q_storage.put(qhat, k)
                     end
                  end
                  -- D7 loop on j
                  k := k - 1
                  u1 := storage.item(j + 1)
                  u2 := storage.item(j)
               end
               -- Remove leading zero of quotient
               k := qlen - 1
               if q_storage.item(k) = 0 then
                  qlen := k
               end
               quotient.set_all(q_storage, q_capacity, qlen, 0, False)
               -- Remove leading zero of remainder
               from
                  j := dlen - 1
               until
                  j < 0 or else storage.item(j) /= 0
               loop
                  j := j - 1
               end
               j := j + 1
               check
                  j >= 0
               end
               if j = 0 then
                  set_with_zero
               else
                  offset := 0
                  integer_length := j
                  negative := False
               end
               -- D8 Unnormalize:
               if shift > 0 then
                  shift_right(shift)
               end
               -- Sign correction
               divide_sign_correction_bis(other, quotient, current_negative)
            end
         end
      ensure
         not negative and abs_compare(other) = -1
      end

   divide_to (other, quotient, remainder: like Current)
         -- Euclidian division.
         -- Calculates the `quotient' and `remainder' of `Current'
         -- divided by `other'. (The contents of `Current' and `other' are
         -- not changed.)
         --
         -- Note: Uses Algorithm D in Knuth section 4.3.1.
      require
         not other.is_zero
         quotient /= Void
         remainder /= Void
         quotient /= other
         quotient /= Current
         remainder /= other
         remainder /= Current
      local
         cmp, shift, nlen, dlen, qlen, j, k, v1, v2, u1, u2, rem: INTEGER
         qhat, rhat, v2qhat_1, v2qhat_2, d_offset: INTEGER; q_storage, r_storage, d_storage: like storage
         q_capacity, r_capacity: like capacity; borrow: BOOLEAN
      do
         if integer_length = 0 then
            -- Dividend is zero:
            quotient.set_with_zero
            remainder.set_with_zero
         else
            cmp := Current.abs_compare(other)
            if cmp < 0 then
               -- Dividend less than divisor:
               quotient.set_with_zero
               remainder.copy(Current)
               -- Sign correction
               remainder.set_negative(False)
               divide_sign_correction(other, quotient, remainder)
            elseif cmp = 0 then
               -- Dividend equal to divisor:
               if negative = other.negative then
                  quotient.from_integer(1)
               else
                  quotient.from_integer(-1)
               end
               remainder.set_with_zero
            elseif other.integer_length = 1 then
               -- Special case one word divisor:
               quotient.copy(Current)
               --|*** replace by "from_unsigned_integer" ? (Vincent Croizier)
               remainder.set_with_zero
               rem := quotient.divide_one_word(other.item(other.offset))
               if rem /= 0 then
                  remainder.put(rem, 0)
                  remainder.set_ilo(1, 0)
               else
                  check
                     remainder.is_zero
                  end
               end
               -- Sign correction
               divide_sign_correction(other, quotient, remainder)
            else
               -- Copy divisor storage to protect divisor:
               register1.copy(other)
               --|***
               remainder.copy(Current)
               -- D1 normalize the divisor:
               shift := register1.normalize
               if shift /= 0 then
                  remainder.shift_left(shift)
               end
               -- D2 Initialize j:
               from
                  r_storage := remainder.storage
                  r_capacity := remainder.capacity
                  check
                     remainder.offset = 0
                  end
                  nlen := remainder.integer_length -- To avoid invariant class violation
                  remainder.set_with_zero
                  d_storage := register1.storage
                  d_offset := register1.offset
                  dlen := register1.integer_length
                  j := nlen - 1
                  u2 := r_storage.item(j)
                  k := register1.offset + dlen - 1
                  v1 := register1.item(k)
                  v2 := register1.item(k - 1)
                  if unsigned_greater_or_equal(u2, v1) then
                     k := nlen - dlen
                     qlen := k + 1
                  else
                     qlen := nlen - dlen
                     k := qlen - 1
                     j := j - 1
                     u1 := u2
                     u2 := r_storage.item(j)
                  end
                  -- Resize quotient if necessary
                  q_capacity := quotient.capacity
                  if q_capacity < qlen then
                     -- reallocation
                     q_capacity := capacity_from_lower_bound(q_capacity, qlen)
                     q_storage := storage.calloc(q_capacity)
                  else
                     q_storage := quotient.storage
                  end
                  -- To avoid invariant violation on `quotient'
                  quotient.set_with_zero
               until
                  k < 0
               loop
                  j := j - 1 -- D3 Calculate qhat - estimate qhat
                  if u1 = v1 then
                     qhat := ~0
                  else
                     qhat := mbi_divide(u1, u2, v1, $rhat) -- Correct qhat
                     if qhat = 0 then
                     else
                        v2qhat_1 := mbi_multiply(v2, qhat, $v2qhat_2)
                        if unsigned_greater_than(v2qhat_1, rhat) then
                           qhat := qhat - 1
                           if mbi_subtract(v2qhat_2, v2, $v2qhat_2) then
                              v2qhat_1 := v2qhat_1 - 1
                           end
                           if mbi_add(rhat, v1, $rhat) then
                           elseif unsigned_greater_than(v2qhat_1, rhat) then
                              qhat := qhat - 1
                           elseif j < 0 then
                              if v2qhat_1 = rhat and then v2qhat_2 /= 0 then
                                 qhat := qhat - 1
                              end
                           elseif v2qhat_1 = rhat and then unsigned_greater_than(v2qhat_2, r_storage.item(j)) then
                              qhat := qhat - 1
                           end
                        elseif j < 0 then
                           if v2qhat_1 = rhat and then v2qhat_2 /= 0 then
                              qhat := qhat - 1
                           end
                        elseif v2qhat_1 = rhat and then unsigned_greater_than(v2qhat_2, r_storage.item(j)) then
                           qhat := qhat - 1
                        end
                     end
                  end
                  -- D4 Multiply and subtract:
                  if qhat = 0 then
                     q_storage.put(0, k)
                  else
                     borrow := multiply_and_subtract(u1, qhat, d_storage, d_offset, r_storage, j - dlen + 2, dlen)
                     -- D5 Test remainder: Result is negative ?
                     if borrow then
                        -- D6 Add back
                        borrow := add_back(u1, d_storage, d_offset, r_storage, j - dlen + 2, dlen)
                        check
                           borrow
                        end
                        q_storage.put(qhat - 1, k)
                     else
                        q_storage.put(qhat, k)
                     end
                  end
                  -- D7 loop on j
                  k := k - 1
                  u1 := r_storage.item(j + 1)
                  u2 := r_storage.item(j)
               end
               -- Remove leading zero of quotient
               k := qlen - 1
               if q_storage.item(k) = 0 then
                  qlen := k
               end
               quotient.set_all(q_storage, q_capacity, qlen, 0, False)
               -- Remove leading zero of remainder
               from
                  j := dlen - 1
               until
                  j < 0 or else r_storage.item(j) /= 0
               loop
                  j := j - 1
               end
               j := j + 1
               check
                  j >= 0
               end
               if j = 0 then
                  check
                     remainder.is_zero
                  end
               else
                  remainder.set_all(r_storage, r_capacity, j, 0, False)
               end
               -- D8 Unnormalize:
               if shift > 0 then
                  remainder.shift_right(shift)
               end
               -- Sign correction
               divide_sign_correction(other, quotient, remainder)
            end
         end
      ensure
         is_a_good_divide(other, quotient, remainder)
         not remainder.negative and remainder.abs_compare(other) = -1
      end

   shift_left (n: INTEGER)
         -- Shift bits of magnitude by `n' position left. (Note that no bit can
         -- be lost because the `storage' area is automatically extended when
         -- it is necessary.)
      require
         n > 0
      local
         new_storage: like storage; left, right: INTEGER_8
         new_capacity, new_integer_length, new_head, word_shift, i, j, k, val1, val2, val3: INTEGER
      do
         if integer_length > 0 then
            word_shift := n |>>> 5
            left := (n & 0x0000001F).to_integer_8 -- Optimistic prediction
            new_integer_length := integer_length + word_shift
            if left = 0 then
               -- Just word shift
               if offset >= word_shift then
                  -- no need to deplace the number in the storage
                  from
                     i := offset
                     offset := offset - word_shift
                     integer_length := new_integer_length
                  until
                     i = offset
                  loop
                     i := i - 1
                     put(0, i)
                  end
               elseif capacity >= new_integer_length then
                  -- deplacing the number
                  from
                     i := offset + integer_length - 1
                     j := word_shift + integer_length - 1
                  until
                     i < offset
                  loop
                     put(item(i), j)
                     i := i - 1
                     j := j - 1
                  end
                  from
                     check
                        j = word_shift - 1
                     end
                  until
                     j < 0
                  loop
                     put(0, j)
                     j := j - 1
                  end
                  offset := 0
                  integer_length := new_integer_length
               else
                  -- reallocation
                  new_capacity := capacity_from_lower_bound(capacity, new_integer_length)
                  new_storage := storage.calloc(new_capacity)
                  from
                     i := offset + integer_length
                     j := word_shift + integer_length
                  until
                     i = offset
                  loop
                     i := i - 1
                     j := j - 1
                     new_storage.put(item(i), j)
                  end
                  storage := new_storage
                  capacity := new_capacity
                  offset := 0
                  integer_length := new_integer_length
               end
            else
               right := 32 - left -- Compute real `integer_length'
               i := offset + integer_length - 1
               val1 := item(i)
               new_head := val1 |>>> right
               if new_head = 0 then
                  -- new_integer_length is good
                  if capacity < new_integer_length then
                     -- reallocation
                     new_capacity := capacity_from_lower_bound(capacity, new_integer_length)
                     new_storage := storage.calloc(new_capacity)
                     from
                        j := new_integer_length - 1
                        check
                           i = offset + integer_length - 1
                           j = word_shift + integer_length - 1
                           val1 = item(i)
                        end
                     until
                        i = offset
                     loop
                        i := i - 1
                        val2 := item(i)
                        new_storage.put(val1 |<< left | (val2 |>>> right), j)
                        val1 := val2
                        j := j - 1
                     end
                     new_storage.put(val1 |<< left, j)
                     storage := new_storage
                     capacity := new_capacity
                     offset := 0
                     integer_length := new_integer_length
                  elseif offset > word_shift then
                     from
                        check
                           j = 0
                        end
                     until
                        j = word_shift
                     loop
                        put(0, j)
                        j := j + 1
                     end
                     from
                        k := offset
                        check
                           i = offset + integer_length - 1
                           j = word_shift
                        end
                     until
                        k = i
                     loop
                        val3 := item(k)
                        put(val3 |<< left | (val2 |>>> right), j)
                        val2 := val3
                        k := k + 1
                        j := j + 1
                     end
                     put(val1 |<< left | (val2 |>>> right), j)
                     offset := 0
                     integer_length := new_integer_length
                  else
                     from
                        j := new_integer_length - 1
                        check
                           i = offset + integer_length - 1
                           j = word_shift + integer_length - 1
                           val1 = item(i)
                        end
                     until
                        i = offset
                     loop
                        i := i - 1
                        val2 := item(i)
                        put(val1 |<< left | (val2 |>>> right), j)
                        val1 := val2
                        j := j - 1
                     end
                     put(val1 |<< left, j)
                     from
                     until
                        j = 0
                     loop
                        j := j - 1
                        put(0, j)
                     end
                     offset := 0
                     integer_length := new_integer_length
                  end
               else
                  new_integer_length := new_integer_length + 1
                  if capacity < new_integer_length then
                     -- Reallocation
                     new_capacity := capacity_from_lower_bound(capacity, new_integer_length)
                     new_storage := storage.calloc(new_capacity)
                     from
                        j := new_integer_length - 2
                        check
                           i = offset + integer_length - 1
                           j = word_shift + integer_length - 1
                           val1 = item(i)
                        end
                        new_storage.put(new_head, j + 1)
                     until
                        i = offset
                     loop
                        i := i - 1
                        val2 := item(i)
                        new_storage.put(val1 |<< left | (val2 |>>> right), j)
                        val1 := val2
                        j := j - 1
                     end
                     new_storage.put(val1 |<< left, j)
                     storage := new_storage
                     capacity := new_capacity
                     offset := 0
                     integer_length := new_integer_length
                  elseif offset > word_shift then
                     from
                        check
                           j = 0
                        end
                     until
                        j = word_shift
                     loop
                        put(0, j)
                        j := j + 1
                     end
                     from
                        k := offset
                        check
                           i = offset + integer_length - 1
                        end
                     until
                        k = i
                     loop
                        val3 := item(k)
                        put(val3 |<< left | (val2 |>>> right), j)
                        val2 := val3
                        k := k + 1
                        j := j + 1
                     end
                     put(val1 |<< left | (val2 |>>> right), j)
                     put(new_head, j + 1)
                     offset := 0
                     integer_length := new_integer_length
                  else
                     from
                        j := new_integer_length - 2
                        check
                           i = offset + integer_length - 1
                           j = word_shift + integer_length - 1
                           val1 = item(i)
                        end
                     until
                        i = offset
                     loop
                        i := i - 1
                        val2 := item(i)
                        put(val1 |<< left | (val2 |>>> right), j)
                        val1 := val2
                        j := j - 1
                     end
                     put(val1 |<< left, j)
                     put(new_head, new_integer_length - 1)
                     from
                     until
                        j = 0
                     loop
                        j := j - 1
                        put(0, j)
                     end
                     offset := 0
                     integer_length := new_integer_length
                  end
               end
            end
         end
      end

   shift_right (n: INTEGER)
         -- Right shift `Current' n bits. (`Current' is left in normal form.)
      require
         n > 0
      local
         n_ints, n_bits: INTEGER
      do
         if integer_length > 0 then
            n_ints := n |>>> 5
            n_bits := n & 0x0000001F
            integer_length := integer_length - n_ints
            offset := offset + n_ints
            if n_bits = 0 then
            else
               primitive_shift_right(n_bits.to_integer_8)
            end
         end
      end

feature {ANY} -- GCD
   gcd (other: like Current)
         -- Compute GCD of `Current' and `other'.
         -- GCD is put in `Current' (`other' is not modified).
      require
         other /= Void
      do
         if other = Current then
            Current.abs
         elseif other.is_zero then
            Current.abs
         elseif Current.is_zero then
            Current.copy(other)
            Current.abs
         else
            from
               register2.copy(other)
               Current.mod(register2)
               if Current.is_zero then
                  Current.swap_with(register2)
                  Current.abs
               else
                  register2.mod(Current)
               end
            until
               register2.is_zero
            loop
               Current.mod(register2)
               if Current.is_zero then
                  Current.swap_with(register2)
               else
                  register2.mod(Current)
               end
            end
         end
      ensure
         is_positive or is_zero and other.is_zero
      end

feature {ANY} -- To multiply:
   multiply (other: like Current)
         -- Multiply `Current' by `other'.
      require
         other /= Void
      do
         if other = Current then
            multiply_to(other, register1)
            swap_with(register1)
         elseif is_zero or other.is_zero then
            set_with_zero
         elseif Current.is_one then
            copy(other)
         elseif other.is_one then
         elseif Current.is_one_negative then
            copy(other)
            set_negative(not negative)
         elseif other.is_one_negative then
            set_negative(not negative)
         else
            --|*** Must be replaced by an algorithm switch. (Vincent Croizier, 09/07/04)
            multiply_like_human(other)
         end
      end

   multiply_to (other, res: like Current)
         -- Multiply the contents of `Current' and `other' and place the
         -- result  in `res'. (`Current' and `other' are not modified.)
      require
         other /= Void
         res /= Void
         res /= Current
      do
         if is_zero or other.is_zero then
            res.set_with_zero
         elseif Current.is_one then
            res.copy(other)
         elseif other.is_one then
            res.copy(Current)
         elseif Current.is_one_negative then
            res.copy(other)
            res.set_negative(not res.negative)
         elseif other.is_one_negative then
            res.copy(Current)
            res.set_negative(not negative)
         else
            --|*** Must be replace by an algorithm switch. (Vincent Croizier, 01/05/04)
            multiply_to_like_human(other, res)
         end
      end

   multiply_integer (other: INTEGER; res: like Current)
         -- Multiply the contents of `Current' and `other' and place the
         -- result  in `res'. (`Current' is not modified.)
      require
         res /= Current
         res /= Void
      local
         overflow, res_integer_length, res_capacity, i, k, up_i, v: INTEGER; res_storage: like storage
      do
         if other = 0 or else is_zero then
            res.set_with_zero
         elseif other = Minimum_integer then
            res.set_negative(not negative)
            shift_left(31)
         else
            if other > 0 then
               res.set_negative(negative)
               v := other
            else
               res.set_negative(not negative)
               v := -other
            end
            -- Pessimistique estimation
            res_integer_length := integer_length + 1 -- Reallocation ?
            if res.capacity < res_integer_length then
               if capacity < res_integer_length then
                  res_capacity := capacity * 2
               else
                  res_capacity := capacity_from_upper_bound(capacity, res_integer_length)
               end
               set_capacity(res_capacity)
               res_storage := storage.calloc(res_capacity)
               res.set_storage(res_storage)
            else
               res_storage := res.storage
            end
            res.set_offset(0)
            -- Multiply
            from
               k := 0
               i := offset
               up_i := offset + integer_length - 1
               overflow := mbi_multiply(item(i), v, storage_at(res_storage, k))
            until
               i = up_i
            loop
               i := i + 1
               k := k + 1
               overflow := mbi_multiply_with_add(item(i), v, overflow, storage_at(res_storage, k))
            end
            if overflow = 0 then
               res.set_integer_length(res_integer_length - 1)
            else
               check
                  k + 1 = integer_length
               end
               res.put(overflow, integer_length)
            end
         end
      end

feature {MUTABLE_BIG_INTEGER} -- to multiply
   multiply_like_human (other: like Current)
         -- Simple multiply.
         -- Complexity = O(`integer_length'*`other.integer_length').
      require
         not is_zero
         not other.is_zero
      local
         old_offset, new_integer_length: INTEGER
      do
         -- Pessimistique estimation
         new_integer_length := integer_length + other.integer_length -- Reallocation ?
         if capacity < new_integer_length then
            register1.swap_with(Current)
            register1.multiply_to_like_human(other, Current)
            -- Multiply in place
         elseif offset + new_integer_length <= capacity then
            multiply_like_human_aux_reverse(other)
         elseif offset >= other.integer_length then
            multiply_like_human_aux(other)
         else
            old_offset := offset
            offset := capacity - integer_length
            storage.slice_copy(offset, storage, old_offset, old_offset + integer_length - 1)
            multiply_like_human_aux(other)
         end
      end

   multiply_like_human_aux (other: like Current)
         -- Only used by `multiply_to_like_human'.
      require
         not is_zero
         not other.is_zero
         offset >= other.integer_length
      local
         other_offset, other_integer_length, overflow, i, j, k, up_i, up_j, down_k, v: INTEGER
         other_storage: like storage
      do
         other_offset := other.offset
         other_integer_length := other.integer_length
         other_storage := other.storage -- First pass
         from
            k := 0
            i := other_offset
            up_i := other_offset + other_integer_length - 1
            j := offset
            up_j := offset + integer_length - 1
            v := storage.item(j)
            overflow := mbi_multiply(other_storage.item(i), v, storage_at(storage, k))
         until
            i = up_i
         loop
            i := i + 1
            k := k + 1
            overflow := mbi_multiply_with_add(other_storage.item(i), v, overflow, storage_at(storage, k))
         end
         k := k + 1
         check
            k <= j
         end
         storage.put(overflow, k)
         from
            down_k := 1
         until
            j = up_j
         loop
            j := j + 1
            from
               k := down_k
               i := other_offset
               v := storage.item(j)
               overflow := mbi_multiply_with_add(other_storage.item(i), v, storage.item(k), storage_at(storage, k))
            until
               i = up_i
            loop
               i := i + 1
               k := k + 1
               overflow := mbi_multiply_with_2_add(other_storage.item(i), v, overflow, storage.item(k), storage_at(storage, k))
            end
            k := k + 1
            check
               k <= j
            end
            storage.put(overflow, k)
            down_k := down_k + 1
         end
         -- Adjust `res.integer_length'
         if overflow = 0 then
            integer_length := integer_length + other_integer_length - 1
         else
            integer_length := integer_length + other_integer_length
         end
         negative := negative /= other.negative
         offset := 0
      end

   multiply_like_human_aux_reverse (other: like Current)
         -- Only used by `multiply_to_like_human'.
      require
         not is_zero
         not other.is_zero
         offset + integer_length <= capacity - other.integer_length
      local
         other_offset, other_integer_length, overflow, i, j, k, up_i, down_j, down_k, v: INTEGER
         other_storage: like storage; inc: BOOLEAN
      do
         other_offset := other.offset
         other_integer_length := other.integer_length
         other_storage := other.storage -- First pass
         from
            i := other_offset
            up_i := other_offset + other_integer_length - 1
            down_j := offset
            j := offset + integer_length - 1
            k := j
            v := storage.item(j)
            overflow := mbi_multiply(other_storage.item(i), v, storage_at(storage, k))
         until
            i = up_i
         loop
            i := i + 1
            k := k + 1
            overflow := mbi_multiply_with_add(other_storage.item(i), v, overflow, storage_at(storage, k))
         end
         k := k + 1
         check
            k <= j + other_integer_length
         end
         storage.put(overflow, k)
         from
            down_k := j - 1
         until
            j = down_j
         loop
            j := j - 1
            from
               k := down_k
               i := other_offset
               v := storage.item(j)
               overflow := mbi_multiply(other_storage.item(i), v, storage_at(storage, k))
            until
               i = up_i
            loop
               i := i + 1
               k := k + 1
               overflow := mbi_multiply_with_2_add(other_storage.item(i), v, overflow, storage.item(k), storage_at(storage, k))
            end
            k := k + 1
            inc := mbi_add(storage.item(k), overflow, storage_at(storage, k))
            check
               k < offset + integer_length + other_integer_length
            end
            from
            until
               not inc
            loop
               k := k + 1
               check
                  k < offset + integer_length + other_integer_length
               end
               inc := mbi_inc(storage_at(storage, k))
            end
            down_k := down_k - 1
         end
         -- Adjust `res.integer_length'
         if storage.item(offset + integer_length + other_integer_length - 1) = 0 then
            integer_length := integer_length + other_integer_length - 1
         else
            integer_length := integer_length + other_integer_length
         end
         negative := negative /= other.negative
      end

   multiply_to_like_human (other, res: like Current)
         -- Simple multiply.
         -- Complexity = O(`integer_length'*`other.integer_length').
      require
         res /= Current
         not is_zero
         not other.is_zero
      local
         overflow, res_integer_length, res_capacity, i, j, k, up_i, up_j, down_k, v: INTEGER
         res_storage: like storage; res_negative: BOOLEAN
      do
         res_negative := negative /= other.negative -- Pessimistique estimation
         res_integer_length := integer_length + other.integer_length -- Reallocation ?
         res_capacity := res.capacity
         if res_capacity < res_integer_length then
            res_capacity := capacity_from_lower_bound(res_capacity, res_integer_length)
            res_storage := storage.calloc(res_capacity)
         else
            res_storage := res.storage
         end
         -- To avoid class invariant violation
         res.set_with_zero
         -- Multiply
         -- First pass
         from
            k := 0
            i := offset
            up_i := offset + integer_length - 1
            j := other.offset
            up_j := j + other.integer_length - 1
            v := other.item(j)
            overflow := mbi_multiply(item(i), v, storage_at(res_storage, k))
         until
            i = up_i
         loop
            i := i + 1
            k := k + 1
            overflow := mbi_multiply_with_add(item(i), v, overflow, storage_at(res_storage, k))
         end
         k := k + 1
         res_storage.put(overflow, k)
         from
            down_k := 1
         until
            j = up_j
         loop
            j := j + 1
            from
               k := down_k
               i := offset
               v := other.item(j)
               overflow := mbi_multiply_with_add(item(i), v, res_storage.item(k), storage_at(res_storage, k))
            until
               i = up_i
            loop
               i := i + 1
               k := k + 1
               overflow := mbi_multiply_with_2_add(item(i), v, overflow, res_storage.item(k), storage_at(res_storage, k))
            end
            k := k + 1
            res_storage.put(overflow, k)
            down_k := down_k + 1
         end
         -- Adjust `res.integer_length'
         if overflow = 0 then
            res.set_all(res_storage, res_capacity, res_integer_length - 1, 0, res_negative)
         else
            res.set_all(res_storage, res_capacity, res_integer_length, 0, res_negative)
         end
      end

feature {ANY} -- Comparison:
   is_zero: BOOLEAN
         -- Is it 0?
      do
         Result := integer_length = 0
      ensure
         Result implies not is_negative
      end

   is_one: BOOLEAN
         -- Is it 1?
      do
         if integer_length = 1 then
            if not negative then
               Result := item(offset) = 1
            end
         end
      ensure
         Result implies not is_negative
      end

   is_one_negative: BOOLEAN
         -- Is it -1 ?
      do
         if integer_length = 1 then
            if negative then
               Result := item(offset) = 1
            end
         end
      ensure
         Result implies is_negative
      end

   is_negative: BOOLEAN
         -- Is `Current' negative integer?
      do
         Result := negative
      ensure
         Result implies not is_positive
      end

   is_positive: BOOLEAN
         -- Is `Current' positive integer?
      do
         Result := not negative and then integer_length /= 0
      ensure
         Result implies not is_negative
      end

   is_even: BOOLEAN
         -- Is `Current' even?
      do
         if integer_length = 0 then
            Result := True
         else
            Result := item(offset).is_even
         end
      ensure
         Result = not Current.is_odd
      end

   is_odd: BOOLEAN
         -- Is `Current' odd?
      do
         if integer_length > 0 then
            Result := item(offset).is_odd
         end
      ensure
         Result = not Current.is_even
      end

   is_equal (other: like Current): BOOLEAN
      local
         a, b, c: INTEGER
      do
         if Current = other then
            Result := True
         elseif integer_length /= other.integer_length then
         elseif negative /= other.negative then
         else
            check
               other.integer_length = integer_length
            end
            from
               c := offset + integer_length
               a := offset
               b := other.offset
               Result := True
            until
               a = c
            loop
               if item(a) /= other.item(b) then
                  Result := False
                  a := c
               else
                  a := a + 1
                  b := b + 1
               end
            end
         end
      end

   infix "<" (other: like Current): BOOLEAN
      local
         a, b: INTEGER; va, vb: INTEGER
      do
         if Current = other then
         elseif negative /= other.negative then
            Result := negative
         elseif integer_length /= other.integer_length then
            Result := integer_length < other.integer_length xor negative
         else
            check
               other.negative = negative
            end
            check
               other.integer_length = integer_length
            end
            from
               a := offset + integer_length - 1
               b := other.offset + integer_length - 1
            until
               a < offset
            loop
               va := item(a)
               vb := other.item(b)
               if unsigned_less_than(va, vb) then
                  Result := not negative
                  a := -1
               elseif unsigned_less_than(vb, va) then
                  Result := negative
                  a := -1
               else
                  a := a - 1
                  b := b - 1
               end
            end
         end
      end

   abs_compare (other: like Current): INTEGER
         -- Compare the magnitude of `Current' and `other'. Returns -1, 0 or 1
         -- as this MutableBigInteger is numerically less than, equal to, or
         -- greater than other.
      local
         a, b: INTEGER; va, vb: INTEGER
      do
         if Current = other then
            --Result := 0
         elseif integer_length < other.integer_length then
            Result := -1
         elseif integer_length > other.integer_length then
            Result := 1
         else
            check
               other.integer_length = integer_length
            end
            from
               a := offset + integer_length
               b := other.offset + integer_length
               check
                  Result = 0
               end
            until
               a <= offset
            loop
               a := a - 1
               b := b - 1
               va := item(a)
               vb := other.item(b)
               if unsigned_less_than(va, vb) then
                  Result := -1
                  a := -1
               elseif unsigned_less_than(vb, va) then
                  Result := 1
                  a := -1
               end
            end
         end
      end

feature {ANY} -- Printing:
   to_string: STRING
         -- The decimal view of `Current' into a new allocated STRING.
         -- For example, if `Current' is -1 the `Result' is "-1".
         --
         -- See also `append_in', `to_string_format', `to_unicode_string', `to_integer'.
      do
         string_buffer.clear_count
         append_in(string_buffer)
         Result := string_buffer.twin
      end

   to_unicode_string: UNICODE_STRING
         -- The decimal view of `Current' into a new allocated UNICODE_STRING.
         -- For example, if `Current' represents -1 the `Result' is U"-1".
         --
         -- See also `append_in_unicode', `to_unicode_string_format', `to_string'.
      do
         unicode_string_buffer.clear_count
         append_in_unicode(unicode_string_buffer)
         Result := unicode_string_buffer.twin
      end

   append_in (buffer: STRING)
         -- Append in the `buffer' the equivalent of `to_string'. No new
         -- STRING creation during the process.
      require
         is_printable
      local
         k: INTEGER
      do
         if is_zero then
            buffer.extend('0')
         else
            -- Put the sign in `buffer'
            if negative then
               buffer.extend('-')
            end
            -- Put it in `buffer'
            from
               k := append_in_char_buffer
            until
               k = 0
            loop
               k := k - 1
               buffer.extend(char_buffer.item(k))
            end
         end
      end

   append_in_unicode (buffer: UNICODE_STRING)
         -- Append in the `buffer' the equivalent of `to_string'. No new
         -- STRING creation during the process.
      require
         is_printable
      local
         k: INTEGER
      do
         if is_zero then
            buffer.extend('0'.code)
         else
            -- Put the sign in `buffer'
            if negative then
               buffer.extend('-'.code)
            end
            -- Put it in `buffer'
            from
               k := append_in_char_buffer
            until
               k = 0
            loop
               k := k - 1
               buffer.extend(char_buffer.item(k).code)
            end
         end
      end

   to_string_format (s: INTEGER): STRING
         -- Same as `to_string' but the result is on `s' character and the
         -- number is right aligned.
         -- Note: see `append_in_format' to save memory.
      require
         to_string.count <= s
      do
         create Result.make(s)
         append_in_format(Result, s)
      ensure
         Result.count = s
      end

   to_unicode_string_format (s: INTEGER): UNICODE_STRING
         -- Same as `to_unicode_string' but the result is on `s' character and
         -- the number is right aligned.
         -- Note: see `append_in_unicode_format' to save memory.
      require
         to_string.count <= s
      do
         create Result.make(s)
         append_in_unicode_format(Result, s)
      ensure
         Result.count = s
      end

   append_in_format (str: STRING; s: INTEGER)
         -- Append the equivalent of `to_string_format' at the end of `str'. Thus you can save
         -- memory because no other STRING is allocated for the job.
      require
         to_string.count <= s
      local
         i, k: INTEGER
      do
         if is_zero then
            -- Put spaces
            from
               i := s - 1
            variant
               i
            until
               i = 0
            loop
               str.extend(' ')
               i := i - 1
            end
            -- Put number
            str.extend('0')
         else
            k := append_in_char_buffer
            -- Put spaces
            from
               if negative then
                  i := s - k - 1
               else
                  i := s - k
               end
            variant
               i
            until
               i = 0
            loop
               str.extend(' ')
               i := i - 1
            end
            -- Put number
            from
               -- Put the sign in `buffer'
               if negative then
                  str.extend('-')
               end
            variant
               k
            until
               k = 0
            loop
               k := k - 1
               str.extend(char_buffer.item(k))
            end
         end
      ensure
         str.count >= old str.count + s
      end

   append_in_unicode_format (str: UNICODE_STRING; s: INTEGER)
         -- Append the equivalent of `to_unicode_string_format' at the end of
         -- `str'. Thus you can save memory because no other
         -- UNICODE_STRING is allocated for the job.
      require
         to_string.count <= s
      local
         i, k: INTEGER
      do
         if is_zero then
            -- Put spaces
            from
               i := s - 1
            variant
               i
            until
               i = 0
            loop
               str.extend(' '.code)
               i := i - 1
            end
            -- Put number
            str.extend('0'.code)
         else
            k := append_in_char_buffer
            -- Put spaces
            from
               if negative then
                  i := s - k - 1
               else
                  i := s - k
               end
            variant
               i
            until
               i = 0
            loop
               str.extend(' '.code)
               i := i - 1
            end
            -- Put number
            from
               -- Put the sign in `buffer'
               if negative then
                  str.extend('-'.code)
               end
            variant
               k
            until
               k = 0
            loop
               k := k - 1
               str.extend(char_buffer.item(k).code)
            end
         end
      ensure
         str.count >= old str.count + s
      end

   is_printable: BOOLEAN
         -- True if decimal view of `Current' is short enougth
         -- to be put in a STRING.
      do
         --|*** MUST BE REWRITE (Vincent Croizier, 14/07/04) ***
         Result := integer_length <= 2 ^ 27
      end

   out_in_tagged_out_memory, fill_tagged_out_memory
      do
         append_in(tagged_out_memory)
      end

feature {ANY} -- Miscellaneous:
   negate
         -- Negate the sign of `Current'.
      do
         if integer_length /= 0 then
            negative := not negative
         end
      end

   abs
         -- Absolute value of `Current'.
      do
         negative := False
      end

   sign: INTEGER_8
         -- Sign of `Current' (0 -1 or 1).
      do
         if negative then
            Result := -1
         elseif integer_length > 0 then
            Result := 1
         else
            check
               is_zero
            end
         end
      end

   set_with_zero
      do
         integer_length := 0
         negative := False
      ensure
         is_zero
      end

   hash_code: INTEGER
      local
         i, c, v: INTEGER
      do
         from
            i := offset
            c := 2
         until
            c = 0 or else i = offset + integer_length
         loop
            v := item(i)
            if v /= 0 then
               Result := Result #+ v
               c := c - 1
            end
            i := i + 1
         end
         Result := integer_length #* Result
         if negative then
            Result := Result #+ 1
         end
         if Result < 0 then
            Result := ~Result
         end
      end

   copy (other: like Current)
      do
         negative := other.negative
         offset := 0
         integer_length := other.integer_length
         if capacity < other.integer_length then
            capacity := capacity_from_upper_bound(other.capacity, integer_length)
            storage := storage.calloc(capacity)
         elseif capacity = 0 then
            capacity := 4
            storage := storage.calloc(capacity)
         end
         if integer_length /= 0 then
            storage.slice_copy(offset, other.storage, other.offset, other.offset + integer_length - 1)
         end
      end

   swap_with (other: like Current)
         -- Swap the value of `Current' with the value of `other'.
      local
         s: like storage; c: like capacity; il: like integer_length; o: like offset; n: like negative
      do
         s := other.storage
         c := other.capacity
         il := other.integer_length
         o := other.offset
         n := other.negative -- Put Current in other
         other.set_all(storage, capacity, integer_length, offset, negative)
         --
         storage := s
         capacity := c
         integer_length := il
         offset := o
         negative := n
      end

feature {MUTABLE_BIG_INTEGER}
   storage: NATIVE_ARRAY[INTEGER_32]
         -- Holds the magnitude of `Current' in natural order (the most significant INTEGER_32 word
         -- has the highest address). To avoid many reallocation of this `storage' area, only some
         -- words are significant. The magnitude is stored in the following significant
         -- range [`offset' .. `offset + integer_length - 1'].

   capacity: INTEGER
         -- Of the allocated `storage' area.

   integer_length: INTEGER
         -- The number of significant INTEGER_32 words in the `storage' area.

   offset: INTEGER
         -- The `offset' of the less significant word into the `storage' area.

   negative: BOOLEAN
         -- True when `Current' is negative.

   item (index: INTEGER): INTEGER_32
      require
      -- index.in_range(0, capacity - 1)
         index.in_range(offset, offset + integer_length - 1)
      do
         Result := storage.item(index)
      end

   put (value: INTEGER; index: INTEGER)
      require
         index.in_range(0, capacity - 1)
      do
         storage.put(value, index)
      end

   set_negative (n: like negative)
      require
         n implies not is_zero
      do
         negative := n
      ensure
         negative = n or is_zero
      end

   set_integer_length (il: like integer_length)
      require
         il.in_range(0, capacity - offset)
      do
         integer_length := il
      ensure
         integer_length = il
      end

   set_offset (o: like offset)
      require
         o.in_range(0, capacity - integer_length)
      do
         offset := o
      ensure
         offset = o
      end

   set_ilo (il: like integer_length; o: like offset)
      require
         il.in_range(0, capacity)
         o.in_range(0, capacity - il)
      do
         integer_length := il
         offset := o
      ensure
         integer_length = il
         offset = o
      end

   set_storage (new_storage: like storage)
      do
         storage := new_storage
      end

   set_capacity (new_capacity: like capacity)
      do
         capacity := new_capacity
      end

   set_all (new_storage: like storage; new_capacity, new_integer_length, new_offset: INTEGER; new_negative: BOOLEAN)
      require
         new_capacity > 0
         new_storage.is_not_null
         new_integer_length.in_range(0, new_capacity)
         new_integer_length /= 0 implies new_offset.in_range(0, new_capacity - new_integer_length) and new_storage.item(new_offset + new_integer_length - 1) /= 0
         new_integer_length = 0 implies not new_negative
         new_capacity.is_a_power_of_2
      do
         storage := new_storage
         capacity := new_capacity
         integer_length := new_integer_length
         offset := new_offset
         negative := new_negative
      ensure
         storage = new_storage
         capacity = new_capacity
         integer_length = new_integer_length
         offset = new_offset
         negative = new_negative
      end

   primitive_shift_left (n: INTEGER_8)
         -- Left shift `Current' with no need to extend the `storage'.
         --|*** Can be a little faster (Vincent Croizier, 26/04/04) ***
      require
         integer_length > 0
         n.in_range(1, 31)
         no_bit_lost: item(offset + integer_length - 1) |<< n |>>> n = item(offset + integer_length - 1)
      local
         n2: INTEGER_8; i, up, b, c: INTEGER
      do
         n2 := 32 - n
         from
            i := offset
            up := i + integer_length - 1
         until
            i > up
         loop
            b := item(i)
            put(b |<< n | c, i)
            c := b |>>> n2
            i := i + 1
         end
         check
            c = 0
         end
      end

   primitive_shift_right (n: INTEGER_8)
         -- Right shift `Current' of `n' bits.
      require
         integer_length > 0
         n.in_range(1, 31)
      local
         n2: INTEGER_8; i, j, up, b, c: INTEGER
      do
         n2 := 32 - n
         from
            up := integer_length - 1
            j := 0
            i := offset
            c := item(i)
         until
            j >= up
         loop
            b := c
            i := i + 1
            c := item(i)
            put(b |>>> n | (c |<< n2), j)
            j := j + 1
         end
         check
            j = up
            i = offset + j
         end
         put(c |>>> n, up)
         offset := 0
         if item(integer_length - 1) = 0 then
            integer_length := integer_length - 1
         end
      ensure
         offset = 0
      end

   divide_one_word (divisor: INTEGER): INTEGER
         -- This method is used by `divide'. The one word divisor
         -- specified by `divisor' is saw as unsigned.
         -- `Current' is the dividend (saw positive) at invocation but is replaced by
         -- the quotient. The remainder is returned as unsigned INTEGER.
         -- Note: `Current' is modified by this method.
      require
         divisor /= 0
      local
         i, remainder_word1, remainder_word0: INTEGER
      do
         if integer_length = 1 then
            Result := item(offset)
            if unsigned_less_than(Result, divisor) then
               integer_length := 0
               negative := False
            else
               put(mbi_divide(0, Result, divisor, $remainder_word1), offset)
               Result := remainder_word1
            end
         else
            from
               i := offset + integer_length - 1
            until
               i < offset
            loop
               remainder_word0 := item(i)
               put(mbi_divide(remainder_word1, remainder_word0, divisor, $remainder_word1), i)
               i := i - 1
            end
            if item(offset + integer_length - 1) = 0 then
               integer_length := integer_length - 1
               check
                  item(offset + integer_length - 1) /= 0
               end
            end
            Result := remainder_word1
         end
      end

   divide_sign_correction (other, quotient, remainder: like Current)
         -- Correct the value of `quotient' and `remainder' after an
         -- "unsigned" division.
         -- Only used by `divide'.
      require
         not remainder.is_negative
      do
         if remainder.is_zero then
            quotient.set_negative(negative /= other.negative)
         elseif negative then
            quotient.set_negative(False)
            if other.negative then
               quotient.add_integer(1)
               remainder.set_negative(True)
               -- other is negative
               remainder.subtract(other)
               check
                  not remainder.is_negative
               end
            else
               quotient.add_integer(1)
               quotient.set_negative(True)
               remainder.set_negative(True)
               remainder.add(other)
               check
                  not remainder.is_negative
               end
            end
         elseif other.negative then
            quotient.set_negative(True)
         else
            quotient.set_negative(False)
         end
      ensure
         not remainder.is_negative
      end

   divide_sign_correction_bis (other, quotient: like Current; current_negative: BOOLEAN)
         -- Correct the value of `quotient' and `remainder' after an
         -- "unsigned" division.
         -- Only used by `divide'.
      require
         not is_negative
      do
         if is_zero then
            quotient.set_negative(current_negative /= other.negative)
         elseif current_negative then
            quotient.set_negative(False)
            if other.negative then
               quotient.add_integer(1)
               set_negative(True)
               -- other is negative
               subtract(other)
               check
                  not is_negative
               end
            else
               quotient.add_integer(1)
               quotient.set_negative(True)
               set_negative(True)
               add(other)
               check
                  not is_negative
               end
            end
         elseif other.negative then
            quotient.set_negative(True)
         else
            quotient.set_negative(False)
         end
      ensure
         not is_negative
      end

   multiply_and_subtract (u1, qhat: INTEGER; d_storage: like storage; d_offset: INTEGER; r_storage: like storage
      r_offset, length: INTEGER): BOOLEAN
         -- Only used by `divide'.
      require
         qhat /= 0
      local
         i, j, jmax, m1, m2: INTEGER; dec: BOOLEAN
      do
         if qhat = 1 then
            from
               i := d_offset
               j := r_offset
               jmax := r_offset + length
            until
               j = jmax
            loop
               if dec then
                  dec := mbi_subtract_with_dec(r_storage.item(j), d_storage.item(i), storage_at(r_storage, j))
               else
                  dec := mbi_subtract(r_storage.item(j), d_storage.item(i), storage_at(r_storage, j))
               end
               i := i + 1
               j := j + 1
            end
            if dec then
               if u1 = 0 then
                  Result := True
               else
                  Result := mbi_dec(storage_at(r_storage, j))
                  check
                     not Result
                  end
               end
            end
         else
            from
               i := d_offset
               j := r_offset
               jmax := r_offset + length
            until
               j = jmax
            loop
               m1 := mbi_multiply_with_add(qhat, d_storage.item(i), m1, $m2)
               if dec then
                  dec := mbi_subtract_with_dec(r_storage.item(j), m2, storage_at(r_storage, j))
               else
                  dec := mbi_subtract(r_storage.item(j), m2, storage_at(r_storage, j))
               end
               i := i + 1
               j := j + 1
            end
            if dec then
               if u1 = 0 then
                  Result := True
               else
                  Result := mbi_subtract_with_dec(r_storage.item(j), m1, storage_at(r_storage, j))
               end
            elseif m1 = 0 then
               -- nothing to do
            elseif u1 = 0 then
               Result := True
            else
               Result := mbi_subtract(r_storage.item(j), m1, storage_at(r_storage, j))
            end
         end
      end

   add_back (old_u1: INTEGER; d_storage: like storage; d_offset: INTEGER; r_storage: like storage
      r_offset, length: INTEGER): BOOLEAN
         -- Only used by `divide'.
         -- `old_u1' is the value of `u1' before `multiply_and_subtract'.
      local
         i, j, jmax: INTEGER; inc: BOOLEAN
      do
         from
            i := d_offset
            j := r_offset
            jmax := r_offset + length
         until
            j = jmax
         loop
            if inc then
               inc := mbi_add_with_inc(r_storage.item(j), d_storage.item(i), storage_at(r_storage, j))
            else
               inc := mbi_add(r_storage.item(j), d_storage.item(i), storage_at(r_storage, j))
            end
            i := i + 1
            j := j + 1
         end
         if inc then
            if old_u1 = 0 then
               Result := True
            else
               Result := mbi_inc(storage_at(r_storage, j))
            end
         end
      end

   is_a_good_divide (other, quotient, remainder: like Current): BOOLEAN
      require
         other /= Void
         quotient /= Void
         remainder /= Void
      local
         v: like Current
      do
         v := other.twin
         v.multiply(quotient)
         v.add(remainder)
         Result := Current.is_equal(v)
      end

   normalize: INTEGER_8
         -- Shift left until the most significant bit is on.
         -- Result give the number of left shift.
      require
         not is_zero
      local
         head: INTEGER
      do
         head := item(offset + integer_length - 1)
         from
         until
            head < 0
         loop
            head := head.bit_shift_left(1)
            Result := Result + 1
         end
         if Result > 0 then
            shift_left(Result)
         end
      ensure
         item(offset + integer_length - 1) < 0
      end

feature {MUTABLE_BIG_INTEGER} -- Implementation:
   register1: MUTABLE_BIG_INTEGER
      once
         create Result.from_integer(0)
      end

   register2: MUTABLE_BIG_INTEGER
      once
         create Result.from_integer(0)
      end

   Real_base: REAL_64
      once
         Result := (0x0000000100000000).force_to_real_64
      end

   add_magnitude (other: like Current)
         -- Add the magnitude of `Current' and `other' regardless of signs.
      require
         not is_zero
         not other.is_zero
      local
         a, b: like Current; inc: BOOLEAN; i, j, k, n: INTEGER; new_storage, a_storage, b_storage: like storage
         new_capacity, a_capacity, a_offset, a_integer_length, b_offset, b_integer_length: INTEGER
      do
         --|*** First tests can be certainely optimized.
         --|*** (Vincent Croizier, 26/03/2004)
         if integer_length > other.integer_length and then capacity - offset > integer_length then
            ---- Add in place (`offset' doesn't change)
            -- Add common parts of both numbers:
            from
               i := offset
               j := other.offset
               n := j + other.integer_length
            until
               j = n
            loop
               if inc then
                  -- overflow in the last addition step
                  inc := mbi_add_with_inc(item(i), other.item(j), storage_at(storage, i))
               else
                  -- no overflow in the last addition step
                  inc := mbi_add(item(i), other.item(j), storage_at(storage, i))
               end
               i := i + 1
               j := j + 1
            end
            -- Add remainder of the longer number with increment (if necessary):
            from
               n := offset + integer_length
            until
               not inc or else i = n
            loop
               inc := mbi_inc(storage_at(storage, i))
               i := i + 1
            end
            if inc then
               storage.put(1, n)
               check
                  n < capacity
               end
               integer_length := integer_length + 1
            end
         else
            ---- Add, after this `offset' will be 0
            -- Set `a' to the longest number and `b' to the smallest.
            if integer_length >= other.integer_length then
               a := Current
               b := other
            else
               a := other
               b := Current
            end
            a_capacity := a.capacity
            a_storage := a.storage
            b_storage := b.storage
            a_integer_length := a.integer_length
            b_integer_length := b.integer_length
            a_offset := a.offset
            b_offset := b.offset -- Verify capacity
            if capacity < a_integer_length then
               new_capacity := capacity_from_lower_bound(capacity, a_integer_length)
               new_storage := new_storage.calloc(new_capacity)
            elseif capacity = a_integer_length then
               --|*** It's possible to make a more restrictive test
               --|*** that can exclude more case of reallocation. (Vincent Croizier, 24/03/2004)
               new_capacity := capacity_from_lower_bound(capacity, a_integer_length + 1)
               new_storage := new_storage.calloc(new_capacity)
            elseif a = other then
               -- protect `other'
               new_storage := a_storage.calloc(a_capacity)
               new_capacity := a_capacity
            else
               new_storage := a_storage
               new_capacity := a_capacity
            end
            -- Add common parts of both numbers:
            n := b_integer_length
            check
               n.in_range(0, new_capacity)
            end
            from
               i := a_offset
               j := b_offset -- k := 0
            until
               k = n
            loop
               if inc then
                  -- overflow in the last addition step
                  inc := mbi_add_with_inc(a_storage.item(i), b_storage.item(j), storage_at(new_storage, k))
               else
                  -- no overflow in the last addition step
                  inc := mbi_add(a_storage.item(i), b_storage.item(j), storage_at(new_storage, k))
               end
               i := i + 1
               j := j + 1
               k := k + 1
            end
            -- Add remainder of the longer number with increment (if necessary):
            from
               n := a_integer_length
            until
               not inc or else k = a_integer_length
            loop
               new_storage.put(a_storage.item(i), k)
               inc := mbi_inc(storage_at(new_storage, k))
               i := i + 1
               k := k + 1
            end
            if inc then
               new_storage.put(1, k)
               check
                  n < new_capacity
               end
               n := n + 1
            else
               -- copy the reste of `a'
               from
               until
                  k = n
               loop
                  new_storage.put(a_storage.item(i), k)
                  i := i + 1
                  k := k + 1
               end
            end
            capacity := new_capacity
            storage := new_storage
            integer_length := n
            offset := 0
         end
      end

feature {MUTABLE_BIG_INTEGER} -- Implementation:
   subtract_magnitude (other: like Current)
         -- Subtract `other' from `Current' (The result is placed  in `Current')
         -- and change `negative' (the sign) if necessary.
      require
         not is_zero
         not other.is_zero
      local
         i, j, v1, v2: INTEGER; test: BOOLEAN; new: like Current
      do
         -- Compare the number
         if integer_length = other.integer_length then
            -- Compare the most significant part of the numbers
            from
               i := offset + integer_length - 1
               j := other.offset + integer_length - 1
               v1 := item(i)
               v2 := other.item(j)
               test := v1 /= v2
            until
               test or else i = offset
            loop
               integer_length := integer_length - 1
               i := i - 1
               j := j - 1
               v1 := item(i)
               v2 := other.item(j)
               test := v1 /= v2
            end
            if test then
               if unsigned_greater_than(v1, v2) then
                  -- Current > other
                  subtract_magnitude_raw_truncated(other)
                  if storage.item(integer_length - 1) = 0 then
                     integer_length := integer_length - 1
                     check
                        integer_length /= 0 implies item(integer_length - 1) /= 0
                     end
                  end
               else
                  -- Current < other
                  check
                     unsigned_less_than(v1, v2)
                  end
                  negative := not negative
                  subtract_magnitude_raw_reverse_truncated(other)
                  if storage.item(integer_length - 1) = 0 then
                     integer_length := integer_length - 1
                     check
                        integer_length /= 0 implies item(integer_length - 1) /= 0
                     end
                  end
               end
            else
               -- Current = other
               set_with_zero
            end
         elseif integer_length > other.integer_length then
            subtract_magnitude_raw(other)
         elseif capacity >= other.integer_length then
            negative := not negative
            subtract_magnitude_raw_reverse(other)
         else
            -- Reallocation
            --|*** Can be faster (Vincent Croizier, 10/06/04) ***
            create new.copy(other)
            new.subtract_magnitude(Current)
            negative := not negative
            integer_length := new.integer_length
            storage := new.storage
            offset := new.offset
         end
      end

   subtract_magnitude_raw (other: like Current)
         -- Subtract (raw) the storage of `other' from `Current'.
         -- Used by `subtract_magnitude'.
      require
         not is_zero
         not other.is_zero
         abs_compare(other) = 1
      local
         i, j, k, up: INTEGER; dec: BOOLEAN
      do
         from
            k := 0
            i := offset
            j := other.offset
            up := other.integer_length - 1
         until
            k > up
         loop
            if dec then
               dec := mbi_subtract_with_dec(item(i), other.item(j), storage_at(storage, k))
            else
               dec := mbi_subtract(item(i), other.item(j), storage_at(storage, k))
            end
            i := i + 1
            j := j + 1
            k := k + 1
         end
         from
         until
            not dec
         loop
            --|*** Could be done in one step with a mbi_dec_bis
            --| routine (Vincent Croizier, 10/06/04) ***
            put(item(i), k)
            dec := mbi_dec(storage_at(storage, k))
            i := i + 1
            k := k + 1
         end
         if k = integer_length then
            from
               k := k - 1
            until
               item(k) /= 0
            loop
               k := k - 1
            end
            integer_length := k + 1
         end
         offset := 0
      ensure
         offset = 0
      end

   subtract_magnitude_raw_reverse (other: like Current)
         -- Subtract (raw) the storage of `Current' from `other' and
         -- put it in `Current'.
         -- Used by `subtract_magnitude'.
      require
         not is_zero
         not other.is_zero
         abs_compare(other) = -1
      local
         i, j, k, up: INTEGER; dec: BOOLEAN
      do
         from
            -- k := 0
            i := offset
            j := other.offset
            up := integer_length - 1
         until
            k > up
         loop
            if dec then
               dec := mbi_subtract_with_dec(other.item(j), item(i), storage_at(storage, k))
            else
               dec := mbi_subtract(other.item(j), item(i), storage_at(storage, k))
            end
            i := i + 1
            j := j + 1
            k := k + 1
         end
         from
         until
            not dec
         loop
            --|*** Could be done in one step with a mbi_dec_bis
            --| routine (Vincent Croizier, 10/06/04) ***
            put(other.item(j), k)
            dec := mbi_dec(storage_at(storage, k))
            j := j + 1
            k := k + 1
         end
         check
            not dec
         end
         up := other.integer_length
         if k < up then
            from
            until
               k = up
            loop
               put(other.item(j), k)
               j := j + 1
               k := k + 1
            end
            integer_length := up
         else
            check
               k = up
            end
            from
               k := k - 1
            until
               storage.item(k) /= 0
            loop
               k := k - 1
            end
            integer_length := k + 1
            offset := 0
         end
      ensure
         offset = 0
      end

   subtract_magnitude_raw_truncated (other: like Current)
         -- Subtract (raw) the storage of `other' from `Current'
         -- where `other' is truncated to the size of `Current'.
         -- Used by `subtract_magnitude'.
      require
         not other.is_zero
         other.integer_length >= integer_length
         unsigned_greater_than(item(offset + integer_length - 1), other.item(offset + integer_length - 1))
      local
         i, j, k, up: INTEGER; dec: BOOLEAN
      do
         from
            k := 0
            i := offset
            j := other.offset
            up := integer_length - 1
         until
            k > up
         loop
            if dec then
               dec := mbi_subtract_with_dec(item(i), other.item(j), storage_at(storage, k))
            else
               dec := mbi_subtract(item(i), other.item(j), storage_at(storage, k))
            end
            i := i + 1
            j := j + 1
            k := k + 1
         end
         check
            not dec
         end
         offset := 0
      ensure
         offset = 0
      end

   subtract_magnitude_raw_reverse_truncated (other: like Current)
         -- Subtract (raw) the storage of `Current' from `other' and
         -- put it in `Current',
         -- where `other' is truncated to the size of `Current'.
         -- Used by `subtract_magnitude'.
      require
         not other.is_zero
         other.integer_length >= integer_length
         unsigned_less_than(item(offset + integer_length - 1), other.item(offset + integer_length - 1))
      local
         i, j, k, up: INTEGER; dec: BOOLEAN
      do
         from
            k := 0
            i := offset
            j := other.offset
            up := integer_length - 1
         until
            k > up
         loop
            if dec then
               dec := mbi_subtract_with_dec(other.item(j), item(i), storage_at(storage, k))
            else
               dec := mbi_subtract(other.item(j), item(i), storage_at(storage, k))
            end
            i := i + 1
            j := j + 1
            k := k + 1
         end
         check
            not dec
         end
         offset := 0
      ensure
         offset = 0
      end

feature {} -- For printing
   char_buffer: FAST_ARRAY[CHARACTER]
      once
         create Result.make(4096)
      end

   append_in_char_buffer: INTEGER
         -- Tool for `append_in' and `append_in_unicode'.
         -- Put absolute value of Current in `char_buffer' and return
         -- the number of characteres really used.
      require
         is_printable
         not is_zero
      local
         base, max_char, i, r: INTEGER
      do
         -- Allocate space in `char_buffer'
         max_char := integer_length * 9 + (2 * integer_length + 2) #// 3
         if char_buffer.capacity < max_char then
            char_buffer.resize(max_char)
         end
         -- Begin of extracting digits
         register1.copy(Current)
         base := 1000000000
         from
            r := register1.divide_one_word(base)
         until
            register1.is_zero
         loop
            check
               r >= 0
            end
            from
               i := 9
            until
               r = 0
            loop
               char_buffer.put((r #\\ 10).decimal_digit, Result)
               r := r #// 10
               Result := Result + 1
               i := i - 1
            end
            from
            until
               i = 0
            loop
               char_buffer.put('0', Result)
               Result := Result + 1
               i := i - 1
            end
            -- extract next digit group
            r := register1.divide_one_word(base)
         end
         from
            check
               r > 0
            end
         until
            r = 0
         loop
            char_buffer.put((r #\\ 10).decimal_digit, Result)
            r := r #// 10
            Result := Result + 1
         end
      end

feature {} -- Tools for capacity:
   capacity_from_lower_bound (actual_capacity, needed_capacity: INTEGER): INTEGER
         -- Give the smallest power of 2 greater than
         -- `needed_capacity' and `actual_capacity'.
         -- Based on `actual_capacity' (the actual capacity).
      require
         actual_capacity.is_a_power_of_2
         actual_capacity >= 4
      do
         from
            Result := actual_capacity
         until
            Result >= needed_capacity
         loop
            Result := Result.bit_shift_left(1)
         end
      ensure
         Result.is_a_power_of_2
         Result >= 4
         Result >= actual_capacity
         Result >= needed_capacity
         Result = actual_capacity or Result #// 2 < needed_capacity
      end

   capacity_from_upper_bound (actual_capacity, needed_capacity: INTEGER): INTEGER
         -- Give the smallest power of 2 greater than `needed_capacity'.
         -- Based on `actual_capacity' (the actual capacity).
      require
         actual_capacity >= 4
         actual_capacity >= needed_capacity
         actual_capacity.is_a_power_of_2
      local
         v: INTEGER
      do
         from
            Result := actual_capacity
            v := Result.bit_shift_right(1)
         until
            v < needed_capacity or else v = 2
         loop
            Result := v
            v := Result.bit_shift_right(1)
         end
      ensure
         Result.is_a_power_of_2
         Result <= actual_capacity
         Result >= needed_capacity
         Result = 4 or Result.bit_shift_right(1) < needed_capacity
      end

feature {}
   unsigned_less_than (a, b: INTEGER): BOOLEAN
         -- Unsigned "<".
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "mutable_big_integer"
         feature_name: "mbi_unsigned_less_than"
         }"
      end

   unsigned_greater_than (a, b: INTEGER): BOOLEAN
         -- Unsigned ">".
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "mutable_big_integer"
         feature_name: "mbi_unsigned_greater_than"
         }"
      end

   unsigned_greater_or_equal (a, b: INTEGER): BOOLEAN
         -- Unsigned ">=".
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "mutable_big_integer"
         feature_name: "mbi_unsigned_greater_or_equal"
         }"
      end

   unsigned_32_to_integer_64 (integer_32: INTEGER): INTEGER_64
         -- Return the unsigned value of the `integer_32'.
         --
         --|*** Ajouter ou pas cette fonction dans INTEGER_32 ? plug_in ou built_in ?(Dom. 27/02/2004) ***
         --|*** Or finally, do it as a simple C iniline? (Dom. 14/09/2007) ***
         --
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "mutable_big_integer"
         feature_name: "mbi_unsigned_32_to_integer_64"
         }"
      end

   storage_at (s: like storage; n: INTEGER): POINTER
         -- Give the address of the corresponding word of `s'.
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "mutable_big_integer"
         feature_name: "mbi_storage_at"
         }"
      end

   mbi_inc (integer_32_adr: POINTER): BOOLEAN
         -- Increment the value at `integer_32_adr'. The `Result' is True only in case of overflow.
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "mutable_big_integer"
         feature_name: "mbi_inc"
         }"
      end

   mbi_add (a, b: INTEGER; integer_32_adr: POINTER): BOOLEAN
         -- t.item(n) := a + b
         -- Overflow if "Result = True".
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "mutable_big_integer"
         feature_name: "mbi_add"
         }"
      end

   mbi_add_with_inc (a, b: INTEGER; integer_32_adr: POINTER): BOOLEAN
         -- t.item(n) := a + b + 1
         -- Overflow if "Result = True".
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "mutable_big_integer"
         feature_name: "mbi_add_with_inc"
         }"
      end

   mbi_dec (integer_32_adr: POINTER): BOOLEAN
         -- Put a - 1 in the item n in the NATIVE_ARRAY t.
         -- t.item(n) := a - 1
         -- Underflow if "Result = True".
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "mutable_big_integer"
         feature_name: "mbi_dec"
         }"
      end

   mbi_subtract (a, b: INTEGER; integer_32_adr: POINTER): BOOLEAN
         -- t.item(n) := a - b
         -- Underflow if "Result = True".
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "mutable_big_integer"
         feature_name: "mbi_subtract"
         }"
      end

   mbi_subtract_with_dec (a, b: INTEGER; integer_32_adr: POINTER): BOOLEAN
         -- t.item(n) := a - b - 1
         -- Underflow if "Result = True".
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "mutable_big_integer"
         feature_name: "mbi_subtract_with_dec"
         }"
      end

   mbi_multiply (a, b: INTEGER; integer_32_adr: POINTER): INTEGER_32
         -- put a * b in t@n and return the overflow.
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "mutable_big_integer"
         feature_name: "mbi_multiply"
         }"
      end

   mbi_multiply_with_add (a, b, c: INTEGER; integer_32_adr: POINTER): INTEGER_32
         -- put a * b + c in t@n and return the overflow.
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "mutable_big_integer"
         feature_name: "mbi_multiply_with_add"
         }"
      end

   mbi_multiply_with_2_add (a, b, c, d: INTEGER; integer_32_adr: POINTER): INTEGER_32
         -- put a * b + c + d in t@n and return the overflow.
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "mutable_big_integer"
         feature_name: "mbi_multiply_with_2_add"
         }"
      end

   mbi_divide (u1, u0, d: INTEGER; r_int32adr: POINTER): INTEGER_32
         -- Divide `u1u0' by `d', put the remainder in `r' and return the quotient.
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "mutable_big_integer"
         feature_name: "mbi_divide"
         }"
      end

   string_buffer: STRING
      once
         create Result.make(128)
      end

   unicode_string_buffer: UNICODE_STRING
      once
         create Result.make(128)
      end

invariant
   capacity > 0
   storage.is_not_null
   integer_length.in_range(0, capacity)
   integer_length /= 0 implies offset.in_range(0, capacity - integer_length) and item(offset + integer_length - 1) /= 0
   integer_length = 0 implies not negative
   capacity.is_a_power_of_2

end -- class MUTABLE_BIG_INTEGER
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
