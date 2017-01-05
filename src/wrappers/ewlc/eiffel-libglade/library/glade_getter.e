note
	description: "."
	copyright: "[
					Copyright (C) 2006-2017: Soluciones Informaticas Libres S.A. (Except)
					
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

deferred class GLADE_GETTER [W -> GTK_WIDGET]

inherit
	G_OBJECT 
	INTERNALS_HANDLER
		undefine copy, is_equal end

insert 
	GLADE_XML_EXTERNAL
	G_OBJECT_EXTERNALS

feature {ANY} -- Access

	get (name: STRING): W
		require
			name /= Void
		local
			factory: G_OBJECT_EXPANDED_FACTORY [W]
			p: POINTER
		do
			p := glade_xml_get_widget (handle, name.to_external)
			check p.is_not_null end
			debug 
				std_error.put_string(once "GLADE_GETTER.get(%"")
				std_error.put_string(name)
				std_error.put_string(once "%"): "); std_error.put_pointer(p)
			end
			Result := factory.wrapper (p)
			debug 
				std_error.put_string(once ", wrapper "); 
				std_error.put_string(Result.generator)
				std_error.put_new_line end
		ensure
			Result /= Void
		end
end
