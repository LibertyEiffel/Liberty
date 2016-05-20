note
	description: "enum cairo_hint_metrics_t"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team,
					Soluciones Informaticas Libres S.A. (Except),
					Cairo team
					
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
	date: "$Date:$"
	revision: "$Revision:$"
	wrapped_version: "1.2.4"

deferred class CAIRO_HINT_METRICS
	-- Specifies whether to hint font metrics; hinting font metrics
	-- means quantizing them so that they are integer values in device
	-- space. Doing this improves the consistency of letter and line
	-- spacing, however it also means that text will be laid out
	-- differently at different zoom factors.

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_hint_metrics (a_metrics: INTEGER): BOOLEAN is
		do
			Result := ((a_metrics = cairo_hint_metrics_default) or else
						(a_metrics = cairo_hint_metrics_off) or else
						(a_metrics = cairo_hint_metrics_on))
		end

	cairo_hint_metrics_default: INTEGER is
			-- Hint metrics in the default manner for the font backend
			-- and target device
		external "C macro use <cairo.h>"
		alias "CAIRO_HINT_METRICS_DEFAULT"
		end

	cairo_hint_metrics_off: INTEGER is
			-- Do not hint font metrics
		external "C macro use <cairo.h>"
		alias "CAIRO_HINT_METRICS_OFF"
		end

	cairo_hint_metrics_on: INTEGER is
			-- Hint font metrics
		external "C macro use <cairo.h>"
		alias "CAIRO_HINT_METRICS_ON"
		end

end
