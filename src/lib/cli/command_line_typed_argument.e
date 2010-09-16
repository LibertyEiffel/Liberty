deferred class COMMAND_LINE_TYPED_ARGUMENT[E_]

inherit
	COMMAND_LINE_ARGUMENT

feature {ANY}
	item: E_ is
		deferred
		end

	as_mandatory, prefix "+": like Current is
			-- make the option mandatory
		require
			can_be_mandatory
		do
			if is_mandatory then
				Result := Current
			else
				Result := twin
				Result.set_mandatory(Current, True)
			end
		ensure
			Result.is_mandatory
		end

	as_optional, prefix "-": like Current is
			-- make the option optional (default)
		require
			can_be_optional
		do
			if is_optional then
				Result := Current
			else
				Result := twin
				Result.set_mandatory(Current, False)
			end
		ensure
			not Result.is_mandatory
		end

feature {ANY}
	is_mandatory: BOOLEAN is
		deferred
		ensure
			Result implies can_be_mandatory
		end

	is_optional: BOOLEAN is
		deferred
		ensure
			Result implies not is_positional
			is_mandatory implies not Result
			Result implies can_be_optional
		end

	is_positional: BOOLEAN is
		deferred
		ensure
			Result implies not is_optional
			Result implies is_mandatory
		end

	can_be_mandatory: BOOLEAN is
		deferred
		end

	can_be_optional: BOOLEAN is
		deferred
		end

feature {ANY}
	short: FIXED_STRING is
		deferred
		end

	long: FIXED_STRING is
		deferred
		end

	usage: FIXED_STRING is
		deferred
		end

	force_index (a_index: INTEGER) is
			-- Force a positional parameter to be valid only at the given index
		require
			a_index > 0
			is_positional
			not is_repeatable
		deferred
		end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
	set_mandatory (parent_option: like Current; enable: BOOLEAN) is
		require
			parent_option /= Void
			enable /= is_mandatory
			enable implies can_be_mandatory
			;(not enable) implies can_be_optional
		deferred
		ensure
			parent = parent_option
			is_mandatory = enable
		end

feature {}
	parent: like Current is
		deferred
		end

invariant
	is_optional or else is_positional or else is_mandatory

end -- class COMMAND_LINE_TYPED_ARGUMENT
