class FAKE_PLUGIN

inherit
	PLUGIN

creation {FAKE_PLUGIN_FACTORY}
	make

feature {NATIVE_PLUG_IN}
	include (position: POSITION) is
		do
		end

feature {SYSTEM_TOOLS}
	try_auto_init is
		do
			-- nothing
		end

feature {ANY}
	auto_init_done: BOOLEAN is True

feature {}
	make (position: POSITION; a_name, a_path: STRING) is
		local
			b, p: STRING
		do
			name := a_name
			path := a_path

			-- Some plugins may do something at creation time that may change the run time set (e.g. include
			-- Cecil files, etc.)

			bd.compute_parent_directory_of(position.path)
			cwd.copy(bd.last_entry)

			b := once ""
			p := once ""
			bd.compute_subdirectory_with(absolute_path(a_path), a_name)
			b.copy(bd.last_entry)

			bd.compute_subdirectory_with(b, once "c")
			p.copy(bd.last_entry)
			bd.connect_to(p)
			if bd.is_connected then
				create c_plugin.make(position, a_name, a_path)
				bd.disconnect
			end

			bd.compute_subdirectory_with(b, once "java")
			p.copy(bd.last_entry)
			bd.connect_to(p)
			if bd.is_connected then
				create jvm_plugin.make(position, a_name, a_path)
				bd.disconnect
			end

			sedb_breakpoint
		end

	c_plugin: C_PLUGIN
	jvm_plugin: JVM_PLUGIN

end -- class FAKE_PLUGIN
