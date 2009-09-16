class LIBERTY_TYPE

inherit
	HASHABLE

insert
	EIFFEL_NODE_HANDLER
		redefine
			is_equal
		end

create {LIBERTY_UNIVERSE}
	make

feature {ANY}
	descriptor: LIBERTY_TYPE_DESCRIPTOR
	obsolete_message: STRING

	hash_code: INTEGER is
		do
			Result := descriptor.hash_code
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := other = Current
		end

	is_obsolete: BOOLEAN is
		do
			Result := obsolete_message /= Void
		end

feature {LIBERTY_TYPE_BUILDER}
	set_obsolete (message: like obsolete_message) is
		require
			message /= Void
		do
			obsolete_message := message
		ensure
			is_obsolete
			obsolete_message = message
		end

feature {} -- Semantincs building
	check_and_initialize (universe: LIBERTY_UNIVERSE) is
		local
			error: LIBERTY_ERROR; code: STRING
		do
			error := builder.check_and_initialize(Current, universe)
			if error /= Void then
				code_stream.clear
				ast.generate(code_stream)
				code := once ""
				code.clear_count
				code_stream.append_in(code)
				error.emit(code)
				die_with_code(1)
			end
		end

	code_stream: STRING_OUTPUT_STREAM is
		once
			create Result.make
		end

	builder: LIBERTY_TYPE_BUILDER is
		once
			create Result.make
		end

feature {}
	make (a_descriptor: like descriptor; a_ast: like ast; universe: LIBERTY_UNIVERSE) is
		require
			a_descriptor /= Void
		do
			descriptor := a_descriptor
			ast := a_ast
			check_and_initialize(universe)
		ensure
			descriptor = a_descriptor
		end

feature {LIBERTY_TYPE_BUILDER}
	ast: LIBERTY_AST_CLASS

invariant
	descriptor /= Void
	ast /= Void

end
