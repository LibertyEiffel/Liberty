note
	description: "Access to GtsFileVariable C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_FILE_VARIABLE_STRUCT
	--  typedef struct {
	--    GtsTokenType type;
	--    gchar name[30];
	--    gboolean unique;
	--    gpointer data;
	--    gboolean set;
	--    guint line, pos;
	--  } GtsFileVariable;
	
inherit ANY undefine is_equal, copy end

feature {} -- Structure getter/setter calls
	
   -- GtsTokenType type;
	get_type (a_struct: POINTER): INTEGER
		external "C struct GtsFileVariable get type use <gts.h>"
		end
	
	set_type (a_struct: POINTER; a_type: INTEGER)
		external "C struct GtsFileVariable set type use <gts.h>"
		end

	-- gchar name[30];
	get_name (a_struct: POINTER): POINTER
		external "C struct GtsFileVariable get name use <gts.h>"
		end

	set_name (a_struct: POINTER; a_name: POINTER)
		external "C struct GtsFileVariable set name use <gts.h>"
		end

	-- gboolean unique;
    get_unique (a_struct: POINTER): INTEGER
		external "C struct GtsFileVariable get unique use <gts.h>"
		end

	set_unique (a_struct: POINTER; a_unique: INTEGER)
		external "C struct GtsFileVariable set unique use <gts.h>"
		end

	-- gpointer data;
    get_data (a_struct: POINTER): POINTER
		external "C struct GtsFileVariable get data use <gts.h>"
		end

	set_data (a_struct: POINTER; a_data: POINTER)
		external "C struct GtsFileVariable set data use <gts.h>"
		end

	-- gboolean set;
    get_set (a_struct: POINTER): INTEGER
		external "C struct GtsFileVariable get set use <gts.h>"
		end

	set_set (a_struct: POINTER; a_set: INTEGER)
		external "C struct GtsFileVariable set set use <gts.h>"
		end

	-- guint line,
	get_line (a_struct: POINTER): INTEGER
			-- TODO: shoould be NATURAL
		external "C struct GtsFileVariable get line use <gts.h>"
		end

	set_line (a_struct: POINTER; a_line: INTEGER)
			-- TODO: shoould be NATURAL
		external "C struct GtsFileVariable set line use <gts.h>"
		end
	
	-- guint pos;
	get_pos (a_struct: POINTER): INTEGER
			-- TODO: shoould be NATURAL
		external "C struct GtsFileVariable get pos use <gts.h>"
		end

	set_pos (a_struct: POINTER; a_pos: INTEGER)
			-- TODO: shoould be NATURAL
		external "C struct GtsFileVariable set pos use <gts.h>"
		end

feature {} -- size
	struct_size: INTEGER
		external "C inline use <gts.h>"
		alias "sizeof(GtsFileVariable)"
		end

end
