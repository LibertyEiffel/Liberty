indexing
	description: "The archetypes dictionary avoids disposing of archetypes wrappers"
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli
					
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
					
deferred class SHARED_ARCHETYPES_DICTIONARY
	-- Shared class that offers the archetypes dictionary.
	
	-- An archetype is a empty wrapper object. One archetype shall be 
	-- created for each GObject class that has an Eiffel wrapper 
	-- class.
	
	-- The dictionary avoids the wrappers archetypes to be disposed 
	-- and their memory reclaimed by the Eiffel Garbage Collector.
	
inherit WRAPPER_HANDLER
	
insert
	ANY undefine copy, default_create, is_equal, fill_tagged_out_memory end
	SHARED_EIFFEL_KEY
	G_TYPE_EXTERNALS undefine default_create, fill_tagged_out_memory end
	G_QUARK_EXTERNALS undefine default_create, fill_tagged_out_memory end
		-- To obtain the definition of gquark

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
	archetypes: HASHED_DICTIONARY [G_OBJECT, INTEGER_64] is
			-- The archetypes of GObjects. A wrapper library during its
			-- initialization must "register" an Eiffel wrapper for each
			-- GObject class. Key is the identification number (also 
			-- known as GType) of the GObject class, value is the 
			-- archetype object. When the wrapper library encounters an 
			-- unwrapped GObject and it does not know from context which 
			-- class it belongs to we looks this dictionary for an 
			-- primer object, an archetype copied into a new

			-- TODO: the key shall be a NATURAL_32 or ideally "like g_type"
		once
			create {HASHED_DICTIONARY[G_OBJECT,INTEGER_64]}
			Result.with_capacity (100)
		end

	has_archetype (a_type: like g_type): BOOLEAN is
			-- Has an archetype been stored for `a_type' GType?
		do
			Result := (g_type_get_archetype (a_type,eiffel_archetype_key.quark)/=Void)
			check consistent: Result = archetypes.has(a_type) end
		end

	store_archetype (an_archetype: G_OBJECT) is
			-- Store `an_archetype' in `archetypes' dictionary and in 
			-- the underlying GType.
		require an_archetype/=Void
		do
			archetypes.put(an_archetype, an_archetype.type)
			g_type_set_archetype (an_archetype.type, eiffel_archetype_key.quark, an_archetype)
		ensure
			archetypes_added: archetypes.has(an_archetype.type)
			archetype_stored_in_gtype: has_archetype(an_archetype.type)
		end

feature {} -- External call
	g_object_get_eiffel_wrapper (a_object: POINTER; a_quark: like gquark): G_OBJECT is
			-- This function gets back the Eiffel wrapper stored using `g_object_set_qdata'
		external "C use <glib-object.h>"
		alias "g_object_get_qdata"
		end

	g_type_set_archetype (a_type: like g_type; a_quark: like gquark; a_gobject: G_OBJECT) is
			-- void g_type_set_qdata (GType type, GQuark quark, gpointer
			-- data);
		
			-- Attaches arbitrary data to a type.
			-- type : 	a GType
			-- quark : 	a GQuark id to identify the data
			-- data : 	the data
		require quark_is_eiffel_archetype_key: a_quark = eiffel_archetype_key.quark
		external "C use <glib-object.h>"
		alias "g_type_set_qdata"
		end
	
	g_type_get_archetype (a_type: like g_type; a_quark: like gquark): G_OBJECT is
			-- Gets back the Eiffel wrapper stored using
			-- `g_object_set_qdata'. Here we stretch the type system a
			-- bit, because actually Result should be a POINTER, so
			-- strictly speaking this feature is almost a trick; yet we
			-- know for sure that the Result pointer is a valid Eiffel
			-- reference to G_OBJECT because of the preconditions we have
			-- added.

			-- gpointer g_type_get_qdata (GType type, GQuark quark);

			-- Obtains data which has previously been attached to type with g_type_set_qdata().
			-- type : 	a GType
			-- quark : 	a GQuark id to identify the data
			-- Returns : 	the data, or NULL if no data was found
		require quark_is_eiffel_archetype_key: a_quark = eiffel_archetype_key.quark
		external "C inline use <glib-object.h>"
		alias "g_type_get_qdata((GType) $a_type, $a_quark)"
		end
end -- class SHARED_ARCHETYPES_DICTIONARY
