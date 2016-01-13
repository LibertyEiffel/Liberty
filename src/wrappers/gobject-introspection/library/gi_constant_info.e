class GI_CONSTANT_INFO
   -- A GObject Introspection metadata structure  representing a constant having an associated `type' and a `value'

inherit
   GI_BASE_INFO
   OPAQUE_TYPE

insert
   GICONSTANTINFO_EXTERNALS

create {GI_INFO_FACTORY, WRAPPER}
   from_external_pointer

feature {ANY}
   constant_type: GI_TYPE_INFO
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
	
