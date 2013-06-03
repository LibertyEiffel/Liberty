class GI_CONSTANT_INFO
	-- A GObject Introspection metadata structure  representing a constant having an associated `type' and a `value'
   
inherit 
	GI_BASE_INFO

insert 	
	GICONSTANTINFO_EXTERNALS
	
creation from_external_pointer

feature 
	constant_type: GI_TYPE_INFO is
		-- The type of the constant
	do
		create Result.from_external_pointer(g_constant_info_get_type(handle))
		-- full onwership transferred to the client
	end

	-- TODO:  value: should be GI_ARGUMENT but GIArgument is not documented

	-- gint                g_constant_info_get_value           (GIConstantInfo *info,
	--                                                          GIArgument *value);
	--
	--   Obtain the value associated with the GIConstantInfo and store it in the value parameter. argument needs to be allocated
	--   before passing it in. The size of the constant value stored in argument will be returned. Free the value with
	--   g_constant_info_free_value().
	--
	--   info :    a GIConstantInfo
	--   value :   an argument. [out]
	--   Returns : size of the constant

end -- class GI_CONSTANT_INFO

