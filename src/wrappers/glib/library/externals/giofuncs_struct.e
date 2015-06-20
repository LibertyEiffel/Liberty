-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GIOFUNCS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   giofuncs_struct_set_io_read (a_structure: POINTER; a_value: POINTER) 
         -- Setter for io_read field of GIOFUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giofuncs_struct_set_io_read"
      }"
      end

   giofuncs_struct_set_io_write (a_structure: POINTER; a_value: POINTER) 
         -- Setter for io_write field of GIOFUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giofuncs_struct_set_io_write"
      }"
      end

   giofuncs_struct_set_io_seek (a_structure: POINTER; a_value: POINTER) 
         -- Setter for io_seek field of GIOFUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giofuncs_struct_set_io_seek"
      }"
      end

   giofuncs_struct_set_io_close (a_structure: POINTER; a_value: POINTER) 
         -- Setter for io_close field of GIOFUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giofuncs_struct_set_io_close"
      }"
      end

   giofuncs_struct_set_io_create_watch (a_structure: POINTER; a_value: POINTER) 
         -- Setter for io_create_watch field of GIOFUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giofuncs_struct_set_io_create_watch"
      }"
      end

   giofuncs_struct_set_io_free (a_structure: POINTER; a_value: POINTER) 
         -- Setter for io_free field of GIOFUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giofuncs_struct_set_io_free"
      }"
      end

   giofuncs_struct_set_io_set_flags (a_structure: POINTER; a_value: POINTER) 
         -- Setter for io_set_flags field of GIOFUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giofuncs_struct_set_io_set_flags"
      }"
      end

   giofuncs_struct_set_io_get_flags (a_structure: POINTER; a_value: POINTER) 
         -- Setter for io_get_flags field of GIOFUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giofuncs_struct_set_io_get_flags"
      }"
      end

feature {} -- Low-level queries

   giofuncs_struct_get_io_read (a_structure: POINTER): POINTER 
         -- Query for io_read field of GIOFUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giofuncs_struct_get_io_read"
      }"
      end

   giofuncs_struct_get_io_write (a_structure: POINTER): POINTER 
         -- Query for io_write field of GIOFUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giofuncs_struct_get_io_write"
      }"
      end

   giofuncs_struct_get_io_seek (a_structure: POINTER): POINTER 
         -- Query for io_seek field of GIOFUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giofuncs_struct_get_io_seek"
      }"
      end

   giofuncs_struct_get_io_close (a_structure: POINTER): POINTER 
         -- Query for io_close field of GIOFUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giofuncs_struct_get_io_close"
      }"
      end

   giofuncs_struct_get_io_create_watch (a_structure: POINTER): POINTER 
         -- Query for io_create_watch field of GIOFUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giofuncs_struct_get_io_create_watch"
      }"
      end

   giofuncs_struct_get_io_free (a_structure: POINTER): POINTER 
         -- Query for io_free field of GIOFUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giofuncs_struct_get_io_free"
      }"
      end

   giofuncs_struct_get_io_set_flags (a_structure: POINTER): POINTER 
         -- Query for io_set_flags field of GIOFUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giofuncs_struct_get_io_set_flags"
      }"
      end

   giofuncs_struct_get_io_get_flags (a_structure: POINTER): POINTER 
         -- Query for io_get_flags field of GIOFUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giofuncs_struct_get_io_get_flags"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GIOFuncs"
               }"
               end

end -- class GIOFUNCS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
