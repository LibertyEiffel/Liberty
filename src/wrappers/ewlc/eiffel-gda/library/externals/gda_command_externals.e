-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_COMMAND_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_command_set_options (a_cmd: POINTER; an_options: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_command_get_options (a_cmd: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_command_set_command_type (a_cmd: POINTER; a_type: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_command_get_command_type (a_cmd: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_command_set_text (a_cmd: POINTER; a_text: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_command_get_text (a_cmd: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_command_copy (a_cmd: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_command_free (a_cmd: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_command_new (a_text: POINTER; a_type: INTEGER_32; an_options: INTEGER_32): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_command_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
