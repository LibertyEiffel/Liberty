indexing
	description: "Access to GdaCommand C structure"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_COMMAND_STRUCT

insert
	ANY
		undefine
			copy, is_equal
		end

feature {} -- Structure getter/setter calls

-- typedef struct {
-- 	gchar *text;
-- 	GdaCommandType type;
-- 	GdaCommandOptions options;
-- 	GdaTransaction *xaction;
-- } GdaCommand;

	-- 	gchar *text;
	get_text (a_struct: POINTER): POINTER is
		external "C struct GdaCommand get text use <libgda/libgda.h>"
		end

	set_text_external (a_struct: POINTER; a_text: POINTER) is
		external "C struct GdaCommand set text use <libgda/libgda.h>"
		end

	-- 	GdaCommandType type;
	get_type (a_struct: POINTER): INTEGER is
		external "C struct GdaCommand get type use <libgda/libgda.h>"
		end

	set_type_external (a_struct: POINTER; a_type: INTEGER) is
		external "C struct GdaCommand set type use <libgda/libgda.h>"
		end

	-- 	GdaCommandOptions options;
	get_options (a_struct: POINTER): INTEGER is
		external "C struct GdaCommand get options use <libgda/libgda.h>"
		end

	set_options_external (a_struct: POINTER; a_options: INTEGER) is
		external "C struct GdaCommand set options use <libgda/libgda.h>"
		end

-- 	GdaTransaction *xaction;
	get_xaction (a_struct: POINTER): POINTER is
		external "C struct GdaCommand get xaction use <libgda/libgda.h>"
		end

	set_xaction_external (a_struct: POINTER; a_xaction: POINTER) is
		external "C struct GdaCommand set xaction use <libgda/libgda.h>"
		end


feature -- size
	struct_size: INTEGER is
		external "C inline use <$include>"
		alias "sizeof(GdaCommand)"
		end

end
