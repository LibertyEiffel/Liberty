class REPOSITORY_LAYOUT
	--
	-- Used by the update engine of REPOSITORY_IMPL to ensure correct object references and cycles handling.
	--

insert
	INTERNALS_HANDLER
	RECYCLABLE

creation {REPOSITORY_IMPL}
	make

feature {REPOSITORY_IMPL, REPOSITORY_LAYOUT}
	type: STRING
			-- data type, if useful

	capacity: INTEGER
			-- for native arrays only

	ref: STRING
			-- object reference, for reference objects only

	name: STRING
			-- object name

	value: STRING
			-- object value, for basic types only

	layouts: AVL_DICTIONARY[REPOSITORY_LAYOUT, STRING]
			-- child layouts

	assigned: AVL_SET[STRING]
			-- each layout for which the INTERNALS object was assigned

	solved: BOOLEAN

	solve (a_solver: FUNCTION[TUPLE[STRING], INTERNALS]): INTERNALS is
		local
			i: INTEGER; layout: REPOSITORY_LAYOUT; attribute_name: STRING; an_attribute: INTERNALS
			s: like solved
		do
			if internals_set then
				Result := internals_memory
			else
				Result := internals(a_solver)
				internals_memory := Result
			end
			if not solved and then Result /= Void then
				check
					Result.object_can_be_modified
				end
				from
					s := True
					i := 1
				until
					i > Result.type_attribute_count
				loop
					attribute_name := Result.type_attribute_name(i)
					if not assigned.has(attribute_name) then
						layout := layouts.reference_at(attribute_name)
						if layout /= Void then
							check
								layout.name.is_equal(attribute_name)
							end
							an_attribute := layout.solve(a_solver)
							if layout.internals_set then --|** should it be layout.solved?
								assigned.add(attribute_name)
								Result.set_object_attribute(an_attribute, i)
							else
								s := False
							end
						end
					end
					i := i + 1
				end
				if s then
					Result.set_object_can_be_retrieved
					solved := True
				end
			end
		ensure
			(Result /= Void and then Result.object_can_be_retrieved) implies solved
		end

