indexing
	description: "PANGO_ATTR_LIST:  a list of attributes that apply to a section of text."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class PANGO_ATTR_LIST
	-- The PangoAttrList structure represents a list of attributes that
	-- apply to a section of text. The attributes are, in general,
	-- allowed to overlap in an arbitrary fashion, however, if the
	-- attributes are manipulated only through `change', the overlap
	-- between properties will meet stricter criteria.

	-- Since the PangoAttrList structure is stored as a linear list, it
	-- is not suitable for storing attributes for large amounts of
	-- text. In general, you should not use a single PangoAttrList for
	-- more than one paragraph of text.

inherit 
   C_STRUCT
      redefine
         copy, from_external_pointer
      end
   
	REFERENCE_COUNTED
   
create {ANY} make, from_external_pointer

feature {ANY} -- Creation
	make is
			-- Create a new empty attribute list with a reference count
			-- of one.
		do
			from_external_pointer (pango_attr_list_new)
			-- pango_attr_list_new Returns the newly allocated
			-- PangoAttrList, which should be freed with
			-- pango_attr_list_unref().
		end

	from_external_pointer (a_ptr: POINTER) is
		do
			Precursor(a_ptr)
			create cache.make
		end

feature {ANY} 
	-- TODO: C implementation "redefines" `type' providing the
	-- `pango_attr_list_get_type()', the GObject type for
	-- PangoAttrList, wrapped by the macro PANGO_TYPE_ATTR_LIST; is it
	-- useful to wrap them? I think not. Paolo 2006-07-12

	ref is
			-- Increase the reference count of the given attribute list
			-- by one.
		local ptr: POINTER
		do
			ptr := pango_attr_list_ref (handle)
			check ptr = handle end
		end

	unref is
			-- Decrease the reference count of the given attribute list
			-- by one. If the result is zero, free the attribute list and
			-- the attributes it contains.
		do
			pango_attr_list_unref (handle)
		end

	copy (another: like Current) is
			-- Copy `another' list and return an identical new list.
			-- Note: another sould be just PANGO_ATTR_LIST instead of 
			-- "like Current" because an hypotetical heir should not 
			-- call this feature. Paolo 2006-07-12
		do
			from_external_pointer (pango_attr_list_copy(another.handle))
		end


	insert_after (an_attribute: PANGO_ATTRIBUTE) is
			-- Insert `an_attribute' into the Current PangoAttrList. It
			-- will be inserted after all other attributes with a
			-- matching start_index. 
		
			-- Note: the underlying C implementation assume to own
			-- `an_attribute'.
		require 
			attribute_not_void: an_attribute /= Void
			not_freezed: not is_freezed
		do
			pango_attr_list_insert (handle, an_attribute.handle)
			an_attribute.set_shared
			cache.put(an_attribute, an_attribute.handle)
		end

	insert_before (an_attribute: PANGO_ATTRIBUTE) is
			-- Insert `an_attribute' into the PangoAttrList. It will be
			-- inserted before all other attributes with a matching
			-- start_index.
		
			-- Note: the underlying C implementation assume to own
			-- `an_attribute'.
		require 
			attribute_not_void: an_attribute /= Void
			not_freezed: not is_freezed
		do
			pango_attr_list_insert_before (handle, an_attribute.handle)
			an_attribute.set_shared
			cache.put(an_attribute, an_attribute.handle)
		end

	change  (an_attribute: PANGO_ATTRIBUTE) is
			-- Insert `an_attribute' into the PangoAttrList. It will
			-- replace any attributes of the same type on that segment
			-- and be merged with any adjoining attributes that are
			-- identical.
		
			-- This function is slower than `insert_after' for creating a
			-- attribute list in order (potentially much slower for large
			-- lists). However, `insert_after' is not suitable for
			-- continually changing a set of attributes since it never
			-- removes or combines existing attributes.
					
			-- Note: the underlying C implementation assume to own
			-- `an_attribute'.
		require 
			attribute_not_void: an_attribute /= Void
			not_freezed: not is_freezed
		do
			pango_attr_list_change (handle, an_attribute.handle)
			an_attribute.set_shared
			cache.put(an_attribute, an_attribute.handle)
		end

	splice (another: PANGO_ATTR_LIST; a_position, a_length: INTEGER) is
			-- This function splices `another' attribute list into
			-- Current. This operation is equivalent to stretching every
			-- attribute that applies at `a_position' in list by
			-- `a_length' and then `change' with a copy of each attribute
			-- in other in sequence (offset in position by pos).
		
			-- This operation proves useful for, for instance, inserting
			-- a preedit string in the middle of an edit buffer.

			-- `a_position': the position in list at which to insert
			-- other 

			-- `a_length': the length of the spliced segment. (Note that
			-- this must be specified since the attributes in other may
			-- only be present at some subsection of this range)
		require 
			another_not_void: another /= Void
			not_freezed: not is_freezed
		do
			pango_attr_list_splice (handle, another.handle, a_position, a_length)
		end

	get_new_iterator: PANGO_ATTR_ITERATOR is
			-- Create a iterator initialized to the beginning of the 
			-- list. 
			-- Current attribute list will be made unchangeable (i.e. 
			-- is_freezed = True) until says "list must not be modified until this iterator is 
			-- freed". Implement it 
		do
			create Result.from_attribute_list (Current)
		ensure freezed: is_freezed
		end

