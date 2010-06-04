class HISTORY_ITERATOR

inherit ITERATOR[HISTORY_ENTRY]
insert HISTORY_EXTERNALS
creation make 

feature 
	make (hist: READ_LINE_HISTORY) is
	do
		history:=hist
	end
	start is
		do
			index:=history.lower
		end

	item: HISTORY_ENTRY is
		do
			Result:=history.item(index)
		end

	next is
		do
			index:=index+1
		end

	is_off: BOOLEAN is
		do
			Result := index > history.upper
		end
feature {} 
	history: READ_LINE_HISTORY
	index: INTEGER
end
