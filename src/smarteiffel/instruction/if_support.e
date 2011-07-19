-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class IF_SUPPORT
	--
	-- Common ancestor of IFTHENELSE and IFTHEN.
	--

insert
	GLOBALS
	
feature {ANY}
	start_position: POSITION
			-- Of the "if" keyword or `start_position' of the "elseif" keyword.

	expression: EXPRESSION
			-- Which must be a boolean `expression'.

	then_compound: INSTRUCTION
			-- Not Void if any.

	side_effect_free (type: TYPE): BOOLEAN is
		do
			--|*** Could be better ***
		end

	end_mark_comment: BOOLEAN is True

feature {IF_SUPPORT}
	frozen specialize_2_check_ (type: TYPE) is
		local
			dt: TYPE
		do
			dt := expression.declaration_type
			if not dt.is_boolean then
				error_handler.append("%"if%" (or %"elseif%" as well) must be followed by a BOOLEAN expression.")
				error_handler.add_position(start_position)
				error_handler.print_as_error
				error_handler.append("The declaration type of this expression is ")
				error_handler.append(dt.name.to_string)
				error_handler.append(" (this is not BOOLEAN).")
				error_handler.add_position(expression.start_position)
				error_handler.print_as_fatal_error
			end
		end

	frozen pretty_ (indent_level: INTEGER; first_keyword: STRING) is
		require
			first_keyword.is_equal(once "if") or first_keyword.is_equal(once "elseif")
		do
			pretty_printer.set_indent_level(indent_level)
			pretty_printer.keyword(first_keyword)
			pretty_printer.set_semi_colon_flag(False)
			expression.pretty(indent_level + 1)
			pretty_printer.keyword(once "then")
			pretty_printer.set_indent_level(0)
			if then_compound /= Void then
				then_compound.pretty(indent_level + 1)
			end
		end

	frozen pretty_end_if (indent_level: INTEGER) is
		do
			pretty_printer.set_indent_level(indent_level)
			pretty_printer.keyword(once "end")
			if pretty_printer.print_end_of_statement then
				pretty_printer.put_end_of(once "if")
			end
			pretty_printer.set_indent_level(indent_level)
		end

feature {IFTHENELSE}
	frozen compile_to_jvm_ (type: TYPE) is
		local
			point: INTEGER
		do
			point := expression.jvm_branch_if_false(type)
			if then_compound /= Void then
				then_compound.compile_to_jvm(type)
			end
			jvm_after_point := code_attribute.opcode_goto
			code_attribute.resolve_u2_branch(point)
		end

	jvm_after_point: INTEGER
			-- To reach the end of IFTHENELSE.

invariant
	expression /= Void

end -- class IF_SUPPORT
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
