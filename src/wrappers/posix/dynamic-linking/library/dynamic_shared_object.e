class DYNAMIC_SHARED_OBJECT
	-- A dynamic shared object loaded with the support of the operative system,
	-- also known as .so libraries or as DLL.

	-- Insert DYNAMIC_LINKING_LOADER and use `new_dynamic_shared_object' or
	-- `main_program' to get an instance of this class.

	-- Currently available only on POSIX systems where it wraps dlopen

inherit 
	WRAPPER

insert
	DL_FLAGS
	DLFCN_EXTERNALS

create {DYNAMIC_LINKING_LOADER} from_external_pointer

feature {ANY} -- Command
	set_flags (some_flags: INTEGER)
		-- Change the flags 
	require are_valid_dlflags(some_flags)
	local h,ptr: POINTER
	do
		-- Using dlopen with rtld_noload to promote the flags on a library that
		-- is already loaded.  For example, a library that was previously
		-- loaded with RTLD_LOCAL can be re-opened with RTLD_NOLOAD |
		-- RTLD_GLOBAL.  This flag is not specified in POSIX.1-2001.
		if name/=Void then h:=name.to_external end
		ptr:=dlopen(h,some_flags)
		check
			handle=ptr
		end
	end

feature {DYNAMIC_LINKING_LOADER, DL_LOADER}
	set_name (a_name: ABSTRACT_STRING)
		do
			name:=a_name
		end

feature {ANY} -- Symbol query
	name: ABSTRACT_STRING
		-- The filename where Current have been loaded from. Void when Current refers to the main program
		attribute
	end

	symbol (a_symbol: ABSTRACT_STRING): POINTER
		-- The address where `a_symbol' - belonging to Current - is loaded into
		-- memory.  If it is not found, either in Current or in its dependecies
		-- Result will be default_pointer. The search performed is breadth
		-- first through the dependency tree of these libraries. Since the
		-- value of the symbol could actually be default_pointer (defined as
		-- NULL in C) the  correct  way  to test for an error is to assign
		-- `error' to a local string, invoke `symbol' and assign `error' again
		-- checking for the last value.

		-- foo (a_dll: DYNAMIC_SHARED_OBJECT) is 
		-- require a_dll/=Void
		-- local precall_status, post_status: STRING; my_symbol: POINTER
		-- do
		--   precall_status := a_dll.error
		--   my_symbol := a_dll.symbol("foo")
		--   post_status := a_dll.error
		--   if post_status/=Void then -- everything ok
		--   else -- error resolving "foo"
		-- end
		
		-- Do not write "if a_dll.symbol("foo").is_not_null", defaull_pointer may be the actual value of "foo"

		-- Do not write "my_symbol:=a_dll.symbol("foo") if a_dll.error/=Void
		-- then print(a_dll.error)", because error is resetted every time it
		-- invoked; the print command will ALWAYS fails because its argument
		-- will be NULL.

		 -- There are two special pseudo-handles, "RTLD_DEFAULT" and
		 -- "RTLD_NEXT". The former will find the first occurrence of the
		 -- desired symbol using the default library search order. The latter
		 -- will find the next occurrence of a function in  the search order
		 -- after the current library. This allows one to provide a wrapper
		 -- around a function in another shared library.

		do
			Result:=dlsym(handle,a_symbol.to_external)
		end

feature {ANY} -- Error handling
	error: FIXED_STRING
		--  A human  readable description of the most recent error that
		--  occurred during DYNAMIC_SHARED_OBJECT lifetime - creation, symbol
		--  query and disposing. Void when no error occurred. A new string is allocated at every query
	local ptr: POINTER
	do	
		ptr :=dlerror
		if ptr.is_not_null then
			create Result.from_external_copy(ptr)
		end
	end

feature {ANY} -- Disposing
	dispose
		-- Invokes dlclose; it decrements the reference count on the dynamic library  handle  handle.   If  the  reference
		-- count drops to zero and no other loaded libraries use symbols in it, then the dynamic library is unloaded.
	local r: INTEGER
	do
		r:=dlclose(handle)
		-- TODO: handle dlclose results: 0 on success, and non-zero on error.
	end
		
feature {} -- Unwrapped
	-- TODO: provide access to Glibc dladdr() and dlvsym() extensions functions
end -- class DYNAMIC_SHARED_OBJECT

-- Liberty Eiffel wrappers for GNU C library Copyright (C) 2013-2018: Paolo Redaelli, Free Software Foundation
-- 
-- The GNU C Library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 2.1 of the License, or (at your option) any later version.
-- 
-- The GNU C Library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with the GNU C Library; if not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
-- 02110-1301 USA

