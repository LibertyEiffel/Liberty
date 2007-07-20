indexing
	descripetion: "Enum GdaDataModelIOFormat"
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

deferred class GDA_DATA_MODEL_IO_FORMAT_ENUM

insert ANY undefine copy, is_equal end

feature {} -- enum
	is_valid_io_format (a_format: INTEGER): BOOLEAN is
		do	
			Result:=((a_format = gda_data_model_io_data_array_xml) or else
						(a_format = gda_data_model_io_text_separated))
		end
	
	gda_data_model_io_data_array_xml: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DATA_MODEL_IO_DATA_ARRAY_XML"
		end
	
	gda_data_model_io_text_separated: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DATA_MODEL_IO_TEXT_SEPARATED"
		end
end

