-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright (C) 2006-2017: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
-- associated documentation files (the "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
-- following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
-- USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://ese.sourceforge.net
-- -----------------------------------------------------------------------------------------------------------
deferred class EDC_COLUMN
   --
   -- Untyped - see also its unique child EDC_TYPED_COLUMN
   --

insert
   EDC_CONSTANTS
      redefine is_equal
      end
   VISITABLE
      redefine is_equal
      end

feature {ANY}
   table: EDC_TABLE

   name: STRING

   is_equal (other: EDC_COLUMN): BOOLEAN
      do
         Result := name.is_equal(other.name) and then table /= Void and then other.table /= Void and then (table = other.table or else table.is_equal(other.table))
      end

   valid_value (a_value: EDC_DATUM): BOOLEAN
      deferred
      end

   same_values (v1, v2: EDC_DATUM): BOOLEAN
      deferred
      end

   hash_code (a_value: EDC_DATUM): INTEGER
      require
         valid_value(a_value)
      deferred
      end

feature {ANY}
   count_constraint: INTEGER
      do
         if constraints /= Void then
            Result := constraints.count
         end
      end

   lower_constraint: INTEGER
      do
         if constraints /= Void then
            Result := constraints.lower
         end
      end

   upper_constraint: INTEGER
      do
         if constraints /= Void then
            Result := constraints.upper
         else
            Result := -1
         end
      end

   item_constraint (i: INTEGER): EDC_CONSTRAINT
      require
         i.in_range(lower_constraint, upper_constraint)
      do
         Result := constraints.item(i)
      end

   set_constraint (a_constraint: EDC_CONSTRAINT)
      do
         if constraints = Void then
            create constraints.make
         end
         constraints.add(a_constraint)
      end

   clear_constraint (a_constraint: EDC_CONSTRAINT)
      do
         if constraints /= Void then
            constraints.remove(a_constraint)
         end
      end

feature {ANY}
   item (set: EDC_RESULT_SET): EDC_DATUM
      require
         not set.is_off
      deferred
      end

feature {EDC_TABLE}
   set_table (a_table: like table)
      require
         a_table /= Void
         table = Void
      do
         table := a_table
      ensure
         table = a_table
      end

   unset_table
      require
         table /= Void
      do
         table := Void
      ensure
         table = Void
      end

feature {}
   constraints: HASHED_SET[EDC_CONSTRAINT]

invariant
   name.count > 0

end -- class EDC_COLUMN
