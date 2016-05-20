note
	description: "Receiver of the cancel signal."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

deferred class CANCEL_SIGNAL_RECEIVER

inherit GTK_WIDGET

feature {ANY} -- The "cancel" signal
	cancel_signal_name: STRING is "cancel"	

	connect_agent_to_activate_signal (a_procedure: PROCEDURE [ANY, TUPLE[CANCEL_SIGNAL_RECEIVER]]) is
			-- The "::cancel" signal is emitted when the cancel button is
			-- clicked. The default behavior of the GtkAssistant is to
			-- switch to the page after the current page, unless the
			-- current page is the last one.

			-- A handler for the "::cancel" signal should carry out the
			-- actions for which the wizard has collected data. If the
			-- action takes a long time to complete, you might consider
			-- to put a page of type GTK_ASSISTANT_PAGE_PROGRESS after
			-- the confirmation page and handle this operation within the
			-- ::prepare signal of the progress page.
		require
			valid_procedure: a_procedure /= Void
		local
			cancel_callback: CANCEL_CALLBACK
		do
			create cancel_callback.make
			cancel_callback.connect (Current, a_procedure)
		end

end -- class CANCEL_SIGNAL_RECEIVER
