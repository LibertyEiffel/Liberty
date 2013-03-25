class FOO
 -- List all the symbols of Gtk library

creation make
feature 
	make is
		do
			create repository 
			repository.load("Gtk")
			print(repository.loaded_namespaces)
			print(repository.infos("Gtk"))
		end

	repository: GI_REPOSITORY
end -- class FOO

