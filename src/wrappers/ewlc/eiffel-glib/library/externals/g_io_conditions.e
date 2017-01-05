note
	description: "Enum "
	copyright: "[
					Copyright (C) 2007-2017: Soluciones Informaticas Libres S.A. (Except)
					
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

deferred class G_IO_CONDITIONS

inherit ANY undefine is_equal, copy end

feature {}

	is_valid_g_io_condition (condition: INTEGER): BOOLEAN
		do
			Result := g_io_in <= condition and condition <= g_io_nval
		end

	g_io_in: INTEGER
			-- There is data to be read
		external "C macro use <glib.h>"
		alias "G_IO_IN"
		end

	g_io_out: INTEGER
			-- Data can be written (without blocking)
		external "C macro use <glib.h>"
		alias "G_IO_OUT"
		end

	g_io_pri: INTEGER
			-- There is urgent data to read
		external "C macro use <glib.h>"
		alias "G_IO_PRI"
		end

	g_io_err: INTEGER
			-- Error condition
		external "C macro use <glib.h>"
		alias "G_IO_ERR"
		end

	g_io_hup: INTEGER
			-- Hung up (the connection has been broken, usually for pipes and sockets).
		external "C macro use <glib.h>"
		alias "G_IO_HUP"
		end

	g_io_nval: INTEGER
			-- Invalid request. The file descriptor is not open.
		external "C macro use <glib.h>"
		alias "G_IO_NVAL"
		end

end -- class G_IO_CONDITIONS
