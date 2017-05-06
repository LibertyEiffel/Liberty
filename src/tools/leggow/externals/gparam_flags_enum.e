-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GPARAM_FLAGS_ENUM

-- Wrapper of enum GParamFlags defined in file /usr/include/glib-2.0/gobject/gparam.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (construct_low_level | 
				construct_only_low_level | 
				deprecated_low_level | 
				explicit_notify_low_level | 
				lax_validation_low_level | 
				private_low_level | 
				readable_low_level | 
				readwrite_low_level | 
				static_blurb_low_level | 
				static_name_low_level | 
				static_nick_low_level | 
				writable_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_construct
               do
                       value := value.bit_or(construct_low_level)
               end

	unset_construct
               do
                       value := value.bit_xor(construct_low_level)
               end

	set_construct_only
               do
                       value := value.bit_or(construct_only_low_level)
               end

	unset_construct_only
               do
                       value := value.bit_xor(construct_only_low_level)
               end

	set_deprecated
               do
                       value := value.bit_or(deprecated_low_level)
               end

	unset_deprecated
               do
                       value := value.bit_xor(deprecated_low_level)
               end

	set_explicit_notify
               do
                       value := value.bit_or(explicit_notify_low_level)
               end

	unset_explicit_notify
               do
                       value := value.bit_xor(explicit_notify_low_level)
               end

	set_lax_validation
               do
                       value := value.bit_or(lax_validation_low_level)
               end

	unset_lax_validation
               do
                       value := value.bit_xor(lax_validation_low_level)
               end

	set_private
               do
                       value := value.bit_or(private_low_level)
               end

	unset_private
               do
                       value := value.bit_xor(private_low_level)
               end

	set_readable
               do
                       value := value.bit_or(readable_low_level)
               end

	unset_readable
               do
                       value := value.bit_xor(readable_low_level)
               end

	set_readwrite
               do
                       value := value.bit_or(readwrite_low_level)
               end

	unset_readwrite
               do
                       value := value.bit_xor(readwrite_low_level)
               end

	set_static_blurb
               do
                       value := value.bit_or(static_blurb_low_level)
               end

	unset_static_blurb
               do
                       value := value.bit_xor(static_blurb_low_level)
               end

	set_static_name
               do
                       value := value.bit_or(static_name_low_level)
               end

	unset_static_name
               do
                       value := value.bit_xor(static_name_low_level)
               end

	set_static_nick
               do
                       value := value.bit_or(static_nick_low_level)
               end

	unset_static_nick
               do
                       value := value.bit_xor(static_nick_low_level)
               end

	set_writable
               do
                       value := value.bit_or(writable_low_level)
               end

	unset_writable
               do
                       value := value.bit_xor(writable_low_level)
               end

feature {ANY} -- Queries
       is_construct: BOOLEAN
               do
                       Result := (value.bit_and(construct_low_level).to_boolean)
               end

       is_construct_only: BOOLEAN
               do
                       Result := (value.bit_and(construct_only_low_level).to_boolean)
               end

       is_deprecated: BOOLEAN
               do
                       Result := (value.bit_and(deprecated_low_level).to_boolean)
               end

       is_explicit_notify: BOOLEAN
               do
                       Result := (value.bit_and(explicit_notify_low_level).to_boolean)
               end

       is_lax_validation: BOOLEAN
               do
                       Result := (value.bit_and(lax_validation_low_level).to_boolean)
               end

       is_private: BOOLEAN
               do
                       Result := (value.bit_and(private_low_level).to_boolean)
               end

       is_readable: BOOLEAN
               do
                       Result := (value.bit_and(readable_low_level).to_boolean)
               end

       is_readwrite: BOOLEAN
               do
                       Result := (value.bit_and(readwrite_low_level).to_boolean)
               end

       is_static_blurb: BOOLEAN
               do
                       Result := (value.bit_and(static_blurb_low_level).to_boolean)
               end

       is_static_name: BOOLEAN
               do
                       Result := (value.bit_and(static_name_low_level).to_boolean)
               end

       is_static_nick: BOOLEAN
               do
                       Result := (value.bit_and(static_nick_low_level).to_boolean)
               end

       is_writable: BOOLEAN
               do
                       Result := (value.bit_and(writable_low_level).to_boolean)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     construct_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_PARAM_CONSTRUCT"
                       }"
               end

     construct_only_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_PARAM_CONSTRUCT_ONLY"
                       }"
               end

     deprecated_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_PARAM_DEPRECATED"
                       }"
               end

     explicit_notify_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_PARAM_EXPLICIT_NOTIFY"
                       }"
               end

     lax_validation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_PARAM_LAX_VALIDATION"
                       }"
               end

     private_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_PARAM_PRIVATE"
                       }"
               end

     readable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_PARAM_READABLE"
                       }"
               end

     readwrite_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_PARAM_READWRITE"
                       }"
               end

     static_blurb_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_PARAM_STATIC_BLURB"
                       }"
               end

     static_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_PARAM_STATIC_NAME"
                       }"
               end

     static_nick_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_PARAM_STATIC_NICK"
                       }"
               end

     writable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_PARAM_WRITABLE"
                       }"
               end


end -- class GPARAM_FLAGS_ENUM
