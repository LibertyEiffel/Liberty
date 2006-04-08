indexing
	description: "Generic callback for the destroy signal"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"
	
class DESTROY_CALLBACK
inherit
	CALLBACK redefine object end
	G_SIGNALS
creation make

feature {NONE} -- Creation

	make (an_object: G_OBJECT; a_procedure: PROCEDURE[TUPLE[G_OBJECT]]) is
			-- Create a destroy callback linked to `an_object'
		do
			object := an_object
			callback := a_procedure
			connect (an_object, signal_name,  $callback)
		end

feature
	signal_name: STRING is "destroy"
	object: G_OBJECT
	callback: PROCEDURE[TUPLE[G_OBJECT]]
end
