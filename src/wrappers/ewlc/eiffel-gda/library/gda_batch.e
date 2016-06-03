note
	description: "."
	copyright: "[

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

class GDA_BATCH
	-- Multiple SQL statements groupped

	-- The GdaBatch object represents one or more SQL statements (as
	-- GdaStatement objects) in a single object.

	-- A GdaBatch can either be built "manually" by assembling together several
	-- GdaStatement objects, or from an SQL string using a GdaSqlParser object.
	
inherit
	G_OBJECT
		redefine 
			copy 
		end

insert
	GDA_BATCH_EXTERNALS
	SHARED_G_ERROR

create {ANY} make, from_external_pointer

feature {} -- Creation
	make is
		--  Creates a new GdaBatch object
	do
		from_external_pointer(gda_batch_new)
	end

feature {ANY}
	copy (another: like Current) is
		-- Creates a copy of another.
	do
		from_external_pointer(gda_batch_copy(another.handle))
	end

	add (a_statement: GDA_STATEMENT) is
		-- Add a_statement'  to the list of statements managed by batch. A
		-- statement object can be added multiple times to a GDA_BATCH object.
	require
		statement_not_void: a_statement/=Void
	do
		gda_batch_add_statement (handle, a_statement.handle)
	end
	
	remove_statement (a_statement: GDA_STATEMENT) is
		-- Removes a_statement from the list of statements managed by batch. If
		-- a_statement is present several times in batch's statements' list,
		-- then only the first one is removed.
	require
		statement_not_void: a_statement/=Void
	do
		gda_batch_remove_statement(handle, a_statement.handle)
	end
	
	to_string: STRING is
		-- A string containing the serialized version of batch
	do
		create Result.from_external(gda_batch_serialize(handle))
	end

	statements: G_OBJECT_SLIST[GDA_STATEMENT] is
		-- The statements contained in the batch.
	do
		create Result.from_external_pointer(gda_batch_get_statements(handle))
		Result.petrify
	ensure 
		Result/=Void
		Result.is_petrified
	end
	
	parameters: GDA_SET is
		-- All the execution parameters which Current batch needs for all the
		-- statements it includes, grouped into a GDA_SET.
	
		-- Result will be Void if Current batch does not need any parameter.
		-- `is_successful' and 'error' will be updated.
	local out_params: POINTER 
	do
		is_successful:=
		gda_batch_get_parameters 
		(handle, address_of(out_params), 
		error.reference).to_boolean 
	end
feature {ANY} --  The "changed" signal
	--
	-- void                user_function                      (GdaBatch *gdabatch,
	--                                                         GObject  *arg1,
	--                                                         gpointer  user_data)      : Run First
	--
	--   gdabatch :  the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.

feature {ANY}
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaBatch)"
		end

end -- class GDA_BATCH
