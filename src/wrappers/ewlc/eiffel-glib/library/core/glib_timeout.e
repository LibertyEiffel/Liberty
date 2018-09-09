note
	description: "[
					Base class for having timed periodical events called from
					the main loop
			"]
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli, eiffel-gtk team
					
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

deferred class GLIB_TIMEOUT

inherit ANY undefine is_equal, copy end



feature {ANY} -- Access

	enabled: BOOLEAN
			-- Periodical events are being called

feature {ANY} -- Operations

	enable (interval: INTEGER_32)
			-- Start periodic event call every `interval' ms
		require
			not enabled
		do
			event_id := g_timeout_add (interval, $callback, to_pointer)
			enabled := True
		ensure
			enabled
		end

	disable
			-- Stop periodic event call
		require
			enabled
		do
			enabled := False
		ensure
			not enabled
		end

	tick
			-- Called every interval. Call `disable' from here to be the last
			-- tick.
		deferred
		end

feature {} -- Internal

	event_id: INTEGER_32

	callback: INTEGER_32
		do
			tick
			Result := enabled.to_integer
		end

feature {} -- Externals

	g_timeout_add (interval: INTEGER_32; function, data: POINTER): INTEGER_32
			-- Sets a `function' to be called at regular intervals, with the
			-- default priority, G_PRIORITY_DEFAULT. The function is called
			-- repeatedly until it returns FALSE, at which point the timeout
			-- is automatically destroyed and the function will not be
			-- called again. The first call to the function will be at the
			-- end of the first interval.
		require
			interval >= 0
			function.is_not_null
			data.is_not_null
		external "C use <gtk/gtk.h>"
		end

-- GSource*    g_timeout_source_new            (guint interval);
-- guint       g_timeout_add_full              (gint priority,
--                                              guint interval,
--                                              GSourceFunc function,
--                                              gpointer data,
--                                              GDestroyNotify notify);

-- g_timeout_source_new ()

-- GSource*    g_timeout_source_new            (guint interval);

-- Creates a new timeout source.

-- The source will not initially be associated with any GMainContext and must be added to one with g_source_attach() before it will be executed.

-- interval : 	the timeout interval in milliseconds.
-- Returns : 	the newly-created timeout source
-- g_timeout_add_full ()

-- guint       g_timeout_add_full              (gint priority,
--                                              guint interval,
--                                              GSourceFunc function,
--                                              gpointer data,
--                                              GDestroyNotify notify);

-- Sets a function to be called at regular intervals, with the given priority. The function is called repeatedly until it returns FALSE, at which point the timeout is automatically destroyed and the function will not be called again. The notify function is called when the timeout is destroyed. The first call to the function will be at the end of the first interval.

-- Note that timeout functions may be delayed, due to the processing of other event sources. Thus they should not be relied on for precise timing. After each call to the timeout function, the time of the next timeout is recalculated based on the current time and the given interval (it does not try to 'catch up' time lost in delays).

-- priority : 	the priority of the idle source. Typically this will be in the range between G_PRIORITY_DEFAULT_IDLE and G_PRIORITY_HIGH_IDLE.
-- interval : 	the time between calls to the function, in milliseconds (1/1000ths of a second)
-- function : 	function to call
-- data : 	data to pass to function
-- notify : 	function to call when the idle is removed, or NULL
-- Returns : 	the id of event source.
end
