indexing
	description: "GTK - Gimp ToolKit shared functionalities."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
	details: "[
				 This class has to be inherited or inserted by all GTK
				 wrapper classes that will actually make GTK function
				 calls
				 ]"

deferred class GTK
-- Note: TODO: is this a good name? or SHARED_GTK is better?
insert
	ANY undefine copy,is_equal,fill_tagged_out_memory end
	GTK_STANDARD_ENUMERATIONS undefine fill_tagged_out_memory end
	GTK_EXTERNALS

feature -- Gtk 

	gtk: GTK_MAIN is
		once
			create Result
		end

	linked_major_version: INTEGER is
		do
			Result := gtk_major_version
		ensure
			Result > 0
		end

	linked_minor_version: INTEGER is
		do
			Result := gtk_minor_version
		ensure
			Result > 0
		end

	linked_micro_version: INTEGER is
		do
			Result := gtk_micro_version
		ensure
			Result > 0
		end

	header_major_version: INTEGER is
		do
			Result := gtk_header_major_version
		ensure
			Result > 0
		end

	header_minor_version: INTEGER is
		do
			Result := gtk_header_minor_version
		ensure
			Result > 0
		end

	header_micro_version: INTEGER is
		do
			Result := gtk_header_micro_version
		ensure
			Result > 0
		end

end
