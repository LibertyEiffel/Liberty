class G_IO_FUNC

inherit
	C_STRUCT
	EIFFEL_OWNED
	
create {ANY}
	make

feature {} -- Creation

	make (ch: G_IO_CHANNEL; a: like action) is
		do
			channel := ch
			action := a
			allocate
			g_io_func_closure_init (handle, to_pointer, $call)
		end

feature {ANY} -- Access

	function: POINTER is
		external "C macro use <glib-callbacks.h>"
		alias "g_io_func_closure_invoke"
		end

	data: POINTER is
		do
			Result := handle
		end

feature {} -- Internal

	channel: G_IO_CHANNEL

	action: FUNCTION [TUPLE [G_IO_CHANNEL, INTEGER], BOOLEAN]

	call (ch: POINTER; condition: INTEGER): BOOLEAN is
		do
			-- We ignore the passed channel, it should be `channel'
				check channel.handle = ch end
			Result := action.item ([channel, condition])
		end

feature {} -- Externals

	struct_size: INTEGER is
		external "C macro use <glib-callbacks.h>"
		alias "(sizeof (struct GIOFuncClosure))"
		end

	g_io_func_closure_init (h, self, func: POINTER) is
		external "C use <glib-callbacks.h>"
		end

end -- class G_IO_FUNC

-- Copyright (C) 2009 Paolo Redaelli, 2013 Cyril Adrian

-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
--
-- This library is distributed in the hopeOA that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
 
