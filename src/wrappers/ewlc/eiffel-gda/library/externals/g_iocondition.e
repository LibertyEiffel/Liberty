-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_IOCONDITION
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN
		do
			Result := (some_flags & (g_io_in | 
				g_io_out | 
				g_io_pri | 
				g_io_err | 
				g_io_hup | 
				g_io_nval)).to_boolean
		end


feature {ANY} -- Setters
	default_create
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_in
		do
			value := value.bit_or(g_io_in)
		end

	unset_in
		do
			value := value.bit_xor(g_io_in)
		end

	set_out_external
		do
			value := value.bit_or(g_io_out)
		end

	unset_out_external
		do
			value := value.bit_xor(g_io_out)
		end

	set_pri
		do
			value := value.bit_or(g_io_pri)
		end

	unset_pri
		do
			value := value.bit_xor(g_io_pri)
		end

	set_err
		do
			value := value.bit_or(g_io_err)
		end

	unset_err
		do
			value := value.bit_xor(g_io_err)
		end

	set_hup
		do
			value := value.bit_or(g_io_hup)
		end

	unset_hup
		do
			value := value.bit_xor(g_io_hup)
		end

	set_nval
		do
			value := value.bit_or(g_io_nval)
		end

	unset_nval
		do
			value := value.bit_xor(g_io_nval)
		end


feature {ANY} -- Queries
	is_in: BOOLEAN
		do
			Result := (value &g_io_in).to_boolean
		end

	is_out_external: BOOLEAN
		do
			Result := (value &g_io_out).to_boolean
		end

	is_pri: BOOLEAN
		do
			Result := (value &g_io_pri).to_boolean
		end

	is_err: BOOLEAN
		do
			Result := (value &g_io_err).to_boolean
		end

	is_hup: BOOLEAN
		do
			Result := (value &g_io_hup).to_boolean
		end

	is_nval: BOOLEAN
		do
			Result := (value &g_io_nval).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_in: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_IN"
		end

	g_io_out: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_OUT"
		end

	g_io_pri: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_PRI"
		end

	g_io_err: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_ERR"
		end

	g_io_hup: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_HUP"
		end

	g_io_nval: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_NVAL"
		end


end

