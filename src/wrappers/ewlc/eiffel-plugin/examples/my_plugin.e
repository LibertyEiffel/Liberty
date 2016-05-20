deferred class MY_PLUGIN

inherit PLUGGABLE

feature {ANY}
	do_stuff is deferred end
	put (a_string: STRING) is deferred end
	add (an_integer: INTEGER) is deferred end
end

