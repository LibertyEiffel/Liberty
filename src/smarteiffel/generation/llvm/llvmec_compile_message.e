class LLVMEC_COMPILE_MESSAGE
-- A message from the main process of llvmec command to its worker
-- processes, to start compilation of a specific part (usually a cluster or
-- a class).
inherit
   ZMQ_MESSAGE
create {LLVM_BYTECODE_EMITTER} to_compile_cluster
feature {}
   to_compile_cluster (a_cluster: CLUSTER) is
      require a_cluster/=Void
      do
         cluster := a_cluster
         allocate
         -- The message body is actually the content of Current
         handle_return_value(zmq_msg_init_data
                             (handle,to_pointer,object_size.to_natural_64,
                              default_pointer, -- i.e. no deallocation function
                              default_pointer  -- i.e. no data hint for the deallocation function
                              ))
         -- Note: we may provide the address of dispose as deallocation function.
      end
feature {ANY}
   cluster: CLUSTER
      end
