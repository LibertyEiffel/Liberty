indexing
	description: "Enum GdaDataModelAccessFlags"
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

deferred class GDA_DATA_MODEL_ACCESS_FLAGS_ENUM

insert ANY undefine copy, is_equal end

feature  -- enum
	are_valid_access_flags (some_flags :INTEGER): BOOLEAN is
		do	
			Result:=(some_flags & (gda_data_model_access_random | 
										  gda_data_model_access_cursor_forward | 
										  gda_data_model_access_cursor_backward | 
										  gda_data_model_access_insert |  
										  gda_data_model_access_update |  
										  gda_data_model_access_delete |  
										  gda_data_model_access_write | 
										  gda_data_model_access_delete)).to_boolean
		end
	
	gda_data_model_access_random: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DATA_MODEL_ACCESS_RANDOM"
		end
	
	gda_data_model_access_cursor_forward: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DATA_MODEL_ACCESS_CURSOR_FORWARD"
		end
 
	gda_data_model_access_cursor_backward: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DATA_MODEL_ACCESS_CURSOR_BACKWARD"
		end
	
	gda_data_model_access_insert: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DATA_MODEL_ACCESS_INSERT"
		end
	
	gda_data_model_access_update: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DATA_MODEL_ACCESS_UPDATE"
		end
  
	gda_data_model_access_delete: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DATA_MODEL_ACCESS_DELETE"
		end
  
	gda_data_model_access_write: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DATA_MODEL_ACCESS_WRITE"
		end
 
end

