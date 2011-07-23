-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FORMAL_GENERIC_ARG
   --
   -- To store one formal generic argument.
   --

inherit
   VISITABLE

insert
   GLOBALS

creation {ANY}
   make

feature {ANY}
   accept (visitor: FORMAL_GENERIC_ARG_VISITOR) is
      do
         visitor.visit_formal_generic_arg(Current)
      end

feature {ANY}
   name: CLASS_NAME
         -- Name of the formal generic argument.

   constraint: TYPE_MARK
         -- Non Void if any.

   rank: INTEGER
         -- In the corresponding declation list.

   constrained: BOOLEAN is
      do
         Result := constraint /= Void
      end

   start_position: POSITION is
      do
         Result := name.start_position
      end

   pretty is
      do
         name.pretty(1)
         if constraint /= Void then
            pretty_printer.put_string(once " -> ")
            pretty_printer.put_type_mark(constraint)
         end
      end

   short (type: TYPE) is
      do
         short_printer.put_class_name_without_link(name)
         if constrained then
            short_printer.hook_or("arrow", "->")
            constraint.short(type)
         end
      end

feature {FORMAL_GENERIC_LIST}
   generic_formal_arguments_check is
      local
         class_text: CLASS_TEXT
      do
         class_text := smart_eiffel.class_text(name, False)
         if class_text /= Void then
            error_handler.add_position(name.start_position)
            error_handler.add_position(class_text.name.start_position)
            error_handler.append("A formal generic argument must not use the name of some existing class.")
            error_handler.print_as_error
            error_handler.add_position(name.start_position)
            error_handler.append("You have to use another name for this formal generic argument. %
                                 %The common usage is to add an extra trailing underscore character %
                                 %(see for example COLLECTION, ARRAY or DICTIONARY).")
            error_handler.print_as_fatal_error
         end
      end

   set_rank (r: like rank) is
      require
         r > 0
      do
         rank := r
      ensure
         rank = r
      end

   constraint_substitution (fga: like Current; r: INTEGER) is
         -- Substitute in the previously read `Current' `constraint'
         -- all occurrences of `fga' which will be added at rank `r'.
      local
         fgan: STRING; cn: CLASS_NAME
      do
         if constraint /= Void then
            fgan := fga.name.to_string
            if constraint.is_formal_generic then
            elseif constraint.is_generic then
               substitute(constraint.generic_list, fga, r, fgan)
            else
               cn := constraint.class_text_name
               if fgan = cn.to_string then
                  create {FORMAL_GENERIC_TYPE_MARK} constraint.make(cn, fga, r)
               end
            end
         end
      end

feature {}
   substitute (gl: ARRAY[TYPE_MARK]; fga: like Current; r: INTEGER; fgan: STRING) is
         -- Substitute recursively all occurrences of `fgan' in `gl'.
      require
         gl /= Void
         fgan = fga.name.to_string
      local
         i: INTEGER; tfg: FORMAL_GENERIC_TYPE_MARK; t: TYPE_MARK; cn: CLASS_NAME
      do
         from
            i := gl.upper
         until
            i < gl.lower
         loop
            t := gl.item(i)
            if t.is_formal_generic then
            elseif t.is_generic then
               substitute(t.generic_list, fga, r, fgan)
            else
               cn := t.class_text_name
               if fgan = cn.to_string then
                  create tfg.make(cn, fga, r)
                  gl.put(tfg, i)
               end
            end
            i := i - 1
         end
      end

   make (n: like name; c: like constraint) is
      require
         n /= Void
      do
         name := n
         constraint := c
      ensure
         name = n
         constraint = c
      end

invariant
   name /= Void

end -- class FORMAL_GENERIC_ARG
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
