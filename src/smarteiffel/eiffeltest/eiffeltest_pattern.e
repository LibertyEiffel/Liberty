-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_PATTERN

insert
   GLOBALS

create {EIFFELTEST, EIFFELTEST_SERVER_RUN_TESTS}
   make

feature {EIFFELTEST, EIFFELTEST_SERVER_RUN_TESTS}
   match (string: ABSTRACT_STRING): BOOLEAN
      require
         string /= Void
      do
         Result := regex.match(string)
         if Result then
            matched := True
         end
      ensure
         Result implies matched
      end

   text: FIXED_STRING
   matched: BOOLEAN

feature {}
   regex: REGULAR_EXPRESSION

   make (a_text: ABSTRACT_STRING)
      require
         a_text /= Void
      local
         entry: STRING; i: INTEGER
         reb: REGULAR_EXPRESSION_BUILDER
      do
         text := a_text.intern
         entry := once ""
         if a_text.count > 1 and then a_text.first = '/' and then a_text.last = '/' then
            entry.copy_substring(a_text, a_text.lower + 1, a_text.upper - 1)
         else
            entry.copy(once "^.*?")
            from
               i := a_text.lower
            until
               i > a_text.upper
            loop
               inspect
                  a_text.item(i)
               when '(', ')', '[', ']', '+', '*', '?', '{', '}', '\', '|', '^', '$', '.' then
                  entry.add_last('\')
               else
               end
               entry.add_last(a_text.item(i))
               i := i + 1
            end
            entry.append(once ".*$")
         end
         echo.put_line(once "Excluded pattern: /#(1)/" # entry)
         regex := reb.convert_python_pattern(entry)
      ensure
         text = a_text.intern
         regex /= Void
         not matched
      end

invariant
   text /= Void
   regex /= Void

end -- class EIFFELTEST_PATTERN
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
-- Copyright (C) 2013-2018: Cyril ADRIAN <cyril.adrian@gmail.com>
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
