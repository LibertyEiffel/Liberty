deferred class C_FUNCTION_ARGUMENT
	-- An XML node of a file made by gccxml representing a piece of the
	-- argument list of a C function, either an actual argument or an ellipsis
	-- ("...")
inherit 
	GCCXML_NODE
insert
	SHARED_COLLECTIONS
	EXCEPTIONS
feature 
	is_ellipsis: BOOLEAN is
		-- Does Current argument make its function a variadic one?
		deferred
		end

	has_wrapper: BOOLEAN is
		deferred
		end

	put_on (a_buffer: FORMATTER) is
		-- Put an Eiffel representation on Current argument on `a_buffer'.
	require a_buffer/=Void
	deferred
	end
end
