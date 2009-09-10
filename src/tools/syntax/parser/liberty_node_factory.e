class LIBERTY_NODE_FACTORY

inherit
	EIFFEL_NODE_FACTORY

create {ANY}
	make

feature {}
	all_classes_names: DICTIONARY[LIBERTY_AST_CLASS_NAME, STRING]

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
			when "Indexing_Clause" then
				create {LIBERTY_AST_INDEXING_CLAUSE}Result.make(name, names)
			when "Class_Marker" then
				create {LIBERTY_AST_CLASS_MARKER}Result.make(name, names)
			when "Inherit" then
				create {LIBERTY_AST_INHERIT}Result.make(name, names)
			when "Insert" then
				create {LIBERTY_AST_INSERT}Result.make(name, names)
			when "Class_Marker" then
				create {LIBERTY_AST_CLASS_MARKER}Result.make(name, names)
			when "Type_Parameters" then
				create {LIBERTY_AST_TYPE_PARAMETERS}Result.make(name, names)
			when "Indexing_Clause" then
				create {LIBERTY_AST_INDEXING_CLAUSE}Result.make(name, names)
			when "Type_Definition" then
				create {LIBERTY_AST_TYPE_DEFINITION}Result.make(name, names)
			when "Parent_Clause" then
				create {LIBERTY_AST_TYPE_PARENT_CLAUSE}Result.make(name, names)
			when "Parent" then
				create {LIBERTY_AST_PARENT}Result.make(name, names)
			when "Parent_Rename" then
				create {LIBERTY_AST_PARENT_RENAME}Result.make(name, names)
			when "Parent_Export" then
				create {LIBERTY_AST_PARENT_EXPORT}Result.make(name, names)
			when "Parent_Undefine" then
				create {LIBERTY_AST_PARENT_UNDEFINE}Result.make(name, names)
			when "Parent_Redefine" then
				create {LIBERTY_AST_PARENT_REDEFINE}Result.make(name, names)
			when "Rename" then
				create {LIBERTY_AST_RENAME}Result.make(name, names)
			when "Export" then
				create {LIBERTY_AST_EXPORT}Result.make(name, names)
			when "Class_Creation" then
				create {LIBERTY_AST_CLASS_CREATION}Result.make(name, names)
			when "Eiffel_Block" then
				create {LIBERTY_AST_EIFFEL_BLOCK}Result.make(name, names)
			when "Require" then
				create {LIBERTY_AST_REQUIRE}Result.make(name, names)
			when "Local_Block" then
				create {LIBERTY_AST_LOCAL_BLOCK}Result.make(name, names)
			when "Do_Block" then
				create {LIBERTY_AST_DO_BLOCK}Result.make(name, names)
			when "Rescue_Block" then
				create {LIBERTY_AST_RESCUE_BLOCK}Result.make(name, names)
			when "Ensure" then
				create {LIBERTY_AST_ENSURE}Result.make(name, names)
			when "External" then
				create {LIBERTY_AST_EXTERNAL}Result.make(name, names)
			when "Declaration" then
				create {LIBERTY_AST_DECLARATION}Result.make(name, names)
			when "Variable" then
				create {LIBERTY_AST_VARIABLE}Result.make(name, names)
			when "Instruction" then
				create {LIBERTY_AST_INSTRUCTION}Result.make(name, names)
			end
		end

	terminal (name: STRING; image: EIFFEL_IMAGE): EIFFEL_TERMINAL_NODE is
		local
			img: like image
		do
			inspect
				name
			when "KW class name" then
				Result := all_classes.reference_at(image)
				if Result = Void then
					img := image.twin
					create {LIBERTY_AST_CLASS_NAME}Result.make(img)
					all_classes.put(Result, img)
				end
			when "KW entity name" then
				create {LIBERTY_AST_ENTITY_NAME}Result.make(image.twin)
			else
				-- some keywords are pure cosmetics; we don't need to distinguish them.
				create {EIFFEL_TERMINAL_NODE_IMPL}Result.make(name, image)
			end
		end

feature {}
	make is
		do
			create {HASHED_DICTIONARY[LIBERTY_AST_CLASS_NAME, STRING]}all_classes.make
		end

end -- class LIBERTY_NODE_FACTORY

