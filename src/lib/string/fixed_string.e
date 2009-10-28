class FIXED_STRING
	--
	-- Immutable character STRINGs indexed from `1' to `count'.
	--
	-- TODO: share storage among substrings (needs offset/length management -- beware of to_external)
	--

inherit
	ABSTRACT_STRING
		redefine
			immutable
		end

creation {ANY}
	make_from_string, copy, from_external_copy, from_external_sized_copy

creation {FIXED_STRING}
	make_from_fixed_string

feature {ANY} -- Creation:
	make_from_string (model: STRING) is
			-- Initialize from the characters of `model'.
		require
			not immutable
			model /= Void
		local
			c, ca: INTEGER
		do
			c := model.count
			if model.last = '%U' then
				ca := c
				if ca > 0 then
					storage := storage.calloc(ca)
					storage.copy_from(model.storage, c - 1)
				end
			else
				ca := c + 1
				storage := storage.calloc(ca)
				storage.copy_from(model.storage, c - 1)
				storage.put('%U', c)
			end
			capacity := ca
			count := c
			hash_code := computed_hash_code
			immutable := True
		ensure
			count = model.count
			immutable
		end

feature {ANY}
	hash_code: INTEGER

	intern: FIXED_STRING is
			-- A shared version of this string.
		do
			if is_interned then
				Result := Current
			else
				Result := interned.reference_at(Current)
				if Result = Void then
					do_intern
					Result := Current
				end
			end
		end

feature {ANY}
	copy (other: like Current) is
			-- In fact this feature can only be used at creation time (see `immutable').
		do
			check
				not immutable
			end
			storage := other.storage
			hash_code := other.hash_code
			count := other.count
			capacity := other.capacity
			immutable := True
		ensure then
			count = other.count
			immutable
		end

	immutable: BOOLEAN

feature {ABSTRACT_STRING}
	do_intern is
		require
			not is_interned
			not interned.has(Current)
		do
			interned.add(Current)
			is_interned := True
		ensure
			is_interned
		end

	is_interned: BOOLEAN

feature {ANY} -- Other features:
	substring (start_index, end_index: INTEGER): like Current is
		do
			create Result.make_from_fixed_string(Current, start_index, end_index)
		end

feature {}
	make_from_fixed_string (fixed: FIXED_STRING; start_index, end_index: INTEGER) is
		require
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= fixed.count
			meaningful_interval: start_index <= end_index + 1
		local
			c: INTEGER
		do
			c := end_index - start_index + 1
			if c > 0 then
				count := c
				if fixed.storage.item(c - 1) = '%U' then
					capacity := c
					storage := storage.calloc(c)
				else
					capacity := c + 1
					storage := storage.calloc(c + 1)
					storage.put('%U', c)
				end
				storage.slice_copy(0, fixed.storage, start_index - 1, end_index - 1)
			else
				storage := storage.calloc(1)
				storage.put('%U', 0)
			end
			hash_code := computed_hash_code
			immutable := True
		ensure
			substring_count: count = end_index - start_index + 1
		end

feature {ANY} -- Interfacing with C string:
	to_external: POINTER is
		do
			Result := storage.to_pointer
		end

feature {} -- Creation from C string:
	from_external_copy (p: POINTER) is
			-- Internal `storage' is set using a copy of `p'. Assume `p' has a null character at the end in order
			-- to compute the Eiffel `count'. This extra null character is not part of the Eiffel
			-- FIXED_STRING.
			-- Also consider `from_external' to choose the most appropriate.
		require
			p.is_not_null
		local
			s: like storage; i: INTEGER
		do
			from
				s := s.from_pointer(p)
			until
				s.item(i) = '%U'
			loop
				i := i + 1
			end

			count := i
			capacity := i + 1
			storage := storage.calloc(capacity)
			storage.copy_from(s, count)
		end

	from_external_sized_copy (p: POINTER; size: INTEGER) is
			-- Internal `storage' is set using a copy of `p'.  'size' characters are copied, setting then 'count'
			-- to at most `size'. If the C string is shorter though then its size is used instead.
			-- Also consider `from_external_copy' to choose the most appropriate.
		require
			p.is_not_null
			size >= 0
		local
			s: like storage; i: INTEGER
		do
			from
				s := s.from_pointer(p)
			until
				i = size or else s.item(i) = '%U'
			loop
				i := i + 1
			end

			count := i
			capacity := i + 1
			storage := storage.calloc(capacity)
			storage.copy_from(s, count - 1)
			storage.put('%U', count)
		ensure
			count <= size
		end

feature {RECYCLING_POOL, STRING_RECYCLING_POOL, STRING_HANDLER}
	recycle is
		local
			s: like storage
		do
			immutable := False
			storage := s
		end

invariant
	0 <= count
	capacity.in_range(count, count + 1)
	storage.is_not_null
	-- immutable or in recycling pool
	count = 0 implies storage.item(0) = '%U'
	count > 0 implies (storage.item(count-1) = '%U' or else storage.item(count) = '%U')
	storage.item(count) = '%U' implies capacity = count + 1
	is_interned = interned.fast_has(Current)

end -- class FIXED_STRING
