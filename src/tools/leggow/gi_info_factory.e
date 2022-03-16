deferred class GI_INFO_FACTORY
	-- A factory for GI_BASE_INFO objects: given a POINTER to an actual heir of
	-- GIBaseInfo creates the correct eiffel_wrapper.

	-- The wrapper assume ownership of the pointer
inherit WRAPPER_FACTORY [GI_BASE_INFO]

insert GIBASEINFO_EXTERNALS undefine default_create end

feature {WRAPPER, WRAPPER_HANDLER}
	wrapper (a_pointer: POINTER): GI_BASE_INFO is
		local type: GIINFO_TYPE_ENUM
		do
			type.set(g_base_info_get_type(a_pointer))
            -- std_error.put_line("Got #(1)" # & type)
			if     type.is_arg then create {GI_ARG_INFO} Result.from_external_pointer(a_pointer)
			elseif type.is_boxed then not_yet_implemented
			elseif type.is_callback then create {GI_FUNCTION_INFO} Result.from_external_pointer(a_pointer)
			elseif type.is_constant then create {GI_CONSTANT_INFO} Result.from_external_pointer(a_pointer)
			elseif type.is_enum then create {GI_ENUM_INFO} Result.from_external_pointer(a_pointer)
			elseif type.is_field then create {GI_FIELD_INFO} Result.from_external_pointer(a_pointer)
			elseif type.is_flags then create {GI_ENUM_INFO} Result.from_external_pointer(a_pointer)
			elseif type.is_function then create {GI_FUNCTION_INFO} Result.from_external_pointer(a_pointer)
			elseif type.is_interface then create {GI_INTERFACE_INFO} Result.from_external_pointer(a_pointer)
			elseif type.is_invalid then not_yet_implemented
			elseif type.is_invalid_0 then not_yet_implemented
			elseif type.is_object then create {GI_OBJECT_INFO} Result.from_external_pointer(a_pointer)
			elseif type.is_property then create {GI_PROPERTY_INFO} Result.from_external_pointer(a_pointer)
			elseif type.is_signal then create {GI_SIGNAL_INFO} Result.from_external_pointer(a_pointer)
			elseif type.is_struct then create {GI_STRUCT_INFO} Result.from_external_pointer(a_pointer)
			elseif type.is_type then not_yet_implemented
			elseif type.is_union then create {GI_UNION_INFO} Result.from_external_pointer(a_pointer)
			elseif type.is_unresolved then not_yet_implemented
			elseif type.is_value then not_yet_implemented --create {GI_VALUE_INFO} Result.from_external_pointer(a_pointer)
			elseif type.is_vfunc then create {GI_VFUNC_INFO} Result.from_external_pointer(a_pointer)
			else not_yet_implemented
			end
            debug
                std_error.put_line("Got #(1)" # &Result)
            end
	end

end -- class GI_INFO_FACTORY

-- Copyright (C) 2013-2022: Paolo Redaelli <paolo.redaelli@gmail.com>
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
	
