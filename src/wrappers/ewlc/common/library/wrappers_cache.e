note
	description: "."
	copyright: "[
					Copyright (C) 2008-2022: Paolo Redaelli
					
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

deferred class WRAPPERS_CACHE [ITEM->WRAPPER]
obsolete once "use GLOBAL_CACHE instead"
	-- A cache for other wrapper.

inherit
   WRAPPER_HANDLER

insert
   GLOBAL_CACHE
      rename
         wrappers as cache
      end

-- insert ANY undefine copy, is_equal, fill_tagged_out_memory end

end -- class WRAPPERS_CACHE

