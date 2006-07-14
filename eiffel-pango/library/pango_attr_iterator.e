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

			-- The PangoAttrIterator structure is used to represent an
			-- iterator through a PangoAttrList. A new iterator is
			-- created with `PANGO_ATTR_LIST.get_new_iterator'. Once the
			-- iterator is created, it can be advanced through the style
			-- changes in the text using `next'. At each style change,
			-- the range of the current style segment and the attributes
			-- currently in effect can be queried.

class PANGO_ATTR_ITERATOR

inherit 
	ITERATOR [G_SLIST [PANGO_ATTRIBUTE]]
	C_STRUCT redefine copy, dispose, from_external_pointer end

creation copy, from_external_pointer

feature 
	copy (another: like Current) is
			--    Copy a PangoAttrIterator
		do
			from_external_pointer (pango_attr_iterator_copy (handle))
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
			end
		end

	-- TODO: font ()
	
	--  void        pango_attr_iterator_get_font    (PangoAttrIterator *iterator, PangoFontDescription *desc, PangoLanguage **language, GSList **extra_attrs);
	
	--    Get the font and other attributes at the current iterator position.
	
	--    iterator :    a PangoAttrIterator
	--    desc :        a PangoFontDescription to fill in with the current values. The family name in this structure will be set
	--                   using pango_font_description_set_family_static() using values from an attribute in the PangoAttrList
	--                   associated with the iterator, so if you plan to keep it around, you must call:
	--                   pango_font_description_set_family (desc, pango_font_description_get_family (desc)).
	--    language :    if non-NULL, location to store language tag for item, or NULL if none is found.
	--    extra_attrs : if non-NULL, location in which to store a list of non-font attributes at the the current position; only
	--                   the highest priority value of each attribute will be added to this list. In order to free this value, you
	--                   must call pango_attribute_destroy() on each member.
	
	--    ------------------------------------------------------------------------------------------------------------------------
	
	attributes: G_SLIST [PANGO_ATTRIBUTE]
			-- a list of all attributes at the current position of the
			-- iterator.
		do
			create Result.from_external_pointer (pango_attr_iterator_get_attrs (handle))
			-- Note: Pango C documentation says that
			-- pango_attr_iterator_get_attrs "returns a list of all
			-- attributes for the current range. To free this value, call
			-- pango_attribute_destroy() on each value and g_slist_free()
			-- on the list." This should be automatically handled by 
			-- `dispose' in PANGO_ATTRIBUTE and in G_SLIST.
		end

	dispose is
			-- Destroy a PangoAttrIterator and free all associated
			-- memory. Thaw the associated PANGO_ATTR_LIST, making it
			-- changeable again.
		do
			pango_attr_iterator_destroy (handle)
			handle := default_pointer
			attributes.unset_freeze
		end

feature -- size

	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(PangoAttrIterator)"
		end


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
