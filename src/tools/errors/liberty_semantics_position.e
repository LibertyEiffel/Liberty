class LIBERTY_SEMANTICS_POSITION

inherit
	LIBERTY_POSITION
		redefine
			emit
		end

create {LIBERTY_ERRORS}
	make

feature {}
	ast: LIBERTY_AST_CLASS

feature {LIBERTY_ERROR}
	emit is
		do
			generate_source
			if index <= source.upper then
				Precursor
			else
				debug
					std_error.put_line(once "Invalid position " + index.out)
				end
			end
		end

feature {}
	make (a_index: like index; a_ast: like ast) is
		require
			a_source /= Void
			a_index > 0
		do
			index := a_index
			ast := a_ast
		ensure
			index = a_index
			ast = a_ast
		end

	generate_source is
		do
			if last_ast_in_code_buffer.item /= ast then
				code_buffer.clear
				ast.generate(code_buffer)
				last_ast_in_code_buffer.set_item(ast)
			end
		end

	last_ast_in_code_buffer: REFERENCE[EIFFEL_NODE] is
		once
			create Result
		end

	code_buffer: STRING_OUTPUT_STREAM is
		once
			create Result.connect_to(source)
		end

	source: STRING is ""

invariant
	ast /= Void

end
