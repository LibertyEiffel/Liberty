indexing
	description: "Keeps track of the transactional status of a connection"
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GDA developers
					
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

	wrapped_version: "3.0.1"

class GDA_TRANSACTION_STATUS
	-- GDA_TRANSACTION_STATUS keeps track of the transactional status
	-- of a connection

	-- On any GDA_CONNECTION, if the database provider used by the
	-- connection supports it, transactions may be started, committed
	-- or rolledback, or savepoints added, removed or rolledback. These
	-- operations can be performed using Libgda's API (such as
	-- gda_connection_begin_transaction()), or directly using some SQL
	-- on the connection (usually a "BEGIN;" command). The
	-- GdaTransactionStatus's aim is to make it easy to keep track of
	-- all the commands which have been issued on a connection
	-- regarding transactions.

	-- One GDA_TRANSACTION_STATUS object is automatically attached to a
	-- GDA_CONNECTION when a transaction is started, and is destroyed
	-- when the transaction is finished. It object can be fetched using
	-- `transaction_status' (Implementation note: TODO: beware that it
	-- should then not be modified).

inherit
	G_OBJECT

insert
	GDA_TRANSACTION_ISOLATION_ENUM
	GDA_STATUS_EVENT_STRUCT -- TODO: Entirely!
	GDA_STATUS_EVENT_TYPE -- TODO: Entirely!

creation make, from_external_pointer

feature {} -- Creation
	make (a_name: STRING) is
			-- Creates a new GDA_TRANSACTION_STATUS with `a_name', which
			-- allows a fine-tune and full control of transactions to be
			-- used with providers.
		require 
		do
			from_external_pointer(gda_transaction_status_new(a_name.to_external))
		end

feature {} -- External calls
	gda_transaction_status_new (a_name: POINTER): POINTER is  
			-- GdaTransactionStatus* gda_transaction_status_new        (const gchar *name);
		external "C use <libgda/libgda.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaTransactionStatus)"
		end

feature dummy_gobject: POINTER is do unimplemented end 

end -- class GDA_TRANSACTION_STATUS
