class PARSER
inherit BACKTRACKING
feature

	get_context: PARSER_CONTEXT is
		do
			Result.make(stack.count,position)
		end

	restore_context(ctxt: PARSER_CONTEXT) is
		do
			stack.resize(ctxt.depth)
			position := ctxt.position
		end

	push_mark_begin(what: PARSER_PARSEABLE) is
		local
			mark: PARSER_MARK
		do
			mark.make_begin(position,what)
			stack.add_last(mark)
		end

	push_mark_end(what: PARSER_PARSEABLE) is
		local
			mark: PARSER_MARK
		do
			mark.make_end(position,what)
			stack.add_last(mark)
		end

	push_and_mark_end(what: PARSER_PARSEABLE) is
		local
			sequence: PARSER_SEQUENCE_MARK_END
		do
			sequence := pool_of_mark_end.get_instance
			sequence.set_parseable(what)
			push_sequence(sequence)
		end

	goto(what: PARSER_PARSEABLE) is
		do
			-- TODO bouffer les blancs
			-- memoriser what
		end
	
	goto_inside(what: PARSER_PARSEABLE) is
		do
			goto(what)
			push_mark_begin(what)
			push_and_mark_end(what)
		end
end

