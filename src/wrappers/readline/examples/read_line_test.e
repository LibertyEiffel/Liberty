class READ_LINE_TEST

inherit ANY 
insert READ_LINE

creation make

feature 
	make is
		do
			prompt := "Liberty> "
			from read_line until last_line.is_empty loop
				if last_line/=Void then 
					print("I got `") print(last_line) print("'%N")
				end
				read_line
			end
		end
	end 

