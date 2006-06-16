indexing
	description: "Generic callback for the destroy signal"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

class DESTROY_CALLBACK

inherit CALLBACK redefine object, callback end
insert G_OBJECT_RETRIEVER [GTK_OBJECT]

creation make

feature
	object: GTK_OBJECT

feature
	callback (instance: POINTER) is --  
		do
			debug
				print ("Callback: instance=") print (instance.to_string) print ("%N")
			end
			object := retrieve_eiffel_wrapper_from_gobject_pointer (instance)
			check
				object_not_void: object /= Void
			end
			procedure.call ([object])
		end

	callback_pointer: POINTER is
		do
			Result := get_callback_pointer ($callback)
		ensure
			Result.is_not_null
		end

	connect (an_object: GTK_OBJECT; a_procedure: PROCEDURE [ANY, TUPLE[GTK_OBJECT]]) is
		do
			debug
				print ("DESTROY_CALLBACK.connect (an_object=") print (an_object.to_pointer.to_string)
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
			procedure := a_procedure
		end

	signal_name: STRING is "destroy"

	procedure: PROCEDURE [ANY, TUPLE[GTK_OBJECT]]
end
