-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LOCAL_NAME1
   --
   -- A local name in some declaration list.
   --

inherit
   LOCAL_ARGUMENT1

insert
   LOCAL_NAME

creation {TOKEN_BUFFER, INTROSPECTION_HANDLER}
   make

feature {ANY}
   collect (type: TYPE): TYPE is
      do
         Result := result_type.resolve_in(type)
         live_reference_counter_increment
      end

   adapt_for (type: TYPE): like Current is
      do
         --|*** (PH 25/08/04) should be identical with 
         --|*** ARGUMENT_NAME1.adapt_for, so put it in LOCAL_ARGUMENT1.
         usage_warning_check(type) --|*** (PH 29/05/04) should be done earlier
         Result := Current
      end

   accept (visitor: LOCAL_NAME1_VISITOR) is
      do
         visitor.visit_local_name1(Current)
      end

feature {LOCAL_VAR_LIST}
   must_be_c_generated (type: TYPE): BOOLEAN is
         -- True if some C code must be generated for this local variable (i.e. this routine now 
         -- handle correctly user's expanded types with a side-effect default creation).
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

feature {LOCAL_VAR_LIST}
   c_declare (type: TYPE; volatile_flag: BOOLEAN) is
         -- C declaration of the local.
      require
         cpp.pending_c_function
      local
         static_tm: TYPE_MARK
      do
         if must_be_c_generated(type) then
            static_tm := result_type.to_static(type)
            if volatile_flag then
               if static_tm.is_kernel_expanded then
                  cpp.pending_c_function_body.append(once "volatile ")
               end
            end
            static_tm.c_type_for_result_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.extend(' ')
            cpp.print_local(to_string)
            cpp.pending_c_function_body.extend('=')
            static_tm.c_initialize_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ";%N")
         end
      end

feature {DECLARATION_LIST}
   name_clash_check (type: TYPE) is
      do
         name_clash_check_(type, once "Conflict between local/feature name (VRLE).")
      end

feature {LOCAL_NAME2}
   parsing_reference_counter_increment is
      do
         parsing_reference_counter := parsing_reference_counter + 1
      end

   live_reference_counter_increment is
      do
         live_reference_counter := live_reference_counter + 1
      end

feature {LOCAL_NAME1}
   usage_warning_check (type: TYPE) is
      do
         if parsing_reference_counter = 0 then
            if must_be_c_generated(type) then
               -- Well, it is a bad idea to rely on side-effects, but it is still allowed...
            else
               error_handler.append("Unused local variable.")
               error_handler.add_position(start_position)
               error_handler.print_as_warning
            end
         end
      end

feature {}
   parsing_reference_counter: INTEGER
         -- How many LOCAL_NAME2 encountered during parsing for this local declaration.

   live_reference_counter: INTEGER
         -- How many actual usage encountered in the living code?

   make (sp: POSITION; n: STRING) is
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

end -- class LOCAL_NAME1
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
