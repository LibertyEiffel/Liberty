-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class TOKEN_BUFFER
	--
	-- Singleton object used by `eiffel_parser' and `ace' to have a temporary
	-- storage of some unknown name or token during syntax analysis.
	--

insert
	GLOBALS

feature {PARSER}
	buffer: STRING is "... once unique buffer .................................."

	line: INTEGER

	column: INTEGER

	reset (l: like line; c: like column) is
		do
			line := l
			column := c
			buffer.clear_count
		end

	extend (ch: CHARACTER) is
		do
			buffer.extend(ch)
		end

	append (s: STRING) is
		do
			buffer.append(s)
		end

	is_current: BOOLEAN is
		do
			inspect
				buffer
			when "Current", "current" then
				Result := True
			else
			end
		end
	
	is_result: BOOLEAN is
		do
			inspect
				buffer
			when "Result", "result" then
				Result := True
			else
			end
		end

	is_void: BOOLEAN is
		do
			inspect
				buffer
			when "Void", "void" then
				Result := True
			else
			end
		end

	hashed_string: HASHED_STRING is
		do
			if hashed_string_memory = Void or else not hashed_string_memory.to_string.is_equal(buffer) then
				hashed_string_memory := string_aliaser.hashed_string(buffer)
			end
			Result := hashed_string_memory
		end

	isa_keyword: BOOLEAN is
		do
			inspect
				buffer
			when "agent", "alias", "all", "and", "as", "attribute", "check", "class", "create", "creation", "Current", "current",
				"debug", "deferred", "do", "else", "elseif", "end", "ensure", "expanded", "export", "external",
				"False", "false",
				"feature", "from", "frozen", "if", "implies", "indexing", "infix", "inherit", "inspect",
				"invariant", "is", "like", "local", "loop", "obsolete", "old", "once", "or", "precursor", "prefix",
				"redefine", "rename", "require", "rescue", "Result", "result", "retry", "select", "separate", "then",
				"True", "true",
				"undefine", "unique", "until", "variant", "when", "Void", "void", "xor" then
				Result := True
			else
				check
					not Result
				end
			end
		end

	to_argument_name1: ARGUMENT_NAME1 is
		do
			create Result.make(start_position, buffer)
		end

	to_argument_name2 (fal: FORMAL_ARG_LIST; rank: INTEGER): ARGUMENT_NAME2 is
		do
			create Result.refer_to(start_position, fal, rank)
		end

	to_class_name: CLASS_NAME is
		do
			create Result.make(string_aliaser.hashed_string(buffer), start_position)
		end

	to_feature_name: FEATURE_NAME is
		do
			create Result.ordinary_name(hashed_string, start_position)
		end

	to_writable_attribute_name: WRITABLE_ATTRIBUTE_NAME is
		do
			create Result.make(hashed_string, start_position)
		end

	to_manifest_string: MANIFEST_STRING is
		do
			create Result.from_identifier(start_position, hashed_string)
		end

	to_local_name1: LOCAL_NAME1 is
		do
			create Result.make(start_position, buffer)
		end

	to_local_name2 (lvl: LOCAL_VAR_LIST; rank: INTEGER): LOCAL_NAME2 is
		do
			create Result.refer_to(start_position, lvl, rank)
		end

	to_tag_name: TAG_NAME is
		do
			create Result.make(hashed_string, start_position)
		end

feature {INI_PARSER}
	case_sensitive_aliased_string: STRING is
		do
			Result := hashed_string.to_string
		end

feature {EIFFEL_PARSER}
	start_position: POSITION is
		do
			Result := eiffel_parser.pos(line, column)
		end

feature {}
	hashed_string_memory: HASHED_STRING

end -- class TOKEN_BUFFER
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
