deferred class DYNAMIC_LINKING_LOADER
	-- Access to the dynamic linking loader provided by the operative system.

	-- When you inserts this class your namespace gets "polluted" with all the
	-- low-level C symbols of its implementation. If you want to avoid this
	-- "clutter" you may use its expanded version, DL_LOADER.
insert 
	DL_FLAGS
	DLFCN_EXTERNALS

feature {ANY} -- Queries
	alreadey_loaded (a_library: ABSTRACT_STRING): BOOLEAN
		-- Has `a_library' already been loaded?

		-- Note: this features require Glibc and is not POSIX
	do
		-- using dlopen with rtld_noload flag: we don't load the library. if
		-- dlopen returns NULL if the library is not already loaded/resident or
		-- the library's handle if it is resident.
		Result:= dlopen(a_library.to_external,rtld_now|rtld_noload).is_not_null
	end

	main_program: DYNAMIC_SHARED_OBJECT
		-- The main program accessible as a dynamic shared object.

		-- Symbols will be searched in the main program, followed by all shared
		-- libraries loaded at program startup, and then all shared libraries
		-- loaded by with the flag RTLD_GLOBAL.
	once
		create Result.from_external_pointer(dlopen(default_pointer, rtld_now))
	end

	new_dynamic_shared_object (a_filename: ABSTRACT_STRING; some_flags: INTEGER): DYNAMIC_SHARED_OBJECT
		-- A newly allocated dynamic shared object (also known as "library")
		-- located at `a_filename'. If `a_filename' contains a slash ("/"),
		-- then it is interpreted as a (relative or absolute) pathname.
		-- Otherwise, the dynamic linker searches for the library as detailed
		-- in ld.so(8) manpage. 

		-- If the library has dependencies on other shared libraries, then
		-- these are also automatically loaded by the dynamic linker using the
		-- same rules. This process may occur recursively, if those libraries
		-- in turn  have  dependencies, and so on.
	
		-- `some_flags' must contain one of the following two values:

		-- rtld_lazy: Perform lazy binding.  Only resolve symbols as the code
		-- that references them is executed.  If the symbol is never
		-- referenced, then it is never resolved.  (Lazy binding is only
		-- performed for function references; references to variables are
		-- always immediately bound when the library is loaded.)
	
		-- rtld_now: all undefined symbols are immediatly resolved; if this
		-- cannot be done Current will be invalid. This behaviour is forced
		-- when the environment variable LD_BIND_NOW is set to a non-empty
		-- string.

		-- Zero of more of the following values may also be (logically) ORed in `some_flags':
	
		-- rtld_global: The  symbols  defined  by  this library will be made
		-- available for symbol resolution of subsequently loaded libraries.

		-- rtld_local: This is the converse of rtld_global, and the default if
		-- neither flag is specified.  Symbols defined in this library are not
		-- made available to resolve references in subsequently loaded
		-- libraries.
 
		-- rtld_nodelete: (since glibc 2.2) Do no  unloa  the library when
		-- Current is disposed.  Consequently, the library's static variables
		-- are not reinitialized if the library is reloaded with
		-- `new_dynamic_shared_object'. This flag is not specified in
		-- POSIX.1-2001.

		-- rtld_deepbind: (since glibc 2.3.4) Place the lookup scope of the
		-- symbols in this library ahead of the global scope. This means that a
		-- self-contained library will use its own symbols in preference to
		-- global symbols with the same name contained in libraries that have
		-- already been loaded. This flag is not specified in POSIX.1-2001.
		
		-- External references in the library are resolved using the libraries in that  library's  dependency  list  and  any
		-- other  libraries  previously  opened with the RTLD_GLOBAL flag.  If the executable was linked with the flag "-rdynamic" (or, synonymously, "--export-dynamic"), then the global symbols in the executable  will  also  be  used  to
		-- resolve references in a dynamically loaded library.
		 
		-- If  the  same  library  is loaded again with dlopen(), the same file handle is returned.  The dl library maintains
		-- reference counts for library handles, so a dynamic library is not deallocated until dlclose() has been  called  on
		-- it  as  many  times as dlopen() has succeeded on it.  The _init() routine, if present, is only called once.  But a
		-- subsequent call with RTLD_NOW may force symbol resolution for a library earlier loaded with RTLD_LAZY.

		-- Result will be Void in case of failure.

		require
			a_filename/=Void
			are_valid_dlflags(some_flags)
		local p: POINTER
		do
			p:=dlopen(a_filename.to_external,some_flags)
			if p.is_not_null then
				create Result.from_external_pointer(p)
				Result.set_name(a_filename)
			end
		end

		
-- NOTES
--        The symbols RTLD_DEFAULT and RTLD_NEXT are defined by <dlfcn.h> only when _GNU_SOURCE was defined before including
--        it.
-- 
--        Since  glibc  2.2.3, atexit(3) can be used to register an exit handler that is automatically called when a library
--        is unloaded.
-- 
--    History
--        The dlopen interface standard comes from SunOS.  That system also has dladdr(), but not dlvsym().
-- 
-- BUGS
--        Sometimes, the function pointers you pass to dladdr() may surprise you.  On some architectures (notably  i386  and
--        x86_64),  dli_fname  and  dli_fbase may end up pointing back at the object from which you called dladdr(), even if
--        the function used as an argument should come from a dynamically linked library.
-- 
--        The problem is that the function pointer will still be resolved at compile time, but merely point to the plt (Pro‐
--        cedure Linkage Table) section of the original object (which dispatches the call after asking the dynamic linker to
--        resolve the symbol).  To work around this, you can try to compile the code to be position-independent:  then,  the
--        compiler  cannot prepare the pointer at compile time anymore and today's gcc(1) will generate code that just loads
--        the final symbol address from the got (Global Offset Table) at run time before passing it to dladdr().
-- 
end -- class DYNAMIC_LINKING_LOADER
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

