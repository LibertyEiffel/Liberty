class C_FIELD

inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	CONTEXTED_NODE
	FILED_NODE
	TYPED_NODE
	STORABLE_NODE

creation make

feature 
	store is
		local container: COMPOSED_NODE
		do
			container := composed_types.reference_at(context)
			if container/=Void then
				container.fields.add_last(Current)
			end
		end
	
	is_fundamental: BOOLEAN is
		do
			Result:=types.at(dequalify(type)).is_fundamental
		end

	is_void: BOOLEAN is False

	has_wrapper: BOOLEAN is
		do
			Result:=types.at(dequalify(type)).has_wrapper
		end

	wrapper_type: STRING is
		do
			Result:=types.at(dequalify(type)).wrapper_type
		end

	append_getter_and_setter (a_structure_name: STRING) is
		require a_structure_name/=Void
		local setter, getter, eiffel_field, getter_description, setter_description: STRING
		do
			if has_wrapper then
				eiffel_field := adapt(c_string_name)
				setter := a_structure_name + once "_set_" + eiffel_field
				getter := a_structure_name + once "_get_" + eiffel_field
				setter.to_lower
				getter.to_lower
				-- TODO: descriptions := feature_descriptions.reference_at(a_structure_name)	
				getter_description:="-- TODO: getter description%N"
				setter_description:="-- TODO: setter description%N"
				-- if descriptions /= Void then
				-- 	setter_description:=formatted_description(descriptions.reference_at(eiffel_field))
				-- 	getter_description:=formatted_description(descriptions.reference_at(eiffel_field))
				-- else setter_description:=once ""; getter_description:=once ""
				-- end
				-- log(once "Field @(1).@(2) (%"@(3)%", %"@(4)%" ",
				-- <<a_structure_name, c_field, setter_description,getter_description>>)
				queries.put_message(once "	@(1) (a_structure: POINTER): @(2) is%N%
				%			-- Query for @(3) field of @(4) structure.%N%
				%			@(5)%N%
				%		external %"plug_in%"%N%
				%		alias %"{%N%
				%			location: %".%"%N%
				%			module_name: %"plugin%"%N%
				%			feature_name: %"@(1)%"%N%
				%		}%"%N%
				%		end%N%N",
				<<getter, wrapper_type, 
				c_string_name, a_structure_name,
				getter_description>>)
				log_string(once "query, ")
				setters.put_message(once "	@(1) (a_structure: POINTER; a_value: @(2)) is%N%
				%			-- Setter for @(3) field of @(4) structure.%N%
				%			@(5)%N%
				%		external %"plug_in%"%N%
				%		alias %"{%N%
				%			location: %".%"%N%
				%			module_name: %"plugin%"%N%
				%			feature_name: %"@(1)%"%N%
				%		}%"%N%
				%		end%N%N",
				<<setter, wrapper_type,
				c_string_name, a_structure_name,
				setter_description>>)
				-- log_string(once "command, ")
				-- -- Note: Type safety is assured by Eiffel and GCC-XML so we can
				-- -- be less type-strict-paranoid here and use some type-casts.
				-- include.put_message(once "#define @(1)(a_structure) (((@(2)*) a_structure).@(3))%N%N",
				-- <<getter, a_structure_name, c_field>>)
				-- include.put_message(once "#define @(1)(a_structure,a_value) ((@(2)*) a_structure)->@(3) = a_value;%N%N",
				-- <<setter, a_structure_name, c_field>>)
				-- include.print_on(include_file)
				-- log_string(once "macros made).%N")
				-- else
				-- 	log(once "Field @(1) in structure @(2) is not wrappable: @(3)",
				-- 	<<c_field, a_structure_name, last_error>>)
				-- 	queries.put_message(once "%T-- Unwrappable field @(1): @(2)%N",
				-- 	<<c_field, last_error>>)
				-- 	last_error := Void -- Error handled, resetting it.
			end
		end
-- invariant name.is_equal(once U"Field")
end

