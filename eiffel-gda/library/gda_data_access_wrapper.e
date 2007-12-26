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

creation from_external_pointer

feature {} -- Creation
	
	--  gda_data_access_wrapper_new ()
	--
	-- GdaDataModel*       gda_data_access_wrapper_new         (GdaDataModel *model);
	--
	--   Creates a new GdaDataModel object which buffers the rows of model. This
	--   object is usefull only if model can only be accessed using cursor based
	--   method.
	--
	--   model :   a GdaDataModel
	--   Returns : a pointer to the newly created GdaDataModel.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_access_wrapper_row_exists ()
	--
	-- gboolean            gda_data_access_wrapper_row_exists  (GdaDataAccessWrapper *wrapper,
	--                                                          gint row);
	--
	--   Tests if the wrapper model of wrapper has a row number row
	--
	--   wrapper : a GdaDataAccessWrapper objects
	--   row :     a row number to test existance
	--   Returns : TRUE if row number row exists
	--
	--Property Details
	--
	--  The "model" property
	--
	--   "model"                    GdaDataModel          : Read / Write / Construct Only

feature 
	dummy_gobject: POINTER is do unimplemented end


	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDataAccessWrapper)"
		end
feature {}
	
	--                     GdaDataAccessWrapperClass;
	--                     GdaDataAccessWrapperPrivate;
	-- GdaDataModel*       gda_data_access_wrapper_new         (GdaDataModel *model);
	-- gboolean            gda_data_access_wrapper_row_exists  (GdaDataAccessWrapper *wrapper,
	--                                                          gint row);
	--
end -- class GDA_DATA_ACCESS_WRAPPER
