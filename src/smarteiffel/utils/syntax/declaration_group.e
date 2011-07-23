-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class DECLARATION_GROUP
   --
   -- When a group of variable have the same type mark.
   --
   -- Exemple 1 :
   --         local
   --           foo, bar : ZOO
   --           --------------
   --
   -- Exemple 2 :
   --         bip(foo, bar : ZOO) is
   --             --------------
   --
   -- See Eiffel3 grammar for more details.
   --
   -- Note : it is necessary to have a good pretty pretty_printing to store
   --        the user's original text.
   --

inherit
   DECLARATION

creation {EIFFEL_PARSER}
   make

feature {ANY}
   accept (visitor: DECLARATION_GROUP_VISITOR) is
      do
         visitor.visit_declaration_group(Current)
      end

feature {DECLARATION_GROUP_VISITOR}
   name_list: ARRAY[LOCAL_ARGUMENT1]

feature {}
   make (nl: like name_list; type: TYPE_MARK) is
      require
         nl /= Void
         1 < nl.count
         type /= Void
      local
         i: INTEGER
      do
         name_list := nl
         from
            i := name_list.upper
         until
            i = 0
         loop
            name_list.item(i).set_result_type(type)
            i := i - 1
         end
      ensure
         name_list = nl
      end

feature {ANY}
   pretty_in (buffer: STRING) is
      local
         i: INTEGER
      do
         from
            i := name_list.lower
            buffer.append(name_list.item(i).to_string)
            i := i + 1
         until
            i > name_list.upper
         loop
            buffer.extend(',')
            if not pretty_printer.zen_mode then
               buffer.extend(' ')
            end
            buffer.append(name_list.item(i).to_string)
            i := i + 1
         end
         buffer.append(once ": ")
         name_list.first.result_type.pretty_in(buffer)
      end

   short (type: TYPE) is
      local
         i: INTEGER
      do
         from
            i := name_list.lower
            name_list.item(i).short(type)
            i := i + 1
         until
            i > name_list.upper
         loop
            short_printer.hook_or("hook304", ", ")
            name_list.item(i).short(type)
            i := i + 1
         end
         short_printer.hook_or("hook305", ": ")
         name_list.item(1).result_type.short(type)
      end

feature {DECLARATION_LIST}
   count: INTEGER is
      do
         Result := name_list.upper
      end

   specialize_in (type: TYPE): like Current is
      local
         la1, la2: LOCAL_ARGUMENT1; nl: like name_list; i: INTEGER
      do
         from
            i := name_list.upper
         until
            i < name_list.lower or else la1 /= la2
         loop
            la1 := name_list.item(i)
            la2 := la1.specialize_in(type)
            i := i - 1
         end
         if la1 = la2 then
            Result := Current
         else
            Result := twin
            create nl.from_collection(name_list)
            Result.set_name_list(nl)
            from
               nl.put(la2, i + 1)
            until
               i < name_list.lower
            loop
               nl.put(name_list.item(i).specialize_in(type), i)
               i := i - 1
            end
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
         la1, la2: LOCAL_ARGUMENT1; nl: like name_list; i: INTEGER
      do
         from
            i := name_list.upper
         until
            i < name_list.lower or else la1 /= la2
         loop
            la1 := name_list.item(i)
            la2 := la1.specialize_thru(parent_type, parent_edge, new_type)
            i := i - 1
         end
         if la1 = la2 then
            Result := Current
         else
            Result := twin
            create nl.from_collection(name_list)
            Result.set_name_list(nl)
            from
               nl.put(la2, i + 1)
            until
               i < name_list.lower
            loop
               nl.put(name_list.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
               i := i - 1
            end
         end
      end

feature {DECLARATION, DECLARATION_LIST}

   has_been_specialized: BOOLEAN is
      local
         i: INTEGER
      do
         from
            Result := True
            i := name_list.upper
         until
            i < name_list.lower or else not Result
         loop
            Result := name_list.item(i).has_been_specialized
            i := i - 1
         end
      end

feature {FORMAL_ARG_LIST}
   append_in_formal_arg_list (fal: FORMAL_ARG_LIST) is
      local
         i: INTEGER
      do
         from
            i := name_list.lower
         until
            i > name_list.upper
         loop
            fal.add_last(name_list.item(i))
            i := i + 1
         end
      end

feature {LOCAL_VAR_LIST}
   append_in_local_var_list (lvl: LOCAL_VAR_LIST) is
      local
         i: INTEGER
      do
         from
            i := name_list.lower
         until
            i > name_list.upper
         loop
            lvl.add_last(name_list.item(i))
            i := i + 1
         end
      end

feature {DECLARATION_GROUP}
   set_name_list(nl: like name_list) is
      require
         nl /= Void
      do
         name_list := nl
      ensure
         name_list = nl
      end

invariant
   name_list.lower = 1

   name_list.upper >= 2

end -- class DECLARATION_GROUP
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
