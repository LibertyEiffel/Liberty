-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AGENT_TYPE_MARK
   --
   -- For all agent's types: ROUTINE, PROCEDURE, FUNCTION and PREDICATE.
   --

inherit
   GENERIC_TYPE_MARK
      redefine pretty_in, specialize_in, specialize_thru
      end

insert
   AGENT_TYPE_MARKS

create {ANY}
   routine, procedure, function, predicate

feature {ANY}
   is_reference: BOOLEAN True

   is_expanded: BOOLEAN False

   written_open: TYPE_MARK
         -- The written type for open operands (this is not always a TUPLE, see also `open').
      do
         Result := generic_list.first
      end

   result_type: TYPE_MARK
         -- The type of the `Result' (used only when `pretty_code' = `function_code').
      local
         index: INTEGER
      do
         index := generic_list.lower + 1
         if generic_list.valid_index(index) then
            Result := generic_list.item(index)
         end
      end

   pretty_in (buffer: STRING)
      do
         inspect
            pretty_code
         when routine_code then
            buffer.append(as_routine)
         when procedure_code then
            buffer.append(as_procedure)
         when function_code then
            buffer.append(as_function)
         when predicate_code then
            buffer.append(as_predicate)
         end
         buffer.extend('[')
         written_open.pretty_in(buffer)
         if pretty_code = function_code then
            buffer.append(once ", ")
            result_type.pretty_in(buffer)
         end
         buffer.extend(']')
      end

   specialize_in (new_type: TYPE)
      local
         gl: ARRAY[TYPE]
      do
         Precursor(new_type)
         gl := static_memory.fast_at(new_type).first.generic_list
         open_check(new_type, gl.first)
      ensure then
         declaration_type /= Void
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): GENERIC_TYPE_MARK
      local
         gl: ARRAY[TYPE];
      do
         Result := Precursor(parent_type, parent_edge, new_type)
         gl := static_memory.fast_at(new_type).first.generic_list
         open_check(new_type, gl.first)
      end

   accept (visitor: AGENT_TYPE_MARK_VISITOR)
      do
         visitor.visit_agent_type_mark(Current)
      end

   is_user_expanded: BOOLEAN False

   id: INTEGER
      do
         Result := type.live_type.id
      end

feature {LIVE_TYPE, TYPE_MARK}
   is_empty_expanded: BOOLEAN False

feature {TYPE_MARK}
   short_ (shorted_type: TYPE)
      local
         agent_type_mark: AGENT_TYPE_MARK
      do
         short_printer.put_class_name(class_text_name)
         short_printer.hook_or("open_sb", "[")
         agent_type_mark ?= static_memory.fast_at(shorted_type).first.canonical_type_mark
         agent_type_mark.written_open.short_(shorted_type)
         if result_type /= Void then
            short_printer.hook_or("tm_sep", ", ")
            result_type.short_(shorted_type)
         end
         short_printer.hook_or("close_sb", "]")
      end

feature {AGENT_TYPE_MARK_VISITOR}
   pretty_code: INTEGER
         -- For the use of `pretty'.

feature {}
   valid_code (c: like pretty_code): BOOLEAN
      do
         inspect
            c
         when routine_code, procedure_code, function_code, predicate_code then
            Result := True
         else
         end
      end

   common_make (c: like pretty_code; wo: like written_open; rt: like result_type)
      require
         class_text_name /= Void
         valid_code(c)
         wo /= Void
      do
         pretty_code := c
         create generic_list.with_capacity(2, 1)
         generic_list.add_last(wo)
         if rt /= Void then
            generic_list.add_last(rt)
         end
      ensure
         pretty_code = c
         written_open = wo
         result_type = rt
      end

   routine (sp: like start_position; wo: like written_open)
      require
         not sp.is_unknown
         wo /= Void
      do
         create class_text_name.make(routine_name, sp, False)
         common_make(routine_code, wo, Void)
      ensure
         written_open = wo
      end

   procedure (sp: like start_position; wo: like written_open)
      require
         not sp.is_unknown
         wo /= Void
      do
         create class_text_name.make(procedure_name, sp, False)
         common_make(procedure_code, wo, Void)
      ensure
         written_open = wo
         result_type = Void
      end

   function (sp: like start_position; wo: like written_open; rt: like result_type)
      require
         not sp.is_unknown
         wo /= Void
         rt /= Void
      do
         create class_text_name.make(function_name, sp, False)
         common_make(function_code, wo, rt)
      ensure
         written_open = wo
         result_type = rt
      end

   predicate (sp: like start_position; wo: like written_open)
      require
         not sp.is_unknown
         wo /= Void
      do
         create class_text_name.make(function_name, sp, False)
         common_make(predicate_code, wo, create {BOOLEAN_TYPE_MARK}.make(sp))
      ensure
         written_open = wo
      end

   routine_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_routine)
      end

   procedure_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_procedure)
      end

   function_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_function)
      end

   open_check (context: TYPE; new_open: TYPE)
         -- Check that `new_open' is a valid `open' TUPLE type.
      require
         new_open /= Void
      do
         if not new_open.is_tuple then
            error_handler.add_position(written_open.start_position)
            error_handler.append(once "TUPLE type expected for open arguments of agent type. %
             %(See also the next fatal error message.)")
            error_handler.print_as_error
            error_handler.add_position(written_open.start_position)
            if not written_open.is_static then
               error_handler.append(once "When the context of the validation is ")
               error_handler.append(context.name.to_string)
               error_handler.append(once ", this type mark is not a TUPLE. (This is actually ")
               error_handler.append(new_open.name.to_string)
               error_handler.append(once ".)")
            else
               error_handler.append(once "This type mark is not a TUPLE type mark.")
            end
            error_handler.print_as_fatal_error
         end
      end

invariant
   valid_code(pretty_code)

   written_open /= Void

end -- class AGENT_TYPE_MARK
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
