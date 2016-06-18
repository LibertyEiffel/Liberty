class DUMMY_MY_PLUGIN
	-- Dummy plugin to make the compiler happy

inherit MY_PLUGIN

feature {ANY}
	do_stuff do end
	put (a_string: STRING) do end
	add (an_integer: INTEGER) do end
end

