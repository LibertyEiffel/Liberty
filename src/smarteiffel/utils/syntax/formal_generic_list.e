-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FORMAL_GENERIC_LIST
   --
   -- To store the list of formal generic arguments of a generic
   -- class :
   --              [X,Y->Z]
   --

inherit
   VISITABLE

insert
   GLOBALS

create {ANY}
   make

feature {ANY}
   start_position: POSITION
         -- Of the opening square bracket.

   count: INTEGER
      do
         Result := list.count
      end

   item (i: INTEGER): FORMAL_GENERIC_ARG
      require
         i.in_range(1, count)
      do
         Result := list.item(i)
      ensure
         Result /= Void
      end

   pretty
      local
         i: INTEGER
      do
         pretty_printer.put_character('[')
         from
            i := list.lower
         until
            i > list.upper
         loop
            list.item(i).pretty
            i := i + 1
            if i <= list.upper then
               pretty_printer.put_string(once ", ")
            end
         end
         pretty_printer.put_character(']')
      end

   short (type: TYPE)
      local
         i: INTEGER
      do
         short_printer.hook_or("open_sb", "[")
         from
            i := list.lower
         until
            i > list.upper
         loop
            list.item(i).short(type)
            i := i + 1
            if i <= list.upper then
               short_printer.hook_or("fgl_sep", ", ")
            end
         end
         short_printer.hook_or("close_sb", "]")
      end

feature {TYPE, GENERIC_TYPE_MARK}
   constraint_genericity_check (t: TYPE; actual_list: ARRAY[TYPE_MARK]; actual_position: POSITION)
      require
         actual_list.count = count
      local
         i: INTEGER; fga: FORMAL_GENERIC_ARG; formal, static_formal, actual: TYPE_MARK
         actual_type, formal_type: TYPE
      do
         if not no_generic_constraint_flag then
            no_generic_constraint_flag := True
            from
               i := list.lower
            until
               i > list.upper
            loop
               fga := list.item(i)
               formal := fga.constraint
               if formal /= Void then
                  no_generic_constraint_flag := False
--|*** Not true for classes like FOO[A,B->BAR[A]] or FOO[A,B->A]
--|*** check
--|*** formal.is_static
--|*** end
                  actual := actual_list.item(i)
                  check
                     actual.is_static
                  end
                  actual_type := actual.type
                  formal.specialize_in(t)
                  static_formal := formal.to_static(t, False)
                  formal_type := static_formal.type
                  if actual_type = formal_type then
                     -- Allowed generic derivation!
                  elseif actual_type.insert_inherit_test(formal_type) = unrelated_code then
                     error_handler.add_position(actual_position)
                     error_handler.add_position(formal.start_position)
                     error_handler.append(once "Actual generic derivation ")
                     error_handler.append(actual_type.name.to_string)
                     error_handler.append(once " must insert ")
                     error_handler.append(formal_type.name.to_string)
                     error_handler.append(once " which is the generic constraint.")
                     error_handler.print_as_error
                     --
                     error_handler.add_position(actual_position)
                     error_handler.add_position(list.item(i).start_position)
                     error_handler.append(once " Constraint Generic Violation.")
                     error_handler.print_as_fatal_error
                  end
               end
               i := i + 1
            end
         end
      end

feature {CLASS_TEXT}
   generic_formal_arguments_check
      local
         i: INTEGER
      do
         from
            i := list.lower
         until
            i > list.upper
         loop
            list.item(i).generic_formal_arguments_check
            i := i + 1
         end
      end

feature {EIFFEL_PARSER}
   add_last (fga: FORMAL_GENERIC_ARG)
      require
         fga /= Void
      local
         fga2: FORMAL_GENERIC_ARG; i: INTEGER; n1, n2: STRING
      do
         from
            i := list.lower
            fga.set_rank(list.count + 1)
            n1 := fga.name.to_string
         until
            i > list.upper
         loop
            fga2 := list.item(i)
            n2 := fga2.name.to_string
            if n1 = n2 then
               error_handler.add_position(fga.start_position)
               error_handler.add_position(fga2.start_position)
               error_handler.append(once "Formal generic name appears twice in %
                %formal generic list (VCFG.2).")
               error_handler.print_as_fatal_error
            end
            fga2.constraint_substitution(fga, list.upper + 1)
            i := i + 1
         end
         list.add_last(fga)
      end

feature {ANY}
   accept (visitor: FORMAL_GENERIC_LIST_VISITOR)
      do
         visitor.visit_formal_generic_list(Current)
      end

feature {}
   list: ARRAY[FORMAL_GENERIC_ARG]

   make (sp: like start_position)
      require
         not sp.is_unknown
      do
         create list.with_capacity(4, 1)
         start_position := sp
      ensure
         start_position = sp
      end

   no_generic_constraint_flag: BOOLEAN
         -- To speed up `constraint_genericity_check'.

end -- class FORMAL_GENERIC_LIST
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
