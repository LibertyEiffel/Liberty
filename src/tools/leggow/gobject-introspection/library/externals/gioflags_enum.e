-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GIOFLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = append_low_level)  or else
				(a_value = get_mask_low_level)  or else
				(a_value = is_readable_low_level)  or else
				(a_value = is_seekable_low_level)  or else
				(a_value = is_writable_low_level)  or else
				(a_value = is_writeable_low_level)  or else
				(a_value = mask_low_level)  or else
				(a_value = nonblock_low_level)  or else
				(a_value = set_mask_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_append
               do
                       value := append_low_level
               end

	set_get_mask
               do
                       value := get_mask_low_level
               end

	set_is_readable
               do
                       value := is_readable_low_level
               end

	set_is_seekable
               do
                       value := is_seekable_low_level
               end

	set_is_writable
               do
                       value := is_writable_low_level
               end

	set_is_writeable
               do
                       value := is_writeable_low_level
               end

	set_mask
               do
                       value := mask_low_level
               end

	set_nonblock
               do
                       value := nonblock_low_level
               end

	set_set_mask
               do
                       value := set_mask_low_level
               end

feature {ANY} -- Queries
       is_append: BOOLEAN
               do
                       Result := (value=append_low_level)
               end

       is_get_mask: BOOLEAN
               do
                       Result := (value=get_mask_low_level)
               end

       is_is_readable: BOOLEAN
               do
                       Result := (value=is_readable_low_level)
               end

       is_is_seekable: BOOLEAN
               do
                       Result := (value=is_seekable_low_level)
               end

       is_is_writable: BOOLEAN
               do
                       Result := (value=is_writable_low_level)
               end

       is_is_writeable: BOOLEAN
               do
                       Result := (value=is_writeable_low_level)
               end

       is_mask: BOOLEAN
               do
                       Result := (value=mask_low_level)
               end

       is_nonblock: BOOLEAN
               do
                       Result := (value=nonblock_low_level)
               end

       is_set_mask: BOOLEAN
               do
                       Result := (value=set_mask_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     append_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_FLAG_APPEND"
                       }"
               end

     get_mask_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_FLAG_GET_MASK"
                       }"
               end

     is_readable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_FLAG_IS_READABLE"
                       }"
               end

     is_seekable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_FLAG_IS_SEEKABLE"
                       }"
               end

     is_writable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_FLAG_IS_WRITABLE"
                       }"
               end

     is_writeable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_FLAG_IS_WRITEABLE"
                       }"
               end

     mask_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_FLAG_MASK"
                       }"
               end

     nonblock_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_FLAG_NONBLOCK"
                       }"
               end

     set_mask_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_FLAG_SET_MASK"
                       }"
               end


end -- class GIOFLAGS_ENUM
