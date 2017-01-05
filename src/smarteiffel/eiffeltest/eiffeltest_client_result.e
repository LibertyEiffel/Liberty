-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_CLIENT_RESULT

insert
   LOGGING

create {ANY}
   make

feature {ANY}
   done: BOOLEAN

   status: INTEGER
      require
         done
      attribute
      end

   reply: STRING

   set_done (a_status: like status)
      require
         not done
      do
         done := True
         status := a_status
      ensure
         done
         status = a_status
      end

   set_reply (a_reply: like reply)
      require
         a_reply /= Void
      do
         reply := a_reply
      ensure
         reply = a_reply
      end

   success: BOOLEAN
      local
         split: ARRAY[STRING]
         nb_failed: INTEGER
      do
         if done and then status = 0 and then reply /= Void then
            split := reply.split
            if split.first.same_as(once "status") and then split.item(split.lower + 1).is_integer then
               nb_failed := split.item(split.lower + 1).to_integer
               if nb_failed > 0 then
                  log.error.put_line(reply)
               else
                  log.trace.put_line(reply)
                  Result := True
               end
            end
         end
      end

feature {}
   make
      do
      end

end -- class EIFFELTEST_CLIENT_RESULT
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
-- Copyright (C) 2013-2017: Cyril ADRIAN <cyril.adrian@gmail.com>
--
-- http://www.gnu.org/software/liberty-eiffel/
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
