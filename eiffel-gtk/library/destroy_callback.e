indexing
	description: "Generic callback for the destroy signal"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"
	
class DESTROY_CALLBACK
inherit
	CALLBACK redefine object, callback end
insert G_SIGNAL_EXTERNALS
creation make, make_and_connect_to
feature
	object: GTK_OBJECT

feature
	callback (instance, user_data: POINTER) is --  
			obsolete "DESTROY_CALLBACK.callback unimplemented, since it %
                  %requires retriving a live Eiffel object from an %
                  %underlying GObject"
		do
			-- Empty by design.
			print ("Callback: instance=") print (instance.to_string)
			print (" user_data=") print (user_data.to_string)
			print ("%N")
			-- create object.from_external_pointer (instance)
			-- procedure.call ([object])
		end

	connect (a_object: GTK_OBJECT; a_procedure: PROCEDURE [ANY, TUPLE[GTK_OBJECT]]) is
		do
			debug
				print ("DESTROY_CALLBACK.connect (a_object=") print (a_object.to_pointer.to_string)
				print (" a_object.handle=") print (a_object.handle.to_string)
				print (") Current=") print (to_pointer.to_string)
				print (" Current.handle=") print (handle.to_string)
				print ("%N")
			end
					 
			handler_id := g_signal_connect_closure (a_object.handle,
																 signal_name.to_external,
																 handle,
																 0 -- i.e. call it before default handler
																 )
			procedure := a_procedure 
		end

	make_and_connect_to (an_object: GTK_OBJECT; a_procedure: PROCEDURE [ANY, TUPLE[GTK_OBJECT]]) is
		do
			make
			connect (an_object, a_procedure)
		end

	signal_name: STRING is "destroy"

	procedure: PROCEDURE [ANY, TUPLE[GTK_OBJECT]]
end
