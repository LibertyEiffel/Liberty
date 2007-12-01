indexing
	description: "Enum "
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
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
				
	wrapped_version: "3.0"
				
deferred class GDA_STATUS_EVENT_TYPE
	--  enum GdaTransactionStatusEventType

	-- TODO!

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_gda (a_ :INTEGER): BOOLEAN is
		do	
			Result:=(
	--  enum GdaTransactionStatusEventType
	--
	-- typedef enum {
	--         GDA_TRANSACTION_STATUS_EVENT_SAVEPOINT,
	--         GDA_TRANSACTION_STATUS_EVENT_SQL,
	--         GDA_TRANSACTION_STATUS_EVENT_SUB_TRANSACTION,
	-- } GdaTransactionStatusEventType;
)
		end

	--
	-- typedef enum {
	--         GDA_TRANSACTION_STATUS_EVENT_SAVEPOINT,
	--         GDA_TRANSACTION_STATUS_EVENT_SQL,
	--         GDA_TRANSACTION_STATUS_EVENT_SUB_TRANSACTION,
	-- } GdaTransactionStatusEventType;

end
