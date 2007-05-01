indexing
	description: "External calls for GdaCommand"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_COMMAND_EXTERNALS

inherit ANY undefine is_equal, copy end



insert ANY undefine copy, is_equal end

feature {} -- External calls
	gda_command_new (a_text: POINTER; a_type, some_options: INTEGER): POINTER is -- GdaCommand*
		external "C use <libgda/libgda.h>"
		end
	
	gda_command_free (a_command: POINTER) is
		external "C use <libgda/libgda.h>"
		end
	
	gda_command_copy (a_command: POINTER): POINTER is -- GdaCommand*
		external "C use <libgda/libgda.h>"
		end
	
	gda_command_get_text (a_command: POINTER): POINTER is -- const gchar* 
		external "C use <libgda/libgda.h>"
		end

	gda_command_set_text (a_command, a_text: POINTER) is
		external "C use <libgda/libgda.h>"
		end
	
	gda_command_get_command_type (a_command: POINTER): INTEGER is -- GdaCommandType
		external "C use <libgda/libgda.h>"
		end

	gda_command_set_command_type (a_command: POINTER; a_type: INTEGER) is
		external "C use <libgda/libgda.h>"
		end
	
	gda_command_get_options (a_command: POINTER): INTEGER is -- GdaCommandOptions
		external "C use <libgda/libgda.h>"
		end

	gda_command_set_options (a_command: POINTER; some_options: INTEGER) is
		external "C use <libgda/libgda.h>"
		end

	gda_command_get_transaction (a_command: POINTER): POINTER is -- GdaTransaction*
		external "C use <libgda/libgda.h>"
		end
	
	gda_command_set_transaction (a_command, a_transaction: POINTER) is
		external "C use <libgda/libgda.h>"
		end

end
