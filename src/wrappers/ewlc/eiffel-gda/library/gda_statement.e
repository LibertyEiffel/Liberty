note
	description: "."
	copyright: "[
					Copyright (C) 2008-2017: Paolo Redaelli, Gnome-DB 
					
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

	wrapped_version: "Unknown"

class GDA_STATEMENT
	-- Single SQL statement

	-- The GDA_STATEMENT represents a single SQL statement; multiple statements
	-- can be groupped in a GDA_BACTH object.
	
	-- A GDA_STATEMENT can either be built "manually" by building a
	-- GDA_SQL_STATEMENT structure, or from an SQL statement using a
	-- GDA_SQL_PARSER object.
	
	-- A GdaConnection can use a GdaStatement to:
	
	-- o prepare it for a future execution, the preparation step involves
	-- converting the GdaStatement object into a structure used by the
	-- database's own API, see GDA_CONNECTION.statement_prepare.
	
	-- o execute it using GDA_CONNECTION.statement_execute_select if it is
	-- known that the statement is a selection statement,
	-- GDA_CONNECTION_STATEMENT.execute_non_select if it is not a selection
	-- statement, or GDA_CONNECTION_STATEMENT.execute when the type of expected
	-- result is unknown.
	
	-- Note that it is possible to use the same GdaStatement object at the same
	-- time with several GdaConnection objects.

inherit
	G_OBJECT 
		redefine
			copy
		end

insert
	GDA_STATEMENT_EXTERNALS
	SHARED_G_ERROR

create {ANY} make, copy, from_external_pointer

feature {} -- Creation
	make
		-- Creates a new GdaStatement object
	do
		from_external_pointer(gda_statement_new)
	end

