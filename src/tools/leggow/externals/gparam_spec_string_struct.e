-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPARAM_SPEC_STRING_STRUCT
-- Wrapper of struct _GParamSpecString defined in file /usr/include/glib-2.0/gobject/gparamspecs.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gparam_spec_string_struct_set_default_value (a_structure: POINTER; a_value: POINTER) 
         -- Setter for default_value field of GPARAM_SPEC_STRING_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_string_struct_set_default_value"
      }"
      end

   gparam_spec_string_struct_set_cset_first (a_structure: POINTER; a_value: POINTER) 
         -- Setter for cset_first field of GPARAM_SPEC_STRING_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_string_struct_set_cset_first"
      }"
      end

   gparam_spec_string_struct_set_cset_nth (a_structure: POINTER; a_value: POINTER) 
         -- Setter for cset_nth field of GPARAM_SPEC_STRING_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_string_struct_set_cset_nth"
      }"
      end

   gparam_spec_string_struct_set_substitutor (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for substitutor field of GPARAM_SPEC_STRING_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_string_struct_set_substitutor"
      }"
      end

   gparam_spec_string_struct_set_null_fold_if_empty (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for null_fold_if_empty field of GPARAM_SPEC_STRING_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_string_struct_set_null_fold_if_empty"
      }"
      end

   gparam_spec_string_struct_set_ensure_non_null (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for ensure_non_null field of GPARAM_SPEC_STRING_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_string_struct_set_ensure_non_null"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
   gparam_spec_string_struct_get_default_value (a_structure: POINTER): POINTER 
         -- Query for default_value field of GPARAM_SPEC_STRING_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_string_struct_get_default_value"
      }"
      end

   gparam_spec_string_struct_get_cset_first (a_structure: POINTER): POINTER 
         -- Query for cset_first field of GPARAM_SPEC_STRING_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_string_struct_get_cset_first"
      }"
      end

   gparam_spec_string_struct_get_cset_nth (a_structure: POINTER): POINTER 
         -- Query for cset_nth field of GPARAM_SPEC_STRING_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_string_struct_get_cset_nth"
      }"
      end

   gparam_spec_string_struct_get_substitutor (a_structure: POINTER): CHARACTER 
         -- Query for substitutor field of GPARAM_SPEC_STRING_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_string_struct_get_substitutor"
      }"
      end

   gparam_spec_string_struct_get_null_fold_if_empty (a_structure: POINTER): NATURAL 
         -- Query for null_fold_if_empty field of GPARAM_SPEC_STRING_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_string_struct_get_null_fold_if_empty"
      }"
      end

   gparam_spec_string_struct_get_ensure_non_null (a_structure: POINTER): NATURAL 
         -- Query for ensure_non_null field of GPARAM_SPEC_STRING_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gparam_spec_string_struct_get_ensure_non_null"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gparam_spec_string"
               }"
               end

end -- class GPARAM_SPEC_STRING_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
