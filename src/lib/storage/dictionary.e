deferred class DICTIONARY[V_, K_]
	--
	-- Associative memory. Values of type `V_' are stored using Keys of type `K_'.
	-- To make a comparison with the well knowned ARRAY class, with a DICTIONARY, index used are not only
	-- INTEGER, you can use for example a STRING to access to your information.
	--
	-- Well knowned implementations, see HASHED_DICTIONARY, AVL_DICTIONARY and ARRAY_DICTIONARY.
	--
	-- See also BIJECTIVE_DICTIONARY class.
	--

inherit
	TRAVERSABLE[V_]
		rename
			new_iterator as new_iterator_on_items,
			do_all as do_all_xitems,
			for_all as for_all_items,
			exists as exists_item
		redefine is_equal, copy
		end

feature {ANY} -- Counting:
	is_empty: BOOLEAN is
			-- Is it empty?
		do
			Result := count = 0
		end

feature {ANY} -- Basic access:
	has (k: K_): BOOLEAN is
			-- Is there a value currently associated with key `k'?
			--
			-- See also `fast_has', `at'.
		require
			k /= Void
		deferred
		end

	at (k: K_): V_ is
			-- Return the value associated to key `k'.
			--
			-- See also `fast_at', `reference_at', `has'.
		require
			has(k)
		deferred
		end

	frozen infix "@" (k: K_): V_ is
			-- The infix notation which is actually a synonym for `at'.
		require
			has(k)
		do
			Result := at(k)
		ensure
			definition: Result = at(k)
		end

	reference_at (k: K_): V_ is
			-- Return Void or the value associated with key `k'. Actually, this feature is useful only 
			-- when the type of values (the type V_) is a reference type, to avoid using `has' just 
			-- followed by `at' to get the corresponding value with the very best performances.
			--
			-- See also `fast_reference_at', `at', `has'.
		require
			k /= Void
			values_are_not_expanded: Result = Void
		deferred
		ensure
			has(k) implies Result = at(k)
		end

	fast_has (k: K_): BOOLEAN is
			-- Is there a value currently associated with key `k'?
			-- Using basic `=' for comparison.
			--
			-- See also `has', `at', `fast_at'.
		require
			k /= Void
		deferred
		end

	fast_at (k: K_): V_ is
			-- Return the value associated to key `k' using basic `=' for comparison.
			--
			-- See also `at', `reference_at', `fast_reference_at'.
		require
			fast_has(k)
		deferred
		end

	fast_reference_at (k: K_): V_ is
			-- Same work as `reference_at', but basic `=' is used for comparison.
			--
			-- See also `reference_at', `at', `has'.
		require
			k /= Void
			values_are_reference: Result = Void
		deferred
		ensure
			fast_has(k) implies Result = fast_at(k)
		end

feature {ANY}
	put (v: V_; k: K_) is
			-- Change some existing entry or `add' the new one. If there is as yet no key `k' in the dictionary,
			-- enter it with item `v'. Otherwise overwrite the item associated with key `k'.
			-- As the `put' procedure actually uses `is_equal', you may consider to use `fast_put' for expanded
			-- objects as well while trying to get the very best performances.
			--
			-- See also `fast_put', `add'.
		require
			k /= Void
		deferred
		ensure
			v = at(k)
		end

	fast_put (v: V_; k: K_) is
			-- Same job as `put', but uses basic `=' for comparison.
			-- If you are sure that `k' is not an existing entry, please consider using `add'
			-- to get very best performances.
			--
			-- See also `put', `add'.
		require
			k /= Void
		deferred
		ensure
			v = at(k)
		end

	add (v: V_; k: K_) is
			-- To add a new entry `k' with its associated value `v'.
			-- Actually, this is equivalent to call `put', but it may run a little bit faster.
			--
			-- See also `put', `fast_put'.
		require
			not has(k)
		deferred
		ensure
			count = 1 + old count
			v = at(k)
		end

