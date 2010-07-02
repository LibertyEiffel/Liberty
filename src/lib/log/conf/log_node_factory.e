class LOG_NODE_FACTORY

inherit
	EIFFEL_NODE_FACTORY

create {LOG_INTERNAL_CONF}
	make

feature {EIFFEL_GRAMMAR}
	list (name: FIXED_STRING): EIFFEL_LIST_NODE is
		do
			create {EIFFEL_LIST_NODE_IMPL} Result.make(name)
		end

	non_terminal (name: FIXED_STRING; names: TRAVERSABLE[FIXED_STRING]): EIFFEL_NON_TERMINAL_NODE is
		do
			create {EIFFEL_NON_TERMINAL_NODE_IMPL} Result.make(name, names)
		end

	terminal (name: FIXED_STRING; image: EIFFEL_IMAGE): EIFFEL_TERMINAL_NODE is
		do
			create {EIFFEL_TERMINAL_NODE_IMPL} Result.make(name, image)
		end

feature {}
	make is
		do
		end

end -- class LOG_NODE_FACTORY
