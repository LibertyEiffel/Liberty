-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GCHECKSUM_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = md_5_low_level)  or else
				(a_value = sha_256_low_level) )
		end

feature -- Setters
	default_create,
	set_md_5 is
		do
			value := md_5_low_level
		end

	set_sha_256 is
		do
			value := sha_256_low_level
		end

feature -- Queries
	is_md_5: BOOLEAN is
		do
			Result := (value=md_5_low_level)
		end

	is_sha_256: BOOLEAN is
		do
			Result := (value=sha_256_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	md_5_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CHECKSUM_MD5"
 			}"
 		end

	sha_256_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CHECKSUM_SHA256"
 			}"
 		end


end -- class GCHECKSUM_TYPE_ENUM