feature {ANY} -- Looking and searching some value:
	occurrences (v: V_): INTEGER is
			-- Number of occurrences using `is_equal' for comparison.
			--
			-- See also `fast_occurrences', `fast_has', `has'.
		local
			i: INTEGER; safe_equal: SAFE_EQUAL[V_]
		do
			from
				i := 1
			until
				i > count
			loop
				if safe_equal.test(v, item(i)) then
					Result := Result + 1
				end
				i := i + 1
			end
		ensure
			Result >= 0
		end

	fast_occurrences (v: V_): INTEGER is
			-- Number of occurrences using basic `=' for comparison.
			--
			-- See also `occurrences', `fast_has', `has'.
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > count
			loop
				if v = item(i) then
					Result := Result + 1
				end
				i := i + 1
			end
		ensure
			Result >= 0
		end

	key_at (v: V_): K_ is
			-- Retrieve the key used for value `v' using `is_equal' for comparison.
			--
			-- See also `fast_key_at', `at'.
		require
			occurrences(v) = 1
		local
			i: INTEGER; safe_equal: SAFE_EQUAL[V_]
		do
			from
				i := 1
			until
				safe_equal.test(v, item(i))
			loop
				i := i + 1
			end
			Result := key(i)
		ensure
			(create {SAFE_EQUAL[V_]}).test(at(Result), v)
		end

	fast_key_at (v: V_): K_ is
			-- Retrieve the key used for value `v' using `=' for comparison.
			--
			-- See also `key_at', `at'.
		require
			fast_occurrences(v) = 1
		local
			i: INTEGER
		do
			from
				i := 1
			until
				v = item(i)
			loop
				i := i + 1
			end
			Result := key(i)
		ensure
			at(Result) = v
		end

