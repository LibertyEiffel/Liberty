-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class THREADS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_cleanup_threads 
               -- xmlCleanupThreads
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCleanupThreads"
               }"
               end

	xml_free_mutex (a_tok: POINTER) 
               -- xmlFreeMutex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeMutex"
               }"
               end

	xml_free_rmutex (a_tok: POINTER) 
               -- xmlFreeRMutex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeRMutex"
               }"
               end

	xml_get_global_state: POINTER 
               -- xmlGetGlobalState
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetGlobalState"
               }"
               end

	xml_get_thread_id: INTEGER 
               -- xmlGetThreadId
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetThreadId"
               }"
               end

	xml_init_threads 
               -- xmlInitThreads
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlInitThreads"
               }"
               end

	xml_is_main_thread: INTEGER 
               -- xmlIsMainThread
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIsMainThread"
               }"
               end

	xml_lock_library 
               -- xmlLockLibrary
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlLockLibrary"
               }"
               end

	xml_mutex_lock (a_tok: POINTER) 
               -- xmlMutexLock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlMutexLock"
               }"
               end

	xml_mutex_unlock (a_tok: POINTER) 
               -- xmlMutexUnlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlMutexUnlock"
               }"
               end

	xml_new_mutex: POINTER 
               -- xmlNewMutex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewMutex"
               }"
               end

	xml_new_rmutex: POINTER 
               -- xmlNewRMutex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewRMutex"
               }"
               end

	xml_rmutex_lock (a_tok: POINTER) 
               -- xmlRMutexLock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRMutexLock"
               }"
               end

	xml_rmutex_unlock (a_tok: POINTER) 
               -- xmlRMutexUnlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRMutexUnlock"
               }"
               end

	xml_unlock_library 
               -- xmlUnlockLibrary
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUnlockLibrary"
               }"
               end


end -- class THREADS_EXTERNALS
