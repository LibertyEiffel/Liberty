note
	description: "."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GTS team
					
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

class GTS_FILE
	-- The gts_get_token() and gts_get_newline() functions are used for parsing
	-- GTS geometric files.
	
inherit
	C_STRUCT
	STREAM_HANDLER undefine copy, is_equal end

insert
	GTS_TOKEN_TYPE
	
create {ANY}  make, from_standard_input, from_external_pointer

feature {} -- Creation
	make (a_file: INPUT_STREAM)
		require file_not_void: a_file/=Void
		do
			from_external_pointer(gts_file_new(a_file.stream_pointer))
		end

	from_standard_input
		do
			from_external_pointer(gts_file_new(std_input.stream_pointer))
		end
	
feature {ANY}

	next_token
			-- Reads next token and updates token and delim fields.
		do
			gts_file_next_token(handle)
		end

	first_token_after (a_type: INTEGER)
			-- Finds and sets the first token of `a_type' different from type
			-- occuring after a token of `a_type'.
		require valid_type: is_valid_token(a_type)
		do
			gts_file_first_token_after(handle,a_type)
		end

	assign_start (some_variables: C_ARRAY[GTS_FILE_VARIABLE])
			--  Opens a block delimited by braces to read a list of optional
			--  arguments specified by some_variables.
		
			--    If an error is encountered the error field of f is set.
		
			--     f :     a GtsFile.
			--     vars :  a GTS_NONE terminated array of GtsFileVariable.
		require
			variables_not_void: some_variables/=Void
			-- TODO: variables are GTS_NONE terminated
		do
			gts_file_assign_start (handle,some_variables.storage.to_external)
		end

--    -----------------------------------------------------------------------------------------------------------

	--   gts_file_assign_next ()

	--  GtsFileVariable* gts_file_assign_next       (GtsFile *f,
	--                                               GtsFileVariable *vars);

	--    Assigns the next optional argument of vars read from f.

	--     f :        a GtsFile.
	--     vars :     a GTS_NONE terminated array of GtsFileVariable.
	--     Returns :  the variable of vars which has been assigned or NULL if no variable has been assigned (if an
	--                error has been encountered the error field of f is set).

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_file_assign_variables ()

	--  void        gts_file_assign_variables       (GtsFile *f,
	--                                               GtsFileVariable *vars);

	--    Assigns all the variables belonging to vars found in f.

	--    If an error is encountered the error field of f is set.

	--     f :     a GtsFile.
	--     vars :  an array of GtsFileVariable.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_file_getc ()

	--  gint        gts_file_getc                   (GtsFile *f);

	--     f :        a GtsFile.
	--     Returns :  the next character in f or EOF if the end of the file is reached or if an error occured.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_file_getc_scope ()

	--  gint        gts_file_getc_scope             (GtsFile *f);

	--     f :        a GtsFile.
	--     Returns :  the next character in f in the scope defined by f->scope_max or EOF if the end of the file is
	--                reached or if an error occured.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_file_read ()

	--  guint       gts_file_read                   (GtsFile *f,
	--                                               gpointer ptr,
	--                                               guint size,
	--                                               guint nmemb);

	--    Reads nmemb elements of data, each size bytes long, from f, storing them at the location given by ptr.

	--     f :        a GtsFile.
	--     ptr :      a pointer.
	--     size :     size of an element.
	--     nmemb :    number of elements.
	--     Returns :  the number of elements read.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_file_variable_error ()

	--  void        gts_file_variable_error         (GtsFile *f,
	--                                               GtsFileVariable *vars,
	--                                               const gchar *name,
	--                                               const gchar *format,
	--                                               ...);

	--    Sets the error field of f using gts_file_verror().

	--    String name must match one of the variable names in vars.

	--    If variable name has been assigned (using gts_file_assign_variables()) sets the line and pos fields of f to
	--    the line and position where it has been assigned.

	--     f :       a GtsFile.
	--     vars :    an array of GtsFileVariable.
	--     name :    the name of a variable in vars.
	--     format :  the standard sprintf() format string.
	--     ... :     the parameters to insert into the format string.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_file_verror ()

	--  void        gts_file_verror                 (GtsFile *f,
	--                                               const gchar *format,
	--                                               va_list args);

	--    Sets the error field of f using g_strdup_vprintf().

	--    This function can be called only once and disables any other operation on f (gts_file_close() excepted).

	--     f :       a GtsFile.
	--     format :  the standard sprintf() format string.
	--     args :    the list of parameters to insert into the format string.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_file_error ()

	--  void        gts_file_error                  (GtsFile *f,
	--                                               const gchar *format,
	--                                               ...);

	--    Sets the error field of f using gts_file_verror().

	--    This function can be called only once and disables any other operation on f (gts_file_close() excepted).

	--     f :       a GtsFile.
	--     format :  the standard sprintf() format string.
	--     ... :     the parameters to insert into the format string.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_file_destroy ()

	--  void        gts_file_destroy                (GtsFile *f);

	--    Frees all the memory allocated for f.

	--     f :  a GtsFile.

