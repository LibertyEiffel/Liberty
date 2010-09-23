expanded class LIBERTY_INTERPRETER_OPTIONS

feature {ANY}
	debug_enabled: BOOLEAN is
		do
			Result := debug_memory.item
		end

	is_all_checked: BOOLEAN is
		do
			Result := level_memory.item.is_all_checked
		end

	is_invariant_checked: BOOLEAN is
		do
			Result := level_memory.item.is_invariant_checked
		end

	is_ensure_checked: BOOLEAN is
		do
			Result := level_memory.item.is_ensure_checked
		end

	is_require_checked: BOOLEAN is
		do
			Result := level_memory.item.is_require_checked
		end

feature {LIBERTYI}
	set (check_level: LIBERTY_MAIN_CHECK_LEVEL; enable_debug: BOOLEAN) is
		do
			debug_memory.set_item(enable_debug)
			level_memory.set_item(check_level)
		end

feature {}
	debug_memory: REFERENCE[BOOLEAN] is
		once
			create Result
		end

	level_memory: REFERENCE[LIBERTY_MAIN_CHECK_LEVEL] is
		once
			create Result
		end

end -- class LIBERTY_INTERPRETER_OPTIONS
