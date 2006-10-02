indexing
	description: "GDA - Gnome Data Access shared functionalities."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
	details: "[
				 This class has to be inherited or inserted by all GTK
				 wrapper classes that will actually make GTK function
				 calls
				 ]"

deferred class GDA
	-- insert ANY undefine copy,is_equal,fill_tagged_out_memory end
	--	GTK_STANDARD_ENUMERATIONS undefine
	--	copy,is_equal,fill_tagged_out_memory end

feature -- GDA 
	gda: LIBGDA is 
		once
			create Result
		end
end
