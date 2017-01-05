-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
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
   buffer: STRING "... once unique buffer .................................."

   line: INTEGER

   column: INTEGER

   reset (l: like line; c: like column)
      do
         line := l
         column := c
         buffer.clear_count
      end

   extend (ch: CHARACTER)
      do
         buffer.extend(ch)
      end

   append (s: STRING)
      do
         buffer.append(s)
      end

   is_current: BOOLEAN
      do
         inspect
            buffer
         when "Current", "current" then
            Result := True
         else
         end
      end

   is_result: BOOLEAN
      do
         inspect
            buffer
         when "Result", "result" then
            Result := True
         else
         end
      end

   is_void: BOOLEAN
      do
         inspect
            buffer
         when "Void", "void" then
            Result := True
         else
         end
      end

   hashed_string: HASHED_STRING
      do
         if hashed_string_memory = Void or else not hashed_string_memory.to_string.is_equal(buffer) then
            hashed_string_memory := string_aliaser.hashed_string(buffer)
         end
         Result := hashed_string_memory
      end

   isa_keyword: BOOLEAN
      do
         inspect
            buffer
         when
            "agent", "alias", "all", "and", "as", "assign", "attribute", "check", "class", "convert", "create",
            "creation", "Current", "current", "debug", "deferred", "do", "else", "elseif", "end", "ensure",
            "expanded", "export", "external", "False", "false", "feature", "from", "frozen", "if", "implies",
            "indexing", "infix", "inherit", "inspect", "invariant", "is", "like", "local", "loop", "not", "note",
            "obsolete", "old", "once", "or", "Precursor", "precursor", "prefix", "redefine", "rename", "require",
            "rescue", "Result", "result", "retry", "select", "separate", "then", "True", "true", "undefine",
            "unique", "until", "variant", "when", "Void", "void", "xor"
         then
            Result := True
         else
            check
               not Result
            end
         end
      end

   to_argument_name_def: ARGUMENT_NAME_DEF
      do
         create Result.make(start_position, buffer)
      end

   to_argument_name_ref (fal: FORMAL_ARG_LIST; rank, closure_rank: INTEGER): ARGUMENT_NAME_REF
      do
         create Result.refer_to(start_position, fal, rank, closure_rank)
      end

   to_class_name (allow_missing: BOOLEAN): CLASS_NAME
      do
         create Result.make(string_aliaser.hashed_string(buffer), start_position, allow_missing)
      end

   to_feature_name: FEATURE_NAME
      do
         create Result.ordinary_name(hashed_string, start_position)
      end

   to_writable_attribute_name: WRITABLE_ATTRIBUTE_NAME
      do
         create Result.make(hashed_string, start_position)
      end

   to_manifest_string: MANIFEST_STRING
      do
         create Result.from_identifier(start_position, hashed_string)
      end

   to_local_name_def: LOCAL_NAME_DEF
      do
         create Result.make(start_position, buffer)
      end

   to_local_name_ref (lvl: LOCAL_VAR_LIST; rank, closure_rank: INTEGER): LOCAL_NAME_REF
      do
         create Result.refer_to(start_position, lvl, rank, closure_rank)
      end

   to_tag_name: TAG_NAME
      do
         create Result.make(hashed_string, start_position)
      end

feature {INI_PARSER}
   case_sensitive_aliased_string: STRING
      do
         Result := hashed_string.to_string
      end

feature {EIFFEL_PARSER}
   start_position: POSITION
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
