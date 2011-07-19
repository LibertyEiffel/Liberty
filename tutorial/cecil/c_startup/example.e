class EXAMPLE
--
-- This example shows how to start execution from outside (external C code starts the
-- execution before calling Eiffel code).
--
-- Obviously, external C code must provide the C main function. In order to avoid double definition of 
-- the main function, one must use option -no_main of command `compile_to_c'.
-- In such a case, the Eiffel root object is accessible only via the predefined C variable 
-- `eiffel_root_object'.
--
-- One must also keep in mind that some internal Eiffel runtime information have to be initialized 
-- before calling any Eiffel feature. Thus, before the first Eiffel call, the external C code
-- have to call C function `initialize_eiffel_runtime(argc,argv)'.
--
--
-- To compile this example, use command:
--
--  se c -no_main -cecil cecil.se example c_prog.c
--

creation {ANY}
	make

feature {ANY}
	make is
		do
		end

	do_it is
		do
			io.put_string("Hi from Eiffel world.%N")
		end

end -- class EXAMPLE
