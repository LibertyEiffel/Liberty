indexing
	description: "."
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

deferred class GDA_DATA_MODEL_ROW
	-- GdaDataModelRow, base implementation for other objects to
	-- implement the GdaDataModel interface based on the usage of
	
	-- This class is not intended to be instanciated directly, but to
	-- be inherited.

inherit
	GDA_OBJECT
	GDA_DATA_MODEL

feature {} -- TODO: Properties
	--   "command-text"             gchararray            : Read / Write
	--   "command-type"             gint                  : Read / Write
	--   "read-only"                gboolean              : Read / Write
	--
	--
	--
	--  The "command-text" property
	--
	--   "command-text"             gchararray            : Read / Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "command-type" property
	--
	--   "command-type"             gint                  : Read / Write
	--
	--   Allowed values: [0,5]
	--
	--   Default value: 5
	--
	--   --------------------------------------------------------------------------
	--
	--  The "read-only" property
	--
	--   "read-only"                gboolean              : Read / Write
	--
	--   Default value: FALSE

end -- class GDA_DATA_MODEL_ROW
