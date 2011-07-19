class FAKE_PLUGIN_FACTORY

inherit
	PLUGIN_FACTORY

creation {ANY}
	make

feature {ANY}
	make is
		do
		end

feature {SYSTEM_TOOLS}
	new (position: POSITION; a_name, a_path: STRING): FAKE_PLUGIN is
		do
			create Result.make(position, a_name, a_path)
		end

end -- class FAKE_PLUGIN_FACTORY
