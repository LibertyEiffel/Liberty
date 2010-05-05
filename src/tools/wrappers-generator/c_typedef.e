class C_TYPEDEF

inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE
	TYPED_NODE
	WRAPPABLE_NODE
	STORABLE_NODE

creation make

feature 
	store is
		do
			typedefs.fast_put(Current,id)
			types.fast_put(Current,id)
		end

	wrapper_type: STRING is
		local referree: TYPED_NODE
		do
			referree := types.at(type)
			if referree.has_wrapper 
				then Result := referree.wrapper_type
			else not_yet_implemented
			end
		end

	is_fundamental: BOOLEAN is
		do
			Result := types.at(type).is_fundamental
		end

	is_void: BOOLEAN is False

	has_wrapper: BOOLEAN is
		do
			Result := types.at(type).has_wrapper
		end

	wrap_on (a_stream: OUTPUT_STREAM) is
		-- If Current ultimately refers to a fundamental type then put an empty query on `a_stream', otherwise nothing is done.
	local query_name: STRING
	do
		if is_fundamental then 
			inspect wrapper_type
			when "void" then buffer.put_message (once "%T-- @(1) typedef to void%N", <<c_string_name>>)
			when "" then buffer.put_message (once "%T-- @(1) unwrappable: no wrapper type.%N", <<c_string_name>>)
			else
				query_name := eiffel_feature(c_string_name)
				log(once "@(1)->@(2), ",<<c_string_name,query_name>>)
				buffer.put_message (once 
				"	@(1): @(2) is%N%
				%		-- typedef @(3)%N%
				%		-- Empty by design, used for anchored declarations.%N%
				%	do%N%
				%	ensure Result.is_default%N%
				%	end%N%
				%%N", <<query_name, wrapper_type, c_string_name>>)
			end
			buffer.print_on(a_stream)
		end
		-- Old code: 
		-- c_string_name := c_name.to_utf8
		-- inspect wrapper_type
		-- when "void" then buffer.put_message (once "%T-- @(1) typedef to void%N", <<c_string_name>>)
		-- when "" then buffer.put_message (once "%T-- @(1) unwrappable: no wrapper type.%N", <<c_string_name>>)
		-- else
		-- 	query_name := eiffel_feature(c_string_name)
		-- 	log(once "@(1)->@(2), ",<<c_string_name,query_name>>)
		-- 	buffer.put_message (once 
		-- 	"	@(1): @(2) is%N%
		-- 	%		-- typedef @(3)%N%
		-- 	%		-- Empty by design, used for anchored declarations.%N%
		-- 	%	do%N%
		-- 	%	ensure Result.is_default%N%
		-- 	%	end%N%
		-- 	%%N", <<query_name, wrapper_type, c_string_name>>)
		-- end
		-- buffer.print_on(a_stream)
		-- buffer.reset
	end

-- invariant name.is_equal(once U"Typedef")
end
