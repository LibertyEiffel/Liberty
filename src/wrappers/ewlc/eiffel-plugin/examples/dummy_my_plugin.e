class DUMMY_MY_PLUGIN
	-- Dummy plugin to make the compiler happy

inherit MY_PLUGIN

feature {ANY}
	do_stuff is do end
	put (a_string: STRING) is do end
	add (an_integer: INTEGER) is do end
end

