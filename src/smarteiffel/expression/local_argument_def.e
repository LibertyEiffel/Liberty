-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class LOCAL_ARGUMENT_DEF
   --
   -- Common behavior for LOCAL_NAME_DEF and ARGUMENT_NAME_DEF
   --

inherit
   LOCAL_ARGUMENT

feature {ANY}
   hashed_string: HASHED_STRING
         -- The unique corresponding one for the name of this entity.

   to_string: STRING
         -- An alias of `hashed_string.to_string'.

   result_type: TYPE_MARK
         -- The corresponding written one in the declaration list.

   rank: INTEGER
         -- The `rank' in the corresponding declaration list.

   is_outside (type: TYPE): BOOLEAN
         -- True if the local or argument is reached from inside a closure.
      do
         Result := outside_set /= Void and then outside_set.fast_has(type)
      end

   declaration_type: TYPE
      do
         not_yet_implemented
      end

   specialize_and_check (type: TYPE): EXPRESSION
      do
         not_yet_implemented
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := result_type.resolve_in(type)
      end

   is_used (type: TYPE): BOOLEAN
         -- True if some C code must be generated for this local variable (i.e. this routine now
         -- handles correctly user expanded types with a side-effect default creation).
      deferred
      end

feature {DECLARATION_LIST}
   set_rank (r: like rank)
      require
         r >= 1
      do
         rank := r
      ensure
         rank = r
      end

feature {LOCAL_ARGUMENT_DEF, DECLARATION_LIST, DECLARATION}
   set_result_type (rt: like result_type)
      require
         rt /= Void
      do
         result_type := rt
      ensure
         result_type = rt
      end

feature {DECLARATION_LIST}
   name_clash_check (type: TYPE)
         -- Check for name clash between argument/feature or local/feature.
         -- (Note: clash between local/argument are checked during parsing.)
      require
         type /= Void
      deferred
      end

feature {ANY}
   frozen specialize_in (type: TYPE): like Current
      do
         result_type.specialize_in(type)
         Result := Current
      end

   frozen specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         rt: like result_type
      do
         rt := result_type.specialize_thru(parent_type, parent_edge, new_type)
         if result_type = rt then
            Result := Current
         else
            Result := twin
            Result.set_result_type(rt)
         end
      end

   has_been_specialized: BOOLEAN
      do
         Result := result_type.has_been_specialized
      end

   adapt_for (type: TYPE): like Current
      deferred
      end

feature {LOCAL_ARGUMENT_REF}
   set_outside (type: TYPE)
      do
         if outside_set = Void then
            create outside_set.make
         end
         outside_set.fast_add(type)
         resolve_in(type).set_local_closure
      ensure
         is_outside(type)
         resolve_in(type).has_local_closure
      end

feature {}
   outside_set: HASHED_SET[TYPE]

   name_clash_check_ (type: TYPE; msg: STRING)
      require
         type /= Void
         msg /= Void
      local
         fn: FEATURE_NAME
      do
         if type.has_simple_feature_name(hashed_string) then
            fn := type.name_from_string(to_string)
            error_handler.append(msg)
            error_handler.add_position(fn.start_position)
            error_handler.add_position(start_position)
            error_handler.print_as_fatal_error
         end
      end

end -- class LOCAL_ARGUMENT_DEF
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
