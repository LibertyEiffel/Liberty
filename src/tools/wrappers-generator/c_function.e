class C_FUNCTION

inherit
	GCCXML_NODE 
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE
	STORABLE_NODE
	WRAPPABLE_NODE
creation make

feature 
	store is
		do
			functions.store(Current)
		end
	
	returns: UNICODE_STRING is do Result:=attribute_at(once U"returns") end

	wrap_on (a_stream: OUTPUT_STREAM) is
		local name: STRING
		do
			unwrappable:=False
			name := adapt(c_name.as_utf8.as_lower)
			-- TODO: this way of assigning feature names is not entirely
			-- bullet-proof. In fact MyFunction and myfunction will get the same
			-- Eiffel feature name. Let me say that if the code you are going
			-- wrapping presents such issues it is not worth your time AFAIK. Paolo
			-- 2009-02-06.
			if is_public(name) then
				log(once "Function @(1)",<<name>>)
				a_stream.put_message(once "%T@(1)", <<name>>)
				if children_count > 0 then put_arguments_on (a_stream) end
				put_return_type_on (a_stream)
				emit_description_on(feature_description(class_name, name),a_stream)
				append_function_body(a_stream)
				-- if unwrappable then log("Function @(1) is not wrappable.%N", <<name>>) end
				log_string(once "%N")
			else log(once "Skipping 'hidden' function @(1)%N", <<name>>)
			end
		end
	do
		end
	
	c_function_name: STRING
			-- The untranslated C name of the function currently being wrapped

		variadic: BOOLEAN
			-- Is the function currently being emitted variadic?

		unwrappable: BOOLEAN 
			-- Is the function currently being emitted unwrappable?

	
		append_function_arguments (a_node: XML_COMPOSITE_NODE) is
				-- Append the arguments of function referred by `a_node' into
				-- `buffer'. If an Ellipsis ("...") is found `variadic' flag
				-- is set to True
			require
				node_not_void: a_node /= Void
				is_function_node: a_node.name.is_equal(once U"Function")
				has_arguments: a_node.children_count > 0
			local
				i: INTEGER; child: XML_NODE
			do
				variadic := False
				buffer.append(once " (")
				log(once "(@(1) args: ",<<a_node.children_count.out>>)
				append_function_argument(a_node.child(1))
				from i:=2 until i>a_node.children_count or variadic or unwrappable loop
					buffer.append(once "; ") -- check a_node/=Void end
					child:=a_node.child(i) -- check child/=Void end 
					append_function_argument(child)
					i := i + 1
				end
				log_string(once ")")
				buffer.append(once ")")
			end


		put_return_type_on (a_stream: OUTPUT_STREAM) is
				-- Append the Eiffel equivalent type of the return type of
				-- `a_node' to `a_stream' and the "is" keyword, i.e. ": INTEGER_32 is " or ":
				-- POINTER is". When result of `a_node' is "void" only " is" is appended.
			require
				node_not_void: a_node /= Void
				is_function_node: a_node.name.is_equal(once U"Function")
			local eiffel_type
			do
				eiffel_type := types.at(returns).wrapper_type
				if returns = Void then
					a_stream.put_message ("%N%T%T%T-- unwrappable return type: @(1)%N", <<last_error>>)
					log(once "Unwrappable return type: @(1)... ",<<last_error>>)
					unwrappable:=True
					last_error := Void -- Error handled, reset it.
				elseif returns.is_empty then
					-- Nothing; the correct "return type" of a C function returning void (i.e. a command) is an empty string.
				else
					a_stream.append(once ": ")
					a_stream.append(returns)
				end
				buffer.append(once " is%N")
			end

		append_function_body (a_node: XML_COMPOSITE_NODE) is
				-- Append the body of function referred by `a_node'
			require
				node_not_void: a_node /= Void
				is_function_node: a_node.name.is_equal(once U"Function")
				c_function_name_not_void: c_function_name /= Void
			deferred
			end


invariant name.is_equal(once U"Function")
end
