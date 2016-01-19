-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GMEM_VTABLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gmem_vtable_struct_set_malloc (a_structure: POINTER; a_value: POINTER) 
         -- Setter for malloc field of GMEM_VTABLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmem_vtable_struct_set_malloc"
      }"
      end

   gmem_vtable_struct_set_realloc (a_structure: POINTER; a_value: POINTER) 
         -- Setter for realloc field of GMEM_VTABLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmem_vtable_struct_set_realloc"
      }"
      end

   gmem_vtable_struct_set_free (a_structure: POINTER; a_value: POINTER) 
         -- Setter for free field of GMEM_VTABLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmem_vtable_struct_set_free"
      }"
      end

   gmem_vtable_struct_set_calloc (a_structure: POINTER; a_value: POINTER) 
         -- Setter for calloc field of GMEM_VTABLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmem_vtable_struct_set_calloc"
      }"
      end

   gmem_vtable_struct_set_try_malloc (a_structure: POINTER; a_value: POINTER) 
         -- Setter for try_malloc field of GMEM_VTABLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmem_vtable_struct_set_try_malloc"
      }"
      end

   gmem_vtable_struct_set_try_realloc (a_structure: POINTER; a_value: POINTER) 
         -- Setter for try_realloc field of GMEM_VTABLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmem_vtable_struct_set_try_realloc"
      }"
      end

feature {} -- Low-level queries

   gmem_vtable_struct_get_malloc (a_structure: POINTER): POINTER 
         -- Query for malloc field of GMEM_VTABLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmem_vtable_struct_get_malloc"
      }"
      end

   gmem_vtable_struct_get_realloc (a_structure: POINTER): POINTER 
         -- Query for realloc field of GMEM_VTABLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmem_vtable_struct_get_realloc"
      }"
      end

   gmem_vtable_struct_get_free (a_structure: POINTER): POINTER 
         -- Query for free field of GMEM_VTABLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmem_vtable_struct_get_free"
      }"
      end

   gmem_vtable_struct_get_calloc (a_structure: POINTER): POINTER 
         -- Query for calloc field of GMEM_VTABLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmem_vtable_struct_get_calloc"
      }"
      end

   gmem_vtable_struct_get_try_malloc (a_structure: POINTER): POINTER 
         -- Query for try_malloc field of GMEM_VTABLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmem_vtable_struct_get_try_malloc"
      }"
      end

   gmem_vtable_struct_get_try_realloc (a_structure: POINTER): POINTER 
         -- Query for try_realloc field of GMEM_VTABLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gmem_vtable_struct_get_try_realloc"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GMemVTable"
               }"
               end

end -- class GMEM_VTABLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
