class DO_STUFF
inherit G_POOLED_ROUTINE
creation
	make,
	default_create
feature {ANY} 
	make (an_i: INTEGER_32) is
	local msg: STRING
	do
		i:=an_i
		msg := "Looking for "
		i.append_in(msg)
		msg.append(once ".%N")
		-- Warning! to_string is NOT thread safe!
		print(msg)

	end
	
	invoke (a_pool: G_THREAD_POOL[G_POOLED_ROUTINE]) is
		local x: like i; msg: STRING
		do
			from is_prime:=False; x:=2
			until not is_prime or x>=i loop
				is_prime := (i\\x)=0 -- rest of the division
				x:=x+1
			end
			msg := ""; i.append_in(msg)
			if is_prime then msg.append(" is prime.%N") 
			else msg.append(" is not prime.%N") 
			end
			print (msg)

		end

	i: INTEGER_32
	is_prime: BOOLEAN
end
