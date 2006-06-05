indexing
	description: "Callback for `toggled' signal."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team
					
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class TOGGLED_CALLBACK

inherit WRAPPER undefine from_external_pointer end
insert G_SIGNALS

creation make
feature
	make (a_radio_button: GTK_RADIO_BUTTON; a_procedure: PROCEDURE[TUPLE[GTK_RADIO_BUTTON]]) is
		require valid_button: a_radio_button/=Void
		do
			radio_button := a_radio_button
			procedure := a_procedure
			id:=g_signal_connect_swapped(radio_button.handle,(once "toggled").to_external,
												  $hidden_callback, Current.to_pointer)
			print ("TOGGLED_CALLBACK created for "+radio_button.to_pointer.to_string+"%N")
		end

	id: INTEGER
			-- callback id number
	radio_button: GTK_RADIO_BUTTON
			-- object connected to signal callback
	procedure: PROCEDURE[TUPLE[GTK_RADIO_BUTTON]]
feature {NONE} -- Implementation
	hidden_callback is
		do
			procedure.call ([radio_button])
		end

	dispose is
		do
			-- Nothing
		end
end

