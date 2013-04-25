-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class DRAND48_DATA_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	STANDARD_C_LIBRARY_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrappable field __x.
	-- Unwrappable field __old_x.
	-- Unwrappable field __c.
	-- Unwrappable field __init.
	-- Unwrappable field __a.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_drand48_data"
		}"
		end

end -- class DRAND48_DATA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

