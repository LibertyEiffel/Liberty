-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GCHECKSUM_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = md5_low_level)  or else
				(a_value = sha1_low_level)  or else
				(a_value = sha256_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_md5 is
		do
			value := md5_low_level
		end

	set_sha1 is
		do
			value := sha1_low_level
		end

	set_sha256 is
		do
			value := sha256_low_level
		end

feature {ANY} -- Queries
	is_md5: BOOLEAN is
		do
			Result := (value=md5_low_level)
		end

	is_sha1: BOOLEAN is
		do
			Result := (value=sha1_low_level)
		end

	is_sha256: BOOLEAN is
		do
			Result := (value=sha256_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	md5_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CHECKSUM_MD5"
 			}"
 		end

	sha1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CHECKSUM_SHA1"
 			}"
 		end

	sha256_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CHECKSUM_SHA256"
 			}"
 		end


end -- class GCHECKSUM_TYPE_ENUM