feature {REPOSITORY_LAYOUT}
	internals_set: BOOLEAN
			-- True when `internals_memory' was set

feature {}
	internals_memory: INTERNALS

	internals (a_solver: FUNCTION[TUPLE[STRING], INTERNALS]): INTERNALS is
		require
			not solved
		local
			c: CHARACTER; b: BOOLEAN; i: INTEGER; r: REAL; i8: INTEGER_8; i16: INTEGER_16; i32: INTEGER_32
			i64: INTEGER_64; r32: REAL_32; r64: REAL_64; r80: REAL_80; r128: REAL_128; re: REAL_EXTENDED
			array_type: STRING
			transient: REPOSITORY_TRANSIENT
		do
			internals_set := True
			inspect
				kind
			when "layout" then
				Result := internals_from_generating_type(type)
				sedb_breakpoint
			when "reference" then
				if not ref.is_equal(once "Void") then
					if transient.has_object(ref) then
						Result := transient.object(ref)
					else
						Result := a_solver.item([ref])
						if Result = Void then
							internals_set := False
						end
					end
				end
				-- by definition, a reference is resolved as soon as the internals is recovered (i.e. the layout
				-- it points to is solved)
				solved := internals_set
			when "embedded" then
				Result := internals_from_generating_type(type)
			when "array" then
				array_type := once ""
				array_type.copy(once "NATIVE_ARRAY[")
				array_type.append(type)
				array_type.extend(']')
				Result := native_array_internals_from_generating_type(array_type, capacity)
			when "basic" then
				inspect
					type
				when "CHARACTER" then
					c := value.to_integer.to_character
					Result := c.to_internals
				when "BOOLEAN" then
					b := value.is_equal("True")
					Result := b.to_internals
				when "INTEGER_8" then
					i8 := value.to_integer.to_integer_8
					Result := i8.to_internals
				when "INTEGER_16" then
					i16 := value.to_integer.to_integer_16
					Result := i16.to_internals
				when "INTEGER" then
					i := value.to_integer
					Result := i.to_internals
				when "INTEGER_32" then
					i32 := value.to_integer
					Result := i32.to_internals
				when "INTEGER_64" then
					i64 := value.to_integer_64
					Result := i64.to_internals
				when "REAL" then
					r := value.to_real
					Result := r.to_internals
				when "REAL_32" then
					r32 := value.to_real.force_to_real_32
					Result := r32.to_internals
				when "REAL_64" then
					r64 := value.to_real
					Result := r64.to_internals
				when "REAL_80" then
					r80 := value.to_real
					Result := r80.to_internals
				when "REAL_128" then
					r128 := value.to_real
					Result := r128.to_internals
				when "REAL_EXTENDED" then
					re := value.to_real
					Result := re.to_internals
				end
				Result.set_object_can_be_retrieved
				solved := True
			end
		end

feature {REPOSITORY_IMPL}
	kind: STRING
			-- The layout kind. Almost everything is common between layout kinds. If things begin to diverge too
			-- much, change that to a real polymorphism.

	is_clear: BOOLEAN is
		do
			Result := kind.is_empty
		end

	set_kind (a_kind: like kind) is
		require
			is_clear
			{ FAST_ARRAY[STRING] << "repository", "reference", "layout", "embedded", "basic", "array" >>}.has(a_kind)
		do
			kind.copy(a_kind)
		ensure
			not is_clear
			kind.is_equal(a_kind)
		end

	set_type (a_type: like type) is
		require
			not is_clear
			type = Void
			a_type /= Void
		do
			type := type_memory
			type.copy(a_type)
		ensure
			type.is_equal(a_type)
		end

	set_capacity (a_capacity: like capacity) is
		do
			capacity := a_capacity
		ensure
			capacity = a_capacity
		end

	set_ref (a_ref: like ref) is
		require
			not is_clear
			ref = Void
			a_ref /= Void
		do
			ref := ref_memory
			ref.copy(a_ref)
		ensure
			ref.is_equal(a_ref)
		end

	set_name (a_name: like name) is
		require
			not is_clear
			name = Void
			a_name /= Void
		do
			name := name_memory
			name.copy(a_name)
		ensure
			name.is_equal(a_name)
		end

	set_value (a_value: like value) is
		require
			not is_clear
			value = Void
			a_value /= Void
		do
			value := value_memory
			value.copy(a_value)
		ensure
			value.is_equal(a_value)
		end

	add_layout (a_layout: REPOSITORY_LAYOUT) is
		require
			not is_clear
			a_layout.name /= Void
			not kind.is_equal("reference")
		do
			layouts.add(a_layout, a_layout.name)
		ensure
			layouts.at(a_layout.name) = a_layout
		end

feature {RECYCLING_POOL}
	recycle is
		do
			kind.clear_count
			type_memory.clear_count
			ref_memory.clear_count
			name_memory.clear_count
			value_memory.clear_count
			type := Void
			ref := Void
			name := Void
			value := Void
			layouts.clear_count
			assigned.clear_count
			internals_memory := Void
			internals_set := False
			solved := False
		ensure
			is_clear
		end

feature {}
	make is
		do
			create layouts.make
			create assigned.make
			kind := ""
			type_memory := ""
			ref_memory := ""
			name_memory := ""
			value_memory := ""
		ensure
			is_clear
		end

	type_memory: STRING

	ref_memory: STRING

	name_memory: STRING

	value_memory: STRING

invariant
	has_kind: kind /= Void
	solved_internals_coherence: (not solved and internals_memory /= Void) implies internals_memory.object_can_be_modified
	reference_has_ref: kind.is_equal("reference") implies ref /= Void
	reference_is_solved: (kind.is_equal("reference") and internals_set) implies solved
	reference_dont_have_layouts: kind.is_equal("reference") implies layouts.is_empty
	assigned_are_layouts: assigned.for_all(agent layouts.has(?))
	coherence: solved implies internals_set

end -- class REPOSITORY_LAYOUT
