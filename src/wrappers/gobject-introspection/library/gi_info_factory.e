deferred class GI_INFO_FACTORY
	-- A factory for GI_BASE_INFO objects: given a POINTER to an actual heir of
	-- GIBaseInfo creates the correct wrapper.

	-- The wrapper assume ownership of the pointer
inherit WRAPPER_FACTORY [GI_BASE_INFO]
insert GIBASEINFO_EXTERNALS undefine copy, default_create, is_equal end
feature
	wrapper (a_pointer: POINTER): GI_BASE_INFO is
		local type: GIINFO_TYPE_ENUM
		do
			type.set(g_base_info_get_type(a_pointer))
			if     type.is_gi_info_type_arg then create {GI_ARG_INFO} Result.from_external_pointer(a_pointer)
			elseif type.is_gi_info_type_boxed then not_yet_implemented
			elseif type.is_gi_info_type_callback then not_yet_implemented
			elseif type.is_gi_info_type_constant then not_yet_implemented
			elseif type.is_gi_info_type_enum then not_yet_implemented
			elseif type.is_gi_info_type_field then not_yet_implemented
			elseif type.is_gi_info_type_flags then not_yet_implemented
			elseif type.is_gi_info_type_function then not_yet_implemented
			elseif type.is_gi_info_type_interface then not_yet_implemented
			elseif type.is_gi_info_type_invalid then not_yet_implemented
			elseif type.is_gi_info_type_invalid_0 then not_yet_implemented
			elseif type.is_gi_info_type_object then not_yet_implemented
			elseif type.is_gi_info_type_property then not_yet_implemented
			elseif type.is_gi_info_type_signal then not_yet_implemented
			elseif type.is_gi_info_type_struct then not_yet_implemented
			elseif type.is_gi_info_type_type then not_yet_implemented
			elseif type.is_gi_info_type_union then not_yet_implemented
			elseif type.is_gi_info_type_unresolved then not_yet_implemented
			elseif type.is_gi_info_type_value then not_yet_implemented
			elseif type.is_gi_info_type_vfunc then not_yet_implemented
			end
	end

end -- class GI_INFO_FACTORY
