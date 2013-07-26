deferred class GI_ITERATOR [AN_ITEM_] 
	-- Base class for most iterators of the wrappers Gobject Introspection
	-- library.

	-- Most of those iterators are expanded objects and inserts this class.
	-- Currently the only exception is the NAMESPACE_ITERATOR which is
	-- generated directoy from a GI_REPOSITORY 

insert 
	ITERATOR[AN_ITEM_]
		redefine default_create end
feature {ANY}
	default_create is
		do
			-- Setting generation and iterable_generation to different values
			-- so that any invocation of the queries and commands requiring
			-- is_valid will fail. 
			-- set_class will make sure that is_valid is set.
			iterable_generation := -1
			generation := 0
		end

feature {GI_CLASS} 
	set_class (a_class: GI_CLASS) is
	require a_class/=Void
	do
		gi_class := a_class
		iterable_generation := generation
	ensure is_valid
	end

feature {ANY}
	next is
		do
			i:=i+1
		end

feature {GI_CLASS} -- Implementation
	gi_class: GI_CLASS
	i: INTEGER

feature {ANY} -- Check that the underlying traversable has not changed
   iterable_generation: INTEGER is
	  attribute
      end

   generation: INTEGER is
	  attribute
      end

end -- class METHODS_ITER


