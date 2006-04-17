indexing
	description: "Generic callback for the clicked signal"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"
	
class CLICKED_CALLBACK
inherit
	CALLBACK
		redefine object, callback
		end
insert G_SIGNAL_EXTERNALS
creation make, connect
feature
	object: GTK_OBJECT

feature
	callback (a_button: GTK_BUTTON) is
		do
			-- Empty by design.
			print ("FOO%N")
			procedure.call ([a_button])
		end

	connect (a_button: GTK_BUTTON; a_procedure: PROCEDURE [ANY, TUPLE[GTK_BUTTON]]) is
		do
			handler_id := g_signal_connect_closure (a_button.handle,
																 signal_name.to_external,
																 handle,
																 0 -- i.e. call it before default handler
																 )
			procedure := a_procedure 
		end

	signal_name: STRING is "clicked"

	procedure: PROCEDURE [ANY, TUPLE[GTK_BUTTON]]
end
