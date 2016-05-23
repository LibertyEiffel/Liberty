deferred class DL_FLAGS
	-- Integer flag values used by DYNAMIC_SHARED_OBJECT

feature {ANY} -- Validity
	are_valid_dlflags (a_value: INTEGER): BOOLEAN
		-- Are `a_value' valid flags to be used when creation a DYNAMIC_SHARED_OBJECT? 
		local optionals: INTEGER
		do
			-- Any optional known value is allowed
			optionals := rtld_global|rtld_local| rtld_nodelete |rtld_noload |rtld_deepbind
			Result := (-- Either lazy or now are required 
				(a_value & (rtld_lazy|optionals)).to_boolean or 
				(a_value & (rtld_now |optionals)).to_boolean)
		end

feature {ANY} -- Required flags, either one must be specified
	rtld_lazy: INTEGER
		-- Perform lazy binding.  Only resolve symbols as the code that references them is executed.  If the symbol is never referenced, then it is never resolved.  (Lazy binding is only performed for function references; references to variables are always immediately bound when the library is loaded.)
	external "plug_in"
	alias "{
		location: "."
		module_name: "generated/plugin"
		feature_name: "RTLD_LAZY"
		}"
	end

	rtld_now: INTEGER
		-- If this value is specified, or the environment variable LD_BIND_NOW is set to a non-empty string, all undeined symbols in the library are resolved before dlopen() returns.  If this cannot be  done,  an  error  is returned.
	external "plug_in"
	alias "{
		location: "."
		module_name: "generated/plugin"
		feature_name: "RTLD_NOW"
		}"
	end

feature {ANY} -- Optional flags: zero of more of the following values may also be ORed
	rtld_global: INTEGER
		-- The  symbols  defined  by  this library will be made available for symbol resolution of subsequently loaded libraries.
	external "plug_in"
	alias "{
		location: "."
		module_name: "generated/plugin"
		feature_name: "RTLD_GLOBAL"
		}"
	end

	rtld_local: INTEGER
		-- This is the converse of RTLD_GLOBAL, and the default if neither flag is specified.  Symbols defined in this library are not made available to resolve references in subsequently loaded libraries.
	external "plug_in"
	alias "{
		location: "."
		module_name: "generated/plugin"
		feature_name: "RTLD_LOCAL"
		}"
	end

	rtld_nodelete: INTEGER
		-- (since glibc 2.2) Do  not  unload  the library during dlclose().  Consequently, the library's static variables are not reini‐ tialized if the library is reloaded with dlopen()  at  a  later  time.   This  flag  is  not  specified  in POSIX.1-2001.
	external "plug_in"
	alias "{
		location: "."
		module_name: "generated/plugin"
		feature_name: "RTLD_NODELETE"
		}"
	end

	rtld_noload: INTEGER
		-- (since glibc 2.2) Don't load the library.  This can be used to test if the library is already resident (dlopen() returns NULL if it is not, or the library's handle if it is resident).  This flag can also be used to promote the  flags on a library that is already loaded.  For example, a library that was previously loaded with RTLD_LOCAL can be re-opened with RTLD_NOLOAD | RTLD_GLOBAL.  This flag is not specified in POSIX.1-2001.
	external "plug_in"
	alias "{
		location: "."
		module_name: "generated/plugin"
		feature_name: "RTLD_NOLOAD"
		}"
	end

	rtld_deepbind: INTEGER
		-- (since glibc 2.3.4) Place the lookup scope of the symbols in this library ahead of the global scope.  This means that  a  self- contained  library will use its own symbols in preference to global symbols with the same name contained in libraries that have already been loaded.  This flag is not specified in POSIX.1-2001.
	external "plug_in"
	alias "{
		location: "."
		module_name: "generated/plugin"
		feature_name: "RTLD_DEEPBIND"
		}"
	end
end -- class DL_FLAGS
