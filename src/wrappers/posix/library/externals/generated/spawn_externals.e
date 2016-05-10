-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SPAWN_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	posix_spawn (a_pid: POINTER; a_path: POINTER; a_file_actions: POINTER; an_attrp: POINTER; an_argv: POINTER; an_envp: POINTER): INTEGER 

		-- function posix_spawn (in `/usr/include/spawn.h')
               -- posix_spawn
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawn"
               }"
               end

	posix_spawn_file_actions_addclose (a_file_actions: POINTER; a_fd: INTEGER): INTEGER 

		-- function posix_spawn_file_actions_addclose (in `/usr/include/spawn.h')
               -- posix_spawn_file_actions_addclose
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawn_file_actions_addclose"
               }"
               end

	posix_spawn_file_actions_adddup2 (a_file_actions: POINTER; a_fd: INTEGER; a_newfd: INTEGER): INTEGER 

		-- function posix_spawn_file_actions_adddup2 (in `/usr/include/spawn.h')
               -- posix_spawn_file_actions_adddup2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawn_file_actions_adddup2"
               }"
               end

	posix_spawn_file_actions_addopen (a_file_actions: POINTER; a_fd: INTEGER; a_path: POINTER; an_oflag: INTEGER; a_mode: NATURAL): INTEGER 

		-- function posix_spawn_file_actions_addopen (in `/usr/include/spawn.h')
               -- posix_spawn_file_actions_addopen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawn_file_actions_addopen"
               }"
               end

	posix_spawn_file_actions_destroy (a_file_actions: POINTER): INTEGER 

		-- function posix_spawn_file_actions_destroy (in `/usr/include/spawn.h')
               -- posix_spawn_file_actions_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawn_file_actions_destroy"
               }"
               end

	posix_spawn_file_actions_init (a_file_actions: POINTER): INTEGER 

		-- function posix_spawn_file_actions_init (in `/usr/include/spawn.h')
               -- posix_spawn_file_actions_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawn_file_actions_init"
               }"
               end

	posix_spawnattr_destroy (an_attr: POINTER): INTEGER 

		-- function posix_spawnattr_destroy (in `/usr/include/spawn.h')
               -- posix_spawnattr_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawnattr_destroy"
               }"
               end

	posix_spawnattr_getflags (an_attr: POINTER; a_flags: POINTER): INTEGER 

		-- function posix_spawnattr_getflags (in `/usr/include/spawn.h')
               -- posix_spawnattr_getflags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawnattr_getflags"
               }"
               end

	posix_spawnattr_getpgroup (an_attr: POINTER; a_pgroup: POINTER): INTEGER 

		-- function posix_spawnattr_getpgroup (in `/usr/include/spawn.h')
               -- posix_spawnattr_getpgroup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawnattr_getpgroup"
               }"
               end

	posix_spawnattr_getschedparam (an_attr: POINTER; a_schedparam: POINTER): INTEGER 

		-- function posix_spawnattr_getschedparam (in `/usr/include/spawn.h')
               -- posix_spawnattr_getschedparam
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawnattr_getschedparam"
               }"
               end

	posix_spawnattr_getschedpolicy (an_attr: POINTER; a_schedpolicy: POINTER): INTEGER 

		-- function posix_spawnattr_getschedpolicy (in `/usr/include/spawn.h')
               -- posix_spawnattr_getschedpolicy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawnattr_getschedpolicy"
               }"
               end

	posix_spawnattr_getsigdefault (an_attr: POINTER; a_sigdefault: POINTER): INTEGER 

		-- function posix_spawnattr_getsigdefault (in `/usr/include/spawn.h')
               -- posix_spawnattr_getsigdefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawnattr_getsigdefault"
               }"
               end

	posix_spawnattr_getsigmask (an_attr: POINTER; a_sigmask: POINTER): INTEGER 

		-- function posix_spawnattr_getsigmask (in `/usr/include/spawn.h')
               -- posix_spawnattr_getsigmask
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawnattr_getsigmask"
               }"
               end

	posix_spawnattr_init (an_attr: POINTER): INTEGER 

		-- function posix_spawnattr_init (in `/usr/include/spawn.h')
               -- posix_spawnattr_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawnattr_init"
               }"
               end

	posix_spawnattr_setflags (an_attr: POINTER; a_flags: INTEGER_16): INTEGER 

		-- function posix_spawnattr_setflags (in `/usr/include/spawn.h')
               -- posix_spawnattr_setflags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawnattr_setflags"
               }"
               end

	posix_spawnattr_setpgroup (an_attr: POINTER; a_pgroup: INTEGER): INTEGER 

		-- function posix_spawnattr_setpgroup (in `/usr/include/spawn.h')
               -- posix_spawnattr_setpgroup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawnattr_setpgroup"
               }"
               end

	posix_spawnattr_setschedparam (an_attr: POINTER; a_schedparam: POINTER): INTEGER 

		-- function posix_spawnattr_setschedparam (in `/usr/include/spawn.h')
               -- posix_spawnattr_setschedparam
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawnattr_setschedparam"
               }"
               end

	posix_spawnattr_setschedpolicy (an_attr: POINTER; a_schedpolicy: INTEGER): INTEGER 

		-- function posix_spawnattr_setschedpolicy (in `/usr/include/spawn.h')
               -- posix_spawnattr_setschedpolicy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawnattr_setschedpolicy"
               }"
               end

	posix_spawnattr_setsigdefault (an_attr: POINTER; a_sigdefault: POINTER): INTEGER 

		-- function posix_spawnattr_setsigdefault (in `/usr/include/spawn.h')
               -- posix_spawnattr_setsigdefault
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawnattr_setsigdefault"
               }"
               end

	posix_spawnattr_setsigmask (an_attr: POINTER; a_sigmask: POINTER): INTEGER 

		-- function posix_spawnattr_setsigmask (in `/usr/include/spawn.h')
               -- posix_spawnattr_setsigmask
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawnattr_setsigmask"
               }"
               end

	posix_spawnp (a_pid: POINTER; a_file: POINTER; a_file_actions: POINTER; an_attrp: POINTER; an_argv: POINTER; an_envp: POINTER): INTEGER 

		-- function posix_spawnp (in `/usr/include/spawn.h')
               -- posix_spawnp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_spawnp"
               }"
               end


end -- class SPAWN_EXTERNALS
