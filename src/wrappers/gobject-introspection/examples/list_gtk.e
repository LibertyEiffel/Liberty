class LIST_GTK
 -- List all the symbols of Gtk library

creation make
feature 
	make is
		local gtk: GI_TYPELIB
		do
			create repository 
			gtk := repository.load("Gtk",Void)
			repository.loaded_namespaces.print_on(std_output)
			-- print(repository.infos("Gtk"))
		end

	repository: GI_REPOSITORY
end -- class LIST_GTK

