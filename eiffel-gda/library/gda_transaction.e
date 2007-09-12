indexing
	description: "GdaTransaction -- Management of transactions."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GDA team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GDA_TRANSACTION

inherit
	G_OBJECT
		rename make as allocate_struct
		end
	
insert
	GDA_TRANSACTION_EXTERNALS
	GDA_TRANSACTION_ISOLATION_ENUM
	
creation dummy, make, from_external_pointer

feature {} -- Creation

	make (a_name: STRING) is    
			-- Creates a new GdaTransaction object with `a_name', which allows a
			-- fine-tune and full control of transactions to be used with
			-- providers.
		do
			from_external_pointer (gda_transaction_new (a_name.to_external))
		end

feature -- Isolation level
	isolation_level: INTEGER is
			-- Gets the isolation level for the given transaction. This
			-- specifies the locking behavior for the database connection
			-- during the given transaction.
		do
			Result := gda_transaction_get_isolation_level (handle)
		ensure is_valid_isolation_level (Result)
		end 

	set_isolation_level (a_level: INTEGER) is
			-- Sets the isolation level for the given transaction.
		require  is_valid_isolation_level (a_level)
		do
			gda_transaction_set_isolation_level (handle, a_level)
		end                                             


feature -- Name
	name: STRING is 
			-- the name of the given transaction, as specified by the
			-- client application (via a non-NULL parameter in the call
			-- to make, or by calling set_name. Note that some providers
			-- may set, when you call GDA_CONNECTION.begin_transaction,
			-- the name of the transaction if it's not been specified by
			-- the client application, so this function may return, for
			-- some providers, values that you don't expect.
		do
			create Result.from_external_copy (gda_transaction_get_name(handle))
		ensure not_void: Result /= Void   
		end

	set_name (a_name: STRING) is
			-- Sets the name of the given transaction. This is very
			-- useful when using providers that support named
			-- transactions.
		require name_not_void: a_name /= Void
		do
			gda_transaction_set_name (handle, a_name.to_external)
		end
end -- class GDA_TRANSACTION
