-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class IFMAP_STRUCT
-- Wrapper of struct ifmap defined in file /usr/include/net/if.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   ifmap_struct_set_mem_start (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for mem_start field of IFMAP_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ifmap_struct_set_mem_start"
      }"
      end

   ifmap_struct_set_mem_end (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for mem_end field of IFMAP_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ifmap_struct_set_mem_end"
      }"
      end

   ifmap_struct_set_base_addr (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for base_addr field of IFMAP_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ifmap_struct_set_base_addr"
      }"
      end

   ifmap_struct_set_irq (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for irq field of IFMAP_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ifmap_struct_set_irq"
      }"
      end

   ifmap_struct_set_dma (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for dma field of IFMAP_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ifmap_struct_set_dma"
      }"
      end

   ifmap_struct_set_port (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for port field of IFMAP_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ifmap_struct_set_port"
      }"
      end

feature {} -- Low-level queries

   ifmap_struct_get_mem_start (a_structure: POINTER): like long_unsigned 
         -- Query for mem_start field of IFMAP_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ifmap_struct_get_mem_start"
      }"
      end

   ifmap_struct_get_mem_end (a_structure: POINTER): like long_unsigned 
         -- Query for mem_end field of IFMAP_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ifmap_struct_get_mem_end"
      }"
      end

   ifmap_struct_get_base_addr (a_structure: POINTER): NATURAL_16 
         -- Query for base_addr field of IFMAP_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ifmap_struct_get_base_addr"
      }"
      end

   ifmap_struct_get_irq (a_structure: POINTER): CHARACTER 
         -- Query for irq field of IFMAP_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ifmap_struct_get_irq"
      }"
      end

   ifmap_struct_get_dma (a_structure: POINTER): CHARACTER 
         -- Query for dma field of IFMAP_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ifmap_struct_get_dma"
      }"
      end

   ifmap_struct_get_port (a_structure: POINTER): CHARACTER 
         -- Query for port field of IFMAP_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ifmap_struct_get_port"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_ifmap"
               }"
               end

end -- class IFMAP_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
