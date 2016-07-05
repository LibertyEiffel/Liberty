-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class PARENT_LISTS
   --
   -- To store both the "inherit" and the "insert" parent list of a class.
   --

inherit
   VISITABLE

insert
   GLOBALS

create {CLASS_TEXT}
   make

feature {ANY}
   class_text: CLASS_TEXT
         -- Where the parent list is written.

   inherit_comment: COMMENT
         -- Comment just after the "inherit" keyword.

   insert_comment: COMMENT
         -- Comment just after the "insert" keyword.

   default_insert_any_added_flag: BOOLEAN
         -- This flag indicates that ANY has been automatically added in the `insert_list' in order to reach
         -- the canonical form (necessary for `pretty' and for error messages printing).

   class_text_name: CLASS_NAME
      do
         Result := class_text.name
      end

   accept (visitor: PARENT_LISTS_VISITOR)
      do
         visitor.visit_parent_lists(Current)
      end

feature {PARENT_LISTS_VISITOR, PARENT_LISTS_HANDLER, CLASS_TEXT, LIVE_TYPE}
    inherit_count: INTEGER
       do
         if inherit_list /= Void then
            Result := inherit_list.count
         end
      end

    insert_count: INTEGER
       do
         if insert_list /= Void then
            Result := insert_list.count
         end
      end

