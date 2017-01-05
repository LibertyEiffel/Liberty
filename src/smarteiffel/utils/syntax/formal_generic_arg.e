-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
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

create {ANY}
   make

feature {ANY}
   accept (visitor: FORMAL_GENERIC_ARG_VISITOR)
      do
         visitor.visit_formal_generic_arg(Current)
      end

feature {ANY}
   name: CLASS_NAME
         -- Name of the formal generic argument.

   constraint: TYPE_MARK
         -- Non Void if any.

   rank: INTEGER
         -- In the corresponding declaration list.

   constrained: BOOLEAN
      do
         Result := constraint /= Void
      end

   start_position: POSITION
      do
         Result := name.start_position
      end

   pretty
      do
         name.pretty(1)
         if constraint /= Void then
            pretty_printer.put_string(once " -> ")
            pretty_printer.put_type_mark(constraint)
         end
      end

   short (type: TYPE)
      do
         short_printer.put_class_name_without_link(name)
         if constrained then
            short_printer.hook_or("arrow", "->")
            constraint.short(type)
         end
      end

feature {}
   class_name_cache: CLASS_NAME
      once
         create Result.unknown_position(string_aliaser.hashed_string(as_any), True)
      end

feature {FORMAL_GENERIC_LIST}
   generic_formal_arguments_check
      local
         class_text: CLASS_TEXT
      do
         class_name_cache.make(name.hashed_name, name.start_position, True)
         class_text := smart_eiffel.class_text(class_name_cache)
         if class_text /= Void then
            error_handler.add_position(name.start_position)
            error_handler.add_position(class_text.name.start_position)
            error_handler.append(once "A formal generic argument should not use the name of some existing class (VCFG).")
            error_handler.print_as_warning
         end
         if name.to_string.last /= '_' then
            error_handler.add_position(name.start_position)
            error_handler.append(once "You should consider using another name for this formal generic argument. %
                                      %The common usage is to add an extra trailing underscore character %
                                      %(see for example COLLECTION, ARRAY or DICTIONARY).")
            error_handler.print_as_style_warning
         end
      end

   set_rank (r: like rank)
      require
         r > 0
      do
         rank := r
      ensure
         rank = r
      end

   constraint_substitution (fga: like Current; r: INTEGER)
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
   substitute (gl: ARRAY[TYPE_MARK]; fga: like Current; r: INTEGER; fgan: STRING)
         -- Substitute recursively all occurrences of `fgan' in `gl'.
      require
         gl /= Void
         fgan = fga.name.to_string
      local
         i: INTEGER; tfg: FORMAL_GENERIC_TYPE_MARK; t: TYPE_MARK; cn: CLASS_NAME
      do
         from
            i := gl.lower
         until
            i > gl.upper
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
            i := i + 1
         end
      end

   make (n: like name; c: like constraint)
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
