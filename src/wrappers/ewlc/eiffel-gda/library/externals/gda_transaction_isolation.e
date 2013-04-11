-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_TRANSACTION_ISOLATION
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_transaction_isolation_unknown) or else 
				(a_value = gda_transaction_isolation_read_committed) or else 
				(a_value = gda_transaction_isolation_read_uncommitted) or else 
				(a_value = gda_transaction_isolation_repeatable_read) or else 
				(a_value = gda_transaction_isolation_serializable))
		end


feature {ANY} -- Setters
	default_create, set_unknown is
		do
			value := gda_transaction_isolation_unknown
		end

	set_read_committed is
		do
			value := gda_transaction_isolation_read_committed
		end

	set_read_uncommitted is
		do
			value := gda_transaction_isolation_read_uncommitted
		end

	set_repeatable_read is
		do
			value := gda_transaction_isolation_repeatable_read
		end

	set_serializable is
		do
			value := gda_transaction_isolation_serializable
		end


feature {ANY} -- Queries
	is_unknown: BOOLEAN is
		do
			Result := (value=gda_transaction_isolation_unknown)
		end

	is_read_committed: BOOLEAN is
		do
			Result := (value=gda_transaction_isolation_read_committed)
		end

	is_read_uncommitted: BOOLEAN is
		do
			Result := (value=gda_transaction_isolation_read_uncommitted)
		end

	is_repeatable_read: BOOLEAN is
		do
			Result := (value=gda_transaction_isolation_repeatable_read)
		end

	is_serializable: BOOLEAN is
		do
			Result := (value=gda_transaction_isolation_serializable)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_transaction_isolation_unknown: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_TRANSACTION_ISOLATION_UNKNOWN"
		end

	gda_transaction_isolation_read_committed: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_TRANSACTION_ISOLATION_READ_COMMITTED"
		end

	gda_transaction_isolation_read_uncommitted: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_TRANSACTION_ISOLATION_READ_UNCOMMITTED"
		end

	gda_transaction_isolation_repeatable_read: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_TRANSACTION_ISOLATION_REPEATABLE_READ"
		end

	gda_transaction_isolation_serializable: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_TRANSACTION_ISOLATION_SERIALIZABLE"
		end


end