feature {} -- Unwrapped code
	--   GTS_COMMENTS

	--  #define GTS_COMMENTS  "#!"

	--    Set of characters used as comments identifiers in GTS geometric files.

	--   GtsFile

	--  typedef struct {
	--    FILE * fp;
	--    gchar * s, * s1;
	--    guint line, pos;
	--    GString * token;
	--    GtsTokenType type;
	--    gchar * error;

	--    guint curline, curpos;
	--    guint scope, scope_max;
	--    gint next_token;
	--    gchar * delimiters;
	--    gchar * comments;
	--    gchar * tokens;
	--  } GtsFile;

feature {} 

	-- #define     GTS_COMMENTS

	-- GtsFile;
	
	-- enum GtsTokenType;
	
	-- GtsFileVariable;

	gts_file_new (a_file: POINTER): POINTER
			-- 	GtsFile* gts_file_new (FILE *fp);
		external "C use <gts.h>"
		end

	gts_file_next_token (a_gts_file: POINTER)
			--  void gts_file_next_token (GtsFile *f);
		external "C use <gts.h>"
		end

	gts_file_first_token_after (a_gts_file: POINTER; a_gts_token_type: INTEGER)
			--  void gts_file_first_token_after (GtsFile *f, GtsTokenType type);
		external "C use <gts.h>"
		end

	gts_file_assign_start (a_gts_file, some_gts_file_variable: POINTER)
			--  void gts_file_assign_start (GtsFile *f, GtsFileVariable *vars);
		external "C use <gts.h>"
		end

	gts_file_assign_next (a_gts_file, a_gts_file_variable: POINTER): POINTER
			-- GtsFileVariable* gts_file_assign_next (GtsFile *f, GtsFileVariable
			-- *vars);
		external "C use <gts.h>"
		end

	gts_file_assign_variables (a_gts_file, a_gts_file_variable: POINTER)
			--  void gts_file_assign_variables (GtsFile *f, GtsFileVariable *vars);
		external "C use <gts.h>"
		end

	gts_file_getc (a_gts_file: POINTER): INTEGER
			--  gint gts_file_getc (GtsFile *f);
		external "C use <gts.h>"
		end

	gts_file_getc_scope (a_gts_file: POINTER): INTEGER
			--  gint gts_file_getc_scope (GtsFile *f);
		external "C use <gts.h>"
		end

	gts_file_read (a_gts_file, a_ptr: POINTER; a_guint_size, a_guint_nmemb: INTEGER): INTEGER
			-- guint gts_file_read (GtsFile *f, gpointer ptr, guint size, guint
			-- nmemb);

			-- TODO: size, nmemb and Result should be NATURAL since they're guint
		external "C use <gts.h>"
		end

	gts_file_variable_error (a_gts_file, some_gts_file_variable, a_name, a_format: POINTER)
			--  void gts_file_variable_error (GtsFile *f, GtsFileVariable *vars,
			--  const gchar *name, const gchar *format, ...);
		external "C use <gts.h>"
		end

	-- Unwrappable: void gts_file_verror (GtsFile *f, const gchar *format,
	-- va_list args);

	gts_file_error (a_gts_file, a_format: POINTER)
			--  void gts_file_error (GtsFile *f, const gchar *format, ...);
		external "C use <gts.h>"
		end

	gts_file_destroy (a_gts_file: POINTER)
			--  void gts_file_destroy (GtsFile *f);
		external "C use <gts.h>"
		end


feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gts.h>"
		alias "sizeof(	GtsFile)"
		end
end -- class GTS_FILE
