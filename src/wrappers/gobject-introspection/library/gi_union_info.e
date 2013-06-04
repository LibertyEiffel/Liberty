class GI_UNION_INFO
	-- A GObject metadata object representing a union.

	-- A union has methods and fields. Unions can optionally have a
	-- discriminator, which is a field deciding what type of real union
	-- fields

inherit 
	GI_REGISTERED_TYPE_INFO
	INDEXABLE[GI_FIELD_INFO]
		rename 
			lower as field_lower
			upper as field_upper
			count as field_count
			is_empty as has_no_fields
			valid_index as valid_field_index
			item as field 
			first as first_field
			last as last_field
			do_all as field_do_all 
			for_all as for_all_fields
			exists as field_exists
			aggregate as aggregate_fields
		undefine 
			copy, 
			field_do_all, 
			field_for_all, 
			field_exists,
			is_equal, 
			out_in_tagged_out_memory 
		redefine field_do_all, for_all_fields, field_exists
		end

	INDEXABLE[GI_FUNCTION_INFO]
		rename 
			lower as method_lower
			upper as method_upper
			count as method_count
			is_empty as has_no_methods
			valid_index as valid_method_index
			item as method 
			first as first_method
			last as last_method
			do_all as method_do_all 
			for_all as for_all_methods
			exists as method_exists
			aggregate as method_aggregate
		undefine copy, is_equal, out_in_tagged_out_memory 
		redefine method_do_all, for_all_methods, method_exists
		end

insert GIUNIONINFO_EXTERNALS
    
creation {GI_INFO_FACTORY, WRAPPER} from_external_pointer

feature {ANY} -- Fields
	field_lower: INTEGER is 0
	field_upper: INTEGER is do Result := field_count-1 end
	field_count: INTEGER is
		-- The number of fields that this object type has.
	do
		Result := g_union_info_get_n_fields(handle)
	ensure not_negative: Result>=0
	end

	field (n: INTEGER): GI_BASE_INFO is 
		-- The field object at index n.
	do
		create Result.from_external_pointer(g_union_info_get_field(handle,n))
		-- g_union_info_get_field returns the GIFieldInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	ensure not_void: Result/=Void
	end

	field_do_all (an_action: ROUTINE[TUPLE[GI_FIELD_INFO]]) is
	do
		lower.loop_up_to(upper, an_action)
	end

	for_all_fields (a_test: FIELD[TUPLE[GI_FIELD_INFO],BOOLEAN]): BOOLEAN is
	do
		not_yet_implemented
	end

	field_exists (test: PREDICATE[TUPLE[GI_FIELD_INFO]]): BOOLEAN is
	do
		not_yet_implemented
	end
	
feature {ANY} -- Methods
	method_lower: INTEGER is 0
	method_upper: INTEGER is do Result := method_count-1 end
	method_count: INTEGER is
		-- The number of methods Current object has
	do
		Result := g_union_info_get_n_methods (handle)
	end

  	method (n: INTEGER): GI_FUNCTION_INFO is
		-- The method object at index `n'
	do
		create Result.from_external_pointer(g_union_info_get_method(handle,n))
   		-- returns  the GIFunctionInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	ensure not_void: Result/=Void
	end

	find_method (a_name: ABSTRACT_STRING): GI_FUNCTION_INFO is
		-- The method with `a_name'. Void if no method exists with that name
	require 
		not_void_name: a_name/=Void
		not_empty_name: not a_name.is_empty
	local p: POINTER
	do
		p := g_union_info_find_method(handle,a_name.to_external) 
		if p.is_not_null then 
			create Result.from_external_pointer(p)
		end 
		-- g_union_info_find_method returns a GIFunctionInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	end

	method_do_all (an_action: ROUTINE[TUPLE[GI_FUNCTION_INFO]]) is
	do
		lower.loop_up_to(upper, an_action)
	end

	for_all_methods (a_test: FUNCTION[TUPLE[GI_FUNCTION_INFO],BOOLEAN]): BOOLEAN is
	do
		not_yet_implemented
	end

	method_exists (test: PREDICATE[TUPLE[GI_FUNCTION_INFO]]): BOOLEAN is
	do
		not_yet_implemented
	end

feature {ANY}
	is_discriminated: BOOLEAN is
		-- Does Current union contain a discriminator field?
	do
		Result:= g_union_info_is_discriminated(handle)
	end 
  
	discriminator_offset: INTEGER is
		-- Offset of the discrimantor 
	require is_discriminated
	do
		Result := g_union_info_get_discriminator_offset(handle)
	end

	discriminator_type: GI_TYPE_INFO is
		-- the type information of the union discriminator.
	require is_discriminated
	do
		create Result.from_external_pointer(g_union_info_get_discriminator_type (handle))
		-- g_union_info_get_discriminator_type returns : the GITypeInfo, free it with g_base_info_unref() when done. [transfer full]
	ensure not_void: Result/=Void
	end

	discriminator (n: INTEGER) : GI_CONSTANT_INFO is
		-- the discriminator value assigned for n-th union field, i.e. n-th
		-- union field is the active one if discriminator contains this
		-- constant.
	do
		create Result.from_external_pointer(g_union_info_get_discriminator(handle,n))
		--g_union_info_get_discriminator returns the GIConstantInfo, free it with g_base_info_unref() when done. [transfer full]
	end

	size: NATURAL is
		-- The total size of the union in bytes
	do
		Result := g_union_info_get_size(handle)
	end 

	alignment: NATURAL is
		-- The required alignment of the union in bytes.
	do
		Result := g_union_info_get_alignment(handle)
	end 
end -- class GI_UNION_INFO
