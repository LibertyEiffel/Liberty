expanded class STRING_RECYCLING_ITEM_SORTER

insert
	ABSTRACT_SORTER[STRING_RECYCLING_ITEM]
	STRING_HANDLER

feature {}
	lt (x, y: STRING_RECYCLING_ITEM): BOOLEAN is
		do
			Result := x.capacity > y.capacity
		end

end -- class STRING_RECYCLING_ITEM_SORTER
