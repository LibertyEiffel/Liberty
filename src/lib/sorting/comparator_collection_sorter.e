expanded class COMPARATOR_COLLECTION_SORTER[X]
	--
	-- Some algorithms to sort any COLLECTION using an external comparator.
	--
	-- Elements are sorted using the order given by the comparator: large elements at the beginning of the collection, small at the
	-- end (increasing order is implemented by class COLLECTION_SORTER).
	--
	-- Note that without setting a comparator (using `set_comparator'), collections won't get sorted.
	--
	-- How to use this expanded class :
	--
	--          local
	--             sorter: COMPARATOR_COLLECTION_SORTER[INTEGER]
	--             array: ARRAY[INTEGER]
	--          do
	--             array := <<1,3,2>>
	--             sorter.set_comparator(agent my_comparator)
	--             sorter.sort(array)
	--             check
	--                sorter.is_sorted(array)
	--             end
	--             ...
	--

insert
	ABSTRACT_SORTER[X]
		redefine default_create
		end

creation {ANY}
	default_create, with_comparator

feature {ANY}
	set_comparator (a_comparator: like comparator) is
		do
			comparator := a_comparator
		end

	comparator: PREDICATE[TUPLE[X, X]]

feature {}
	lt (x, y: X): BOOLEAN is
		do
			Result := comparator.item([x, y])
		end

	default_comparator (x, y: X): BOOLEAN is
		do
			Result := True -- does not sort by default (sort algorithms are conservative)
		end

	default_create is
		do
			set_comparator(agent default_comparator(?, ?))
		end

	with_comparator (a_comparator: like comparator) is
		do
			set_comparator(a_comparator)
		end

end -- class COMPARATOR_COLLECTION_SORTER
