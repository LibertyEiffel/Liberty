-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_CONDUCTOR
   --
   -- As in any good orchester, there must be a conductor
   --
   -- The eiffeltest conductor starts the servers and distributes
   -- work among them by scanning subdirectories
   --

create {ANY}
   make

feature {ANY}
   run is
      do
         if work.count > 0 then
            if work.count < servers_count then
               servers_count := work.count
            end
            start_servers
            distribute_work
            stack.run
         end
      end

   status: INTEGER

feature {}
   distribute_work is
      local
         i: INTEGER
      do
         from
            i := work.lower
         until
            i > work.upper
         loop
            servers_list.item(i \\ servers_list.count).call(work.item(i))
            i := i + 1
         end
         from
            i := servers_list.lower
         until
            i > servers_list.upper
         loop
            servers_list.item(i).call(once "disconnect")
            i := i + 1
         end
      end

feature {}
   start_servers is
      require
         servers = Void
      local
         i, port: INTEGER; server: EIFFELTEST_CLIENT_SOCKET
      do
         create servers.make
         create servers_list.with_capacity(servers_count)
         from
            i := 1
         until
            i > servers_count
         loop
            port := 4096 + i
            create server.make(port, agent on_reply)
            servers.add(server, port)
            servers_list.add_last(server)
            server.server_start
            stack.add_job(server)
            i := i + 1
         end
      ensure
         servers.count = servers_count
      end

   on_reply (port: INTEGER; command, reply: STRING) is
      do
         -- TODO: reply will help decide if we exit with status 0 or not
      end

feature {}
   scan_tree_ (force: BOOLEAN; root: FIXED_STRING; eiffeltest_path: STRING; logger: OUTPUT_STREAM) is
      require
         root /= Void
         logger.is_connected
      local
         name: STRING
         dir_path: FIXED_STRING
         bd: BASIC_DIRECTORY
         ft: FILE_TOOLS
         tfw: TEXT_FILE_WRITE
      do
         bd.connect_to(root)
         if not bd.is_connected then
            logger.put_line(once "**** Error: could not connect to #(1)" # root)
         else
            work.add_last(root)

            if ft.is_directory(eiffeltest_path) then
               bd.compute_file_path_with(eiffeltest_path, "log.new")
               if ft.file_exists(bd.last_entry) then
                  logger.put_line(once "**** Error: #(1) already exists, please remove or rename it (e.g. to log.ref)" # bd.last_entry)
               else
                  create tfw.connect_to(bd.last_entry.intern)
                  if tfw.is_connected then
                     from
                        name := once "................"
                        bd.read_entry
                     until
                        bd.end_of_input
                     loop
                        if not is_ignored(bd.last_entry) then
                           name.copy(bd.last_entry)
                           bd.compute_subdirectory_with(root, name)
                           if ft.is_directory(bd.last_entry) then
                              dir_path := bd.last_entry.intern
                              tfw.put_line(once "Found subdirectory: #(1)" # name)
                              scan_tree(force, dir_path, tfw)
                           end
                        end
                        bd.read_entry
                     end
                     tfw.disconnect
                  end
               end
            end

            bd.disconnect
         end
      end

   scan_tree (force: BOOLEAN; root: FIXED_STRING; logger: OUTPUT_STREAM) is
      require
         root /= Void
         logger.is_connected
      local
         path: STRING
         bd: BASIC_DIRECTORY
         ft: FILE_TOOLS
      do
         path := once "................................"

         bd.compute_subdirectory_with(root, "eiffeltest")
         path.copy(bd.last_entry)
         if ft.is_directory(path) then
            scan_tree_(force, root, path, logger)
         elseif force then
            if bd.create_new_directory(path) then
               scan_tree_(force, root, path, logger)
            else
               logger.put_line(once "**** Error: could not create directory #(1)" # path)
            end
         elseif ft.file_exists(path) then
            logger.put_line(once "**** Error: could scan #(1) (not a directory)" # path)
         else
            logger.put_line(once "**** Error: could scan #(1) (use -force to create)" # path)
         end
      end

   is_ignored (name: STRING): BOOLEAN is
      require
         not name.is_empty
      do
         inspect
            name
         when "eiffeltest", "CVS" then
            Result := True
         else
            Result := name.first = '.'
         end
      end

feature {}
   make (a_servers_count: like servers_count; force: BOOLEAN; root: FIXED_STRING) is
      do
         servers_count := a_servers_count
         scan_tree(force, root, std_error)
      end

   stack: LOOP_STACK is
      once
         create Result.make
      end

   servers_count: INTEGER
   servers: AVL_DICTIONARY[EIFFELTEST_CLIENT_SOCKET, INTEGER]
   servers_list: FAST_ARRAY[EIFFELTEST_CLIENT_SOCKET]

   work: FAST_ARRAY[FIXED_STRING] is
      once
         create Result.make(0)
      end

end -- class EIFFELTEST_CONDUCTOR
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
