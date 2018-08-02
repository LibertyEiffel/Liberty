note
	description: "."
	copyright: "[
					Copyright (C) 2008-2018: Paolo Redaelli
					
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

	wrapped_version: "3.99.3"

class GDA_SQL_PARSER
	-- GdaSqlParser: SQL parser

	-- The GdaSqlParser is an object dedicated to creating GdaStatement and
	-- GdaBatch objects from SQL strings. The actual contents of the parsed
	-- statements is represented as GDA_SQL_STATEMENT structures (which can be
	-- obtained from any GDA_STATEMENT through the "structure" property).
	
	-- GDA_SQLIPARSER parsers can be created by calling
	-- GDA_SERVER_PROVIDER.create_parser for a provider adapted SQL parser,
	-- or using GDA_SQL_PARSER make for a general purpose SQL parser.
	
	-- The GdaSqlParser can either work in "parse" mode where it will try to
	-- parse the SQL string, or in "delimiter" mode where it will only attempt
	-- at delimiting SQL statements in a string which may contain several SQL
	-- statements (usually separated by a semi column). If operating in
	-- "parser" mode, and the parser can't correctly parse the string, then it
	-- will switch to the "delimiter" mode for the next statement in the string
	-- to parse (and create a GDA_SQL_STATEMENT_UNKNOWN statement).
	
	-- The GdaSqlParser object parses and analyses SQL statements and reports
	-- the following statement types:
	
	-- o SELECT (and COMPOUND select), INSERT, UPDATE and DELETE SQL statements
	-- should be completely parsed.
	
	-- o Transaction related statements (corresponding to the BEGIN, COMMIT,
	-- ROLLBACK, SAVEPOINT, ROLLBACK SAVEPOINT and DELETE SAVEPOINT) are parsed
	-- and a minimalist structure is created to extract some information (that
	-- structure is not enough per-se to re-create the complete SQL statement).
	
	-- o Any other type of SQL statement (CREATE TABLE, ...) creates a
	-- GdaStatement of type GDA_SQL_STATEMENT_UNKNOW, and it only able to
	-- locate place holders (variables) and end of statement marks.
	
	-- NOTE: Any SQL of a type which should be parsed which but which creates a
	-- GdaStatement of type GDA_SQL_STATEMENT_UNKNOWN (check with
	-- GDA_STATEMENT.type) should be reported as a bug.
	
	--   The GdaSqlParser object recognizes place holders (variables), which
	--   can later be queried and valued using gda_statement_get_parameters().
	--   The folllowing syntax are recognized (other syntaxes might be
	--   recognized for specific database providers if the GdaSqlParser is
	--   created using gda_server_provider_create_parser() but for portability
	--   reasons it's better to avoid them):

	-- o ##NAME[::TYPE[::NULL]]: for a variable named NAME with the optional
	-- type TYPE (which can be a GType name or a custom database type name),
	-- and with the optional "::NULL" to instruct that the variable can be
	-- NULL.
	
	-- o ## /* name:NAME [type:TYPE] [nullok:[TRUE|FALSE]] [descr:DESCR] */ for
	-- a variable named NAME with the optional type TYPE (which can be a GType
	-- name or a custom database type name), with the optional "nullok"
	-- attribute and an optional description DESCR.
	
	-- The GdaSqlParser object internally uses a LEMON generated parser (the
	-- same as the one used by SQLite).
	
inherit
	G_OBJECT

insert
	GDA_SQL_PARSER_EXTERNALS
	SHARED_G_ERROR

create {ANY} make, from_external_pointer

feature {} -- Creation
	make
		--   Creates a new GdaSqlParser object
		do
			from_external_pointer(gda_sql_parser_new)
		end

feature {ANY} 
	statement_from_string (some_sql: STRING): GDA_STATEMENT
		-- a newly created GDA_STATEMENT parsed from the first SQL statement
		-- contained in `some_sql'; if it contains more than one statement,
		-- then the remaining part of the string is not parsed at all (TODO:
		-- handle it properly) and remain (if not NULL) will point at the first
		-- non parsed character.  Result will be Void if an error occurred.
		-- `error' is updated.
	local p,remainder: POINTER
	do
		p:=gda_sql_parser_parse_string
			(handle, some_sql.to_external,
			 address_of(remainder), address_of(error.handle))
		if p.is_not_null then
			create Result.from_external_pointer(p)
		end
	end
	
	batch_from_string (some_sql: STRING): GDA_BATCH
		-- A newly create GDA_BATCH that contains all the GdaStatement objects
		-- created while parsing (one object per SQL statement).  Empty
		-- statements (composed of spaces only) do not appear in the resulting
		-- object.

		-- `some_sql' is parsed and GdaStatement objects are created as long as
		-- no error is found in sql. If an error is found at some point, then
		-- the parsing stops and (TODO) remain may contain a non NULL pointer,
		-- error may be set, and NULL is returned.

		-- if sql is NULL, then the returned GdaBatch object will contain no
		-- statement.
	
		-- TODO: add support for a location to store a pointer to remaining
		-- part of sql in case an error occurred while parsing sql,

		-- `error' is updated. Result is Void if an error occurrend. 
	local p, remainder: POINTER
	do
		p:=gda_sql_parser_parse_string_as_batch
		(handle, null_or_string(some_sql),
		address_of(remainder), address_of(error.handle))
		if p.is_not_null then
			create Result.from_external_pointer(p)
		end
	end
	
	
	--  gda_sql_parser_parse_file_as_batch ()
	--
	-- GdaBatch*           gda_sql_parser_parse_file_as_batch  (GdaSqlParser *parser,
	--                                                          const gchar *filename,
	--                                                          GError **error);
	--
	--   Parse filename's contents and creates a GdaBatch object which contains all
	--   the GdaStatement objects created while parsing (one object per SQL
	--   statement).
	--
	--   filename's contents are parsed and GdaStatement objects are created as
	--   long as no error is found. If an error is found at some point, then the
	--   parsing stops, error may be set and NULL is returned
	--
	--   if sql is NULL, then the returned GdaBatch object will contain no
	--   statement.
	--
	--   parser :   a GdaSqlParser object
	--   filename : name of the file to parse
	--   error :    location to store error, or NULL
	--   Returns :  a new GdaBatch object, or NULL if an error occurred
	--
	--  The "debug" property
	--
	--   "debug"                    gboolean              : Write
	--
	--   Forces the parser to display somme debug information.
	--
	--   Default value: FALSE
	--
	--  The "mode" property
	--
	--   "mode"                     gint                  : Read / Write
	--
	--   Controls the parsing mode determining how the parser operates.
	--
	--   Allowed values: [0,1]
	--
	--   Default value: 0
	--
	--   --------------------------------------------------------------------------
	--
	--  The "tokenizer-flavour" property
	--
	--   "tokenizer-flavour"        gint                  : Read / Write
	--
	--   Modifies the behaviour of the tokenizer, reserved for GdaServerProvider
	--   implementations
	--
	--   Allowed values: [0,4]
	--
	--   Default value: 0
	--
feature {} -- Unwrapped 
	--  enum GdaSqlParserMode
	--
	-- typedef enum {
	--         GDA_SQL_PARSER_MODE_PARSE,
	--         GDA_SQL_PARSER_MODE_DELIMIT
	-- } GdaSqlParserMode;
	--
	--   GDA_SQL_PARSER_MODE_PARSE   Parse mode, the parser tries to parse and
	--                               build a structure representing the SQL
	--                               statement
	--   GDA_SQL_PARSER_MODE_DELIMIT Delimit mode, the parser only tries to
	--                               identify variables, will always return a
	--                               statement of type GDA_SQL_STATEMENT_UNKNOW.
	
feature {ANY}
	struct_size: INTEGER
		external "C inline use <sql-parser/gda-sql-parser.h>"
		alias "sizeof(GdaSet)"
		end

end -- class GDA_SQL_PARSER
