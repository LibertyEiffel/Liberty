indexing
	description: "."
	copyright: "[
					Copyright (C) 2006 Soluciones Informaticas Libres S.A. (Except)
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GLADE_GETTER [W -> GTK_WIDGET]

inherit
	GLADE_XML_EXTERNAL
	INTERNALS_HANDLER
		undefine copy, is_equal end

feature {NONE} -- Creation

	handle: POINTER is deferred end

feature -- Access

	get (name: STRING): W is
		require
			name /= Void
		local
			r: G_RETRIEVER [W]
			p: POINTER
			internal: TYPED_INTERNALS [W] -- Magic for dynamic object creation
		do
			p := glade_xml_get_widget (handle, name.to_external)
			if r.has_eiffel_wrapper_stored (p) then
				Result := r.retrieve_eiffel_wrapper_from_gobject_pointer (p)
			else
				create internal.make_blank
				internal.set_object_can_be_retrieved
				internal.object.from_external_pointer (p)
				Result := internal.object
			end
		ensure
			Result /= Void
		end
end
