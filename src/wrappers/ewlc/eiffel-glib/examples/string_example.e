note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class STRING_EXAMPLE

create {ANY} make
feature {ANY}
	string: G_STRING
	make
		local i: INTEGER; c: CHARACTER
		do
			create string.make (10)
			print ("String count is "+string.count.out+"%N")
			from i:=0; c:='a' until c>'j' loop
				string.put(c,i)
				c:=c.next
				i:=i+1
			end
			print(string.to_string)
		end
end	
				
