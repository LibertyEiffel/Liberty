-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GPARAM_FLAGS_ENUM

-- Wrapper of enum GParamFlags defined in file /usr/include/glib-2.0/gobject/gparam.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = construct_low_level)  or else
				(a_value = construct_only_low_level)  or else
				(a_value = deprecated_low_level)  or else
				(a_value = explicit_notify_low_level)  or else
				(a_value = lax_validation_low_level)  or else
				(a_value = private_low_level)  or else
				(a_value = readable_low_level)  or else
				(a_value = readwrite_low_level)  or else
				(a_value = static_blurb_low_level)  or else
				(a_value = static_name_low_level)  or else
				(a_value = static_nick_low_level)  or else
				(a_value = writable_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_construct
               do
                       value := construct_low_level
               end

	set_construct_only
               do
                       value := construct_only_low_level
               end

	set_deprecated
               do
                       value := deprecated_low_level
               end

	set_explicit_notify
               do
                       value := explicit_notify_low_level
               end

	set_lax_validation
               do
                       value := lax_validation_low_level
               end

	set_private
               do
                       value := private_low_level
               end

	set_readable
               do
                       value := readable_low_level
               end

	set_readwrite
               do
                       value := readwrite_low_level
               end

	set_static_blurb
               do
                       value := static_blurb_low_level
               end

	set_static_name
               do
                       value := static_name_low_level
               end

	set_static_nick
               do
                       value := static_nick_low_level
               end

	set_writable
               do
                       value := writable_low_level
               end

feature {ANY} -- Queries
       is_construct: BOOLEAN
               do
                       Result := (value=construct_low_level)
               end

       is_construct_only: BOOLEAN
               do
                       Result := (value=construct_only_low_level)
               end

       is_deprecated: BOOLEAN
               do
                       Result := (value=deprecated_low_level)
               end

       is_explicit_notify: BOOLEAN
               do
                       Result := (value=explicit_notify_low_level)
               end

       is_lax_validation: BOOLEAN
               do
                       Result := (value=lax_validation_low_level)
               end

       is_private: BOOLEAN
               do
                       Result := (value=private_low_level)
               end

       is_readable: BOOLEAN
               do
                       Result := (value=readable_low_level)
               end

       is_readwrite: BOOLEAN
               do
                       Result := (value=readwrite_low_level)
               end

       is_static_blurb: BOOLEAN
               do
                       Result := (value=static_blurb_low_level)
               end

       is_static_name: BOOLEAN
               do
                       Result := (value=static_name_low_level)
               end

       is_static_nick: BOOLEAN
               do
                       Result := (value=static_nick_low_level)
               end

       is_writable: BOOLEAN
               do
                       Result := (value=writable_low_level)
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
