class LLVM_MODULE_PROVIDER
	-- An helper class providing a module to JIT or interpreter.

inherit 
	C_STRUCT
	EIFFEL_OWNED
		redefine 
			dispose
		end

insert CORE_EXTERNALS

create {ANY} from_module
create {WRAPPER} from_external_pointer
feature {ANY}
	module: LLVM_MODULE 
	-- The module owned by Current provider
feature {} -- Creation
	from_module (a_module: LLVM_MODULE) is
		-- Encapsulates `a_module' in a new module provider, taking ownership of the module.
	require 
		a_module/=Void
		not a_module.is_owned
	do
		module:=a_module
		module.set_owner(Current)
		from_external_pointer(llvmcreate_module_provider_for_existing_module(a_module.handle))
	ensure
		a_module.is_owned
		a_module.owner = Current
		module = a_module
	end

feature {} -- Disposing
	dispose is
		-- Destroys the module provider MP as well as the contained module. See the destructor llvm::ModuleProvider::~ModuleProvider.

		--
	do
		llvmdispose_module_provider(handle)
	end
feature {ANY} 
	struct_size: like size_t is
		do
			not_yet_implemented
		end
end -- class LLVM_MODULE_PROVIDER

-- Copyright (C) 2010 Paolo Redaelli

-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
 
-- This library is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
 
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
