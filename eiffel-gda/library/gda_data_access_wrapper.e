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

class GDA_DATA_ACCESS_WRAPPER
	-- GdaDataAccessWrapper Offers a random access on top of a
	-- cursor-only access data model

	-- The GdaDataAccessWrapper object simply wraps around another
	-- GdaDataModel data model object and allows data to be accessed in
	-- a random way while remaining memory efficient as much as
	-- possible.
	
inherit
	GDA_OBJECT
	GDA_DATA_MODEL

creation make, from_external_pointer

feature {} -- Creation
	make (a_model: GDA_DATA_MODEL) is
			-- Creates a new GdaDataModel object which buffers the rows
			-- of model. This object is usefull only if model can only be
			-- accessed using cursor based method.
		require model_not_void: a_model/=Void
		do
			from_external_pointer(gda_data_access_wrapper_new(a_model.handle))
		end

feature 
	row_exists (a_row_number: INTEGER): BOOLEAN is
			-- Does the row number `a_row' exist?
		do
			Result:=(gda_data_access_wrapper_row_exists
						(handle, a_row).to_boolean))
		end	

	-- TODO:  The "model" property

	--   "model"                    GdaDataModel          : Read / Write / Construct Only

feature 
	dummy_gobject: POINTER is do unimplemented end


	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDataAccessWrapper)"
		end
feature {}
	gda_data_access_wrapper_new (a_model: POINTER): POINTER is
			-- GdaDataModel*       gda_data_access_wrapper_new         (GdaDataModel *model);
		external "C use <libgda/libgda.h>"
		end

	gda_data_access_wrapper_row_exists  (a_wrapper: POINTER: a_row: INTEGER): INTEGER is
			-- gboolean gda_data_access_wrapper_row_exists  (GdaDataAccessWrapper *wrapper, gint row);
		external "C use <libgda/libgda.h>"
		end

end -- class GDA_DATA_ACCESS_WRAPPER
