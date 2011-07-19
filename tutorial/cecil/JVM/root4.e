class ROOT4

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
			-- get a string that has capacity greater than count
			Result := "XXXXHi from ROOT4"
			Result.remove(1)
			Result.remove(1)
			Result.remove(1)
			Result.remove(1)
		end

	put_string (s: STRING) is
		do
			io.put_string("'")
			io.put_string(s)
			io.put_string("'%N")
		end

end -- class ROOT4
