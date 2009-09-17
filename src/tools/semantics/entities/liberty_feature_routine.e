deferred class LIBERTY_FEATURE_ROUTINE

inherit
	LIBERTY_FEATURE_DEFINITION

feature {ANY}
	is_require: BOOLEAN is
		do
			Result := precondition_type = precondition_require
		end

	is_require_else: BOOLEAN is
		do
			Result := precondition_type = precondition_require_else
		end

	is_require_then: BOOLEAN is
		do
			Result := precondition_type = precondition_require_then
		end

	is_ensure: BOOLEAN is
		do
			Result := postcondition_type = postcondition_ensure
		end

	is_ensure_then: BOOLEAN is
		do
			Result := postcondition_type = postcondition_ensure_then
		end

	preconditions: TRAVERSABLE[LIBERTY_ASSERTION]
	postconditions: TRAVERSABLE[LIBERTY_ASSERTION]

feature {LIBERTY_TYPE_BUILDER}
	precondition_set: BOOLEAN is
		do
			Result := precondition_type /= 0
		ensure
			Result = (is_require or is_require_else or is_require_then)
			Result implies preconditions /= Void
		end

	set_require (assertions: like preconditions) is
		require
			not precondition_set
		do
			precondition_type := precondition_require
			preconditions := assertions
		ensure
			is_require
			preconditions = assertions
		end

	set_require_else (assertions: like preconditions) is
		require
			not precondition_set
		do
			precondition_type := precondition_require_else
			preconditions := assertions
		ensure
			is_require_else
			preconditions = assertions
		end

	set_require_then (assertions: like preconditions) is
		require
			not precondition_set
		do
			precondition_type := precondition_require_then
			preconditions := assertions
		ensure
			is_require_then
			preconditions = assertions
		end

	postcondition_set: BOOLEAN is
		do
			Result := postcondition_type /= 0
		ensure
			Result = (is_ensure or is_ensure_then)
			Result implies postconditions /= Void
		end

	set_ensure (assertions: like postconditions) is
		require
			not postcondition_set
		do
			postcondition_type := postcondition_ensure
			postconditions := assertions
		ensure
			is_ensure
			postconditions = assertions
		end

	set_ensure_then (assertions: like postconditions) is
		require
			not postcondition_set
		do
			postcondition_type := postcondition_ensure_then
			postconditions := assertions
		ensure
			is_ensure_then
			postconditions = assertions
		end

feature {}
	precondition_require: INTEGER is 1
	precondition_require_else: INTEGER is 2
	precondition_require_then: INTEGER is 3

	postcondition_ensure: INTEGER is 1
	postcondition_ensure_then: INTEGER is 2

	precondition_type: INTEGER
	postcondition_type: INTEGER

end
