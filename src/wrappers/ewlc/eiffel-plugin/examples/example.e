class EXAMPLE

inherit PLUGGABLE_FACTORY[MY_PLUGIN]

create {ANY} make

feature {ANY} 
	make is
		do
			my_plugin := get_new_pluggable("my-plugin.so")
			check 
				my_plugin /= Void 
			end
			my_plugin.do_stuff
			my_plugin.put("an example string")
			my_plugin.add(120_000)
		end

		my_plugin: MY_PLUGIN
	end
