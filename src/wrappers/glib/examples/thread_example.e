class THREAD_EXAMPLE

creation make

feature {ANY} 
	make is
		do
			print("Creating threads...%N")
			create t1; create t2; create t3
			t1.set(100); t2.set(1000); t3.set(2000)
			t1.start; t2.start; t3.start
			print("Waiting...")
			t1.join
			t2.join
			t3.join
			print("ohh%N")
		end

		t1,t2,t3: MY_THREAD
end
