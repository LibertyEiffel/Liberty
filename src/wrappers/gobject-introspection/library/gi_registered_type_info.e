deferred class GI_REGISTERED_TYPE_INFO
   -- A GOBject introspection metadata representing a struct with a GType
   
   -- GIRegisteredTypeInfo represents an entity with a GType associated. Could
   -- be either a GIEnumInfo, GIInterfaceInfo, GIObjectInfo, GIStructInfo or a
   -- GIUnionInfo.

   -- A registered type info struct has a name and a type function. To get the
   -- name call g_registered_type_info_get_type_name(). Most users want to call
   -- g_registered_type_info_get_g_type() and don't worry about the rest of the
   -- details.

inherit GI_BASE_INFO

insert GIREGISTEREDTYPEINFO_EXTERNALS

feature {ANY}
	type_name: FIXED_STRING is
		-- the type name of the struct within the GObject type system. TODO: provide Eiffel version of "This type can be passed to g_type_name() to get a GType."
		do
			create Result.from_external(g_registered_type_info_get_type_name(handle))
		ensure not_void: Result/=Void
		end

	type_init: FIXED_STRING is
		-- the symbol name of the type init function, suitable for passing into
		-- g_module_symbol(). The type init function is the function which will
		-- register the GType within the GObject type system. Usually this is
		-- not called by langauge bindings or applications, use
		-- g_registered_type_info_get_g_type() directly instead.
	do
		create Result.from_external(g_registered_type_info_get_type_init(handle))
	ensure not_void: Result/=Void
	end


	-- TODO: wrap  g_registered_type_info_get_g_type ()
	-- 
	--  GType               g_registered_type_info_get_g_type   (GIRegisteredTypeInfo *info);
	-- 
	--    Obtain the GType for this registered type or G_TYPE_NONE which a special meaning. It means that either there is no type
	--    information associated with this info or that the shared library which provides the type_init function for this info
	--    cannot be called.
	-- 
	--    info :    a GIRegisteredTypeInfo
	--    Returns : the GType.

end -- class GI_REGISTERED_TYPE_INFO
