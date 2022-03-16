-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class DECLARATION_1
   --
   -- For a single declaration like :
   --             foo : BAR
   --

inherit
   DECLARATION

create {ANY}
   make

feature {ANY}
   start_position: POSITION
      do
         Result := name.start_position
      end

   pretty_in (buffer: STRING)
      do
         buffer.append(name.to_string)
         buffer.append(once ": ")
         name.result_type.pretty_in(buffer)
      end

   short (type: TYPE)
      do
         name.short(type)
         short_printer.hook_or("hook305", ": ")
         name.result_type.short(type)
      end

feature {ANY}
   accept (visitor: DECLARATION_1_VISITOR)
      do
         visitor.visit_declaration_1(Current)
      end

feature {DECLARATION_LIST}
   count: INTEGER 1

   specialize_in (type: TYPE): like Current
      local
         n: like name
      do
         n := name.specialize_in(type)
         if name = n then
            Result := Current
         else
            Result := twin
            Result.set_name(n)
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         n: like name
      do
         n := name.specialize_thru(parent_type, parent_edge, new_type)
         if name = n then
            Result := Current
         else
            Result := twin
            Result.set_name(n)
         end
      end

feature {DECLARATION, DECLARATION_LIST}

   has_been_specialized: BOOLEAN
      do
         Result := name.has_been_specialized
      end

feature {FORMAL_ARG_LIST}
   append_in_formal_arg_list (fal: FORMAL_ARG_LIST)
      do
         fal.add_last(name)
      end

feature {LOCAL_VAR_LIST}
   append_in_local_var_list (lvl: LOCAL_VAR_LIST)
      do
         lvl.add_last(name)
      end

feature {DECLARATION_1_VISITOR}
   name: LOCAL_ARGUMENT_DEF
         -- Of the declared variable.

feature {DECLARATION_1}
   set_name(n: like name)
      require
         n /= Void
      do
         name := n
      ensure
         name = n
      end

feature {}
   make (n: like name; type: TYPE_MARK)
      require
         n /= Void
      do
         name := n
         name.set_result_type(type)
      ensure
         name = n
      end

end -- class DECLARATION_1
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
