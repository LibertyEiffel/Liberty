-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_COMMAND_PROVIDER

create {ANY}
   make

feature {ANY}
   add (a_path: STRING) is
      require
         a_path /= Void
      local
         bd: BASIC_DIRECTORY
      do
         bd.compute_absolute_file_path_with(a_path)
         commands.add_last(bd.last_entry.intern)
      ensure
         not is_empty
      end

   count: INTEGER is
      do
         Result := commands.count
      end

   is_empty (client: EIFFELTEST_CLIENT_SOCKET): BOOLEAN is
      do
         if commands.is_empty then
            Result := disconnected_clients.fast_has(client)
         else
            Result := False
         end
      ensure
         Result implies count = 0
      end

   item (client: EIFFELTEST_CLIENT_SOCKET): FIXED_STRING is
      require
         not is_empty(client)
      do
         if commands.is_empty then
            Result := disconnect_item
         else
            Result := commands.first
         end
      end

   remove (client: EIFFELTEST_CLIENT_SOCKET) is
      require
         not is_empty(client)
      do
         if commands.is_empty then
            disconnected_clients.fast_add(client)
         else
            commands.remove_first
         end
      ensure
         disconnect_is_last: (old item(client) = disconnect_item) implies is_empty(client)
      end

feature {}
   make is
      do
         create commands.make(1, 0)
         create disconnected_clients.make
      end

   commands: RING_ARRAY[FIXED_STRING]
   disconnected_clients: HASHED_SET[EIFFELTEST_CLIENT_SOCKET]

   disconnect_item: FIXED_STRING is
      once
         Result := "disconnect".intern
      end

invariant
   commands /= Void
   disconnected_clients /= Void

end -- class EIFFELTEST_COMMAND_PROVIDER
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
-- Copyright(C) 2013: Cyril ADRIAN <cyril.adrian@gmail.com>
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
