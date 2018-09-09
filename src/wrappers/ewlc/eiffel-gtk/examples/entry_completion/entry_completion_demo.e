note
	description: "Entry completion demo."
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team
					
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

class ENTRY_COMPLETION_DEMO

insert
	GTK
	G_TYPES
	ANY
	
create {ANY} make
feature {ANY}
	make
		do
			gtk.initialize
			create window.make
			window.set_title (title_string)
			window.midscreen

			create entry_box.make (True,10)
			create entry_label.with_label ("Programmer's name:")
			create entry.make
			entry_box.pack_start_defaults (entry_label)
			entry_box.pack_start_defaults (entry)
			window.add(entry_box)
			window.show_all
			window.connect_agent_to_destroy_signal (agent on_destroy_window(?))

			gtk.run_main_loop
		end

	on_destroy_window (an_obj: GTK_OBJECT)
		local a_win: GTK_WINDOW
		do
			a_win ::= an_obj
			print ("Quitting%N")
			gtk.quit
		end

feature {ANY} -- labels
	title_string: STRING is "Completion entry demo"
	
feature {ANY} -- Widgets
	window: GTK_WINDOW
	entry_box: GTK_HBOX
	entry_label: GTK_LABEL
	entry: PROGRAMMERS_ENTRY
	
end


