indexing
	description: "Shared GDA functionalities."
	copyright: "(C) 2008 Paolo Redaelli "
	license: "LGPL v2 or later"

deferred class GDA
	
insert ANY undefine copy,is_equal,fill_tagged_out_memory end
		
feature -- Gtk 

	gda: GDA_MAIN is
		once
			create Result
		end
end
