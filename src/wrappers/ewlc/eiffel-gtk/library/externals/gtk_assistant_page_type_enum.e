note
	description: "Enum "
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

deferred class GTK_ASSISTANT_PAGE_TYPE_ENUM
	-- An enum for determining the page role inside the
	-- GtkAssistant. It's used to handle buttons sensitivity and
	-- visibility.
	
inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_gtk_page_type (a_type :INTEGER): BOOLEAN
		do	
			Result:=((a_type=gtk_assistant_page_content) or else
						(a_type=gtk_assistant_page_intro) or else
						(a_type=gtk_assistant_page_confirm) or else
						(a_type=gtk_assistant_page_summary) or else
						(a_type=gtk_assistant_page_progress))
		end

	-- Note that an assistant needs to end its page flow with a page of
	-- type GTK_ASSISTANT_PAGE_CONFIRM or GTK_ASSISTANT_PAGE_SUMMARY to
	-- be correct.

	gtk_assistant_page_content: INTEGER
			-- The page has regular contents.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ASSISTANT_PAGE_CONTENT"
		end
	
	gtk_assistant_page_intro: INTEGER
			-- The page contains an introduction to the assistant task.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ASSISTANT_PAGE_INTRO"
		end
	
	gtk_assistant_page_confirm: INTEGER
			-- The page lets the user confirm or deny the changes.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ASSISTANT_PAGE_CONFIRM"
		end

	gtk_assistant_page_summary: INTEGER
			-- The page informs the user of the changes done.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ASSISTANT_PAGE_SUMMARY"
		end

	gtk_assistant_page_progress: INTEGER
			-- Used for tasks that take a long time to complete, blocks
			-- the assistant until the page is marked as complete.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ASSISTANT_PAGE_PROGRESS"
		end
end