feature {ANY}	
	copy (another: like Current)
		-- Creates a new GDA_STATEMENT from another.
	do
		from_external_pointer(gda_statement_copy(another.handle))
	end
	
	deserialize (a_string: STRING)
		-- Creates a new GDA_STATEMENT from `a_string'...
	
		--   error :   a place to store errors, or NULL
		--   Returns : a new GdaStatement object, or NULL if an error occurred
	local p: POINTER
	do
		p:= gda_statement_deserialize(a_string.to_external, address_of(error.handle))
		if p.is_not_null then
			from_external_pointer(p)
		end
	end

feature {ANY} 
	to_string: STRING
		-- A string containing the serialized version of Current statement
	require is_not_null
	do
		create Result.from_external(gda_statement_serialize(handle))
	end

	parameters: GDA_SET
		--   all the execution parameters which Current statement needs, grouped into a GDA_SET.
	
		-- Void if the statement does not need any parameter.
	
		-- `is_successful' and `error' are updated.
	local ptr: POINTER
	do
		is_successful := gda_statement_get_parameters 
		(handle, address_of(ptr), error.reference).to_boolean

		if ptr.is_not_null 
			then create Result.from_external_pointer(ptr)
		end
	end
	
	
	--  gda_statement_to_sql()
	--
	-- #define             gda_statement_to_sql(stmt,params,error) gda_statement_to_sql_extended ((stmt), NULL, (params), GDA_STATEMENT_SQL_PARAMS_SHORT, NULL, (error))
	--
	--   stmt :
	--   params :
	--   error :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_statement_to_sql_extended ()
	--
	-- gchar*              gda_statement_to_sql_extended       (GdaStatement *stmt,
	--                                                          GdaConnection *cnc,
	--                                                          GdaSet *params,
	--                                                          GdaStatementSqlFlag flags,
	--                                                          GSList **params_used,
	--                                                          GError **error);
	--
	--   Renders stmt as an SQL statement, with some control on how it is rendered.
	--
	--   If cnc is not NULL, then the rendered SQL will better be suited to be used
	--   by cnc (in particular it may include some SQL tweaks and/or proprietary
	--   extensions specific to the database engine used by cnc).
	--
	--   stmt :        a GdaStatement object
	--   cnc :         a GdaConnection object, or NULL
	--   params :      parameters contained in a single GdaSet object
	--   flags :       a set of flags to control the rendering
	--   params_used : a place to store the list of actual GdaHolder objects in
	--                 params used to do the rendering, or NULL
	--   error :       a place to store errors, or NULL
	--   Returns :     a new string if no error occurred
	
	
	statement_type: GDA_SQL_STATEMENT_TYPE
		-- the type of statement. It will be gda_sql_statement_none
		-- if it does not hold any statement.
	do
			Result.set_value (gda_statement_get_statement_type(handle)) 
	end
	
	--  gda_statement_is_useless ()
	--
	-- gboolean            gda_statement_is_useless            (GdaStatement *stmt);
	--
	--   Tells if stmt is composed only of spaces (that is it has no real SQL
	--   code), and is completely useless as such.
	--
	--   stmt :    a GdaStatement object
	--   Returns : TRUE if executing stmt does nothing
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_statement_check_structure ()
	--
	-- gboolean            gda_statement_check_structure       (GdaStatement *stmt,
	--                                                          GError **error);
	--
	--   Checks that stmt's structure is correct.
	--
	--   stmt :    a GdaStatement object
	--   error :   a place to store errors, or NULL
	--   Returns : TRUE if stmt's structure is correct
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_statement_check_validity ()
	--
	-- gboolean            gda_statement_check_validity        (GdaStatement *stmt,
	--                                                          GdaConnection *cnc,
	--                                                          GError **error);
	--
	--   If cnc is not NULL then checks that every object (table, field, function)
	--   used in stmt actually exists in cnc's database
	--
	--   If cnc is NULL, then cleans anything related to cnc in stmt.
	--
	--   See gda_sql_statement_check_validity() for more information.
	--
	--   stmt :    a GdaStatement object
	--   cnc :     a GdaConnection object, or NULL
	--   error :   a place to store errors, or NULL
	--   Returns : TRUE if every object actually exists in cnc's database
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_statement_normalize ()
	--
	-- gboolean            gda_statement_normalize             (GdaStatement *stmt,
	--                                                          GdaConnection *cnc,
	--                                                          GError **error);
	--
	--   "Normalizes" some parts of stmt, see gda_sql_statement_normalize() for
	--   more information.
	--
	--   stmt :    a GdaStatement object
	--   cnc :     a GdaConnection object
	--   error :   a place to store errors, or NULL
	--   Returns : TRUE if no error occurred
	--
	--Property Details
	--
	--  The "structure" property
	--
	--   "structure"                gpointer              : Read / Write
	--
	--   This property changes or queries the internal GdaSqlStatement structure. A
	--   copy is made when either setting or getting that property.
	--
	--Signal Details
	--
	--  The "checked" signal
	--
	-- void                user_function                      (GdaStatement  *gdastatement,
	--                                                         GdaConnection *arg1,
	--                                                         gboolean       arg2,
	--                                                         gpointer       user_data)         : Run First
	--
	--   gdastatement : the object which received the signal.
	--   arg1 :
	--   arg2 :
	--   user_data :    user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "reset" signal
	--
	-- void                user_function                      (GdaStatement *gdastatement,
	--                                                         gpointer      user_data)         : Run First
	--
	--   This signal is emitted whenever the internal GdaSqlStatement structure has
	--   changed
	--
	--   gdastatement : the object which received the signal.
	--   user_data :    user data set when the signal handler was connected.
	--
