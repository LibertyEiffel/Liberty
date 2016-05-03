class LLVM_GLOBAL_VARIABLE
inherit LLVM_GLOBAL_VALUE 
create {WRAPPER, WRAPPER_HANDLER} from_external_pointer
feature {ANY} -- Queries
	initializer: LLVM_VALUE is
		do
			create Result.from_external_pointer(llvmget_initializer(handle))
		ensure non_void: Result/=Void
		end

	is_thread_local: BOOLEAN is
		do
			Result:=llvmis_thread_local(handle).to_boolean
		end

	is_global_constant: BOOLEAN is
		do
			Result:=llvmis_global_constant(handle).to_boolean
		end

feature {ANY} -- Commands
	set_initializer (a_constant_value: LLVM_VALUE) is
	require a_constant_value/=Void
	do
		llvmset_initializer(handle,a_constant_value.handle)
	ensure set: initializer.is_equal(a_constant_value)
	end

	set_thread_local (a_setting: BOOLEAN) is
	do
		llvmset_thread_local(handle,a_setting.to_integer)
	ensure set: is_thread_local=a_setting
	end

	set_global_constant (a_setting: BOOLEAN) is
	do
		llvmset_global_constant(handle,a_setting.to_integer)
	ensure set: is_global_constant=a_setting
	end

-- TODO: provide deletiong feature delete is do	Precursor llvmdelete_global(handle)	end

end -- class LLVM_GLOBAL_VARIABLE

-- Copyright 2010 Paolo Redaelli

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