feature {ANY} -- Unchangability 
	is_freezed: BOOLEAN

feature {PANGO_ATTR_ITERATOR} -- Freezed setter
	set_freezed is 
		do
			is_freezed := True
		end

	unset_freezed is 
		do
			is_freezed := False
		end

feature {} -- Unwrapped 
--   pango_attr_list_filter ()

--  PangoAttrList* pango_attr_list_filter       (PangoAttrList *list, PangoAttrFilterFunc func, gpointer data);

--    Given a PangoAttrList and callback function, removes any elements of list for which func returns TRUE and inserts them
--    into a new list.

--    list :    a PangoAttrList
--    func :    callback function; returns TRUE if an atttribute should be filtered out.
--    data :    Data to be passed to func
--    Returns : the new PangoAttrList or NULL if no attributes of the given types were found.

--    Since 1.2

--    ------------------------------------------------------------------------------------------------------------------------

--   PangoAttrFilterFunc ()

--  gboolean    (*PangoAttrFilterFunc)          (PangoAttribute *attribute, gpointer data);

--    A predicate function used by pango_attr_list_filter() to filter out a subset of attributes for a list.

--    attribute : a PangoAttribute
--    data :      callback data passed to pango_attr_list_filter()
--    Returns :   TRUE if the attribute should be filtered out

--    ------------------------------------------------------------------------------------------------------------------------
feature {PANGO_ATTR_ITERATOR}
	cache: HASHED_DICTIONARY [PANGO_ATTRIBUTE, POINTER]
	
feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <pango/pango.h>"
		alias "sizeof(PangoAttrList)"
		end

feature {} -- External calls
	pango_attr_list_new: POINTER is --  PangoAttrList* 
		external "C use <pango/pango.h>"
		end

	pango_attr_list_ref (a_list: POINTER): POINTER is --  PangoAttrList* 
		external "C use <pango/pango.h>"
		end

	pango_attr_list_unref (a_list: POINTER) is
		external "C use <pango/pango.h>"
		end
	
	pango_attr_list_copy (a_list: POINTER): POINTER is -- PangoAttrList* 
		external "C use <pango/pango.h>"
		end
	
	pango_attr_list_insert (a_list, an_attribute: POINTER) is
		external "C use <pango/pango.h>"
		end

	pango_attr_list_insert_before (a_list, an_attribute: POINTER) is
		external "C use <pango/pango.h>"
		end
	
	pango_attr_list_change (a_list, an_attribute: POINTER) is
		external "C use <pango/pango.h>"
		end
	
	pango_attr_list_splice (a_list, another_list: POINTER; a_pos, a_len: INTEGER) is
		external "C use <pango/pango.h>"
		end

	pango_attr_list_filter (a_list, a_pango_attr_filter_func, some_data: POINTER): POINTER is 	-- PangoAttrList* 
		external "C use <pango/pango.h>"
		end
	
	--gboolean (*PangoAttrFilterFunc) (PangoAttribute *attribute, gpointer data) is
end
