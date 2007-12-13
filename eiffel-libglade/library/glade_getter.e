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

deferred class GLADE_GETTER [W -> GTK_WIDGET]

inherit WRAPPER_HANDLER 

insert GLADE_XML_EXTERNAL

feature {} -- Creation

	handle: POINTER is deferred end

feature -- Access

	get (name: STRING): W is
		require
			name /= Void
		local
			r: G_OBJECT_EXPANDED_FACTORY [W]
			p: POINTER
			internal: TYPED_INTERNALS [W] -- Magic for dynamic object creation
		do
			Result:=r.wrapper(glade_xml_get_widget (handle, name.to_external))
		ensure
			Result /= Void
		end
end
