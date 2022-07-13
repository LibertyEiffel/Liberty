-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FFI_TYPE_STRUCT
-- Wrapper of struct _ffi_type defined in file /usr/include/ffi-x86_64.h

insert STANDARD_C_LIBRARY_TYPES

	FFI_TYPES
feature {} -- Low-level setters

   ffi_type_struct_set_size (a_structure: POINTER; a_value: like size_t) 
         -- Setter for size field of FFI_TYPE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_type_struct_set_size"
      }"
      end

   ffi_type_struct_set_alignment (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for alignment field of FFI_TYPE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_type_struct_set_alignment"
      }"
      end

   ffi_type_struct_set_type (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for type field of FFI_TYPE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_type_struct_set_type"
      }"
      end

   ffi_type_struct_set_elements (a_structure: POINTER; a_value: POINTER) 
         -- Setter for elements field of FFI_TYPE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_type_struct_set_elements"
      }"
      end

feature {} -- Low-level queries

   ffi_type_struct_get_size (a_structure: POINTER): like size_t 
         -- Query for size field of FFI_TYPE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_type_struct_get_size"
      }"
      end

   ffi_type_struct_get_alignment (a_structure: POINTER): NATURAL_16 
         -- Query for alignment field of FFI_TYPE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_type_struct_get_alignment"
      }"
      end

   ffi_type_struct_get_type (a_structure: POINTER): NATURAL_16 
         -- Query for type field of FFI_TYPE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_type_struct_get_type"
      }"
      end

   ffi_type_struct_get_elements (a_structure: POINTER): POINTER 
         -- Query for elements field of FFI_TYPE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_type_struct_get_elements"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_ffi_type"
               }"
               end

end -- class FFI_TYPE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
