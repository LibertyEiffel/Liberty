class MY_EXPANDER
inherit
	GTK_EXPANDER
		rename make as make_expander
		export {} make_expander
		redefine on_activate			
		end
create {ANY} make
feature {ANY} make (a_statusbar: GTK_STATUS_BAR)
		require valid_statusbar: a_statusbar/=Void
		do
			statusbar:= a_statusbar
			make_with_mnemonic (expander_label)
			enable_on_activate
		end

	on_activate
		require statusbar_set: statusbar /= Void
		do
			if not statusbar.is_empty then
				statusbar.pop
			end
			if is_expanded then
				statusbar.push ("The expander clicked when it was expanded.")
			else
				statusbar.push ("The expander clicked when it was collapsed.")
			end
		end
	statusbar: GTK_STATUS_BAR
	expander_label: STRING is "_An expander"
end
