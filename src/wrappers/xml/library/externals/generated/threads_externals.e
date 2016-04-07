-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class THREADS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_cleanup_threads 

		-- function xmlCleanupThreads (in `/usr/include/libxml2/libxml/threads.h')
               -- xmlCleanupThreads
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCleanupThreads"
               }"
               end

	xml_free_mutex (a_tok: POINTER) 

		-- function xmlFreeMutex (in `/usr/include/libxml2/libxml/threads.h')
               -- xmlFreeMutex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeMutex"
               }"
               end

	xml_free_rmutex (a_tok: POINTER) 

		-- function xmlFreeRMutex (in `/usr/include/libxml2/libxml/threads.h')
               -- xmlFreeRMutex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeRMutex"
               }"
               end

	xml_get_global_state: POINTER 

		-- function xmlGetGlobalState (in `/usr/include/libxml2/libxml/threads.h')
               -- xmlGetGlobalState
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetGlobalState"
               }"
               end

	xml_get_thread_id: INTEGER 

		-- function xmlGetThreadId (in `/usr/include/libxml2/libxml/threads.h')
               -- xmlGetThreadId
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetThreadId"
               }"
               end

	xml_init_threads 

		-- function xmlInitThreads (in `/usr/include/libxml2/libxml/threads.h')
               -- xmlInitThreads
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlInitThreads"
               }"
               end

	xml_is_main_thread: INTEGER 

		-- function xmlIsMainThread (in `/usr/include/libxml2/libxml/threads.h')
               -- xmlIsMainThread
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlIsMainThread"
               }"
               end

	xml_lock_library 

		-- function xmlLockLibrary (in `/usr/include/libxml2/libxml/threads.h')
               -- xmlLockLibrary
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlLockLibrary"
               }"
               end

	xml_mutex_lock (a_tok: POINTER) 

		-- function xmlMutexLock (in `/usr/include/libxml2/libxml/threads.h')
               -- xmlMutexLock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlMutexLock"
               }"
               end

	xml_mutex_unlock (a_tok: POINTER) 

		-- function xmlMutexUnlock (in `/usr/include/libxml2/libxml/threads.h')
               -- xmlMutexUnlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlMutexUnlock"
               }"
               end

	xml_new_mutex: POINTER 

		-- function xmlNewMutex (in `/usr/include/libxml2/libxml/threads.h')
               -- xmlNewMutex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewMutex"
               }"
               end

	xml_new_rmutex: POINTER 

		-- function xmlNewRMutex (in `/usr/include/libxml2/libxml/threads.h')
               -- xmlNewRMutex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewRMutex"
               }"
               end

	xml_rmutex_lock (a_tok: POINTER) 

		-- function xmlRMutexLock (in `/usr/include/libxml2/libxml/threads.h')
               -- xmlRMutexLock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRMutexLock"
               }"
               end

	xml_rmutex_unlock (a_tok: POINTER) 

		-- function xmlRMutexUnlock (in `/usr/include/libxml2/libxml/threads.h')
               -- xmlRMutexUnlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRMutexUnlock"
               }"
               end

	xml_unlock_library 

		-- function xmlUnlockLibrary (in `/usr/include/libxml2/libxml/threads.h')
               -- xmlUnlockLibrary
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUnlockLibrary"
               }"
               end


end -- class THREADS_EXTERNALS
