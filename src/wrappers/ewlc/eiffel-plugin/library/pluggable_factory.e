note
	description: "."
	copyright: "[
					Copyright (C) 2008-2018: Paolo Redaelli
					
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

deferred class PLUGGABLE_FACTORY [ITEM->PLUGGABLE]

inherit FACTORY[ITEM] 

feature {ANY} -- Creation
	get_new_pluggable (a_plugin_name: STRING): ITEM
		require a_plugin_name/=Void
		local ptr: POINTER
		do
			ptr := dlopen(a_plugin_name.to_external,rtld_now|rtld_global)
			if ptr.is_not_null then
				Result := new
				Result.set_handle(ptr)
			end
		end

feature {} -- External features
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

	dlsym(an_handle, a_symbol: POINTRE): POINTER
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
	end -- class PLUGGER

