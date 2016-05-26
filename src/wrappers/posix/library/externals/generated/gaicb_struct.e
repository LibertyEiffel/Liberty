-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GAICB_STRUCT
-- Wrapper of struct gaicb defined in file /usr/include/netdb.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   gaicb_struct_set_ar_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ar_name field of GAICB_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gaicb_struct_set_ar_name"
      }"
      end

   gaicb_struct_set_ar_service (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ar_service field of GAICB_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gaicb_struct_set_ar_service"
      }"
      end

   gaicb_struct_set_ar_request (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ar_request field of GAICB_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gaicb_struct_set_ar_request"
      }"
      end

   gaicb_struct_set_ar_result (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ar_result field of GAICB_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gaicb_struct_set_ar_result"
      }"
      end

feature {} -- Low-level queries

   gaicb_struct_get_ar_name (a_structure: POINTER): POINTER 
         -- Query for ar_name field of GAICB_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gaicb_struct_get_ar_name"
      }"
      end

   gaicb_struct_get_ar_service (a_structure: POINTER): POINTER 
         -- Query for ar_service field of GAICB_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gaicb_struct_get_ar_service"
      }"
      end

   gaicb_struct_get_ar_request (a_structure: POINTER): POINTER 
         -- Query for ar_request field of GAICB_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gaicb_struct_get_ar_request"
      }"
      end

   gaicb_struct_get_ar_result (a_structure: POINTER): POINTER 
         -- Query for ar_result field of GAICB_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gaicb_struct_get_ar_result"
      }"
      end

	-- Unwrapped private field __return.
	-- Unwrapped private field __glibc_reserved.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gaicb"
               }"
               end

end -- class GAICB_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
