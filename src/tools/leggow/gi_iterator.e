deferred class GI_ITERATOR [AN_ITEM_] 
	-- Base class for most iterators of the wrappers Gobject Introspection
	-- library.

	-- Many of those iterators are expanded objects and inserts this class.

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

end -- class GI_ITERATOR


-- Copyright (C) 2013-2022: Paolo Redaelli <paolo.redaelli@gmail.com>
-- 
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
	