feature {ANY} -- Removing:
	remove (k: K_) is
			-- Remove entry `k' (which may exist or not before this call).
			-- As the `remove' procedure actually uses `is_equal', you may consider to use `fast_remove' for expanded
			-- objects as well while trying to get the very best performances.
			--
			-- See also `fast_remove', `clear_count'.
		require
			k /= Void
		deferred
		ensure
			not has(k)
		end

	fast_remove (k: K_) is
			-- Same job as `remove', but uses basic `=' for comparison.
			--
			-- See also `remove', `clear_count'.
		require
			k /= Void
		deferred
		ensure
			not has(k)
		end

	clear_count is
			-- Discard all items (`is_empty' is True after that call). The internal `capacity' is not changed
			-- by this call.
			--
			-- See also `clear_count_and_capacity', `remove'.
		deferred
		ensure
			is_empty: count = 0
			capacity = old capacity
		end

	clear_count_and_capacity is
			-- Discard all items (`is_empty' is True after that call). The internal `capacity' may also be
			-- reduced after this call.
			--
			-- See also `clear_count', `remove'.
		deferred
		ensure
			is_empty: count = 0
			capacity <= old capacity
		end

	capacity: INTEGER is
			-- Approximation of the actual internal storage `capacity'. The `capacity' will grow automatically
			-- when needed (i.e. `capacity' is not a limit for the number of values stored). Also note that
			-- the `capacity' value may not be always accurate depending of the implementation (anyway, this
			-- `capacity' value is at least equals to `count').
		deferred
		end

feature {ANY} -- To provide iterating facilities:
	lower: INTEGER is 1

	upper: INTEGER is
		do
			Result := count
		ensure
			Result = count
		end

	item (index: INTEGER): V_ is
		deferred
		ensure
			Result = at(key(index))
		end

	key (index: INTEGER): K_ is
		require
			valid_index(index)
		deferred
		ensure
			at(Result) = item(index)
		end

	first: V_ is
		do
			Result := item(lower)
		end

	last: V_ is
		do
			Result := item(upper)
		end

	new_iterator_on_items: ITERATOR[V_] is
		do
			create {ITERATOR_ON_DICTIONARY_ITEMS[V_, K_]} Result.make(Current)
		ensure then
			Result /= Void
		end

	new_iterator_on_keys: ITERATOR[K_] is
		deferred
		ensure
			Result /= Void
		end

	key_map_in (buffer: COLLECTION[K_]) is
			-- Append in `buffer', all available keys (this may be useful to
			-- speed up the traversal).
			--
			-- See also `item_map_in'.
		require
			buffer /= Void
		local
			i: INTEGER
		do
			from
				i := count
			until
				i < lower
			loop
				buffer.add_last(key(i))
				i := i - 1
			end
		ensure
			buffer.count = count + old buffer.count
		end

	item_map_in (buffer: COLLECTION[V_]) is
			-- Append in `buffer', all available items (this may be useful to
			-- speed up the traversal).
			--
			-- See also `key_map_in'.
		require
			buffer /= Void
		local
			i: INTEGER
		do
			from
				i := count
			until
				i < lower
			loop
				buffer.add_last(item(i))
				i := i - 1
			end
		ensure
			buffer.count = count + old buffer.count
		end

feature {ANY}
	is_equal (other: like Current): BOOLEAN is
			-- Do both dictionaries have the same set of associations?
			-- Keys are compared with `is_equal' and values are comnpared
			-- with the basic = operator.
			--
			-- See also `is_equal_map'.
		local
			i: INTEGER
		do
			if Current = other then
				Result := True
			elseif count = other.count then
				from
					Result := True
					i := 1
				until
					not Result or else i > count
				loop
					if other.has(key(i)) then
						if other.at(key(i)) /= item(i) then
							Result := False
						else
							i := i + 1
						end
					else
						Result := False
					end
				end
			end
		ensure then
			Result implies count = other.count
		end

	is_equal_map (other: like Current): BOOLEAN is
			-- Do both dictionaries have the same set of associations?
			-- Both keys and values are compared with `is_equal'.
			--
			-- See also `is_equal'.
		local
			i: INTEGER; k: K_; safe_equal: SAFE_EQUAL[V_]
		do
			if Current = other then
				Result := True
			elseif count = other.count then
				from
					Result := True
					i := 1
				until
					not Result or else i > count
				loop
					k := key(i)
					if other.has(k) then
						if not safe_equal.test(other.at(k), item(i)) then
							Result := False
						else
							i := i + 1
						end
					else
						Result := False
					end
				end
			end
		end

	copy (other: like Current) is
			-- Reinitialize by copying all associations of `other'.
		local
			i: INTEGER
		do
			clear_count
			from
				i := 1
			until
				i > other.count
			loop
				put(other.item(i), other.key(i))
				i := i + 1
			end
		end

feature {ANY} -- Agents based features:
	do_all (action: ROUTINE[TUPLE[V_, K_]]) is
			-- Apply `action' to every [V_, K_] associations of `Current'.
			--
			-- See also `for_all', `exist'.
		require
			action /= Void
		local
			i: INTEGER; v: V_; k: K_
		do
			from
				i := lower
			until
				i > upper
			loop
				v := item(i)
				k := key(i)
				action.call([v, k])
				i := i + 1
			end
		end

	for_all (test: PREDICATE[TUPLE[V_, K_]]): BOOLEAN is
			-- Do all [V_, K_] associations satisfy `test'?
			--
			-- See also `do_all', `exist'.
		require
			test /= Void
		local
			i: INTEGER; v: V_; k: K_
		do
			from
				Result := True
				i := lower
			until
				not Result or else i > upper
			loop
				v := item(i)
				k := key(i)
				Result := test.item([v, k])
				i := i + 1
			end
		end

	exists (test: PREDICATE[TUPLE[V_, K_]]): BOOLEAN is
			-- Does at least one [V_, K_] association satisfy `test'?
			--
			-- See also `for_all', `do_all'.
		require
			test /= Void
		local
			i: INTEGER; v: V_; k: K_
		do
			from
				i := lower
			until
				Result or else i > upper
			loop
				v := item(i)
				k := key(i)
				Result := test.item([v, k])
				i := i + 1
			end
		end

feature {ANY} -- Other features:
	internal_key (k: K_): K_ is
			-- Retrieve the internal key object which correspond to the existing
			-- entry `k' (the one memorized into the `Current' dictionary).
			--
			-- See also `has', `fast_has'.
		require
			has(k)
		deferred
		ensure
			Result.is_equal(k)
		end

feature {}
	make is
			-- Creates an empty dictionary.
		deferred
		ensure
			is_empty
		end

feature {} -- Implement manifest generic creation:
	manifest_make (needed_capacity: INTEGER) is
			-- Manifest creation of a dictionary.
		do
			make
		end

	manifest_put (index: INTEGER; v: V_; k: K_) is
		require
			not has(k)
		do
			add(v, k)
		end

	manifest_semicolon_check: INTEGER is 2
			-- Put semicolons between successive value-key pairs.

feature {}
	key_safe_equal (k1, k2: K_): BOOLEAN is
			-- Because keys are never Void, we do not rely on the SAFE_EQUAL class.
		require
			k1 /= Void
			k2 /= Void
		do
			if k1 = k2 then
				Result := True
			elseif k1.same_dynamic_type(k2) then
				Result := k1.is_equal(k2)
			end
		end

invariant
	capacity >= count

end -- class DICTIONARY
