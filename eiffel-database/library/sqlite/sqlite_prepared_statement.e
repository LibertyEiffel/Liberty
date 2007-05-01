indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class SQLITE_PREPARED_STATEMENT
inherit 	PREPARED_STATEMENT
	C_STRUCT
		redefine dispose
		end
insert SQLITE3_EXTERNALS
	
feature -- size
	struct_size: INTEGER is
		external "C inline "
		alias "sizeof(sqlite3_stmt)"
		end
feature -- Disposing
	dispose is
		local res: INTEGER
		do
			res := sqlite3_finalize (handle)
			-- TODO: use the result call of the finalize somehow
			handle := default_pointer
		end

feature -- parameters validity
	parameters_count: INTEGER is
		do
			Result := sqlite3_bind_parameter_count (handle)
		end

	are_valid_parameters (some_parameters: TRAVERSABLE[ANY]): BOOLEAN is
		local 
			an_iter: ITERATOR[ANY]
			j: INTEGER -- binded parameters index
		do
			Result := True
			from an_iter:=some_parameters.get_new_iterator; an_iter.start; j := 1
			until an_iter.is_off or Result=False
			loop
				Result := is_valid_parameter(an_iter.item, j)
				j:=j+1
				an_iter.next
			end
		end

	is_valid_parameter (a_parameter: ANY; an_index: INTEGER): BOOLEAN is
		local		
			int_ref: REFERENCE[INTEGER]; real_ref: REFERENCE[REAL]; a_string: STRING
		do
			if int_ref ?:= a_parameter then
				int_ref ::= a_parameter
				res_code := sqlite3_bind_int (handle, an_index, int_ref.item )
			elseif real_ref ?:= a_parameter then
				real_ref ::= a_parameter
				res_code := sqlite3_bind_double (handle, an_index, real_ref.item)
			elseif a_string ?:= a_parameter then
				a_string ::= a_parameter 
				res_code := sqlite3_bind_text (handle, an_index, a_string.to_external, 
														 a_string.count, sqlite_transient)
			end
			inspect res_code
			when sqlite_ok then Result:=True
			when sqlite_mismatch then Result:=False
			else
				raise ("Unhandled return code in SQLITE_PREPARED_COMMAND.is_valid_parameter: " + create {STRING}.from_external_copy(sqlite3_errmsg(handle)))
			end
		end

	bind_parameter (a_parameter: ANY; an_index: INTEGER) is
			-- Bind `a_parameter' to `an_index' placeholder in the statement.
		require 
			parameter_not_void: a_parameter /= Void
			valid_index: an_index.in_range (1,parameters_count)
		local		
			int_ref: REFERENCE[INTEGER]; real_ref: REFERENCE[REAL]; a_string: STRING
		do
			if int_ref ?:= a_parameter then
				int_ref ::= a_parameter
				res_code := sqlite3_bind_int (handle, an_index, int_ref.item )
			elseif real_ref ?:= a_parameter then
				real_ref ::= a_parameter
				res_code := sqlite3_bind_double (handle, an_index, real_ref.item)
			elseif a_string ?:= a_parameter then
				a_string ::= a_parameter 
				res_code := sqlite3_bind_text (handle, an_index, a_string.to_external, 
														 a_string.count, sqlite_transient)
			else 
				debug
					print ("Warning! Unrecognized type in SQLITE_PREPARED_STATEMENT.%
							 %bind_parameter ("+a_parameter.out+", "+an_index.out+")%N")
				end
			end
			inspect res_code
			when sqlite_ok then -- do nothing
			when sqlite_mismatch then
				raise ("Sqlite type mismatch " + create {STRING}.from_external_copy(sqlite3_errmsg(handle)))
			else
				raise ("Sqlite error: " + create {STRING}.from_external_copy(sqlite3_errmsg(handle)))
			end					
		end

feature {DATABASE} -- Creation of heirs (command and query)
	make (sqlite_db: SQLITE_DATABASE; some_sql: STRING) is
			-- Makes a prepared query from `some_sql'
		local unused_portion: POINTER -- unused part of `some_sql'
		do
			res_code := sqlite3_prepare (sqlite_db.handle,
												  some_sql.to_external,
												  some_sql.count,
												  $handle,
												  $unused_portion)		
		end


feature {} -- Implementation
	res_code: INTEGER 
			-- The result code of the last sqlite operation

end

