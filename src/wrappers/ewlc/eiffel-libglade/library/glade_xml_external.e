note
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

deferred class GLADE_XML_EXTERNAL

inherit
	ANY
		undefine copy, is_equal end

feature {} -- External calls

	glade_xml_new (fname, root, domain: POINTER): POINTER is
		require
			fname.is_not_null
		external "C use <glade/glade.h>"
		ensure
			Result.is_not_null
		end

	glade_xml_signal_autoconnect (self: POINTER) is
		external "C use <glade/glade.h>"
		end

	glade_xml_get_widget (self, name: POINTER): POINTER is
		require
			self.is_not_null
			name.is_not_null
		external "C use <glade/glade.h>"
		ensure
			Result.is_not_null
		end

end
