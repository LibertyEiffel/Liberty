class TEXT_ENTRY
inherit
	GTK_ENTRY
		redefine
			on_activate,
			on_backspace,
			on_copy_clipboard,
			on_cut_clipboard,
			on_paste_clipboard,
			on_changed
		end
	
create {ANY} with_label
feature {ANY} with_label (a_label: STRING)
		require a_label/=Void
		do
			make
			set_text (a_label)
			-- Low level, unsecure signal handling
			connect (Current, "changed", $on_changed)
			connect (Current, "delete-text", $on_delete)
			-- High level, secure signal handling
			enable_on_activate
			enable_on_backspace
			enable_on_copy_clipboard
			enable_on_cut_clipboard
			enable_on_paste_clipboard
		end

feature {ANY} -- Callbacks
	on_changed
		do
			print ("Entry has changed; now it contains `") print(text) print ("'%N")
		end

	on_delete (a_start,an_end: INTEGER)
		do
			print ("Deleting text in entry from ") print(a_start.out) print (" to ") print (an_end.out) print("%N")
		end

	on_activate
		do
			print ("on activate%N")
		end

	on_backspace
		do
			print ("on backspace%N")
		end

	on_copy_clipboard
		do
			print ("Text copied to clipboard %N")
		end

	on_cut_clipboard
		do
			print ("Cut to clipboard%N")
		end

	on_paste_clipboard
		do
			print ("Text pasted from clipboard%N")
		end

end

