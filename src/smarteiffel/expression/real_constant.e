-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class REAL_CONSTANT
   --
   -- For Manifest Constant of types REAL_32, REAL_64, REAL and REAL_80.
   --

inherit
   BASE_TYPE_CONSTANT

create {EIFFEL_PARSER, INTEGER_CONSTANT, NATURAL_CONSTANT, REAL_TYPE_MARK}
   make

feature {ANY}
   pretty_view: STRING
         -- Used to memorize the notation used in the Eiffel source (always used by `pretty' as it is).

   result_type: REAL_TYPE_MARK

   extra_bracket_flag: BOOLEAN
      do
         -- Because of the usual low priority of prefix minus:
         Result := normalized_view.first = '-'
      end

   declaration_type: TYPE
      do
         if result_type = Void then
            Result := smart_eiffel.type_real_64
         else
            inspect
               result_type.bit_count
            when 32 then
               Result := smart_eiffel.type_real_32
            when 64 then
               Result := smart_eiffel.type_real_64
            else
               Result := smart_eiffel.type_real_extended
            end
         end
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := declaration_type
      end

   simplify_1_, simplify_2: like Current
      do
         Result := Current
      end

   to_string: STRING
         -- Which is actually exactly the way the real was written by the user (see also `normalized_view').
      do
         Result := pretty_view
      end

   normalized_view: STRING
         -- Return our internal normalized notation:
         --    0.0      --> 0e0
         --    1.0      --> 1e0
         --    0.5      --> 5e-1
         --   -3.5      --> -35e-1
         --   -3.56     --> -356e-2
         --   5_000.0   --> 5e3
      local
         buffer: STRING; state, i, mantissa_count, exponent, user_exponent: INTEGER; cc: CHARACTER
         negative_user_exponent_flag: BOOLEAN
      do
         if normalized_memory = Void then
            from
               -- This automaton assume that the `pretty_view' is correct.
               buffer := once "..........................................................."
               buffer.clear_count
               i := 1
            until
               i > pretty_view.count
            loop
               cc := pretty_view.item(i)
               inspect
                  state
               when 0 then   -- Still waiting for the first non zero digit of the mantissa.
                  inspect
                     cc
                  when '{' then
                     state := 1
                  when '-' then
                     buffer.extend('-')
                  when '1' .. '9' then
                     state := 2
                     buffer.extend(cc); mantissa_count := 1
                  when '0', '+' then
                  when '.' then
                     state := 3
                  when 'e', 'E' then
                     state := 4
                  when '_' then
                     -- Ignored.
                  end
               when 1 then   -- Inside the type mark.
                  if cc = ' ' then
                     state := 0
                  end
               when 2 then   -- Inside mantissa.
                  inspect
                     cc
                  when '0' .. '9' then
                     buffer.extend(cc); mantissa_count := mantissa_count + 1
                  when '.' then
                     state := 3
                  when 'e', 'E' then
                     state := 4
                  when '_' then
                     -- Ignored.
                  end
               when 3 then   -- Inside rational part.
                  inspect
                     cc
                  when '0' then
                     if mantissa_count > 0 then
                        buffer.extend(cc); mantissa_count := mantissa_count + 1
                     end
                     exponent := exponent - 1
                  when '1' .. '9' then
                     buffer.extend(cc); mantissa_count := mantissa_count + 1
                     exponent := exponent - 1
                  when '}', '_' then
                  when 'e', 'E' then
                     state := 4
                  end
               when 4 then   -- Inside exponent part.
                  inspect
                     cc
                  when '+' then
                  when '-' then
                     negative_user_exponent_flag := True
                  when '0' .. '9' then
                     user_exponent := (user_exponent * 10) + cc.decimal_value
                  when '}', '_' then
                  end
               end
               i := i + 1
            end
            if negative_user_exponent_flag then
               user_exponent := - user_exponent
            end
            exponent := exponent + user_exponent
            inspect
               mantissa_count
            when 0 then
               if user_exponent /= 0 then
                  error_handler.add_position(start_position)
                  error_handler.append(once "Invalid notation for 0.0.")
                  error_handler.print_as_error
               end
               buffer.copy(once "0e0")
            else
               -- Remove trailing '0'.
               from
               until
                  buffer.last /= '0'
               loop
                  buffer.remove_last
                  mantissa_count := mantissa_count - 1
                  exponent := exponent + 1
               end
               buffer.extend('e')
               exponent.append_in(buffer)
            end
            normalized_memory := buffer.twin
         end
         Result := normalized_memory
      end

   accept (visitor: REAL_CONSTANT_VISITOR)
      do
         visitor.visit_real_constant(Current)
      end

feature {IMPLICIT_CAST, TMP_FEATURE}
   set_result_type (type_mark: TYPE_MARK)
      require
         type_mark.is_real
      do
         result_type ::= type_mark
      ensure
         result_type = type_mark
      end

feature {}
   normalized_memory: STRING
         -- (See `normalized_view'.)

   make (sp: like start_position; pv: like pretty_view; rt: like result_type)
      require
         not sp.is_unknown
         not pv.is_empty
      do
         start_position := sp
         pretty_view := pv
         result_type := rt
      ensure
         start_position = sp
         pretty_view = pv
         result_type = rt
      end

end -- class REAL_CONSTANT
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
