-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIOFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = append_low_level)  or else
				(a_value = is__readable_low_level)  or else
				(a_value = is__writeable_low_level)  or else
				(a_value = is__seekable_low_level)  or else
				(a_value = mask_low_level)  or else
				(a_value = get__mask_low_level)  or else
				(a_value = set__mask_low_level) )
		end

feature -- Setters
	default_create,
	set_append is
		do
			value := append_low_level
		end

	set_is__readable is
		do
			value := is__readable_low_level
		end

	set_is__writeable is
		do
			value := is__writeable_low_level
		end

	set_is__seekable is
		do
			value := is__seekable_low_level
		end

	set_mask is
		do
			value := mask_low_level
		end

	set_get__mask is
		do
			value := get__mask_low_level
		end

	set_set__mask is
		do
			value := set__mask_low_level
		end

feature -- Queries
	is_append: BOOLEAN is
		do
			Result := (value=append_low_level)
		end

	is_is__readable: BOOLEAN is
		do
			Result := (value=is__readable_low_level)
		end

	is_is__writeable: BOOLEAN is
		do
			Result := (value=is__writeable_low_level)
		end

	is_is__seekable: BOOLEAN is
		do
			Result := (value=is__seekable_low_level)
		end

	is_mask: BOOLEAN is
		do
			Result := (value=mask_low_level)
		end

	is_get__mask: BOOLEAN is
		do
			Result := (value=get__mask_low_level)
		end

	is_set__mask: BOOLEAN is
		do
			Result := (value=set__mask_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	append_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_FLAG_APPEND"
 			}"
 		end

	is__readable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_FLAG_IS_READABLE"
 			}"
 		end

	is__writeable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_FLAG_IS_WRITEABLE"
 			}"
 		end

	is__seekable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_FLAG_IS_SEEKABLE"
 			}"
 		end

	mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_FLAG_MASK"
 			}"
 		end

	get__mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_FLAG_GET_MASK"
 			}"
 		end

	set__mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_FLAG_SET_MASK"
 			}"
 		end


end -- class GIOFLAGS_ENUM
