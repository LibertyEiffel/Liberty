class C_ARGUMENT
	-- An "Argument" node of an XML file made by gccxml.

inherit
	C_FUNCTION_ARGUMENT
	NAMED_NODE
	TYPED_NODE
	LIBERTY_TYPED

insert
	NAME_CONVERTER

creation make

feature 
	is_ellipsis: BOOLEAN is False

	wrapper_type: STRING is
		do
			Result:=types.at(dequalify(type)).wrapper_type
		end

	placeholder: STRING is
		-- The placeholder name of Current, suitable for Liberty as a newly created string.
	do
		if c_name = Void then
			-- Nameless prototype: providing sound default, using
			-- line and column, which are locally unique.
			Result := "an_argument_l"
			line.append_in(Result)
			Result.append(once "_c")
			column.append_in(Result)
		else Result := eiffel_argument(c_name.as_utf8) 
		end
	ensure Result/=Void; not Result.is_empty
	end

	put_on (a_buffer: FORMATTER) is
	local a_placeholder, a_wrapper_type: STRING
	do
		-- Cache results of `placeholder' and `wrapper_type' queries
		a_placeholder := placeholder
		a_wrapper_type := wrapper_type
		log(once "@(1): @(2) ", <<a_placeholder, a_wrapper_type>>)
		a_buffer.put_message (once "@(1): @(2)", <<a_placeholder, a_wrapper_type>>)
	end

end -- class C_ARGUMENT

