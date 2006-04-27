indexing
	description: "Callback for `toggled' signal."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
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

