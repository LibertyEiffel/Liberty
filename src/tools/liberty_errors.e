deferred class LIBERTY_ERRORS

feature {ANY}
	last_error: LIBERTY_ERROR is
		do
			Result := last_error_memory.item
		end

feature {ANY}
	has_error: BOOLEAN is
		do
			if last_error /= Void then
				Result := last_error.is_fatal
			end
		end

	has_warning_or_error: BOOLEAN is
		do
			Result := last_error /= Void
		end

feature {}
	error (index: INTEGER; message: STRING) is
		do
			last_error_memory.set_item(create {LIBERTY_ERROR}.error(index, message, last_error))
		end

	warning (index: INTEGER; message: STRING) is
		do
			last_error_memory.set_item(create {LIBERTY_ERROR}.warning(index, message, last_error))
		end

	emit_semantics_error (ast: LIBERTY_AST_CLASS) is
		do
			if last_error /= Void then
				last_error.emit_semantics(ast)
				last_error_memory.clear
			end
		end

	last_error_memory: REFERENCE[LIBERTY_ERROR] is
		once
			create Result
		end

	emit_syntax_error (perr: PARSE_ERROR; code: STRING) is
		local
			e: LIBERTY_ERROR
		do
			create e.from_parse_error(perr)
			e.emit_syntax(code)
		ensure
			does_not_return: False
		end

end
