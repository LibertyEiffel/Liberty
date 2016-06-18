-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_NORMALIZE_MODE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_normalize_default) or else 
				(a_value = g_normalize_nfd) or else 
				(a_value = g_normalize_default_compose) or else 
				(a_value = g_normalize_nfc) or else 
				(a_value = g_normalize_all) or else 
				(a_value = g_normalize_nfkd) or else 
				(a_value = g_normalize_all_compose) or else 
				(a_value = g_normalize_nfkc))
		end


feature {ANY} -- Setters
	default_create, set_default_external
		do
			value := g_normalize_default
		end

	set_nfd
		do
			value := g_normalize_nfd
		end

	set_default_compose
		do
			value := g_normalize_default_compose
		end

	set_nfc
		do
			value := g_normalize_nfc
		end

	set_all
		do
			value := g_normalize_all
		end

	set_nfkd
		do
			value := g_normalize_nfkd
		end

	set_all_compose
		do
			value := g_normalize_all_compose
		end

	set_nfkc
		do
			value := g_normalize_nfkc
		end


feature {ANY} -- Queries
	is_default_external: BOOLEAN
		do
			Result := (value=g_normalize_default)
		end

	is_nfd: BOOLEAN
		do
			Result := (value=g_normalize_nfd)
		end

	is_default_compose: BOOLEAN
		do
			Result := (value=g_normalize_default_compose)
		end

	is_nfc: BOOLEAN
		do
			Result := (value=g_normalize_nfc)
		end

	is_all: BOOLEAN
		do
			Result := (value=g_normalize_all)
		end

	is_nfkd: BOOLEAN
		do
			Result := (value=g_normalize_nfkd)
		end

	is_all_compose: BOOLEAN
		do
			Result := (value=g_normalize_all_compose)
		end

	is_nfkc: BOOLEAN
		do
			Result := (value=g_normalize_nfkc)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_normalize_default: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_NORMALIZE_DEFAULT"
		end

	g_normalize_nfd: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_NORMALIZE_NFD"
		end

	g_normalize_default_compose: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_NORMALIZE_DEFAULT_COMPOSE"
		end

	g_normalize_nfc: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_NORMALIZE_NFC"
		end

	g_normalize_all: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_NORMALIZE_ALL"
		end

	g_normalize_nfkd: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_NORMALIZE_NFKD"
		end

	g_normalize_all_compose: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_NORMALIZE_ALL_COMPOSE"
		end

	g_normalize_nfkc: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_NORMALIZE_NFKC"
		end


end

