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

	cluster: LIBERTY_CLUSTER is
		do
			Result := descriptor.cluster
		end

	name: STRING is
		do
			Result := descriptor.name
		end

	parameters: TRAVERSABLE[LIBERTY_TYPE] is
		do
			Result := descriptor.parameters
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

	add_feature (a_feature: LIBERTY_FEATURE) is
		do
			features.add(a_feature, a_feature.name)
		end

	check_validity: LIBERTY_ERROR is
		do
			not_yet_implemented
		end

feature {LIBERTY_UNIVERSE} -- Semantincs building
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

feature {}
	code_stream: STRING_OUTPUT_STREAM is
		once
			create Result.make
		end

	builder: LIBERTY_TYPE_BUILDER is
		once
			create Result.make
		end

feature {}
	make (a_descriptor: like descriptor; a_ast: like ast) is
		require
			a_descriptor /= Void
		do
			descriptor := a_descriptor
			ast := a_ast
			create {HASHED_DICTIONARY[LIBERTY_FEATURE, STRING]}features.make
		ensure
			descriptor = a_descriptor
		end

	features: DICTIONARY[LIBERTY_FEATURE, STRING]

feature {LIBERTY_TYPE_BUILDER}
	ast: LIBERTY_AST_CLASS
	descriptor: LIBERTY_TYPE_DESCRIPTOR

invariant
	descriptor /= Void
	ast /= Void
	features /= Void

end
