deferred class CLARG_WITH_ARGS[E_]

inherit
	TRAVERSABLE[E_]
		undefine
			out_in_tagged_out_memory
		end
	COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[E_]]
		rename
			item as items
		undefine
			out_in_tagged_out_memory
		end

insert
	CLARG_PARSER
		redefine
			optional, positional
		end

feature {ANY}
	items: TRAVERSABLE[E_] is
		do
			Result := Current
		end

	is_repeatable: BOOLEAN is True

	is_set: BOOLEAN is
		do
			Result := not set.is_empty
		end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
	prepare_parse is
		do
			set.clear_count
		end

	is_set_at (context: COMMAND_LINE_CONTEXT): BOOLEAN is
		do
			Result := set.has(context)
		end

	undo_parse (context: COMMAND_LINE_CONTEXT) is
		do
			set.remove(context)
		end

	set_data (context: COMMAND_LINE_CONTEXT; data: STRING) is
		do
			set.add(decode(data), context)
		end

feature {}
	decode (data: STRING): E_ is
		require
			is_valid_data(data)
		deferred
		end

feature {ANY} -- TRAVERSABLE:
	count: INTEGER is
		do
			Result := set.count
		end

	is_empty: BOOLEAN is
		do
			Result := set.is_empty
		end

	lower: INTEGER is
		do
			Result := set.lower
		end

	upper: INTEGER is
		do
			Result := set.upper
		end

	item (i: INTEGER): E_ is
		do
			Result := set.item(i)
		end

	first: like item is
		do
			Result := set.first
		end

	last: like item is
		do
			Result := set.last
		end

	new_iterator: ITERATOR[E_] is
		do
			Result := set.new_iterator_on_items
		end

feature {}
	set: AVL_DICTIONARY[E_, COMMAND_LINE_CONTEXT]

	optional (a_short, a_long, a_name, a_usage: ABSTRACT_STRING) is
		do
			create set.make
			Precursor(a_short, a_long, a_name, a_usage)
		end

	positional (a_name, a_usage: ABSTRACT_STRING) is
		do
			create set.make
			Precursor(a_name, a_usage)
		end

invariant
	set /= Void

end -- class CLARG_WITH_ARGS
