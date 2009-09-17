class REPOSITORY_TRANSIENT_OBJECT

inherit
	HASHABLE
	COMPARABLE
		redefine is_equal
		end

insert
	RECYCLABLE
		redefine is_equal
		end
	INTERNALS_HANDLER
		redefine is_equal
		end

creation {REPOSITORY_TRANSIENT}
	make, set

feature {ANY}
	hash_code: INTEGER is
		do
			if internals /= Void then
				Result := internals.object_as_pointer.hash_code
			end
		end

	infix "<" (other: like Current): BOOLEAN is
		do
			Result := hash_code < other.hash_code
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := hash_code = other.hash_code
		end

feature {REPOSITORY_TRANSIENT}
	set (a_internals: like internals; a_key: like key) is
		require
			not a_internals.type_is_expanded
			a_internals.object_as_pointer /= default_pointer
			a_key /= Void
		do
			internals := a_internals
			key := a_key
		ensure
			internals = a_internals
			key = a_key
		end

	internals: INTERNALS

	key: STRING

	reset is
		do
			internals := Void
			key := Void
		ensure
			internals = Void
			key = Void
		end

feature {RECYCLING_POOL}
	recycle is
		do
			reset
		end

feature {}
	make is
		do
		end

invariant
	internals /= Void implies not internals.type_is_expanded
	internals /= Void implies internals.object_as_pointer /= default_pointer
	internals /= Void = (key /= Void)

end -- class REPOSITORY_TRANSIENT_OBJECT
