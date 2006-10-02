indexing
	description: "enum GdaTransactionIsolation"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

deferred class GDA_TRANSACTION_ISOLATION_ENUM
feature  -- enum
	is_valid_isolation_level (a_level: INTEGER): BOOLEAN is
		do	
			Result:=((a_level = gda_transaction_isolation_unknown) or else
						(a_level = gda_transaction_isolation_read_committed) or else
						(a_level = gda_transaction_isolation_read_uncommitted) or else
						(a_level = gda_transaction_isolation_repeatable_read) or else
						(a_level = gda_transaction_isolation_serializable))
		end

	gda_transaction_isolation_unknown: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_TRANSACTION_ISOLATION_UNKNOWN"
		end

	gda_transaction_isolation_read_committed: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_TRANSACTION_ISOLATION_READ_COMMITTED"
		end

	gda_transaction_isolation_read_uncommitted: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_TRANSACTION_ISOLATION_READ_UNCOMMITTED"
		end

	gda_transaction_isolation_repeatable_read: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_TRANSACTION_ISOLATION_REPEATABLE_READ"
		end

	gda_transaction_isolation_serializable: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_TRANSACTION_ISOLATION_SERIALIZABLE"
a		end

end
