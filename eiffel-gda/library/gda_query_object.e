indexing
	description: "GdaQueryObject: Parent class for any object participating in a GdaQuery."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GDA developers
					
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

deferred class GDA_QUERY_OBJECT

inherit GDA_OBJECT

insert GLIB_BASIC_TYPES

feature 
	set_natural_id (an_id: like guint) is
			-- Sets the natural (integer) ID of Current; this also
			-- triggers a change in the string `id'.

			-- TODO: guint should be a NATURAL_32
		do
			gda_query_object_set_int_id(handle,an_id)
		end

	natural_id: like guint is
			-- the natural (integer) ID of Current
		do
			Result:=gda_query_object_get_int_id(handle)
		end

feature -- TODO: Signal Details
	--
	--  The "numid-changed" signal
	--
	-- void                user_function                      (GdaQueryObject *gdaqueryobject,
	--                                                         gpointer        user_data)           : Run First
	--
	--   gdaqueryobject : the object which received the signal.
	--   user_data :      user data set when the signal handler was connected.

feature {} -- External calls
	gda_query_object_set_int_id (an_obj: POINTER; an_id: like guint ) is
			-- void gda_query_object_set_int_id (GdaQueryObject *qobj, guint id);
		external "C use <libgda/libgda.h>"
		end

	gda_query_object_get_int_id (an_obj: POINTER): like guint is
	-- guint gda_query_object_get_int_id (GdaQueryObject *qobj);
		external "C use <libgda/libgda.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaQueryObject)"
		end
end -- class GDA_QUERY_OBJECT
