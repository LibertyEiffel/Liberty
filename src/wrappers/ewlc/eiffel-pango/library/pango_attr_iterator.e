indexing
	description: "."
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

class PANGO_ATTR_ITERATOR
	-- An iterator through a `PANGO_ATTR_LIST' (PangoAttrList). A new
	-- iterator is created with
	-- `PANGO_ATTR_LIST.get_new_iterator'. Once the iterator is
	-- created, it can be advanced through the style changes in the
	-- text using `next'. At each style change, you can query the range
	-- of the current style segment with `range' and the attributes currently in
	-- effect with `item' (a G_SLIST[PANGO_ATTRIBUTE]), `item_of_type' 
	-- and `details'.

inherit 
	ITERATOR [G_SLIST[PANGO_ATTRIBUTE]]
		redefine 
			copy
		end

	C_STRUCT
		undefine
			is_equal
		redefine
			copy
		end

create {ANY} from_attribute_list, copy, from_external_pointer

feature {} --
	from_attribute_list (an_attribute_list: PANGO_ATTR_LIST) is
		require list_not_void: an_attribute_list /= Void
		do
			from_external_pointer(pango_attr_list_get_iterator (an_attribute_list.handle))
			attribute_list := an_attribute_list
			attribute_list.set_freezed
		ensure attribute_list_freezed: an_attribute_list.is_freezed
		end
	
feature {ANY} 
	copy (another: like Current) is
			--    Copy a PangoAttrIterator
		do
			from_external_pointer (pango_attr_iterator_copy (handle))
			debug print ("Warning: PANGO_ATTR_ITERATOR.copy does not know the attribute list it is linked to%N") end
		end

	start is
		do
			
		end

	item, attributes: G_SLIST [PANGO_ATTRIBUTE] is
			-- a list of all attributes at the current position of the
			-- iterator.
		do
			create {G_SLIST_PANGO_ATTRIBUTE}  Result.from_external_pointer (pango_attr_iterator_get_attrs (handle))
		end

	is_off: BOOLEAN

	next is
			--    Advance the iterator until the next change of style.
		do
			is_off := not (pango_attr_iterator_next (handle).to_boolean)
			-- Infact pango_attr_iterator_next returns FALSE if the
			-- iterator is at the end of the list, otherwise TRUE
		end

	range: TUPLE [INTEGER, INTEGER] is
			-- the range of the current segment. Note that the stored
			-- return values are signed, not unsigned like the values in
			-- PangoAttribute. To deal with this API oversight, stored
			-- return values that wouldn't fit into a signed integer are
			-- clamped to G_MAXINT.
		local a_start, an_end: INTEGER
		do		
			pango_attr_iterator_range (handle, $a_start, $an_end)
			create Result.make_2 (a_start, an_end)
		end

	item_of_type (a_type: INTEGER): PANGO_ATTRIBUTE is
			-- the current attribute of `a_type' at the iterator location
			-- or Void if no attribute of that type applies to the
			-- current location. When multiple attributes of the same
			-- type overlap, the attribute whose range starts closest to
			-- the current location is used.
		local ptr: POINTER 
		do
			ptr := pango_attr_iterator_get (handle, a_type)
			if ptr.is_not_null then
				create Result.from_external_pointer (ptr)
				Result.set_shared
			end
		end
	
	details: TUPLE[PANGO_FONT_DESCRIPTION, PANGO_LANGUAGE, G_SLIST[PANGO_ATTRIBUTE]] is
			-- Details about the current position of the iterator:

			-- a description of the font; the family name in this
			-- structure will be set using PANGO_FONT_DESCRIPTION's
			-- `set_family_static' using values from an attribute in the
			-- PangoAttrList associated with the iterator, so if you plan
			-- to keep it around, you must call: (TODO: Eiffellize)
			-- pango_font_description_set_family (desc,
			-- pango_font_description_get_family (desc)).

			-- the language tag for item; Void if none is found.

			-- a list of non-font attributes at the the current position;
			-- only the highest priority value of each attribute will be
			-- added to this list. 

			-- Note: the original C implementation says "In order to free
			-- this value, you must call pango_attribute_destroy() on
			-- each member". Eiffel does not need to comply explicitly
			-- with this rule, because memory handling is already dealt
			-- with by G_SLIST
		local 
			a_description: PANGO_FONT_DESCRIPTION
			a_language: PANGO_LANGUAGE;  some_attributes: G_SLIST[PANGO_ATTRIBUTE]
			a_language_ptr, extra_attrs_ptr: POINTER
		do
			create a_description.make
			pango_attr_iterator_get_font (handle, a_description.handle,
													address_of(a_language_ptr), address_of(extra_attrs_ptr))
			if a_language_ptr.is_not_null then 
				create a_language.from_external_pointer(a_language_ptr) 
			end
			if extra_attrs_ptr.is_not_null then
				create {G_SLIST_PANGO_ATTRIBUTE} some_attributes.from_external_pointer(extra_attrs_ptr) 
			end
			create Result.make_3 (a_description, a_language, some_attributes)
		end
	
	dispose is
			-- Destroy a PangoAttrIterator and free all associated
			-- memory. Thaw the associated PANGO_ATTR_LIST, making it
			-- changeable again.
		do
			pango_attr_iterator_destroy (handle)
			handle := default_pointer
			if attribute_list/=Void then
				attribute_list.unset_freezed
			end
		end

feature {ANY} -- size

	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(PangoAttrIterator)"
		end

feature {} -- Implementation
	attribute_list: PANGO_ATTR_LIST
			-- The list Current iterator is linked to.
	
feature {} -- External calls
	pango_attr_list_get_iterator (a_list: POINTER): POINTER is -- PangoAttrIterator* 
		external "C use <pango/pango.h>"
		end
	
	pango_attr_iterator_copy (an_iterator: POINTER): POINTER is  -- PangoAttrIterator*
		external "C use <pango/pango.h>"
		end

	pango_attr_iterator_next (an_iterator: POINTER): INTEGER is --  gboolean
		external "C use <pango/pango.h>"
		end
	
	pango_attr_iterator_range (an_iterator: POINTER; gint_start, gint_end: POINTER) is
		external "C use <pango/pango.h>"
		end

	pango_attr_iterator_get (an_iterator: POINTER; a_type: INTEGER): POINTER is --PangoAttribute*
		external "C use <pango/pango.h>"
		end
	
	pango_attr_iterator_get_font (an_iterator, font_description, language_reference, extra_attrs_reference: POINTER) is
		external "C use <pango/pango.h>"
		end
	
	pango_attr_iterator_get_attrs (an_iterator: POINTER): POINTER is --GSList*
		external "C use <pango/pango.h>"
		end
	pango_attr_iterator_destroy (an_iterator: POINTER) is
		external "C use <pango/pango.h>"
		end
end
