-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_CONNECT_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN
		do
			Result := (some_flags & (g_connect_after | 
				g_connect_swapped)).to_boolean
		end


feature {ANY} -- Setters
	default_create
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_g_connect_after
		do
			value := value.bit_or(g_connect_after)
		end

	unset_g_connect_after
		do
			value := value.bit_xor(g_connect_after)
		end

	set_g_connect_swapped
		do
			value := value.bit_or(g_connect_swapped)
		end

	unset_g_connect_swapped
		do
			value := value.bit_xor(g_connect_swapped)
		end


feature {ANY} -- Queries
	is_g_connect_after: BOOLEAN
		do
			Result := (value &g_connect_after).to_boolean
		end

	is_g_connect_swapped: BOOLEAN
		do
			Result := (value &g_connect_swapped).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_connect_after: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_CONNECT_AFTER"
		end

	g_connect_swapped: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_CONNECT_SWAPPED"
		end


end

