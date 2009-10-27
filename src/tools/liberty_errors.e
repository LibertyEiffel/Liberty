-- Copyright (C) 2009 Cyril ADRIAN
--
expanded class LIBERTY_ERRORS

insert
	LIBERTY_ERROR_LEVELS

feature {ANY} -- Errors
	last_error: LIBERTY_ERROR is
		do
			Result := last_error_memory.item
		end

	has_error: BOOLEAN is
		do
			if last_error /= Void then
				Result := last_error.is_error
			end
		end

	has_warning_or_error: BOOLEAN is
		do
			Result := last_error /= Void
		end

	set (level: INTEGER_8; message: STRING) is
		require
			valid_level(level)
		do
			last_error_memory.set_item(create {LIBERTY_ERROR}.make(level, positions.twin, message, last_error))
			if level < level_error then
				emit
			end
		ensure
			fatal_means_die: level >= level_error
		end

	emit is
		require
			has_warning_or_error
		do
			last_error.emit
			last_error_memory.set_item(Void)
		ensure
			not has_warning_or_error
			dead_if_fatal: not old (last_error.is_fatal)
		end

feature {ANY} -- Error positions
	has_positions: BOOLEAN is
		do
			Result := not positions.is_empty
		end

	syntax_position (a_index: INTEGER; a_source: STRING): LIBERTY_SYNTAX_POSITION is
		require
			a_index.in_range(source.lower, source.upper)
		do
			create Result.make(a_index, a_source)
		ensure
			Result /= Void
		end

	semantics_position (a_index: INTEGER; a_ast: LIBERTY_AST_CLASS): LIBERTY_SEMANTICS_POSITION is
		require
			a_index > 0
			a_ast /= Void
		do
			create Result.make(a_index, a_ast)
		ensure
			Result /= Void
		end

	add_position (a_position: LIBERTY_POSITION) is
		require
			a_position /= Void
		do
			positions.add_last(a_position)
		ensure
			has_positions
		end

	cancel_positions is
		do
			positions.clear_count
		ensure
			not has_positions
		end

feature {}
	last_error_memory: REFERENCE[LIBERTY_ERROR] is
		once
			create Result
		end

	positions: COLLECTION[LIBERTY_POSITION] is
		once
			create {FAST_ARRAY[LIBERTY_POSITION]} Result.with_capacity(4)
		end

end
