-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GCHECKSUM_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = md5_low_level)  or else
				(a_value = sha1_low_level)  or else
				(a_value = sha256_low_level)  or else
				(a_value = sha512_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_md5
               do
                       value := md5_low_level
               end

	set_sha1
               do
                       value := sha1_low_level
               end

	set_sha256
               do
                       value := sha256_low_level
               end

	set_sha512
               do
                       value := sha512_low_level
               end

feature {ANY} -- Queries
       is_md5: BOOLEAN
               do
                       Result := (value=md5_low_level)
               end

       is_sha1: BOOLEAN
               do
                       Result := (value=sha1_low_level)
               end

       is_sha256: BOOLEAN
               do
                       Result := (value=sha256_low_level)
               end

       is_sha512: BOOLEAN
               do
                       Result := (value=sha512_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     md5_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_CHECKSUM_MD5"
                       }"
               end

     sha1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_CHECKSUM_SHA1"
                       }"
               end

     sha256_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_CHECKSUM_SHA256"
                       }"
               end

     sha512_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_CHECKSUM_SHA512"
                       }"
               end


end -- class GCHECKSUM_TYPE_ENUM
