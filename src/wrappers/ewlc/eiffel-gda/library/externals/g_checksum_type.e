-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_CHECKSUM_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_checksum_md5) or else 
				(a_value = g_checksum_sha1) or else 
				(a_value = g_checksum_sha256))
		end


feature {ANY} -- Setters
	default_create, set_g_checksum_md5
		do
			value := g_checksum_md5
		end

	set_g_checksum_sha1
		do
			value := g_checksum_sha1
		end

	set_g_checksum_sha256
		do
			value := g_checksum_sha256
		end


feature {ANY} -- Queries
	is_g_checksum_md5: BOOLEAN
		do
			Result := (value=g_checksum_md5)
		end

	is_g_checksum_sha1: BOOLEAN
		do
			Result := (value=g_checksum_sha1)
		end

	is_g_checksum_sha256: BOOLEAN
		do
			Result := (value=g_checksum_sha256)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_checksum_md5: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_CHECKSUM_MD5"
		end

	g_checksum_sha1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_CHECKSUM_SHA1"
		end

	g_checksum_sha256: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_CHECKSUM_SHA256"
		end


end

