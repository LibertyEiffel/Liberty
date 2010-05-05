class C_ELLIPSIS
	-- An "Ellipsis" node of in an XML file produced by gccxml.

inherit C_FUNCTION_ARGUMENT

creation make

feature
	is_ellipsis: BOOLEAN is True

	has_wrapper: BOOLEAN is False

	put_on (a_buffer: FORMATTER) is
	do
		a_buffer.append("%N%T%T%T -- Ellipsis%N")
	end

--invariant name.is_equal(once U"Ellipsis")
end -- C_ELLIPSIS
		
