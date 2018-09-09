-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FEATURE_NAME_LIST
   --
   -- A list of FEATURE_NAME (simple feature names as well as infix or
   -- prefix names).
   --

inherit
   VISITABLE
insert
   GLOBALS

create {ANY}
   make_1, make_n

feature {ANY}
   first: FEATURE_NAME

   item (i: INTEGER): FEATURE_NAME
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

   count: INTEGER
      do
         if remainder = Void then
            Result := 1
         else
            Result := remainder.upper + 2
         end
      end

   has (fn: FEATURE_NAME): BOOLEAN
      require
         fn /= Void
      do
         Result := index_of(fn) > 0
      end

   internal_name (fn: FEATURE_NAME): FEATURE_NAME
         -- If present, give back the one actually stored in `Current'.
      require
         fn /= Void
      local
         i: INTEGER
      do
         if first.is_equal(fn) then
            Result := first
         elseif remainder /= Void then
            from
               i := remainder.lower
            until
               i > remainder.upper or else fn.is_equal(remainder.item(i))
            loop
               i := i + 1
            end
            if remainder.valid_index(i) then
               Result := remainder.item(i)
            end
         end
      end

   pretty (indent_level: INTEGER)
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > count
         loop
            item(i).declaration_pretty_print
            i := i + 1
            if i <= count then
               pretty_printer.put_string(once ", ")
               if pretty_printer.column > pretty_printer.wrap_limit then
                  pretty_printer.set_indent_level(indent_level)
               end
            end
         end
      end

   short
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > count
         loop
            crash
            --|*** Missing argument now detected by the new compiler ! (Dom. march 29th 2004)
            --|*** item(i).short
            i := i + 1
            if i <= count then
               short_printer.hook_or("fnl_sep", ", ")
            end
         end
      end

   all_positions_in_error_handler
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > count
         loop
            error_handler.add_position(item(i).start_position)
            i := i + 1
         end
      end

   accept (visitor: FEATURE_NAME_LIST_VISITOR)
      do
         visitor.visit_feature_name_list(Current)
      end

feature {EIFFEL_PARSER}
   add_last (fn: FEATURE_NAME)
      require
         fn /= Void
      local
         fn2: FEATURE_NAME
      do
         fn2 := internal_name(fn)
         if fn2 /= Void then
            fe_multiple(fn2, fn)
         end
         if remainder = Void then
            create remainder.with_capacity(4)
         end
         remainder.add_last(fn)
      ensure
         count = 1 + old count
         item(count) = fn
      end

feature {FEATURE_CLAUSE}
   for_short (fc: FEATURE_CLAUSE; heading_done: BOOLEAN; bcn: CLASS_NAME; parent, type: TYPE; client: TYPE_MARK): BOOLEAN
      require
         not_done_to_report_errors: error_handler.is_empty -- required by gives_permission_to
      local
         i: INTEGER; fn: FEATURE_NAME; fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE; cl: CLIENT_LIST
      do
         Result := heading_done
         from
            i := 1
         until
            i > count
         loop
            fn := item(i)
            fs := parent.lookup(fn)
            fs := fs.resolve_static_binding_for(parent, type)
            af := fs.anonymous_feature(type)
            fn := type.get_feature_name(fs)
            if af.obsolete_mark = Void then
               cl := af.permissions
               check
                  cl /= Void
               end
               if client = Void or else cl.gives_permission_to(client, type) then
                  if not short_printer.has(fn, af) then
                     if short_printer.sort_flag then
                        short_printer.delayed_output_of(fn, af)
                     else
                        if not Result then
                           Result := True
                           fc.do_heading_for_short(bcn)
                        end
                        short_printer.immediate_output_of(fn, af)
                     end
                  end
               end
            end
            i := i + 1
         end
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

feature {RUN_FEATURE_1}
   index_of (fn: FEATURE_NAME): INTEGER
      require
         fn /= Void
      do
         if first.is_equal(fn) then
            Result := 1
         elseif remainder /= Void then
            from
               Result := remainder.upper
            until
               Result < 0 or else fn.is_equal(remainder.item(Result))
            loop
               Result := Result - 1
            end
            if Result < 0 then
               Result := 0
            else
               Result := Result + 2
            end
         end
      ensure
         Result.in_range(0, count)
         Result > 0 implies fn.is_equal(item(Result))
      end

feature {CREATION_CLAUSE}
   has_make: BOOLEAN
         -- Is the "make" name member of this list ?
      local
         i: INTEGER
      do
         from
            i := 1
         until
            Result or else i > count
         loop
            if item(i).to_string = as_make then
               Result := True
            end
            i := i + 1
         end
      end

   root_creation_search (a_name: STRING): FEATURE_NAME
      local
         i: INTEGER; fn: FEATURE_NAME
      do
         from
            i := 1
         until
            Result /= Void or else i > count
         loop
            fn := item(i)
            if fn.to_string.is_equal(a_name) then
               Result := fn
            end
            i := i + 1
         end
      end

feature {}
   remainder: FAST_ARRAY[FEATURE_NAME]
         -- Non Void when the list has more than one element.

   make_1 (fn: FEATURE_NAME)
      require
         fn /= Void
      do
         first := fn
      ensure
         count = 1
         item(1) = fn
      end

   make_n (list: FAST_ARRAY[FEATURE_NAME])
         -- Note: also check for multiple occurrences.
      require
         list.count > 1
      local
         i, j: INTEGER
      do
         from
            i := list.lower
         until
            i > list.upper
         loop
            from
               j := i + 1
            until
               j > list.upper
            loop
               if list.item(i).is_equal(list.item(j)) then
                  fe_multiple(list.item(i), list.item(j))
               end
               j := j + 1
            end
            i := i + 1
         end
         first := list.item(0)
         i := list.upper
         if i > 0 then
            from
               create remainder.make(i)
               j := 0
            until
               i = 0
            loop
               remainder.put(list.item(j + 1), j)
               j := j + 1
               i := i - 1
            end
         end
      ensure
         count = list.count
      end

   fe_multiple (fn1, fn2: FEATURE_NAME)
      do
         error_handler.add_position(fn1.start_position)
         error_handler.add_position(fn2.start_position)
         error_handler.append(once "Same feature name appears twice.")
         error_handler.print_as_fatal_error
      end

invariant
   first /= Void

   remainder /= Void implies count = 1 + remainder.count

end -- class FEATURE_NAME_LIST
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
