class LIBERTY_TYPE

inherit
	HASHABLE

insert
	EIFFEL_NODE_HANDLER
		redefine
			is_equal
		end
	LIBERTY_ERRORS

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

	is_deferred: BOOLEAN is
		require
			mark_set
		do
			Result := mark = deferred_mark
		end

	is_expanded: BOOLEAN is
		require
			mark_set
		do
			Result := mark = expanded_mark
		end

	is_separate: BOOLEAN is
		require
			mark_set
		do
			Result := mark = separate_mark
		end

	is_reference: BOOLEAN is
		require
			mark_set
		do
			Result := mark = reference_mark
		end

	mark_set: BOOLEAN is
		do
			Result := mark /= 0
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

	set_deferred is
		require
			not mark_set
		do
			mark := deferred_mark
		ensure
			mark_set
			is_deferred
		end

	set_expanded is
		require
			not mark_set
		do
			mark := expanded_mark
		ensure
			mark_set
			is_expanded
		end

	set_separate is
		require
			not mark_set
		do
			mark := separate_mark
		ensure
			mark_set
			is_separate
		end

	set_reference is
		require
			not mark_set
		do
			mark := reference_mark
		ensure
			mark_set
			is_reference
		end

	add_parent (a_parent: LIBERTY_TYPE; conformant: BOOLEAN) is
		do
			if conformant then
				if conformant_parents = Void then
					create {FAST_ARRAY[LIBETRY_TYPE]}conformant_parents.make(0)
				end
				conformant_parents.add_last(a_parent)
			else
				if non_conformant_parents = Void then
					create {FAST_ARRAY[LIBERTY_TYPE]}non_conformant_parents.make(0)
				end
				non_conformant_parents.add_last(a_parent)
			end
		end

	features_twin: like features is
		local
			i: INTEGER
		do
			create  {HASHED_DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]}Result.with_capacity(features.count)
			from
				i := features.lower
			until
				i > features.upper
			loop
				Result.add(features.item_at(i).twin, features.key_at(i))
				i := i + 1
			end
		end

	add_feature (a_feature: LIBERYT_FEATURE_DEFINITION) is
		require
			not has_feature(a_feature.name)
		do
			a_features.add(a_feature, a_feature.name)
		ensure
			features.at(a_feature.name) = a_feature
		end

	has_feature (a_feature_name: LIBERTY_FEATURE_NAME): BOOLEAN is
		do
			Result := features.has(a_feature_name)
		end

feature {LIBERTY_UNIVERSE} -- Semantincs building
	check_and_initialize (universe: LIBERTY_UNIVERSE) is
		require
			not has_error
		local
			builder: LIBERTY_TYPE_BUILDER
		do
			create builder.make(Current, universe)
			builder.check_and_initialize
			if not has_error then
				check_validity
			end
			if has_error_or_warning then
				emit_semantics_error(ast)
			end
		end

feature {}
	check_validity is
		do
			-- TODO
		end

feature {}
	make (a_descriptor: like descriptor; a_ast: like ast) is
		require
			a_descriptor /= Void
		do
			descriptor := a_descriptor
			ast := a_ast
			create {HASHED_DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]}features.make
		ensure
			descriptor = a_descriptor
		end

	mark: INTEGER_8
	conformant_parents: COLLECTION[LIBERTY_TYPE]
	non_conformant_parents: COLLECTION[LIBERTY_TYPE]
	features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]

	deferred_mark: INTEGER_8 is 1
	expanded_mark: INTEGER_8 is 2
	separate_mark: INTEGER_8 is 4
	reference_mark: INTEGER_8 is 8

feature {LIBERTY_AST_HANDLER}
	ast: LIBERTY_AST_CLASS
	descriptor: LIBERTY_TYPE_DESCRIPTOR

invariant
	descriptor /= Void
	ast /= Void
	features /= Void
	features.for_all(agent (fd: LIBERTY_FEATURE_DEFINITION; fn: LIBERTY_FEATURE_NAME): BOOLEAN is do Result := fd.name.is_equal(fd) end)

end
