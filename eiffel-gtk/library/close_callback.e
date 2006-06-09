indexing
	description: "Generic callback for the close signal"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

class CLOSE_CALLBACK

inherit
	CALLBACK
		-- rename object as button
		redefine object, callback
		end

insert G_OBJECT_RETRIEVER [GTK_DIALOG]

creation make

feature
	object: GTK_DIALOG

feature
	callback (instance: POINTER) is
		do
			debug
				print ("Callback: instance=") print (instance.to_string) print ("%N")
				print ("is_object: "+g_is_object (instance).out+"%N")
				print ("type: "+g_object_type (instance).out+"%N")
			end
			-- The following is written with the implicit requirement 
			-- that the button is actually created bu the Eiffel 
			-- application. 
			check
				eiffel_created_the_button: has_eiffel_wrapper_stored (instance)
			end
			object := retrieve_eiffel_wrapper_from_gobject_pointer (instance)
			-- The above line replaces "create object.from_external_pointer
			-- (instance)" which continuosly creates new Eiffel wrappers
			procedure.call ([object])
		end

	connect (an_object: GTK_DIALOG; a_procedure: PROCEDURE [ANY, TUPLE[GTK_DIALOG]]) is
		do
			debug
				print ("CLOSE_CALLBACK.connect (an_object=") print (an_object.to_pointer.to_string)
				print (" an_object.handle=") print (an_object.handle.to_string)
				print (") Current=") print (to_pointer.to_string)
				print (" Current.handle=") print (handle.to_string)
				print ("%N")
			end
					 
			handler_id := g_signal_connect_closure (an_object.handle,
													 signal_name.to_external,
													 handle,
													 0 -- i.e. call it before default handler
													 )
			procedure:=a_procedure
		end

		signal_name: STRING is "close"

	procedure: PROCEDURE [ANY, TUPLE[GTK_DIALOG]]
end
