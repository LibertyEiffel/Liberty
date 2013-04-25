class G_SLIST_PANGO_ATTRIBUTE 
	-- A singly-linked list of PANGO_ATTRIBUTEs returned by
	-- PANGO_ATTR_ITERATOR.item

inherit
	G_SLIST [PANGO_ATTRIBUTE]
		redefine
			dispose, from_external_pointer
		end

create {WRAPPER} from_external_pointer

feature {WRAPPER, WRAPPER_HANDLER}
	from_external_pointer (a_pointer: POINTER) is
		do
			create cache.make
			Precursor(a_pointer)
		end

	wrapper (a_pointer: POINTER): PANGO_ATTRIBUTE is
		do
			Result:=cache.reference_at(a_pointer)
			if Result=Void then
				create Result.from_external_pointer(a_pointer)
				cache.put (Result, a_pointer)
			end
		end
	
feature {} -- Memory management
	dispose is
		do
			-- TODO: Pango C documentation says that
			-- pango_attr_iterator_get_attrs "returns a list of all
			-- attributes for the current range. To free this value, call
			-- pango_attribute_destroy() on each value and g_slist_free()
			-- on the list." This should be automatically handled by
			-- `dispose' in PANGO_ATTRIBUTE and in G_SLIST.			
			g_slist_free(handle)
			handle := default_pointer
			debug
				print("G_SLIST_PANGO_ATTRIBUTE.dispose is implemented partially. Please see the sources%N")
			end
		end
	
feature {} -- internal storage
	cache: HASHED_DICTIONARY [PANGO_ATTRIBUTE, POINTER]
end	
