deferred class LLVM_GLOBAL_VALUE
-- Global values (GlobalVariables or Functions) are the only LLVM
-- values that are visible in the bodies of all Functions.
-- Because they are visible at global scope, they are also
-- subject to linking with other globals defined in different
-- translation units. To control the linking process,
-- GlobalValues know their linkage rules. Specifically,
-- GlobalValues know whether they have internal or external
-- linkage, as defined by the LinkageTypes enumeration.

-- If a GlobalValue has internal linkage (equivalent to being
-- static in C), it is not visible to code outside the current
-- translation unit, and does not participate in linking. If it
-- has external linkage, it is visible to external code, and does
-- participate in linking. In addition to linkage information,
-- GlobalValues keep track of which Module they are currently
-- part of.

-- Because GlobalValues are memory objects, they are always
-- referred to by their address. As such, the Type of a global is
-- always a pointer to its contents. It is important to remember
-- this when using the GetElementPtrInst instruction because this
-- pointer must be dereferenced first. For example, if you have a
-- GlobalVariable (a subclass of GlobalValue) that is an array of
-- 24 ints, type [24 x i32], then the GlobalVariable is a pointer
-- to that array. Although the address of the first element of
-- this array and the value of the GlobalVariable are the same,
-- they have different types. The GlobalVariable's type is [24 x
-- i32]. The first element's type is i32. Because of this,
-- accessing a global value requires you to dereference the
-- pointer with GetElementPtrInst first, then its elements can be
-- accessed. This is explained in the LLVM Language Reference
-- Manual.

inherit LLVM_CONSTANT
feature {ANY} -- Queries
   parent: LLVM_MODULE
      do
create Result.from_external_pointer(llvmget_global_parent(handle))
      ensure Result/=Void
      end

   is_declaration: BOOLEAN
      do
         Result:=llvmis_declaration(handle).to_boolean
      end

   section: FIXED_STRING
         -- TODO: should be created with from_external
      do
create Result.from_external_copy(llvmget_section(handle))
      ensure Result/=Void
      end


   visibility: LLVMVISIBILITY_ENUM
      do
         Result.change_value(llvmget_visibility(handle))
      end


   alignment: NATURAL_32
      do
         Result:=llvmget_alignment(handle)
      end

   linkage: LLVMLINKAGE_ENUM
      do
         Result.change_value
         (llvmget_linkage(handle))
      end

feature {ANY} -- Commands
   set_section (a_section: ABSTRACT_STRING)
         --
      require
         non_void: a_section/=Void
         non_empty: not a_section.is_empty
      do
         llvmset_section(handle,a_section.to_external)
      ensure set: a_section.is_equal(section)
      end

   set_visibility (a_visibility: LLVMVISIBILITY_ENUM)
      do
         llvmset_visibility(handle,a_visibility.value)
      ensure set: visibility=a_visibility
      end

   set_alignment (a_number_of_bytes: NATURAL_32)
      do
         llvmset_alignment(handle, a_number_of_bytes)
      end

feature {ANY} -- Linkage commands
   set_linkage (a_value: LLVMLINKAGE_ENUM)
         --
      do
         llvmset_linkage(handle,a_value.value)
      ensure set: linkage=a_value
      end

   set_external_linkage
      local l: like linkage
      do
         llvmset_linkage(handle,l.external_linkage_low_level)
      end

   set_link_once_any_linkage
      local l: like linkage
      do
         llvmset_linkage(handle,l.link_once_any_linkage_low_level)
      end

   set_link_once_odrlinkage
      local l: like linkage
      do
         llvmset_linkage(handle,l.link_once_odrlinkage_low_level)
      end

   set_weak_any_linkage
      local l: like linkage
      do
         llvmset_linkage(handle,l.weak_any_linkage_low_level)
      end

   set_weak_odrlinkage
      local l: like linkage
      do
         llvmset_linkage(handle,l.weak_odrlinkage_low_level)
      end

   set_appending_linkage
      local l: like linkage
      do
         llvmset_linkage(handle,l.appending_linkage_low_level)
      end

   set_internal_linkage
      local l: like linkage
      do
         llvmset_linkage(handle,l.internal_linkage_low_level)
      end

   set_private_linkage
      local l: like linkage
      do
         llvmset_linkage(handle,l.private_linkage_low_level)
      end

   set_dllimport_linkage
      local l: like linkage
      do
         llvmset_linkage(handle,l.dllimport_linkage_low_level)
      end

   set_dllexport_linkage
      local l: like linkage
      do
         llvmset_linkage(handle,l.dllexport_linkage_low_level)
      end

   set_external_weak_linkage
      local l: like linkage
      do
         llvmset_linkage(handle,l.external_weak_linkage_low_level)
      end

   set_ghost_linkage
      local l: like linkage
      do
         llvmset_linkage(handle,l.ghost_linkage_low_level)
      end

   set_common_linkage
      local l: like linkage
      do
         llvmset_linkage(handle,l.common_linkage_low_level)
      end

   set_linker_private_linkage
      local l: like linkage
      do
         llvmset_linkage(handle,l.linker_private_linkage_low_level)
      end

end -- class LLVM_GLOBAL_VALUE

-- Copyright 2009 Paolo Redaelli

-- This file is part of LLVM wrappers for Liberty Eiffel.
--
-- This library is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
