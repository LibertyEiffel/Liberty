indexing
	description: "Enum GdaDataModelHint"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

deferred class GDA_DATA_MODEL_HINT_ENUM

inherit ANY undefine is_equal, copy end


feature {}  -- enum
	is_valid_hint (an_hint :INTEGER): BOOLEAN is
		do	
			Result:=((an_hint = gda_data_model_hint_start_batch_update) or else
						(an_hint = gda_data_model_hint_end_batch_update) or else
						(an_hint = gda_data_model_hint_refresh))
		end

	gda_data_model_hint_start_batch_update: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DATA_MODEL_HINT_START_BATCH_UPDATE"
		end

	gda_data_model_hint_end_batch_update: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DATA_MODEL_HINT_END_BATCH_UPDATE"
		end
			
	gda_data_model_hint_refresh: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DATA_MODEL_HINT_REFRESH"
		end

end
