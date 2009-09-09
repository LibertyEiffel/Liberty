class LIBERTY_NODE_FACTORY

inherit
	EIFFEL_NODE_FACTORY

create {ANY}
	make

feature {EIFFEL_GRAMMAR}
	list (name: STRING): EIFFEL_LIST_NODE is
		do
			create {EIFFEL_LIST_NODE_IMPL}Result.make(name)
		end

	non_terminal (name: STRING; names: TRAVERSABLE[STRING]): EIFFEL_NON_TERMINAL_NODE is
		do
			inspect
				name
			when "Class" then
				create {LIBERTY_AST_CLASS}Result.make(name, names)
			when "Class_Header" then
				create {LIBERTY_AST_CLASS_HEADER}Result.make(name, names)
			when "Obsolete" then
				create {LIBERTY_AST_OBSOLETE}Result.make(name, names)
			when "Inherit" then
				create {LIBERTY_AST_INHERIT}Result.make(name, names)
			when "Insert" then
				create {LIBERTY_AST_INSERT}Result.make(name, names)
			when "Class_Creation*" then
				create {LIBERTY_AST_CREATIONS}Result.make(name, names)
			when "Feature*" then
				create {LIBERTY_AST_FEATURES}Result.make(name, names)
			when "Invariant" then
				create {LIBERTY_AST_INVARIANT}Result.make(name, names)
			when "Indexing" then
				create {LIBERTY_AST_INDEXING}Result.make(name, names)
			when "Class_Marker" then
				create {LIBERTY_AST_CLASS_MARKER}Result.make(name, names)
			when "Type_Parameters" then
				create {LIBERTY_AST_TYPE_PARAMETERS}Result.make(name, names)
			end
		end

	terminal (name: STRING; image: EIFFEL_IMAGE): EIFFEL_TERMINAL_NODE is
		do
			inspect
				name
			when "KW class name" then
				create {LIBERTY_AST_CLASS_NAME}.make(image)
			when "KW end", "KW end of file", "KW indexing" then
				-- some keywords are pure cosmetics; we don't need to distinguish them.
				create {EIFFEL_TERMINAL_NODE_IMPL}Result.make(name, image)
			end
		end

feature {}
	make is
		do
		end

end -- class LIBERTY_NODE_FACTORY

