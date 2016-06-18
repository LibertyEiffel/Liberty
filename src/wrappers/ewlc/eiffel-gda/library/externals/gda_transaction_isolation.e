-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_TRANSACTION_ISOLATION
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_transaction_isolation_unknown) or else 
				(a_value = gda_transaction_isolation_read_committed) or else 
				(a_value = gda_transaction_isolation_read_uncommitted) or else 
				(a_value = gda_transaction_isolation_repeatable_read) or else 
				(a_value = gda_transaction_isolation_serializable))
		end


feature {ANY} -- Setters
	default_create, set_unknown
		do
			value := gda_transaction_isolation_unknown
		end

	set_read_committed
		do
			value := gda_transaction_isolation_read_committed
		end

	set_read_uncommitted
		do
			value := gda_transaction_isolation_read_uncommitted
		end

	set_repeatable_read
		do
			value := gda_transaction_isolation_repeatable_read
		end

	set_serializable
		do
			value := gda_transaction_isolation_serializable
		end


feature {ANY} -- Queries
	is_unknown: BOOLEAN
		do
			Result := (value=gda_transaction_isolation_unknown)
		end

	is_read_committed: BOOLEAN
		do
			Result := (value=gda_transaction_isolation_read_committed)
		end

	is_read_uncommitted: BOOLEAN
		do
			Result := (value=gda_transaction_isolation_read_uncommitted)
		end

	is_repeatable_read: BOOLEAN
		do
			Result := (value=gda_transaction_isolation_repeatable_read)
		end

	is_serializable: BOOLEAN
		do
			Result := (value=gda_transaction_isolation_serializable)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_transaction_isolation_unknown: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_TRANSACTION_ISOLATION_UNKNOWN"
		end

	gda_transaction_isolation_read_committed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_TRANSACTION_ISOLATION_READ_COMMITTED"
		end

	gda_transaction_isolation_read_uncommitted: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_TRANSACTION_ISOLATION_READ_UNCOMMITTED"
		end

	gda_transaction_isolation_repeatable_read: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_TRANSACTION_ISOLATION_REPEATABLE_READ"
		end

	gda_transaction_isolation_serializable: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_TRANSACTION_ISOLATION_SERIALIZABLE"
		end


end

