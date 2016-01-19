indexing
	description: "GTK - Gimp ToolKit shared functionalities."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
	details: "[
				 This class has to be inherited or inserted by all GTK
				 wrapper classes that will actually make GTK function
				 calls
				 ]"

deferred class GTK
	-- Note: the class-name GTK has been picked because it is brief and somehow
	-- follow the conventions of other languages; A more proper name following
	-- name schemes usually used in Eiffel would be SHARED_GTK.
insert
	ANY undefine copy,is_equal,fill_tagged_out_memory end
	-- Unnecessary in LibertyEiffel: GTK_STANDARD_ENUMERATIONS undefine fill_tagged_out_memory end

feature {ANY} -- Gtk 

	gtk: GTK_MAIN is
		once
			create Result
		end

end
