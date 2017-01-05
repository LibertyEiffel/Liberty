-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LOCAL_NAME_DEF
   --
   -- A local name in some declaration list.
   --

inherit
   LOCAL_ARGUMENT_DEF

insert
   LOCAL_NAME

create {ANY}
   make

feature {ANY}
   collect (type: TYPE): TYPE
      do
         Result := result_type.resolve_in(type)
         live_reference_counter_increment
      end

   adapt_for (type: TYPE): like Current
      do
         --|*** (PH 25/08/04) should be identical with
         --|*** ARGUMENT_NAME_DEF.adapt_for, so put it in LOCAL_ARGUMENT_DEF.
         usage_warning_check(type) --|*** (PH 29/05/04) should be done earlier
         Result := Current
      end

   accept (visitor: LOCAL_NAME_DEF_VISITOR)
      do
         visitor.visit_local_name_def(Current)
      end

feature {ANY}
   is_used (type: TYPE): BOOLEAN
      local
         actual_type: TYPE
      do
         if live_reference_counter > 0 then
            Result := True
         elseif parsing_reference_counter = 0 then
            actual_type := result_type.resolve_in(type)
            if type.is_user_expanded then
               Result := not type.live_type.side_effect_free_default_create
            end
         end
      end

feature {DECLARATION_LIST}
   name_clash_check (type: TYPE)
      do
         name_clash_check_(type, once "Conflict between local/feature name (VRLE).")
      end

feature {LOCAL_NAME_REF}
   parsing_reference_counter_increment
      do
         parsing_reference_counter := parsing_reference_counter + 1
      end

   live_reference_counter_increment
      do
         live_reference_counter := live_reference_counter + 1
      end

feature {LOCAL_NAME_DEF}
   usage_warning_check (type: TYPE)
      do
         if parsing_reference_counter = 0 then
            if is_used(type) then
               -- Well, it is a bad idea to rely on side-effects, but it is still allowed...
            else
               error_handler.append(once "Unused local variable `")
               error_handler.append(to_string)
               error_handler.append(once "%'.")
               error_handler.add_position(start_position)
               error_handler.print_as_warning
            end
         end
      end

feature {}
   parsing_reference_counter: INTEGER
         -- How many LOCAL_NAME_REF encountered during parsing for this local declaration.

   live_reference_counter: INTEGER
         -- How many actual usage encountered in the living code?

   make (sp: POSITION; n: STRING)
      require
         not sp.is_unknown
         not n.is_empty
      do
         start_position := sp
         hashed_string := string_aliaser.hashed_string(n)
         to_string := hashed_string.to_string
      ensure
         start_position = sp
         to_string.is_equal(n) and string_aliaser.registered_one(to_string)
      end

end -- class LOCAL_NAME_DEF
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
