-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FEATURE_CLAUSE
   --
   -- The syntactical contents of some feature clause.
   -- Note: for a `pretty' pretty_printing, it is obviously necessary to store
   -- exactly the original contents (in the source file) of a feature clause.
   --

inherit
   VISITABLE
insert
   GLOBALS

create {ANY}
   make

feature {ANY}
   clients: CLIENT_LIST
         -- The `clients' allowed to use these features.

   comment: COMMENT
         -- The heading comment coming with the clause.

   class_text: CLASS_TEXT
         -- The one where `Current' is written.

   pretty
      do
         if list = Void or else list.is_empty or else not list.first.is_inline_agent then
            do_pretty
         end
      end

   start_position: POSITION
      do
         if clients /= Void then
            Result := clients.start_position
         end
      end

feature {FEATURE_CLAUSE_LIST}
   for_short (bcn: CLASS_NAME; parent, type: TYPE; client: TYPE_MARK)
      require
         not_done_to_report_errors: error_handler.is_empty -- required by gives_permission_to
      local
         i: INTEGER; ft: FEATURE_TEXT; heading_done: BOOLEAN
      do
         if list /= Void then
            if client = Void or else clients.gives_permission_to(client, type) then
               from
                  i := list.lower
               until
                  i > list.upper
               loop
                  ft := list.item(i)
                  heading_done := ft.names.for_short(Current, heading_done, bcn, parent, type, client)
                  i := i + 1
               end
            end
         end
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

feature {FEATURE_NAME_LIST}
   do_heading_for_short (bcn: CLASS_NAME)
      do
         if comment = Void then
            short_printer.hook_or("hook202", "feature(s) from ")
            short_printer.put_class_name(bcn)
            short_printer.hook_or("hook203", "%N")
         else
            short_printer.hook_or("hook204", "feature(s) from ")
            short_printer.put_class_name(bcn)
            short_printer.hook_or("hook205", "%N")
            comment.short("hook206", "   --", "hook207", "%N")
            short_printer.hook_or("hook208", "")
         end
      end

feature {FEATURE_CLAUSE_LIST}
   add_into (fd: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME])
      require
         fd /= Void
      local
         i: INTEGER; feature_text: FEATURE_TEXT
      do
         if list /= Void then
            from
               i := 0
            until
               i > list.upper
            loop
               feature_text := list.item(i)
               feature_text.add_into(Current, fd)
               i := i + 1
            end
         end
      end

feature {ANY}
   accept (visitor: FEATURE_CLAUSE_VISITOR)
      do
         visitor.visit_feature_clause(Current)
      end

feature {FEATURE_CLAUSE_VISITOR}
   list: FAST_ARRAY[FEATURE_TEXT]
         -- Only the features of the current clause. (Actually, this is useful
         -- only for `pretty' because all features of a class are grouped in a
         -- single DICTIONARY (see CLASS_TEXT).

feature {}
   make (ct: like class_text; c: like clients; cm: COMMENT; l: like list)
      require
         ct /= Void
         c /= Void
         l /= Void implies not l.is_empty
      do
         class_text := ct
         clients := c
         comment := cm
         list := l
      ensure
         class_text = ct
         clients = c
         comment = cm
         list = l
      end

   do_pretty
      local
         i: INTEGER
      do
         if not pretty_printer.zen_mode then
            pretty_printer.skip_one_line
         end
         pretty_printer.set_indent_level(0)
         pretty_printer.keyword(once "feature")
         clients.pretty(1)
         if comment /= Void then
            comment.pretty(1)
         end
         if list /= Void then
            from
               i := list.lower
            until
               i > list.upper
            loop
               if pretty_printer.parano_mode then
                  pretty_printer.skip_one_line
               end
               pretty_printer.set_indent_level(1)
               list.item(i).pretty
               pretty_printer.skip_one_line
               i := i + 1
            end
         end
         pretty_printer.skip_one_line
      end

invariant
   clients /= Void

   list /= Void implies not list.is_empty

   class_text /= Void

end -- class FEATURE_CLAUSE
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
