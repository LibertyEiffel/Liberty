indexing
	description: "Generic callback for the clicked signal"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"
	
class CLICKED_CALLBACK
inherit
	CALLBACK
		rename object as button
		redefine button, callback
		end
insert G_SIGNAL_EXTERNALS
creation make, connect
feature
	button: GTK_BUTTON

feature
	callback (instance,user_data: POINTER) is --  a_button: GTK_BUTTON) is
		do
			-- Empty by design.
			print ("Callback: instance=") print (instance.to_string)
			print (" user_data=") print (user_data.to_string)
			print ("%N")
			create button.from_external_pointer (instance)
			procedure.call ([button])
		end

	connect (a_button: GTK_BUTTON; a_procedure: PROCEDURE [ANY, TUPLE[GTK_BUTTON]]) is
		do
			debug
				print ("CLICKED_CALLBACK.connect (a_button=") print (a_button.to_pointer.to_string)
				print (" a_button.handle=") print (a_button.handle.to_string)
				print (") Current=") print (to_pointer.to_string)
				print (" Current.handle=") print (handle.to_string)
				print ("%N")
			end
					 
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
