note
	description: "Receiver of the close signal."
	copyright: "[
					Copyright (C) 2006-2017: Paolo Redaelli
					
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

deferred class CLOSE_SIGNAL_RECEIVER

inherit GTK_WIDGET

feature {ANY} -- The "close" signal
	close_signal_name: STRING is "close"
	
	enable_on_close
			-- Connects "close" signal to `on_close' feature.
		do
			connect (Current, close_signal_name, $on_close)
		end
		
	on_close
			-- Built-in close signal handler; empty by design; redefine it.
		do
		end

	connect_agent_to_activate_signal (a_procedure: PROCEDURE [ANY, TUPLE[CLOSE_SIGNAL_RECEIVER]])
		require
			valid_procedure: a_procedure /= Void
		local close_callback: CLOSE_CALLBACK
		do
			create close_callback.make
			close_callback.connect (Current, a_procedure)
		end

end -- class CLOSE_SIGNAL_RECEIVER
