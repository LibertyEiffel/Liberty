-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GOBJECT_INTROSPECTION_TYPES


insert ANY undefine is_equal, copy end

	STANDARD_C_LIBRARY_TYPES

feature {ANY} -- C type definitions (typedefs)
	giobject_info_ref_function: POINTER
		-- typedef GIObjectInfoRefFunction
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	giobject_info_unref_function: POINTER
		-- typedef GIObjectInfoUnrefFunction
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	giobject_info_get_value_function: POINTER
		-- typedef GIObjectInfoGetValueFunction
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	giobject_info_set_value_function: POINTER
		-- typedef GIObjectInfoSetValueFunction
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	gifficlosure_callback: POINTER
		-- typedef GIFFIClosureCallback
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

end
