-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.

class LEC
	-- Liberty Eiffel Compiler

	-- or better a temporary fork of `compile_to_c' command pretending to be a
	-- compiler, shamelessly copied from SmartEiffel, removing one-by-one all
	-- the assumptions that does not allow to scale.

	-- Iteration 1: parallellize eiffel parser using Liberty parser

	-- Iteration 2: read ACE and loadpaths, build dispatcher

insert ARGUMENTS 
creation {} make

feature {ANY}
   command_line_name: STRING is "lec"

   command_line_help_summary: STRING is "[
      Usage: lec filename 

      Parse an Eiffel source code. 
	  ]"
feature {}
	make is
		-- Main procedure
	local input: INPUT_STREAM
	do
		if argument_count = 0 then 
			"No file given, reading from standard input".print_on(std_error)
			input := std_input
		else
			("Reading from #(1)%N" # argument(1)).print_on(std_error)
			create {TEXT_FILE_READ} input.connect_to(argument(1))
		end
		content := "" -- create content
		input.read_tail_in(content)
		create buffer; 
		buffer.initialize_with(content)
		create parser
		create grammar
		-- feed the parser with file at argument(1)
		if parser.eval(buffer, grammar.table,"Classes") then
			check
				grammar.root_node/=Void 
			end
			examine (grammar.root_node) -- grammar.display(std_output) -- print the source code tree
			-- grammar.generate(std_output) -- reprint parsed source code

			die_with_code(exit_success_code)
		else die_with_code(exit_failure_code)
		end
	end

	content: STRING
	buffer: MINI_PARSER_BUFFER
	parser: DESCENDING_PARSER
	grammar: EIFFEL_GRAMMAR

	examine (a_node: EIFFEL_NODE) is 
		-- examine parsed code
	local ntn: EIFFEL_NON_TERMINAL_NODE
	do
		a_node.print_on(std_output)
		ntn ?= a_node
		if ntn/=Void then 
			ntn.do_all(agent examine) 
		end
	end

end -- class LEC

-- Copyright notice below. Please read.
--
-- lec is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 3, or (at your option) any later version.
-- lec is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
-- Copytight(C) 2011: Paolo Redaelli
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
