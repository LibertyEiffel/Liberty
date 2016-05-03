note
	description: "."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

class EXPANDER

inherit DEMO

insert 
	GTK_RESPONSE_TYPE
	GTK_STOCK_ITEMS
	
create {ANY} make

feature {ANY}

	name: STRING is "Expander"
	
	description: STRING is "GtkExpander allows to provide additional content that is initially hidden. This is also known as %"disclosure triangle%"."

	filename: STRING is "expander.e"
	
feature {ANY} -- widgets
	vbox: GTK_VBOX
	label: GTK_LABEL
	expander: GTK_EXPANDER
	
feature {ANY}
	make is
		do
			if window=Void then
				create {GTK_DIALOG} window.with_buttons ("GtkExpander", -- Window label
																	  parent_window,
																	  0, -- no flags
																	  <<gtk_stock_close,
																		 gtk_response_none>>)
				window.set_unresizable

				create vbox.make (False, 5)
				window.vbox.pack_start (vbox, True, True, 0);
				vbox.set_border_width (5)

				vbox.pack_start (create {GTK_LABEL}.with_label
									  ("Expander demo. Click on the triangle for details."),
									  label, False, False, 0)
				
				create expander.make ("Details")
				vbox.pack_start (expander, False, False, 0)

				expander.add (create {GTK_LABEL}.with_label("Details can be shown or hidden."))

				if not window.is_visible then
					window.show_all (window)
				else
					window.destroy
				end
			end
		end
end





