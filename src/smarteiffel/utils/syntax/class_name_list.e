-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CLASS_NAME_LIST

inherit
   VISITABLE
      redefine is_equal
      end

insert
   GLOBALS
      redefine is_equal
      end

creation {ANY}
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

   item (i: INTEGER): CLASS_NAME is
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
         i: INTEGER; cn: CLASS_NAME
      do
         from
            i := 1
         until
            i > count
         loop
            cn := item(i)
            error_handler.add_position(cn.start_position)
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

   accept (visitor: CLASS_NAME_LIST_VISITOR) is
      do
         visitor.visit_class_name_list(Current)
      end

feature {EIFFEL_PARSER, CLASS_NAME_LIST_VISITOR}
   add_last (cn: CLASS_NAME) is
      require
         cn /= Void
      local
         i: INTEGER
      do
         i := index_of(cn)
         if i > 0 then
            error_handler.add_position(item(i).start_position)
            error_handler.add_position(cn.start_position)
            error_handler.append(once "Same class name appears more than once.")
            error_handler.print_as_warning
         end
         if remainder = Void then
            create remainder.with_capacity(4)
         end
         remainder.add_last(cn)
      ensure
         count = 1 + old count
         item(count) = cn
      end

feature {CLASS_NAME_LIST_VISITOR}
   index_of (cn: CLASS_NAME): INTEGER is
         -- Is `cn' a member of `Current' class name list?
         -- Gives 0 when `cn' is not in the `list'.
      require
         cn /= Void
      local
         cn_to_string: STRING
      do
         from
            cn_to_string := cn.to_string
            Result := count
         until
            Result = 0 or else cn_to_string = item(Result).to_string
         loop
            Result := Result - 1
         end
      ensure
         Result.in_range(0, count)
         Result > 0 implies cn.to_string = item(Result).to_string
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
            b.append(item(i).to_string)
            i := i + 1
         end
      end

   pretty (indent_level: INTEGER) is
      local
         i: INTEGER; cn: CLASS_NAME
      do
         from
            i := 1
         until
            i > count
         loop
            cn := item(i)
            if not cn.to_string.is_equal(once "NONE") then
               cn.pretty(indent_level)
               if i < count then
                  pretty_printer.put_string(once ", ")
               end
            end
            i := i + 1
         end
      end

   gives_permission_to (cn: CLASS_NAME): BOOLEAN is
      require
         not_done_to_report_errors: error_handler.is_empty -- required by try_class_text
         cn /= Void
      local
         i: INTEGER; item_class_name: CLASS_NAME; cn_class_text, item_class_text: CLASS_TEXT
      do
         if cn.to_string = as_any then
            Result := gives_permission_to_any
         else
            from
               i := 1
            until
               Result or else i > count
            loop
               item_class_name := item(i)
               if item_class_name.to_string = as_any then
                  -- All classes do "inherit" or at least "insert" ANY.
                  Result := True
               elseif cn.to_string = item_class_name.to_string then
                  -- No need to look for the CLASS_TEXT, this is the same class.
                  Result := True
               else
                  item_class_text := item_class_name.try_class_text
                  if item_class_text = Void then
                     -- May be this exportation is for some other library. No fear.
                  else
                     if cn_class_text = Void then
                        cn_class_text := cn.class_text
                     end
                     check
                        handled_before: cn_class_text /= item_class_text
                     end
                     Result := cn_class_text.get_export_permission_of(item_class_text)
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
            Result := item(i).to_string = as_any
            i := i + 1
         end
      end

feature {CLIENT_LIST, CLASS_NAME_LIST}
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
   first: CLASS_NAME

   remainder: FAST_ARRAY[CLASS_NAME]

   make_1 (cn: CLASS_NAME) is
      require
         cn /= Void
      do
         first := cn
      ensure
         count = 1
         item(1) = cn
      end

   merge (l1, l2: like Current) is
      require
         l1 /= Void
         l2 /= Void
      local
         i: INTEGER; cn: CLASS_NAME
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
            cn := l2.item(i)
            if index_of(cn) = 0 then
               remainder.add_last(cn)
            end
            i := i + 1
         end
      end

invariant
   first /= Void

   remainder /= Void implies count = 1 + remainder.count

end -- class CLASS_NAME_LIST
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
