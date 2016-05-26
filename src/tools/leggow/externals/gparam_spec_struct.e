-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPARAM_SPEC_STRUCT
-- Wrapper of struct _GParamSpec defined in file /usr/include/glib-2.0/gobject/gparam.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gparam_spec_struct_set_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for name field of GPARAM_SPEC_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_struct_set_name"
      }"
      end

   gparam_spec_struct_set_flags (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for flags field of GPARAM_SPEC_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_struct_set_flags"
      }"
      end

   gparam_spec_struct_set_value_type (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for value_type field of GPARAM_SPEC_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_struct_set_value_type"
      }"
      end

   gparam_spec_struct_set_owner_type (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for owner_type field of GPARAM_SPEC_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_struct_set_owner_type"
      }"
      end

   gparam_spec_struct_set_qdata (a_structure: POINTER; a_value: POINTER) 
         -- Setter for qdata field of GPARAM_SPEC_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_struct_set_qdata"
      }"
      end

   gparam_spec_struct_set_ref_count (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for ref_count field of GPARAM_SPEC_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_struct_set_ref_count"
      }"
      end

   gparam_spec_struct_set_param_id (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for param_id field of GPARAM_SPEC_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_struct_set_param_id"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field g_type_instance.
   gparam_spec_struct_get_name (a_structure: POINTER): POINTER 
         -- Query for name field of GPARAM_SPEC_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_struct_get_name"
      }"
      end

   gparam_spec_struct_get_flags (a_structure: POINTER): INTEGER 
         -- Query for flags field of GPARAM_SPEC_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_struct_get_flags"
      }"
      end

   gparam_spec_struct_get_value_type (a_structure: POINTER): like long_unsigned 
         -- Query for value_type field of GPARAM_SPEC_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_struct_get_value_type"
      }"
      end

   gparam_spec_struct_get_owner_type (a_structure: POINTER): like long_unsigned 
         -- Query for owner_type field of GPARAM_SPEC_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_struct_get_owner_type"
      }"
      end

	-- Unwrapped private field _nick.
	-- Unwrapped private field _blurb.
   gparam_spec_struct_get_qdata (a_structure: POINTER): POINTER 
         -- Query for qdata field of GPARAM_SPEC_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_struct_get_qdata"
      }"
      end

   gparam_spec_struct_get_ref_count (a_structure: POINTER): NATURAL 
         -- Query for ref_count field of GPARAM_SPEC_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_struct_get_ref_count"
      }"
      end

   gparam_spec_struct_get_param_id (a_structure: POINTER): NATURAL 
         -- Query for param_id field of GPARAM_SPEC_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_struct_get_param_id"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gparam_spec"
               }"
               end

end -- class GPARAM_SPEC_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
