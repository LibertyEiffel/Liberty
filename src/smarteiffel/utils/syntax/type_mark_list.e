-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TYPE_MARK_LIST
   -- a client list, to check permissions

inherit
   VISITABLE
      redefine is_equal
      end

insert
   GLOBALS
      redefine is_equal
      end

create {ANY}
   make_1, merge

feature {ANY}
   count: INTEGER is
      do
         if remainder = Void then
            Result := 1
         else
            Result := 2 + remainder.upper
         end
      end

   item (i: INTEGER): TYPE_MARK is
      require
         i.in_range(1, count)
      do
         if i = 1 then
            Result := first
         else
            Result := remainder.item(i - 2)
         end
      ensure
         Result /= Void
      end

   locate_in_error_handler is
         -- Add one or more related positions in the `error_handler'.
      local
         i: INTEGER; tm: TYPE_MARK
      do
         from
            i := 1
         until
            i > count
         loop
            tm := item(i)
            error_handler.add_position(tm.start_position)
            i := i + 1
         end
      end

   is_equal (other: like Current): BOOLEAN is
      local
         i: INTEGER
      do
         Result := other.count = count
         from
            i := 1
         until
            not Result or else i > count
         loop
            Result := item(i).is_equal(other.item(i))
            i := i + 1
         end
      ensure then
         Result = (wider_than(other) and other.wider_than(Current))
      end

   accept (visitor: TYPE_MARK_LIST_VISITOR) is
      do
         visitor.visit_type_mark_list(Current)
      end

feature {EIFFEL_PARSER, TYPE_MARK_LIST_VISITOR}
   add_last (tm: TYPE_MARK) is
      require
         tm /= Void
      local
         i: INTEGER
      do
         i := index_of(tm)
         if i > 0 then
            error_handler.add_position(item(i).start_position)
            error_handler.add_position(tm.start_position)
            error_handler.append(once "Same type appears more than once.")
            error_handler.print_as_warning
         end
         if remainder = Void then
            create remainder.with_capacity(4)
         end
         remainder.add_last(tm)
      ensure
         count = 1 + old count
         item(count) = tm
      end

feature {TYPE_MARK_LIST_VISITOR}
   index_of (tm: TYPE_MARK): INTEGER is
         -- Is `tm' a member of `Current' class name list?
         -- Gives 0 when `tm' is not in the `list'.
      require
         tm /= Void
      local
         tm_written_mark: STRING
      do
         from
            tm_written_mark := tm.written_mark
            Result := count
         until
            Result = 0 or else tm_written_mark = item(Result).written_mark
         loop
            Result := Result - 1
         end
      ensure
         Result.in_range(0, count)
         Result > 0 implies tm.written_mark = item(Result).written_mark
      end

feature {CLIENT_LIST}
   append_in (b: STRING) is
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > count
         loop
            if i > 1 then
               b.append(once ", ")
            end
            b.append(item(i).written_mark)
            i := i + 1
         end
      end

   pretty (indent_level: INTEGER) is
      local
         i: INTEGER; tm: TYPE_MARK
      do
         from
            i := 1
         until
            i > count
         loop
            tm := item(i)
            if not tm.written_mark.is_equal(once "NONE") then
               pretty_printer.put_string(tm.written_mark)
               if i < count then
                  pretty_printer.put_string(once ", ")
               end
            end
            i := i + 1
         end
      end

   gives_permission_to (tm: TYPE_MARK; target_type: TYPE): BOOLEAN is
      require
         not_done_to_report_errors: error_handler.is_empty -- required by try_class_text
         tm /= Void
      local
         i: INTEGER; item_type_mark: TYPE_MARK; tm_type: TYPE
      do
         if tm.written_mark = as_any then
            Result := gives_permission_to_any
         else
            tm_type := tm.resolve_in(target_type)
            from
               i := 1
            until
               Result or else i > count
            loop
               item_type_mark := item(i)
               if item_type_mark.written_mark = as_any then
                  -- All classes do "inherit" or at least "insert" ANY.
                  Result := True
               elseif tm.written_mark = item_type_mark.written_mark then
                  -- No need to look for the CLASS_TEXT, this is the same class.
                  Result := True
               else
                  item_type_mark := item_type_mark.to_static(target_type, True)
                  if item_type_mark.try_class_text = Void then
                     -- just an unknown class, no big deal in a client clause
                  else
                     Result := tm_type.insert_inherit_test(item_type_mark.type) /= unrelated_code
                  end
               end
               i := i + 1
            end
         end
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

   gives_permission_to_any: BOOLEAN is
      local
         i: INTEGER
      do
         from
            i := 1
         until
            Result or else i > count
         loop
            Result := item(i).written_mark = as_any
            i := i + 1
         end
      end

feature {CLIENT_LIST, TYPE_MARK_LIST}
   wider_than (other: like Current): BOOLEAN is
      require
         not_done_to_report_errors: error_handler.is_empty -- required by try_class_text
      local
         i, o: INTEGER; c, oc: CLASS_TEXT
      do
         from
            Result := True
            o := other.count
         until
            not Result or else o = 0
         loop
            oc := other.item(o).try_class_text
            if oc /= Void then
               from
                  Result := False
                  i := 1
               until
                  Result or else i > count
               loop
                  c := item(i).try_class_text
                  if c /= Void then
                     Result := oc = c or else oc.get_export_permission_of(c)
                  end
                  i := i + 1
               end
            end
            o := o - 1
         end
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

feature {}
   first: TYPE_MARK
   remainder: FAST_ARRAY[TYPE_MARK]

   make_1 (tm: TYPE_MARK) is
      require
         tm /= Void
      do
         first := tm
      ensure
         count = 1
         item(1) = tm
      end

   merge (l1, l2: like Current) is
      require
         l1 /= Void
         l2 /= Void
      local
         i: INTEGER; tm: TYPE_MARK
      do
         create remainder.with_capacity(l1.count + l2.count - 1)
         from
            first := l1.item(1)
            i := 2
         until
            i > l1.count
         loop
            remainder.add_last(l1.item(i))
            i := i + 1
         end
         from
            i := 1
         until
            i > l2.count
         loop
            tm := l2.item(i)
            if index_of(tm) = 0 then
               remainder.add_last(tm)
            end
            i := i + 1
         end
      end

invariant
   first /= Void
   remainder /= Void implies count = 1 + remainder.count

end -- class TYPE_MARK_LIST
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
