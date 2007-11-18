indexing
	description: "External calls for GDA_OBJECT"	
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli
					
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

deferred class GDA_OBJECT_EXTERNALS

insert ANY undefine copy, is_equal end

feature {} -- External calls

	gda_object_get_dict (an_object: POINTER): POINTER is
			-- GdaDict* gda_object_get_dict (GdaObject *object);
		external "C use <libgda/libgda.h>"
		end

	gda_object_set_id (an_object, a_strid: POINTER) is
			-- void gda_object_set_id (GdaObject *object, const gchar *strid);
		external "C use <libgda/libgda.h>"
		end

	gda_object_set_name (an_object, a_name: POINTER) is
			-- void gda_object_set_name (GdaObject *object, const gchar *name);
		external "C use <libgda/libgda.h>"
		end
	
	gda_object_set_description (an_object, a_descr: POINTER) is
			-- void gda_object_set_description (GdaObject *object, const gchar *descr);
		external "C use <libgda/libgda.h>"
		end
	
	gda_object_set_owner (an_object, an_owner: POINTER) is
			-- void gda_object_set_owner (GdaObject *object, const gchar *owner);
		external "C use <libgda/libgda.h>"
		end

	gda_object_get_id (an_object: POINTER): POINTER is
			-- const gchar* gda_object_get_id (GdaObject *object);
		external "C use <libgda/libgda.h>"
		end
	
	gda_object_get_name (an_object: POINTER): POINTER is
			-- const gchar* gda_object_get_name (GdaObject *object);
		external "C use <libgda/libgda.h>"
		end
	
	gda_object_get_description (an_object: POINTER): POINTER is
			-- const gchar* gda_object_get_description (GdaObject *object);
		external "C use <libgda/libgda.h>"
		end

	gda_object_get_owner (an_object: POINTER): POINTER is
			-- const gchar* gda_object_get_owner (GdaObject *object);
		external "C use <libgda/libgda.h>"
		end
	
	gda_object_destroy (an_object: POINTER) is
			-- void gda_object_destroy (GdaObject *object);
		external "C use <libgda/libgda.h>"
		end
	
	gda_object_destroy_check (an_object: POINTER) is
			-- void gda_object_destroy_check (GdaObject *object);
		external "C use <libgda/libgda.h>"
		end
	
	gda_object_connect_destroy (an_object, a_callback, some_data: POINTER): INTEGER_64 is
			-- gulong gda_object_connect_destroy (gpointer object, GCallback callback, gpointer data);
		external "C use <libgda/libgda.h>"
		end
	
	gda_object_changed (an_object: POINTER) is
			-- void gda_object_changed (GdaObject *object);
		external "C use <libgda/libgda.h>"
		end

	gda_object_block_changed (an_object: POINTER) is
			-- void gda_object_block_changed (GdaObject *object);
		external "C use <libgda/libgda.h>"
		end
	
	gda_object_unblock_changed (an_object: POINTER) is
			-- void gda_object_unblock_changed (GdaObject *object);
		external "C use <libgda/libgda.h>"
		end
	
	gda_object_dump (an_object: POINTER; an_offset: INTEGER) is
			-- void gda_object_dump (GdaObject *object, guint offset);
			-- an_offset should ba NATURAL
		external "C use <libgda/libgda.h>"
		end
	
	-- Not defining struct_size, since GDA_OBJECT is deferred
end
