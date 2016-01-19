class FIRST_PLUGIN
	-- My plugin example

inherit MY_PLUGIN

create {ANY} make

feature {ANY}
	make is
		do
			value  := 17 000
			name := "Plugin, Effective Plugin"
		end

	do_stuff is 
		do 
			io.put_string(name)
			io.put_string(once " sends ")
			io.put_integer(value)
			io.put_line(onec " postcards.")
		end

	put (a_string: STRING) is
		do 
			io.put_string(once "Plugin says: ")
			io.put_line (a_string)
		end

	add (an_integer: INTEGER) is 
		do 
			value:=value+an_integer	
		end
feature {}
	value: INTEGER
	name: STRING
end

