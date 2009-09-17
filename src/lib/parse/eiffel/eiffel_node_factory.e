deferred class EIFFEL_NODE_FACTORY

feature {EIFFEL_GRAMMAR}
	list (name: STRING): EIFFEL_LIST_NODE is
		deferred
		ensure
			Result.name = name
		end

	non_terminal (name: STRING; names: TRAVERSABLE[STRING]): EIFFEL_NON_TERMINAL_NODE is
		require
			not name.is_empty
			names /= Void
		deferred
		ensure
			Result.name.is_equal(name)
		end

	terminal (name: STRING; image: EIFFEL_IMAGE): EIFFEL_TERMINAL_NODE is
		require
			not name.is_empty
			image /= Void
		deferred
		ensure
			Result.name.is_equal(name)
			Result.image.is_equal(image)
		end

end -- class EIFFEL_NODE_FACTORY
