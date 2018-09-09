note
	description: "enum GtkButtonsType -- Prebuilt sets of buttons for the dialog. If none of these choices are appropriate, simply use GTK_BUTTONS_NONE then call gtk_dialog_add_buttons()."
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team,  GTK+ team and others
					
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

deferred class BUTTONS_TYPES
inherit GTK_BUTTONS_TYPE
		rename
			gtk_buttons_none as no_buttons,
			gtk_buttons_ok as ok_button,
			gtk_buttons_close as close_button,
			gtk_buttons_cancel as cancel_button,
			gtk_buttons_yes_no as yes_no_buttons,
			gtk_buttons_ok_cancel as ok_cancel_buttons
		end
end
