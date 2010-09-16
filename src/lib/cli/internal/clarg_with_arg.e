deferred class CLARG_WITH_ARG[E_]

inherit
	COMMAND_LINE_TYPED_ARGUMENT[E_]
		undefine
			out_in_tagged_out_memory
		end

insert
	CLARG_PARSER

feature {ANY}
	is_repeatable: BOOLEAN is False

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
	prepare_parse is
		do
			unset
		end

	is_set_at (context: COMMAND_LINE_CONTEXT): BOOLEAN is
		do
			Result := is_set
		end

	undo_parse (context: COMMAND_LINE_CONTEXT) is
		do
			unset
		end

feature {}
	unset is
		deferred
		ensure
			not is_set
		end

end -- class CLARG_WITH_ARG
