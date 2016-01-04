class GI_STRUCT_INFO
        -- GObject metadata representing a C structure

        -- A C structure has methods and fields.

inherit
        GI_REGISTERED_TYPE_INFO
                undefine copy, is_equal
                redefine out_in_tagged_out_memory
                end

        INDEXABLE[GI_FIELD_INFO]
                rename
                        lower as fields_lower,
                        upper as fields_upper,
                        count as fields_count,
                        is_empty as has_no_fields,
                        valid_index as valid_field_index,
                        item as field,
                        first as first_field,
                        last as last_field,
                        for_each as for_each_field,
                        for_all as for_all_fields,
                        exists as exists_field,
                        aggregate as aggregate_fields
                redefine
                        out_in_tagged_out_memory
                end

insert
        GISTRUCTINFO_EXTERNALS
                redefine out_in_tagged_out_memory
                end

create {GI_INFO_FACTORY, WRAPPER} from_external_pointer

feature {ANY} -- Fields
        fields_lower: INTEGER 0
        fields_upper: INTEGER do Result := fields_count-1 end
        fields_count: INTEGER
                -- The number of fields that this object type has.
        do
                Result := g_struct_info_get_n_fields(handle)
        end

        has_no_fields: BOOLEAN
                do
                        Result := fields_count=0
                end

        field (n: INTEGER): GI_FIELD_INFO
                -- The field object at index n.
        do
                create Result.from_external_pointer(g_struct_info_get_field(handle,n))
                -- g_struct_info_get_field returns the GIFieldInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
        ensure not_void: Result/=Void
        end

        first_field: GI_FIELD_INFO do Result:=field(fields_lower) end
        last_field: GI_FIELD_INFO do Result:=field(fields_upper) end


    new_fields_iterator: ITERATOR_OVER_STRUCT_FIELDS
        do
            create Result.from_struct(Current)
        end

feature {ANY} -- Methods
        methods_lower: INTEGER 0
        methods_upper: INTEGER do Result := methods_count-1 end
        methods_count: INTEGER
                -- The number of methods Current object has
        do
                Result := g_struct_info_get_n_methods (handle)
        end

        method (n: INTEGER): GI_FUNCTION_INFO
                -- The method object at index `n'
    require n.in_range(methods_lower,methods_upper)
        do
                create Result.from_external_pointer(g_struct_info_get_method(handle,n))
                -- returns  the GIFunctionInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
        ensure not_void: Result/=Void
        end

        find_method (a_name: ABSTRACT_STRING): GI_FUNCTION_INFO
                -- The method with `a_name'. Void if no method exists with that name
        require
                not_void_name: a_name/=Void
                not_empty_name: not a_name.is_empty
        local p: POINTER
        do
                p := g_struct_info_find_method(handle,a_name.to_external)
                if p.is_not_null then
                        create Result.from_external_pointer(p)
                end
                -- g_struct_info_find_method returns a GIFunctionInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
        end

feature {ANY}
        out_in_tagged_out_memory
        do
                not_yet_implemented
        end

        size: NATURAL
                -- The total size of the structure in bytes
        do
                Result := g_struct_info_get_size(handle)
        end

        alignment: NATURAL
                -- the required alignment of the structure.
        do
                Result := g_struct_info_get_alignment(handle)
        end


        is_gtype_struct: BOOLEAN
                -- Does this structure represent the "class structure" for some GObject
                -- or GInterface? This query is mainly useful to hide this kind of
                -- structure from generated public APIs.
        do
                Result := g_struct_info_is_gtype_struct(handle).to_boolean
        end

        is_foreign: BOOLEAN
                --
        do
                Result := g_struct_info_is_foreign(handle).to_boolean
        end
end -- class GI_STRUCT_INFO

-- Copyright (C) 2013-2016: Paolo Redaelli <paolo.redaelli@gmail.com>
--
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
--
-- This library is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
