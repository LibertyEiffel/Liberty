-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FFI_RAW_UNION
-- Wrapper of union  defined in file /usr/include/x86_64-linux-gnu/ffi.h

insert STANDARD_C_LIBRARY_TYPES

	FFI_TYPES
feature {} -- Low-level setters

   ffi_raw_union_set_sint (a_structure: POINTER; a_value: like long) 
         -- Setter for sint field of FFI_RAW_UNION structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_raw_union_set_sint"
      }"
      end

   ffi_raw_union_set_uint (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for uint field of FFI_RAW_UNION structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_raw_union_set_uint"
      }"
      end

   ffi_raw_union_set_flt (a_structure: POINTER; a_value: REAL_32) 
         -- Setter for flt field of FFI_RAW_UNION structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_raw_union_set_flt"
      }"
      end

   ffi_raw_union_set_data (a_structure: POINTER; a_value: POINTER) 
         -- Setter for data field of FFI_RAW_UNION structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_raw_union_set_data"
      }"
      end

   ffi_raw_union_set_ptr (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ptr field of FFI_RAW_UNION structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_raw_union_set_ptr"
      }"
      end

feature {} -- Low-level queries

   ffi_raw_union_get_sint (a_structure: POINTER): like long 
         -- Query for sint field of FFI_RAW_UNION structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_raw_union_get_sint"
      }"
      end

   ffi_raw_union_get_uint (a_structure: POINTER): like long_unsigned 
         -- Query for uint field of FFI_RAW_UNION structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_raw_union_get_uint"
      }"
      end

   ffi_raw_union_get_flt (a_structure: POINTER): REAL_32 
         -- Query for flt field of FFI_RAW_UNION structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_raw_union_get_flt"
      }"
      end

   ffi_raw_union_get_data (a_structure: POINTER): POINTER 
         -- Query for data field of FFI_RAW_UNION structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_raw_union_get_data"
      }"
      end

   ffi_raw_union_get_ptr (a_structure: POINTER): POINTER 
         -- Query for ptr field of FFI_RAW_UNION structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffi_raw_union_get_ptr"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_ffi_raw"
               }"
               end

end -- class FFI_RAW_UNION
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
