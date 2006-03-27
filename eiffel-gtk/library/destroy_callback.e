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

	make (an_object: G_OBJECT) is
			-- Create a destroy callback linked to `an_object'
		do
			object := an_object
		end

feature
	signal_name: STRING is "destroy"
	object: G_OBJECT
end
