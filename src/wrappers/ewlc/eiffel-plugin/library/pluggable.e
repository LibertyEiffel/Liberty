note
	copyright: "[
					Copyright (C) 2008 Paolo Redaelli
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class PLUGGABLE
	-- 

feature {ANY} 
	initialize (a_plugin_name: STRING)
		-- Tries to load the `a_plugin_name'
		require a_plugin_name/=Void
		-- local ptr: POINTER
		do
			handle := dlopen(a_plugin_name.to_external,rtld_now|rtld_global)
		end
	
	is_initialized: BOOLEAN
		-- Has pluggable correctly loaded the plugin?
	do
		Result := handle.is_not_null
	end

	symbol (a_symbol_name: STRING)
		-- Tries to find the symbol named a_symbol_name. It it exists it
		-- invokes it as a function using Current.
	require 
		a_symbol_name/=Void
		is_initialized
	local sym: POINTER
	do
		sym:=dlsym(handle,a_symbol_name.to_external)
		if sym.is_not_null then
			invoke(Current.to_pointer,sym)
		end
	end


feature {} -- External features
	invoke (a_current, a_pointer: POINTER)
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-plugin"
			feature_name: "invoke"
			}"
		end


	dlopen(a_filename: POINTER; some_flag: INTEGER): POINTER
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-plugin"
			feature_name: "dlopen"
			}"
		end

	dlerror: POINTER
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-plugin"
			feature_name: "dlerror"
			}"
		end

	dlsym(an_handle, a_symbol: POINTER): POINTER
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-plugin"
			feature_name: "dlsym"
			}"
		end

	dlclose(an_handle: POINTER): INTEGER
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-plugin"
			feature_name: "dlclose"
			}"
		end


	rtld_now: INTEGER
	external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-plugin"
			feature_name: "RTLD_NOW"
			}"
		end

      
	rtld_global: INTEGER
    	external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-plugin"
			feature_name: "RTLD_GLOBAL"
			}"
		end

feature {}
	handle: POINTER

end -- class PLUGGABLE
