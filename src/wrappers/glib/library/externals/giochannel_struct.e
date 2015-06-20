-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GIOCHANNEL_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   giochannel_struct_set_ref_count (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for ref_count field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_ref_count"
      }"
      end

   giochannel_struct_set_funcs (a_structure: POINTER; a_value: POINTER) 
         -- Setter for funcs field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_funcs"
      }"
      end

   giochannel_struct_set_encoding (a_structure: POINTER; a_value: POINTER) 
         -- Setter for encoding field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_encoding"
      }"
      end

   giochannel_struct_set_read_cd (a_structure: POINTER; a_value: POINTER) 
         -- Setter for read_cd field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_read_cd"
      }"
      end

   giochannel_struct_set_write_cd (a_structure: POINTER; a_value: POINTER) 
         -- Setter for write_cd field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_write_cd"
      }"
      end

   giochannel_struct_set_line_term (a_structure: POINTER; a_value: POINTER) 
         -- Setter for line_term field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_line_term"
      }"
      end

   giochannel_struct_set_line_term_len (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for line_term_len field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_line_term_len"
      }"
      end

   giochannel_struct_set_buf_size (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for buf_size field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_buf_size"
      }"
      end

   giochannel_struct_set_read_buf (a_structure: POINTER; a_value: POINTER) 
         -- Setter for read_buf field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_read_buf"
      }"
      end

   giochannel_struct_set_encoded_read_buf (a_structure: POINTER; a_value: POINTER) 
         -- Setter for encoded_read_buf field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_encoded_read_buf"
      }"
      end

   giochannel_struct_set_write_buf (a_structure: POINTER; a_value: POINTER) 
         -- Setter for write_buf field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_write_buf"
      }"
      end

   giochannel_struct_set_partial_write_buf (a_structure: POINTER; a_value: POINTER) 
         -- Setter for partial_write_buf field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_partial_write_buf"
      }"
      end

   giochannel_struct_set_use_buffer (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for use_buffer field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_use_buffer"
      }"
      end

   giochannel_struct_set_do_encode (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for do_encode field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_do_encode"
      }"
      end

   giochannel_struct_set_close_on_unref (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for close_on_unref field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_close_on_unref"
      }"
      end

   giochannel_struct_set_is_readable (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for is_readable field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_is_readable"
      }"
      end

   giochannel_struct_set_is_writeable (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for is_writeable field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_is_writeable"
      }"
      end

   giochannel_struct_set_is_seekable (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for is_seekable field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_is_seekable"
      }"
      end

   giochannel_struct_set_reserved1 (a_structure: POINTER; a_value: POINTER) 
         -- Setter for reserved1 field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_reserved1"
      }"
      end

   giochannel_struct_set_reserved2 (a_structure: POINTER; a_value: POINTER) 
         -- Setter for reserved2 field of GIOCHANNEL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_set_reserved2"
      }"
      end

feature {} -- Low-level queries

   giochannel_struct_get_ref_count (a_structure: POINTER): INTEGER 
         -- Query for ref_count field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_ref_count"
      }"
      end

   giochannel_struct_get_funcs (a_structure: POINTER): POINTER 
         -- Query for funcs field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_funcs"
      }"
      end

   giochannel_struct_get_encoding (a_structure: POINTER): POINTER 
         -- Query for encoding field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_encoding"
      }"
      end

   giochannel_struct_get_read_cd (a_structure: POINTER): POINTER 
         -- Query for read_cd field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_read_cd"
      }"
      end

   giochannel_struct_get_write_cd (a_structure: POINTER): POINTER 
         -- Query for write_cd field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_write_cd"
      }"
      end

   giochannel_struct_get_line_term (a_structure: POINTER): POINTER 
         -- Query for line_term field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_line_term"
      }"
      end

   giochannel_struct_get_line_term_len (a_structure: POINTER): NATURAL 
         -- Query for line_term_len field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_line_term_len"
      }"
      end

   giochannel_struct_get_buf_size (a_structure: POINTER): like long_unsigned 
         -- Query for buf_size field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_buf_size"
      }"
      end

   giochannel_struct_get_read_buf (a_structure: POINTER): POINTER 
         -- Query for read_buf field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_read_buf"
      }"
      end

   giochannel_struct_get_encoded_read_buf (a_structure: POINTER): POINTER 
         -- Query for encoded_read_buf field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_encoded_read_buf"
      }"
      end

   giochannel_struct_get_write_buf (a_structure: POINTER): POINTER 
         -- Query for write_buf field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_write_buf"
      }"
      end

   giochannel_struct_get_partial_write_buf (a_structure: POINTER): POINTER 
         -- Query for partial_write_buf field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_partial_write_buf"
      }"
      end

   giochannel_struct_get_use_buffer (a_structure: POINTER): NATURAL 
         -- Query for use_buffer field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_use_buffer"
      }"
      end

   giochannel_struct_get_do_encode (a_structure: POINTER): NATURAL 
         -- Query for do_encode field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_do_encode"
      }"
      end

   giochannel_struct_get_close_on_unref (a_structure: POINTER): NATURAL 
         -- Query for close_on_unref field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_close_on_unref"
      }"
      end

   giochannel_struct_get_is_readable (a_structure: POINTER): NATURAL 
         -- Query for is_readable field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_is_readable"
      }"
      end

   giochannel_struct_get_is_writeable (a_structure: POINTER): NATURAL 
         -- Query for is_writeable field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_is_writeable"
      }"
      end

   giochannel_struct_get_is_seekable (a_structure: POINTER): NATURAL 
         -- Query for is_seekable field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_is_seekable"
      }"
      end

   giochannel_struct_get_reserved1 (a_structure: POINTER): POINTER 
         -- Query for reserved1 field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_reserved1"
      }"
      end

   giochannel_struct_get_reserved2 (a_structure: POINTER): POINTER 
         -- Query for reserved2 field of GIOCHANNEL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giochannel_struct_get_reserved2"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GIOChannel"
               }"
               end

end -- class GIOCHANNEL_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
