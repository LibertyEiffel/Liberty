indexing
	description: "GdaDataModelRow: Base implementation for other objects to implement the GdaDataModel interface based on the usage of. (TODO: original GDA doc is incomplete"
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GDA team
					
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

			-- Description: This object is not intended to be
			-- instanciated directly, but to be inherited.

deferred class GDA_DATA_MODEL_ROW

inherit 
	GDA_OBJECT
		-- Known heirs: GdaDataModelArray, GdaDataModelHash
	GDA_DATA_MODEL
		-- Since GdaDataModelRow implements GdaDataModel interface.

feature {} -- TODO
	-- Properties

	--    "command-text"         gchararray            : Read / Write
	--    "command-type"         gint                  : Read / Write
--    "read-only"            gboolean              : Read / Write

--    --------------------------------------------------------------------------

--   GdaDataModelRowClass

--  typedef struct {
--          GdaObjectClass parent_class;

--          /* virtual methods */
--          gint                (* get_n_rows)      (GdaDataModelRow *model);
--          gint                (* get_n_columns)   (GdaDataModelRow *model);
--          GdaRow             *(* get_row)         (GdaDataModelRow *model, gint row, GError **error);
--          const GValue       *(* get_value_at)    (GdaDataModelRow *model, gint col, gint row);

--          gboolean            (* is_updatable)    (GdaDataModelRow *model);

--          GdaRow             *(* append_values)   (GdaDataModelRow *model, const GList *values, GError **error);
--          gboolean            (* append_row)      (GdaDataModelRow *model, GdaRow *row, GError **error);
--          gboolean            (* update_row)      (GdaDataModelRow *model, GdaRow *row, GError **error);
--          gboolean            (* remove_row)      (GdaDataModelRow *model, GdaRow *row, GError **error);
--  } GdaDataModelRowClass;

--    --------------------------------------------------------------------------

feature {} -- TODO: Property Details

--   The "command-text" property

--    "command-text"         gchararray            : Read / Write

--    Default value: NULL

--    --------------------------------------------------------------------------

--   The "command-type" property

--    "command-type"         gint                  : Read / Write

--    Allowed values: [0,5]

--    Default value: 5

--    --------------------------------------------------------------------------

--   The "read-only" property

--    "read-only"            gboolean              : Read / Write

--    Default value: FALSE

end -- class GDA_DATA_MODEL_ROW
