indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
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

	wrapped_version: "3.0.1"

class GDA_HANDLER_STRING
	--   GdaHandlerString -- Default handler for strings
inherit
	GDA_DATA_HANDLER
	GDA_OBJECT

creation make, from_external_pointer

feature {} -- Creation
	make is
			--   Creates a data handler for numerical values
		do
			from_external_pointer(gda_handler_string_new)
		end

	-- TODO: with_provider (a)
	--
	-- GdaDataHandler*     gda_handler_string_new_with_provider
	--                                                         (GdaServerProvider *prov,
	--                                                          GdaConnection *cnc);
	--
	--   Creates a data handler for strings, which will use some specific methods
	--   implemented by the prov object (possibly also cnc).
	--
	--   prov :    a GdaServerProvider object
	--   cnc :     a GdaConnection object, or NULL
	--   Returns : the new object

feature -- size
	dummy_gobject: POINTER is do unimplemented end 

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaHandlerString)"
		end

feature {} -- External calls
	gda_handler_string_new: POINTER is
			-- GdaDataHandler* gda_handler_type_new (void);
		external "C use <libgda/libgda.h>"
		end

	gda_handler_string_new_with_provider (a_provider, a_connection: POINTER): POINTER is
			-- GdaDataHandler* gda_handler_string_new_with_provider (GdaServerProvider *prov, GdaConnection *cnc);
		external "C use <libgda/libgda.h>"
		end

end -- class GDA_HANDLER_STRING
