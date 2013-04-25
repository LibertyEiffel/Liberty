-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_IOCONDITION
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (g_io_in | 
				g_io_out | 
				g_io_pri | 
				g_io_err | 
				g_io_hup | 
				g_io_nval)).to_boolean
		end


feature {ANY} -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_in is
		do
			value := value.bit_or(g_io_in)
		end

	unset_in is
		do
			value := value.bit_xor(g_io_in)
		end

	set_out_external is
		do
			value := value.bit_or(g_io_out)
		end

	unset_out_external is
		do
			value := value.bit_xor(g_io_out)
		end

	set_pri is
		do
			value := value.bit_or(g_io_pri)
		end

	unset_pri is
		do
			value := value.bit_xor(g_io_pri)
		end

	set_err is
		do
			value := value.bit_or(g_io_err)
		end

	unset_err is
		do
			value := value.bit_xor(g_io_err)
		end

	set_hup is
		do
			value := value.bit_or(g_io_hup)
		end

	unset_hup is
		do
			value := value.bit_xor(g_io_hup)
		end

	set_nval is
		do
			value := value.bit_or(g_io_nval)
		end

	unset_nval is
		do
			value := value.bit_xor(g_io_nval)
		end


feature {ANY} -- Queries
	is_in: BOOLEAN is
		do
			Result := (value &g_io_in).to_boolean
		end

	is_out_external: BOOLEAN is
		do
			Result := (value &g_io_out).to_boolean
		end

	is_pri: BOOLEAN is
		do
			Result := (value &g_io_pri).to_boolean
		end

	is_err: BOOLEAN is
		do
			Result := (value &g_io_err).to_boolean
		end

	is_hup: BOOLEAN is
		do
			Result := (value &g_io_hup).to_boolean
		end

	is_nval: BOOLEAN is
		do
			Result := (value &g_io_nval).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_in: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_IN"
		end

	g_io_out: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_OUT"
		end

	g_io_pri: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_PRI"
		end

	g_io_err: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_ERR"
		end

	g_io_hup: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_HUP"
		end

	g_io_nval: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_NVAL"
		end


end

