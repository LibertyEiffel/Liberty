-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LLVM_BYTECODE_EMITTER
   --
   -- Singleton in charge of emitting Low Level Virtual Machine bytecode.

   -- This singleton is shared via the LLVM_GLOBALS.`llvm_bytecode_emitter' once function.

   -- This object in the main process do not actually emit any code but forks
   -- several times and tells its children to compile clusters.

        -- In each process this object will be an actual singleton yet the compiler
        -- will be made up by several processes.


inherit CODE_PRINTER undefine is_equal end

insert MULTIPROCESSING

create {LLVM_GLOBALS} make

feature {SMART_EIFFEL}
   compile
         -- Entry point of actual bytecode generation.
         local workers_count: INTEGER
      do
         if nb_errors = 0 then
            check
               smart_eiffel.root_procedure /= Void
            end
            get_started
            check
               smart_eiffel.is_ready
            end
            smart_eiffel.customize_runtime
                        -- Now we are ready.

                        -- Let's have an aggressive parallel attitute. We now have
                        -- everything parsed up and understood.  Some children are spawned,
                        -- one or more per core available. Once they are all ready we can
                        -- send them messages to process each cluster"
                        workers_count := (2*processors_count + 1);
                        ("Creating #(1) workers processes over #(2) cores.%N" # &workers_count # &processors_count).print_on(std_error)
                        create workers.with_capacity(workers_count)
                        socket_path := "ipc:///tmp/liberty-llvm-compiler-"+process_id.out
                        controller_path := "ipc:///tmp/liberty-llvm-compiler-controller-"+process_id.out
                        workers_count.times(agent do
                                workers.add_last(create {LLVM_WORKER}.communicating_over(socket_path))
                        end)

                        -- For each cluster send a command message on the push socket to
                        -- compile it.  The usage of a plain string message is deliberate,
                        -- conscious design choice that will let us scale to multi-machine,
                        -- multi-architecture without any fuss. It is true that it requires
                        -- some parsing which may sound costly yet.
                        -- In a fully distributed compiler each worker would receive a
                        -- "huge" message containing all the tree it should compile.
                        -- Currently we stay on a single machine so we may rely on the fact
                        -- that forked children processes share all the memory content of
                        -- their father at creation/fork time.
                        create messaging_context
                        socket := messaging_context.new_push_socket;
                        socket.bind(socket_path)

                        -- Wait for all the workers to become ready... or perhaps its
                        -- better to have a "ready or not here I come!" attitude
                        -- controller := messaging_context.new_push_socket;
                        -- controller.connect(controller_path)

                        -- Tell
                        (1|..|ace.cluster_count).for_each(agent (an_index: INTEGER_32)
                        local message: ZMQ_STRING_MESSAGE
                        do
                                create message.from_string("compile-cluster "| &an_index)
                                print("Posting message `"+message+"'%N")
                                socket.post(message)
                        end)
                        -- Granularity at cluster level may be too coarse, perhaps it may
                        -- be  better to do it at class level
         end
      end

        socket_path, controller_path: ABSTRACT_STRING
        messaging_context: ZMQ_CONTEXT
        socket: ZMQ_PUSH_SOCKET
        controller: ZMQ_PUSH_SOCKET
        workers: FAST_ARRAY[LLVM_WORKER]

feature {ANY}
   get_started
      require
         smart_eiffel.status.is_safety_checking
      do
         smart_eiffel.status.set_generating
      end

   make
      do
      end

        is_equal (another: like Current): BOOLEAN
                do
                        Result := to_pointer = another.to_pointer
                end
end -- class LLVM_BYTECODE_EMITTER
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
-- Copyright (C) 2012-2017: Paolo Redaelli
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
