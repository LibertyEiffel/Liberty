-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SEMAPHORE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	sem_close (a_sem: POINTER): INTEGER 

		-- function sem_close (in `/usr/include/semaphore.h')
               -- sem_close
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sem_close"
               }"
               end

	sem_destroy (a_sem: POINTER): INTEGER 

		-- function sem_destroy (in `/usr/include/semaphore.h')
               -- sem_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sem_destroy"
               }"
               end

	sem_getvalue (a_sem: POINTER; a_sval: POINTER): INTEGER 

		-- function sem_getvalue (in `/usr/include/semaphore.h')
               -- sem_getvalue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sem_getvalue"
               }"
               end

	sem_init (a_sem: POINTER; a_pshared: INTEGER; a_value: NATURAL): INTEGER 

		-- function sem_init (in `/usr/include/semaphore.h')
               -- sem_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sem_init"
               }"
               end

	sem_open (a_name: POINTER; an_oflag: INTEGER): POINTER 

		-- function sem_open (in `/usr/include/semaphore.h')
               -- sem_open (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sem_open"
               }"
               end

	sem_post (a_sem: POINTER): INTEGER 

		-- function sem_post (in `/usr/include/semaphore.h')
               -- sem_post
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sem_post"
               }"
               end

	sem_timedwait (a_sem: POINTER; an_abstime: POINTER): INTEGER 

		-- function sem_timedwait (in `/usr/include/semaphore.h')
               -- sem_timedwait
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sem_timedwait"
               }"
               end

	sem_trywait (a_sem: POINTER): INTEGER 

		-- function sem_trywait (in `/usr/include/semaphore.h')
               -- sem_trywait
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sem_trywait"
               }"
               end

	sem_unlink (a_name: POINTER): INTEGER 

		-- function sem_unlink (in `/usr/include/semaphore.h')
               -- sem_unlink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sem_unlink"
               }"
               end

	sem_wait (a_sem: POINTER): INTEGER 

		-- function sem_wait (in `/usr/include/semaphore.h')
               -- sem_wait
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sem_wait"
               }"
               end


end -- class SEMAPHORE_EXTERNALS