feature {} -- Unwrapped documentation of enumerations.
	
	--  enum GdaStatementSqlFlag
	--
	-- typedef enum {
	--         GDA_STATEMENT_SQL_PRETTY             = 1 << 0,
	--         GDA_STATEMENT_SQL_PARAMS_LONG        = 1 << 1,
	--         GDA_STATEMENT_SQL_PARAMS_SHORT       = 1 << 2,
	--         GDA_STATEMENT_SQL_PARAMS_AS_COLON    = 1 << 3,
	--         GDA_STATEMENT_SQL_PARAMS_AS_DOLLAR   = 1 << 4,
	--         GDA_STATEMENT_SQL_PARAMS_AS_QMARK    = 1 << 5,
	--         GDA_STATEMENT_SQL_PARAMS_AS_UQMARK   = 1 << 6
	-- } GdaStatementSqlFlag;
	--
	--   These flags control how a GdaStatement will be rendered as SQL. If no
	--   "GDA_STATEMENT_SQL_PARAMS..." flag is specified, then for each parameter
	--   (variable) required by the statement, there must be a value provided when
	--   converting to SQL (through the params argument of the
	--   gda_statement_to_sql_extended() function), or an error will be reported.
	--
	--   GDA_STATEMENT_SQL_PRETTY           indents the output for easier
	--                                      readability
	--   GDA_STATEMENT_SQL_PARAMS_LONG      use the <default value> /* ... */
	--                                      syntax for each parameter
	--   GDA_STATEMENT_SQL_PARAMS_SHORT     use the ##<param_name> syntax for each
	--                                      parameter when possible
	--   GDA_STATEMENT_SQL_PARAMS_AS_COLON  use the :<param_name> syntax for each
	--                                      parameter, replacing any char not in
	--                                      [0-9A-Za-z] by '_'
	--   GDA_STATEMENT_SQL_PARAMS_AS_DOLLAR use the $<param_number> syntax for each
	--                                      parameter (starting numbering at 1)
	--   GDA_STATEMENT_SQL_PARAMS_AS_QMARK  use the ?<param_number> syntax for each
	--                                      parameter (starting numbering at 1)
	--   GDA_STATEMENT_SQL_PARAMS_AS_UQMARK use the ? syntax for each parameter (no
	--                                      numbering)
	--
	--   --------------------------------------------------------------------------
	--
	--  enum GdaStatementModelUsage
	--
	-- typedef enum {
	--         GDA_STATEMENT_MODEL_RANDOM_ACCESS   = 1 << 0,
	--         GDA_STATEMENT_MODEL_CURSOR_FORWARD  = 1 << 1,
	--         GDA_STATEMENT_MODEL_CURSOR_BACKWARD = 1 << 2,
	--         GDA_STATEMENT_MODEL_CURSOR          = GDA_STATEMENT_MODEL_CURSOR_FORWARD | GDA_STATEMENT_MODEL_CURSOR_BACKWARD
	-- } GdaStatementModelUsage;
	--
	--   These flags specify how the GdaDataModel returned when executing a
	--   GdaStatement will be used
	--
	--   GDA_STATEMENT_MODEL_RANDOM_ACCESS   access to the data model will be
	--                                       random (usually this will result in a
	--                                       data model completely stored in
	--                                       memory)
	--   GDA_STATEMENT_MODEL_CURSOR_FORWARD  access to the data model will be done
	--                                       using a cursor moving forward
	--   GDA_STATEMENT_MODEL_CURSOR_BACKWARD access to the data model will be done
	--                                       using a cursor moving backward
	--   GDA_STATEMENT_MODEL_CURSOR
	--
	--   --------------------------------------------------------------------------
	--
	--  enum GdaStatementError
	--
	-- typedef enum
	-- {
	--         GDA_STATEMENT_PARSE_ERROR,
	--         GDA_STATEMENT_SYNTAX_ERROR,
	--         GDA_STATEMENT_NO_CNC_ERROR,
	--         GDA_STATEMENT_CNC_CLOSED_ERROR,
	--         GDA_STATEMENT_EXEC_ERROR,
	--         GDA_STATEMENT_PARAM_TYPE_ERROR,
	--         GDA_STATEMENT_PARAM_ERROR
	-- } GdaStatementError;
	--
feature {ANY}
	struct_size: INTEGER
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaStatement)"
		end


end -- class GDA_STATEMENT
