class MY_EXPANDER
inherit
	GTK_EXPANDER
		rename make as make_expander
		export {} make_expander
		end

creation make
	
feature
	make (a_statusbar: GTK_STATUS_BAR) is
		require valid_statusbar: a_statusbar/=Void
		do
			statusbar:= a_statusbar
			statusbar.new_context_id(context)
			context_id := statusbar.last_context_id
			make_with_mnemonic (expander_label)
			connect_activate_signal_to (agent on_activate)
		end

	on_activate is
		require statusbar_set: statusbar /= Void
		do
			-- if not statusbar.is_empty then
			statusbar.pop(context_id)
			--end
			if is_expanded then
				statusbar.push(context_id, "The expander clicked when it was expanded.")
			else
				statusbar.push(context_id, "The expander clicked when it was collapsed.")
			end
		end

	statusbar: GTK_STATUS_BAR
	expander_label: STRING is "_An expander"

feature {} -- Implementation
	context: STRING is "My expander context"
	context_id: INTEGER
end
