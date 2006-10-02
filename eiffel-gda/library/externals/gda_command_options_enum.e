indexing
	description: "Enum GdaCommandOptions"
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

deferred class GDA_COMMAND_OPTIONS_ENUM
feature  -- enum
	are_valid_options (some_options :INTEGER): BOOLEAN is
		do	
			Result:=(some_options & (gda_command_option_ignore_errors |
											 gda_command_option_stop_on_errors |
											 gda_command_option_bad_option)).to_boolean
		end

 	gda_command_option_ignore_errors: INTEGER is
		external "C macro use <libgda/ligda.h>"
		alias "GDA_COMMAND_OPTION_IGNORE_ERRORS"
		end 

	gda_command_option_stop_on_errors: INTEGER is
		external "C macro use <libgda/ligda.h>"
		alias "GDA_COMMAND_OPTION_STOP_ON_ERRORS"
		end 

	gda_command_option_bad_option: INTEGER is
		external "C macro use <libgda/ligda.h>"
		alias "GDA_COMMAND_OPTION_BAD_OPTION"
		end	
end
