-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GWEAK_REF_STRUCT
-- Wrapper of struct  defined in file /usr/include/glib-2.0/gobject/gobject.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrappable field priv.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_GWeakRef"
               }"
               end

end -- class GWEAK_REF_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
