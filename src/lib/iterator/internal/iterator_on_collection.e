class ITERATOR_ON_COLLECTION[E_]
	-- Please do not use this class directly. Look at `ITERATOR'.

obsolete
		"The new class to use is now ITERATOR_ON_TRAVERSABLE[E_] (march 30th 2006)."

inherit
	ITERATOR_ON_TRAVERSABLE[E_]

creation {ANY}
	make

end -- class ITERATOR_ON_COLLECTION
