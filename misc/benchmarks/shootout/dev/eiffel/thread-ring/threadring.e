class THREADRING

insert
	ARGUMENTS

create {}
	make

feature {}
	number_of_threads: INTEGER 503

	make
		local
			n: INTEGER
			pi: PIPE_INPUT
		do
			create linkme.make
			create pi.connect_to(linkme)
			n := argument(1).to_integer
			create_links
			create_threads(pi)
			links.first.put_integer(n)
			links.first.put_new_line
			linkme.read_line
			std_output.put_line(linkme.last_string)
			kill_threads
		end

	linkme: PIPE_OUTPUT
	links: FAST_ARRAY[PIPE_INPUT]

	create_links
		local
			i: INTEGER; po: PIPE_OUTPUT; pi: PIPE_INPUT
		do
			create links.make(number_of_threads + 1)
			from
				i := 0
			until
				i = number_of_threads
			loop
				create po.make
				create pi.connect_to(po)
				links.put(pi, i)
				i := i + 1
			end
			links.put(links.first, i)
		end

	create_threads (linktome: PIPE_INPUT)
		local
			i: INTEGER; tp: THREADRING_PROCESS
		do
			from
				i := 1
			until
				i > number_of_threads
			loop
				create tp.make(i, links.item(i - 1).output, links.item(i), linktome)
				i := i + 1
			end
		end

	kill_threads
		local
			i: INTEGER
		do
			from
				i := 0
			until
				i = number_of_threads
			loop
				links.item(i).put_line(once "shutdown")
				i := i + 1
			end
		end

end
