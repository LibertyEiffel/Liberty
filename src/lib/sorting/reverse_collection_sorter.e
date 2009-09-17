expanded class REVERSE_COLLECTION_SORTER[X -> COMPARABLE]
	--
	-- Some algorithms to sort any COLLECTION[COMPARABLE].
	--
	-- Elements are sorted using the order given by the comparator: large elements at the beginning of the collection, small at the
	-- end (increasing order is implemented by class COLLECTION_SORTER).
	--
	-- How to use this expanded class :
	--
	--          local
	--             sorter: REVERSE_COLLECTION_SORTER[INTEGER]
	--             array: ARRAY[INTEGER]
	--          do
	--             array := <<1,3,2>>
	--             sorter.sort(array)
	--             check
	--                sorter.is_sorted(array)
	--             end
	--             ...
	--

insert
	ABSTRACT_SORTER[X]

feature {}
	lt (x, y: X): BOOLEAN is
		do
			Result := y < x
		end

end -- class REVERSE_COLLECTION_SORTER
