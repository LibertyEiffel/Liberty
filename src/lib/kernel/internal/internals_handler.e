class INTERNALS_HANDLER
	--
	-- '''Warning:''' This interface is tentative and may change to a large extent from SmartEiffel 2.2 to
	-- SmartEiffel 2.3.
	--
	-- All classes that use INTERNALS must be descendants of INTERNALS_HANDLER.
	--

feature {}
	valid_generating_type_for_internals (type: STRING): BOOLEAN is
		require
			type /= Void
		external "built_in"
		ensure
			Result implies not type.has_prefix(once "NATIVE_ARRAY")
		end

	internals_from_generating_type (type: STRING): INTERNALS is
		require
			valid_generating_type_for_internals(type)
		external "built_in"
		ensure
			Result /= Void
			Result.object_can_be_modified
		end

	valid_generating_type_for_native_array_internals (type: STRING): BOOLEAN is
		require
			type /= Void
		external "built_in"
		ensure
			Result implies type.has_prefix(once "NATIVE_ARRAY")
		end

	native_array_internals_from_generating_type (type: STRING; capacity: INTEGER): INTERNALS is
		require
			valid_generating_type_for_native_array_internals(type)
		external "built_in"
		ensure
			Result /= Void
			Result.object_can_be_modified
		end

end -- class INTERNALS_HANDLER
