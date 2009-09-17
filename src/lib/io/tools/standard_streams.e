class STANDARD_STREAMS
	--
	-- Thanks to this `standard_streams' singleton object, you can redirect `std_input_stream',
	-- `std_output_stream' as well as `std_error_stream'.
	--
	-- See also the examples from our tutorial/io directory.
	--

insert
	SINGLETON
		rename io as any_io,
			std_input as any_std_input,
			std_output as any_std_output,
			std_error as any_std_error
		end

creation {ANY}
	make

feature {ANY}
	std_input: INPUT_STREAM
	
	std_output: OUTPUT_STREAM

	std_error: OUTPUT_STREAM

feature {ANY}
	set_std_input (a_std_input: like std_input) is
		require
			a_std_input.is_connected
		do
			std_input := a_std_input
		end

	restore_std_input is
		do
			set_std_input(any_std_input)
		end

	set_std_output (a_std_output: like std_output) is
		require
			a_std_output.is_connected
		do
			std_output := a_std_output
		end

	restore_std_output is
		do
			set_std_output(any_std_output)
		end

	set_std_error (a_std_error: like std_error) is
		require
			a_std_error.is_connected
		do
			std_error := a_std_error
		end

	restore_std_error is
		do
			set_std_error(any_std_error)
		end

feature {}
	make is
		do
			restore_std_input
			restore_std_output
			restore_std_error
		end

end -- class STANDARD_STREAMS
