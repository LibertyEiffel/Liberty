expanded class LIBERTY_INTERPRETER_OPTIONS

feature {ANY}
	debug_enabled: BOOLEAN is
		do
			Result := debug_memory.item
		end

	is_all_checked: BOOLEAN is
		do
			Result := level_memory.item <= level_check_all
		end

	is_invariant_checked: BOOLEAN is
		do
			Result := level_memory.item <= level_check_invariant
		end

	is_ensure_checked: BOOLEAN is
		do
			Result := level_memory.item <= level_check_ensure
		end

	is_require_checked: BOOLEAN is
		do
			Result := level_memory.item <= level_check_require
		end

	is_none_checked: BOOLEAN is
		do
			Result := level_memory.item <= level_check_none
		end

feature {LIBERTYI}
	enable_debug is
		do
			debug_memory.set_item(True)
		ensure
			debug_enabled
		end

	check_all is
		do
			level_memory.set_item(level_check_all)
		end

	check_invariant is
		do
			level_memory.set_item(level_check_invariant)
		end

	check_ensure is
		do
			level_memory.set_item(level_check_ensure)
		end

	check_require is
		do
			level_memory.set_item(level_check_require)
		end

	check_none is
		do
			level_memory.set_item(level_check_none)
		end

feature {}
	debug_memory: REFERENCE[BOOLEAN] is
		once
			create Result
		end

	level_memory: REFERENCE[INTEGER_8] is
		once
			create Result
		end

	level_check_all: INTEGER_8 is 0
	level_check_invariant: INTEGER_8 is 1
	level_check_ensure: INTEGER_8 is 2
	level_check_require: INTEGER_8 is 3
	level_check_none: INTEGER_8 is 4

end -- class LIBERTY_INTERPRETER_OPTIONS
