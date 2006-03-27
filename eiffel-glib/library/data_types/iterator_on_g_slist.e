indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class ITERATOR_ON_G_SLIST [ITEM->WRAPPER]
inherit ITERATOR
	G_SLIST_EXTERNALS
	
creation make

feature {NONE} -- Creation
	make () is
		do
		end
feature --
	start is do end
	is_off: BOOLEAN is do end 
	item: ITEM is do end
	next is do end
end
