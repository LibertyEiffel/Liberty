class LIBERTY_FEATURE_LOCAL_CONTEXT

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	result_type: LIBERTY_TYPE is
		do
			if result_entity /= Void then
				Result := result_entity.result_type
			end
		end

	parameters: TRAVERSABLE[LIBERTY_PARAMETER] is
		do
			Result := parameters_list
		ensure
			definition: Result = parameters_list
			exists: Result /= Void
		end

	locals: TRAVERSABLE[LIBERTY_LOCAL] is
		do
			Result := locals_list
		ensure
			definition: Result = locals_list
			exists: Result /= Void
		end

	is_parameter (name: ABSTRACT_STRING): BOOLEAN is
		require
			name /= Void
		do
			Result := parameters_map.has(name)
		end

	parameter (name: ABSTRACT_STRING): LIBERTY_PARAMETER is
		require
			name /= Void
			is_parameter(name)
		do
			Result := parameters_map.reference_at(name)
		ensure
			Result /= Void
		end

	is_local (name: ABSTRACT_STRING): BOOLEAN is
		require
			name /= Void
		do
			Result := locals_map.has(name)
		end

	local_var (name: ABSTRACT_STRING): LIBERTY_LOCAL is
		require
			name /= Void
			is_local(name)
		do
			Result := locals_map.has(name)
		ensure
			Result /= Void
		end

	result_entity: LIBERTY_RESULT

feature {LIBERTY_TYPE_BUILDER}
	add_parameter (a_parameter: LIBERTY_PARAMETER) is
		require
			a_parameter /= Void
		do
			parameters_list.add_last(a_parameter)
			parameters_map.add(a_parameter, a_parameter.name)
		end

	add_local (a_local: LIBERTY_LOCAL) is
		require
			a_local /= Void
		do
			locals_list.add_last(a_local)
			locals_map.add(a_local, a_local.name)
		end

feature {}
	parameters_map: DICTIONARY[LIBERTY_PARAMETER, FIXED_STRING]
	parameters_list: COLLECTION[LIBERTY_PARAMETER]
	locals_map: DICTIONARY[LIBERTY_LOCAL, FIXED_STRING]
	locals_list: COLLECTION[LIBERTY_LOCAL]

	make (a_result_type: like result_type) is
		do
			create {FAST_ARRAY[LIBERTY_PARAMETER]} parameters_list.make(0)
			create {HASHED_DICTIONARY[LIBERTY_PARAMETER, FIXED_STRING]} parameters_map.make
			create {FAST_ARRAY[LIBERTY_LOCAL]} locals_list.make(0)
			create {HASHED_DICTIONARY[LIBERTY_LOCAL, FIXED_STRING]} locals_map.make
			create result_entity.make(a_result_type)
		ensure
			result_type = a_result_type
		end

invariant
	parameters_list /= Void
	locals_list /= Void
	parameters_map /= Void
	locals_map /= Void

end
