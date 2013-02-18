-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class THREADS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_init_threads is
 		-- xmlInitThreads (node at line 598)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlInitThreads()"
		}"
		end

	xml_unlock_library is
 		-- xmlUnlockLibrary (node at line 1569)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlUnlockLibrary()"
		}"
		end

	xml_is_main_thread: INTEGER_32 is
 		-- xmlIsMainThread (node at line 2252)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlIsMainThread()"
		}"
		end

	xml_rmutex_unlock (a_tok: POINTER) is
 		-- xmlRMutexUnlock (node at line 2429)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRMutexUnlock"
		}"
		end

	xml_cleanup_threads is
 		-- xmlCleanupThreads (node at line 2547)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCleanupThreads()"
		}"
		end

	xml_lock_library is
 		-- xmlLockLibrary (node at line 2772)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlLockLibrary()"
		}"
		end

	xml_mutex_unlock (a_tok: POINTER) is
 		-- xmlMutexUnlock (node at line 2807)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMutexUnlock"
		}"
		end

	xml_mutex_lock (a_tok: POINTER) is
 		-- xmlMutexLock (node at line 3719)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMutexLock"
		}"
		end

	xml_free_rmutex (a_tok: POINTER) is
 		-- xmlFreeRMutex (node at line 3896)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeRMutex"
		}"
		end

	xml_get_global_state: POINTER is
 		-- xmlGetGlobalState (node at line 4017)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetGlobalState()"
		}"
		end

	xml_rmutex_lock (a_tok: POINTER) is
 		-- xmlRMutexLock (node at line 4526)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRMutexLock"
		}"
		end

	xml_free_mutex (a_tok: POINTER) is
 		-- xmlFreeMutex (node at line 4533)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeMutex"
		}"
		end

	xml_new_mutex: POINTER is
 		-- xmlNewMutex (node at line 5150)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewMutex()"
		}"
		end

	xml_get_thread_id: INTEGER_32 is
 		-- xmlGetThreadId (node at line 5822)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetThreadId()"
		}"
		end

	xml_new_rmutex: POINTER is
 		-- xmlNewRMutex (node at line 6041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewRMutex()"
		}"
		end


end -- class THREADS_EXTERNALS
