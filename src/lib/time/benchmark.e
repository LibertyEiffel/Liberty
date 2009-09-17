class BENCHMARK
	--
	-- Benchmarking facilities
	--

insert
	ANY
	PLATFORM

creation {ANY}
	make

feature {ANY}
	make (n: like name) is
		require
			n /= Void
		do
			name := n
			in_progress := False
			counter := 0
			total_time := 0
			min_time := Maximum_real
			max_time := 0
			last_print := 0
		ensure
			not in_progress
			counter = 0
		end

	start is
		require
			not in_progress
		do
			start_time.update
			in_progress := True
		ensure
			in_progress
		end

	next is
		require
			in_progress
		local
			end_time: MICROSECOND_TIME; exec_time: REAL
		do
			end_time.update
			exec_time := start_time.elapsed_seconds(end_time)
			start_time := end_time
			total_time := total_time + exec_time
			if exec_time < min_time then
				min_time := exec_time
			end
			if exec_time > max_time then
				max_time := exec_time
			end
			counter := counter + 1
			smart_print
		ensure
			counter = old counter + 1
			in_progress
		end

	stop is
		require
			in_progress
		do
			next
			in_progress := False
		ensure
			counter = old counter + 1
			not in_progress
		end

	break is
			-- useful for loop termination
		require
			in_progress
		do
			in_progress := False
		ensure
			counter = old counter
			not in_progress
		end

	name: STRING

	in_progress: BOOLEAN

	counter: INTEGER --|*** PH (14/06/2005) INTEGER_64?

	min_time: REAL -- in seconds

	max_time: REAL -- in seconds

	total_time: REAL -- in seconds

	mean_time: REAL is
			-- in seconds
		require
			counter > 0
		do
			Result := total_time / counter
		end

	set_custom_print (cp: like custom_print) is
		do
			custom_print := cp
		end

	print_now is
		do
			if custom_print /= Void then
				custom_print.call([Current])
			else
				default_print
			end
			last_print := total_time
		end

	smart_print is
		do
			if total_time - last_print > total_time / 10 + 1 then
				print_now
			end
		end

feature {}
	start_time: MICROSECOND_TIME

	last_print: REAL -- total_time value when last print occured

	custom_print: PROCEDURE[TUPLE[BENCHMARK]] -- Used if non Void. See also default_print

	default_print is
			-- Used if custom_print is Void
		require
			counter > 0
		local
			speed: REAL
		do
			speed := mean_time
			if speed < 0.1 then
				std_output.put_real(1.0 / speed)
				std_output.put_character(' ')
				std_output.put_string(name)
				std_output.put_string(once "/s")
			else
				std_output.put_real(speed)
				std_output.put_character(' ')
				std_output.put_string(once "s/")
				std_output.put_string(name)
			end
			std_output.put_string(once ", min: ")
			std_output.put_real(min_time)
			std_output.put_string(once "s, max: ")
			std_output.put_real(max_time)
			std_output.put_string(once "s, counter: ")
			std_output.put_integer(counter)
			std_output.put_new_line
		end

end -- class BENCHMARK