feature {CLASS_TEXT}
   inherit_edge (i: INTEGER): PARENT_EDGE
      require
         i.in_range(1, inherit_count)
      do
         Result := inherit_list.item(i - 1)
      end

   insert_edge (i: INTEGER): PARENT_EDGE
      require
         i.in_range(1, insert_count)
      do
         Result := insert_list.item(i - 1)
      end

    undefine_position_of (fn: FEATURE_NAME): POSITION
          --|*** PH(31/03/04): I think it should be removed.
          -- Search the POSITION of `fn' in one undefine lists.
       require
          fn /= Void
       local
          fn2: FEATURE_NAME; i: INTEGER
       do
         if inherit_list /= Void then
            from
               i := inherit_list.lower
            until
               fn2 /= Void
            loop
               fn2 := inherit_list.item(i).get_undefine(fn)
               i := i + 1
            end
         end
         if insert_list /= Void then
            from
               i := insert_list.lower
            until
               fn2 /= Void
            loop
               fn2 := insert_list.item(i).get_undefine(fn)
               i := i + 1
            end
          end
          Result := fn2.start_position
       ensure
          not Result.is_unknown
       end

    id_extra_information (tfw: TEXT_FILE_WRITE)
       local
          i: INTEGER
       do
         if inherit_list /= Void then
            i := inherit_list.count
         end
         if insert_list /= Void then
            i := i + insert_list.count
         end
          tfw.put_integer(i)
         if inherit_list /= Void then
            tfw.put_string(once " inherit: ")
            from
               i := inherit_list.lower
            until
               i > inherit_list.upper
            loop
               inherit_list.item(i).id_extra_information(tfw)
               i := i + 1
               if i <= inherit_list.upper then
                  tfw.put_character(' ')
               end
            end
         end
         if insert_list /= Void then
            tfw.put_string(once " insert: ")
            from
               i := insert_list.lower
            until
               i > insert_list.upper
            loop
               insert_list.item(i).id_extra_information(tfw)
               tfw.put_character(' ')
               i := i + 1
            end
         end
       end

    get_permission_of (other: CLASS_TEXT): BOOLEAN
      require
          not other.is_any
       local
          i: INTEGER; bc: CLASS_TEXT; parent_edge: PARENT_EDGE
       do
         if inherit_list /= Void then
            from
               i := inherit_list.lower
            until
               Result or else i > inherit_list.upper
            loop
               parent_edge := inherit_list.item(i)
               if parent_edge.class_text_name /= as_any then
                  bc := parent_edge.class_text
                  check
                     bc /= Void
                  end
                  Result := other = bc or else bc.get_export_permission_of(other)
               end
               i := i + 1
            end
         end
         if insert_list /= Void then
            from
               i := insert_list.lower
            until
               Result or else i > insert_list.upper
            loop
               parent_edge := insert_list.item(i)
               if parent_edge.class_text_name /= as_any then
                  bc := parent_edge.class_text
                  check
                     bc /= Void
                  end
                  Result := other = bc or else bc.get_export_permission_of(other)
               end
               i := i + 1
            end
          end
       end

    header_comment_for_class_invariant (class_invariant: CLASS_INVARIANT)
       local
          i: INTEGER
       do
         if inherit_list /= Void then
            from
               i := inherit_list.lower
            until
               class_invariant.header_comment /= Void or else i > inherit_list.upper
            loop
               inherit_list.item(i).class_text.header_comment_for_class_invariant(class_invariant)
               i := i + 1
            end
         end
         if insert_list /= Void then
            from
               i := insert_list.lower
            until
               class_invariant.header_comment /= Void or else i > insert_list.upper
            loop
               insert_list.item(i).class_text.header_comment_for_class_invariant(class_invariant)
               i := i + 1
            end
         end
       end

    initialize_and_check_level_1
       local
          i: INTEGER
       do
         if inherit_list /= Void then
            from
               i := inherit_list.lower
            until
               i > inherit_list.upper
            loop
               inherit_list.item(i).initialize_and_check_level_1(Current)
               i := i + 1
            end
         end
         if insert_list /= Void then
            from
               i := insert_list.lower
            until
               i > insert_list.upper
            loop
               insert_list.item(i).initialize_and_check_level_1(Current)
               i := i + 1
            end
         end
       end

   check_level_2 (type: TYPE)
      require
         type.class_text = class_text
       local
          i: INTEGER
      do
         if inherit_list /= Void then
            from
               i := inherit_list.lower
            until
               i > inherit_list.upper
            loop
               inherit_list.item(i).check_level_2(type)
               i := i + 1
            end
         end
         if insert_list /= Void then
            from
               i := insert_list.lower
            until
               i > insert_list.upper
            loop
               insert_list.item(i).check_level_2(type)
               i := i + 1
            end
         end
      end

   pretty
      local
         i: INTEGER
      do
         pretty_printer.set_indent_level(0)
         if not pretty_printer.zen_mode then
            pretty_printer.skip_one_line
         end
         if inherit_list /= Void then
            pretty_printer.set_indent_level(0)
            pretty_printer.keyword(once "inherit")
            pretty_printer.set_indent_level(1)
            if inherit_comment /= Void then
               inherit_comment.pretty(1)
            end
            from
               i := inherit_list.lower
            until
               i > inherit_list.upper
            loop
               inherit_list.item(i).pretty
               i := i + 1
            end
            pretty_printer.set_indent_level(0)
         end
         if insert_list /= Void and then not default_insert_any_added_flag then
            if inherit_list /= Void then
               pretty_printer.set_indent_level(0)
               pretty_printer.put_character('%N')
            end
            pretty_printer.set_indent_level(0)
            pretty_printer.keyword(once "insert")
            pretty_printer.set_indent_level(1)
            if insert_comment /= Void then
               insert_comment.pretty(1)
            end
            if not default_insert_any_added_flag then
               from
                  i := insert_list.lower
               until
                  i > insert_list.upper
               loop
                  insert_list.item(i).pretty
                  i := i + 1
               end
            end
         end
         pretty_printer.set_indent_level(0)
      end

feature {TYPE, PARENT_LISTS_VISITOR, PARENT_LISTS_HANDLER, TAGGER}
   inherit_list: FAST_ARRAY[PARENT_EDGE]
         -- The Void or non-empty list after the "inherit" keyword.
         -- (Items are in the same order as they are in the source text file.)

   insert_list: FAST_ARRAY[PARENT_EDGE]
         -- The Void or non-empty list after the "insert" keyword.
         -- (Items are in the same order as they are in the source text file.)

feature {TYPE}
   set_insert_member (i: INTEGER)
         -- Makes the `i'th member of the `inherit_list' a member of the `insert_list' instead
      require
         i.in_range(0, inherit_count - 1)
      local
         a_parent_edge: PARENT_EDGE
      do
         if insert_list = Void then
            create insert_list.with_capacity(1)
         end
         a_parent_edge := inherit_list.item(i)
         a_parent_edge.set_insert_member
         insert_list.add_last(a_parent_edge)
         inherit_list.remove(i)
         if inherit_list.is_empty then
            inherit_list := Void
         end
      ensure
         insert_list.last = old inherit_list.item(i)
         insert_list.last.is_insert_member
      end

feature {}
   make (ct: like class_text; hc1: like inherit_comment; l1: like inherit_list;
         hc2: like insert_comment; l2: like insert_list)
      require
         not ct.is_any -- Because class ANY must have no parent to avoid cycles.
      local
         any_type_mark: ANY_TYPE_MARK
      do
         class_text := ct
         inherit_comment := hc1
         inherit_list := l1
         insert_comment := hc2
         insert_list := l2
         if insert_list = Void and then inherit_list = Void then
            default_insert_any_added_flag := True
            create insert_list.with_capacity(1)
            create any_type_mark.make(ct.name.start_position)
            insert_list.add_last(create {PARENT_EDGE}.make(True, any_type_mark))
         end
      ensure
         class_text = ct
         inherit_comment = hc1
         inherit_list = l1
         insert_comment = hc2
         default_insert_any_added_flag xor insert_list = l2
      end

   em1: STRING "Inheritance clash."

invariant
   class_text /= Void

   insert_list /= Void implies not insert_list.is_empty

   inherit_list /= Void implies not inherit_list.is_empty;

   (not class_text.is_any) implies (inherit_count + insert_count > 0)
      --*** DO THE "ANY" CLASS MUST HAVE A PARENT_LISTS OBJECT OR NOT?
      --*** According to {CLASS_TEXT}.create_parent_lists_using, ANY
      --has no parent_lists object. We must make a clear decision and
      --check that with invariant.

end -- class PARENT_LISTS
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
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
