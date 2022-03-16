-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NATURAL_CONSTANT
   --
   -- For Manifest Constant of class NATURAL.
   --

inherit
   BASE_TYPE_CONSTANT
      redefine pretty_target
      end

insert
   PLATFORM

create {ANY}
   make

create {EIFFEL_PARSER}
   special, hexadecimal

create {EIFFEL_PARSER, NATURAL_TYPE_MARK, CST_ATT_UNIQUE, EXTERNAL_FUNCTION}
   with

feature {ANY}
   extra_bracket_flag: BOOLEAN False

   pretty_target (indent_level: INTEGER)
      do
         if pretty_view = Void then
            Precursor(indent_level)
         else
            if pretty_view.first = '-' or else pretty_view.has_prefix(once "0x") then
               pretty_printer.put_character('(')
               pretty(indent_level)
               pretty_printer.put_character(')')
            else
               pretty(indent_level)
            end
            pretty_printer.put_character('.')
         end
      end

   result_type: NATURAL_TYPE_MARK
      do
         Result := result_type_memory
         if Result = Void then
            inspect
               size
            when 8 then
               Result ::= smart_eiffel.type_natural_8.canonical_type_mark
            when 16 then
               Result ::= smart_eiffel.type_natural_16.canonical_type_mark
            when 32 then
               Result ::= smart_eiffel.type_natural_32.canonical_type_mark
            when 64 then
               Result ::= smart_eiffel.type_natural_64.canonical_type_mark
            end
         end
      ensure
         Result /= Void
      end

   value_memory: NATURAL_64
         -- We use here a 64 bit NATURAL to be able to store large values.

   size: INTEGER
         -- is 8, 16, 32 or 64.
         -- Note this is the actual `size' of the `value_memory' which may be smaller or equal to the
         -- corresponding size of the `result_type_memory'.

   declaration_type: TYPE
      do
         inspect
            result_type.bit_count
         when 8 then
            Result := smart_eiffel.type_natural_8
         when 16 then
            Result := smart_eiffel.type_natural_16
         when 32 then
            Result := smart_eiffel.type_natural_32
         when 64 then
            Result := smart_eiffel.type_natural_64
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
      local
         buffer: STRING
      do
         buffer := once "..........."
         buffer.clear_count
         append_in(buffer)
         Result := buffer.twin
      end

   append_in (buffer: STRING)
         -- Append in `buffer' Eiffel prettified view of `Current'.
      do
         if pretty_view /= Void then
            buffer.append(pretty_view)
         else
            value_memory.append_in(buffer)
         end
      end

   accept (visitor: NATURAL_CONSTANT_VISITOR)
      do
         visitor.visit_natural_constant(Current)
      end

feature {TMP_FEATURE}
   to_real_constant: REAL_CONSTANT
      local
         real_view: STRING
      do
         real_view := once "................................"
         real_view.clear_count
         value_memory.append_in(real_view)
         real_view.append(once ".0")
         create Result.make(start_position, real_view.twin, Void)
      end

feature {FEATURE_TEXT, ASSIGNMENT_HANDLER, IMPLICIT_CAST, INTROSPECTION_HANDLER}
   set_result_type (type_mark: TYPE_MARK)
      require
         type_mark.is_natural
      do
         result_type_memory ::= type_mark
         check
            result_type_memory.bit_count >= size
         end
      ensure
         result_type = type_mark
      end

feature {INTROSPECTION_HANDLER}
   set_value (v: like value_memory)
      do
         make(v, start_position)
      ensure
         value_memory = v
      end

feature {NATURAL_CONSTANT_VISITOR}
   result_type_memory: NATURAL_TYPE_MARK
         -- Usually Void (`size' is used).

   pretty_view: STRING
         -- Used as soon as the non basic notation is used. Non-basic means hexadecimal, underscore
         -- or the {NATURAL_* ...} notation.

feature {}
   special (sp: like start_position; pv: like pretty_view; rt: like result_type; vm: like value_memory)
      require
         not sp.is_unknown
         not pv.is_empty
         rt /= Void
      do
         pretty_view := pv
         make(vm, sp)
         result_type_memory := rt
         inspect
            rt.bit_count
         when 8 then
            if not vm.fit_natural_8 then
               error_handler.add_position(sp)
               error_handler.append(once "Value `")
               error_handler.append(vm.to_string)
               error_handler.append(once "' is out of NATURAL_8 range.")
               error_handler.print_as_fatal_error
            end
         when 16 then
            if not vm.fit_natural_16 then
               error_handler.add_position(sp)
               error_handler.append(once "Value `")
               error_handler.append(vm.to_string)
               error_handler.append(once "' is out of NATURAL_16 range.")
               error_handler.print_as_fatal_error
            end
         when 32 then
            if not vm.fit_natural_32 then
               error_handler.add_position(sp)
               error_handler.append(once "Value `")
               error_handler.append(vm.to_string)
               error_handler.append(once "' is out of NATURAL_32 range.")
               error_handler.print_as_fatal_error
            end
         else
            -- Should normally fit.
         end
      end

   make (vm: like value_memory; sp: like start_position)
      do
         start_position := sp
         value_memory := vm
         if value_memory.fit_natural_8 then
            size := 8
         elseif value_memory.fit_natural_16 then
            size := 16
         elseif value_memory.fit_natural_32 then
            size := 32
         else
            size := 64
         end
      end

feature {}
   hexadecimal (sp: like start_position; pv:like pretty_view; digit_count: INTEGER_8; a_value: NATURAL_64)
      do
         start_position := sp
         pretty_view := pv
         value_memory := a_value
         inspect
            digit_count
         when 2 then
            size := 8
         when 4 then
            size := 16
         when 8 then
            size := 32
         when 16 then
            size := 64
         end
      end

   with (v: like value_memory; sp: like start_position; rt: like result_type)
      require
         rt /= Void
      do
         make(v, sp)
         set_result_type(rt)
      ensure
         result_type_memory = rt
      end

invariant
   size = 8 xor size = 16 xor size = 32 xor size = 64

end -- class NATURAL_CONSTANT
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
