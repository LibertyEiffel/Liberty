class ROOT3

creation {ANY}
	make

feature {ANY}
	make is
			-- Dummy root procedure to make some live code.
		do
			put_string(get_string)
		end

	get_string: STRING is
		do
			Result := "Hi from ROOT3%N"
		end

	put_string (s: STRING) is
		do
			io.put_string(s)
		end

end -- class ROOT3
