class LEGGOW
        -- Liberty Eiffel Generator of GObject Wrappers

        -- Current embryio just scans Gtk library
insert
        ANY
        GTYPE_EXTERNALS

create {ANY} make

feature  {ANY}

        make
                local gtk: GI_TYPELIB; namespaces: NAMESPACE_ITERATOR
                do
                        g_type_init
                        create repository
                        gtk := repository.load("Gtk",Void)
                        repository.loaded_namespaces.print_on(std_output)
                        -- print(repository.infos("Gtk"))
                        repository.namespace_iterator.for_each (agent emit)
                end

        repository: GI_REPOSITORY

        emit (an_info: GI_BASE_INFO)
                require an_info/=Void
                do
                        an_info.print_on(std_output)
                end
end -- class LEGGOW
