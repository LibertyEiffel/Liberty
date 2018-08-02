-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_CLIENT_CONDUCTOR
   --
   -- As in any good orchestra, there must be a conductor
   --
   -- The eiffeltest conductor starts the servers and distributes
   -- work among them by scanning subdirectories
   --

insert
   LOGGING
   PROCESS_WAIT
      rename
         in as waitpid_in,
         job as waitpid_job
      end

create {ANY}
   make

feature {ANY}
   run
      do
         if commands.count > 0 then
            if commands.count < servers_count then
               servers_count := commands.count
            end

            stack.add_job(waitpid_job)
            start_servers
            waitpid_job.arm(-1)
            stack.run
         end
      end

   success: BOOLEAN
      do
         Result := test_results.for_all(agent {EIFFELTEST_CLIENT_RESULT}.success)
      end

feature {}
   start_servers
      require
         test_results = Void
      local
         i, port: INTEGER; server: EIFFELTEST_CLIENT_SOCKET
      do
         log.info.put_line(once "Number of servers to start: #(1)" # servers_count.out)

         create test_results.make
         create servers_list.with_capacity(servers_count)
         from
            i := 1
         until
            i > servers_count
         loop
            port := 17380 + i
            log.info.put_string(once "Starting server #")
            log.info.put_integer(i)
            log.info.put_string(once " on port ")
            log.info.put_integer(port)
            log.info.put_new_line
            create server.make(port, commands, agent on_reply(port, ?, ?, ?), agent on_done(port, ?, ?))
            waitpid_job.set_action(port.out, agent on_killed(server, ?, ?), Void)
            test_results.add(create {EIFFELTEST_CLIENT_RESULT}.make, port)
            servers_list.add_last(server)
            stack.add_job(server)
            i := i + 1
         end
      ensure
         test_results.count = servers_count
         servers_list.count = servers_count
      end

   on_reply (expected_port, actual_port: INTEGER; command: FIXED_STRING; reply: STRING)
      do
         if expected_port = actual_port then
            log.info.put_line(once "Server #(1) [#(2)]: #(3)" # actual_port.out # command # reply)
            test_results.at(actual_port).set_reply(reply)
         else
            log.error.put_line(once "Unexpected port mismatch #(1) /= #(2)" # expected_port.out # actual_port.out)
         end
      end

   on_done (expected_port, actual_port, status: INTEGER)
      do
         if expected_port = actual_port then
            log.info.put_line(once "Server #(1): exit (status #(2))" # actual_port.out # status.out)
            test_results.at(actual_port).set_done(status)
            if test_results.for_all_items(agent {EIFFELTEST_CLIENT_RESULT}.done) then
               waitpid_job.disarm
               waitpid_job.stop
               stack.break
            end
         else
            log.error.put_line(once "Unexpected port mismatch #(1) /= #(2)" # expected_port.out # actual_port.out)
         end
      end

   on_killed (server: EIFFELTEST_CLIENT_SOCKET; pid, status: INTEGER)
      local
         test_result: EIFFELTEST_CLIENT_RESULT
      do
         if pid = server.pid then
            test_result := test_results.at(server.port)
            if not test_result.done then
               log.warning.put_line(once "Server #(1): passed away (status #(2))" # server.port.out # status.out)
               test_result.set_done(status)
            end
            if test_results.for_all_items(agent {EIFFELTEST_CLIENT_RESULT}.done) then
               waitpid_job.disarm
               waitpid_job.stop
               stack.break
            end
         end
      end

feature {}
   collection_sorter: COLLECTION_SORTER[FIXED_STRING]

   scan_tree_ (force: BOOLEAN; root, eiffeltest_path: STRING; logger: OUTPUT_STREAM)
      require
         root /= Void
         logger.is_connected
      local
         name: FIXED_STRING; dir_path: STRING
         bd: BASIC_DIRECTORY
         ft: FILE_TOOLS
         tfw: TEXT_FILE_WRITE
         subdirectories: FAST_ARRAY[FIXED_STRING]
         i: INTEGER
      do
         log.trace.put_line(once "Scanning directory: #(1)" # root)
         bd.connect_to(root)
         if not bd.is_connected then
            logger.put_line(once "**** Error: could not connect to #(1)" # root)
         else
            commands.add(root)

            if ft.is_directory(eiffeltest_path) then
               bd.compute_file_path_with(eiffeltest_path, "log.new")
               if ft.file_exists(bd.last_entry) then
                  if force then
                     log.info.put_line(once "#(1) exists, removing it" # bd.last_entry)
                     ft.delete(bd.last_entry)
                  else
                     log.error.put_line(once "#(1) already exists, please remove or rename it (e.g. to log.ref); or use -force" # bd.last_entry)
                  end
               end
               if not ft.file_exists(bd.last_entry) then
                  create tfw.connect_to(bd.last_entry.intern)
                  if tfw.is_connected then
                     from
                        create subdirectories.make(0)
                        bd.read_entry
                     until
                        bd.end_of_input
                     loop
                        if not is_ignored(bd.last_entry) then
                           name := bd.last_entry.intern
                           bd.compute_subdirectory_with(root, name)
                           if ft.is_directory(bd.last_entry) then
                              dir_path := bd.last_entry.twin
                              collection_sorter.add(subdirectories, name)
                              scan_tree(force, dir_path, tfw)
                           end
                        end
                        bd.read_entry
                     end

                     from
                        i := subdirectories.lower
                     until
                        i > subdirectories.upper
                     loop
                        tfw.put_line(once "Found subdirectory: #(1)" # subdirectories.item(i))
                        i := i + 1
                     end

                     tfw.put_line(once "----------------------------------------------------------------")
                     tfw.disconnect
                  end
               end
            end

            bd.disconnect
         end
      end

   scan_tree (force: BOOLEAN; root: STRING; logger: OUTPUT_STREAM)
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

   is_ignored (name: STRING): BOOLEAN
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
   make (a_servers_count: like servers_count; force: BOOLEAN; root: STRING)
      require
         a_servers_count > 0
      do
         servers_count := a_servers_count
         create commands.make
         scan_tree(force, root, std_error)
         if log.is_trace then
            log.trace.put_line(once "All commands added.")
            commands.display(log.trace)
         end
      end

   stack: LOOP_STACK
      once
         create Result.make
      end

   servers_count: INTEGER
   test_results: AVL_DICTIONARY[EIFFELTEST_CLIENT_RESULT, INTEGER]
   servers_list: FAST_ARRAY[EIFFELTEST_CLIENT_SOCKET]

   commands: EIFFELTEST_COMMAND_PROVIDER

end -- class EIFFELTEST_CLIENT_CONDUCTOR
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
