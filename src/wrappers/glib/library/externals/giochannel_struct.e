-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GIOCHANNEL_STRUCT

inherit ANY undefine is_equal, copy end

insert GLIB_TYPES
feature {} -- Low-level setters

	giochannel_struct_set_ref_count (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for ref_count field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_ref_count"
		}"
		end

	giochannel_struct_set_funcs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for funcs field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_funcs"
		}"
		end

	giochannel_struct_set_encoding (a_structure: POINTER; a_value: POINTER) is
			-- Setter for encoding field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_encoding"
		}"
		end

	giochannel_struct_set_read_cd (a_structure: POINTER; a_value: POINTER) is
			-- Setter for read_cd field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_read_cd"
		}"
		end

	giochannel_struct_set_write_cd (a_structure: POINTER; a_value: POINTER) is
			-- Setter for write_cd field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_write_cd"
		}"
		end

	giochannel_struct_set_line_term (a_structure: POINTER; a_value: POINTER) is
			-- Setter for line_term field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_line_term"
		}"
		end

	giochannel_struct_set_line_term_len (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for line_term_len field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_line_term_len"
		}"
		end

	giochannel_struct_set_buf_size (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for buf_size field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_buf_size"
		}"
		end

	giochannel_struct_set_read_buf (a_structure: POINTER; a_value: POINTER) is
			-- Setter for read_buf field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_read_buf"
		}"
		end

	giochannel_struct_set_encoded_read_buf (a_structure: POINTER; a_value: POINTER) is
			-- Setter for encoded_read_buf field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_encoded_read_buf"
		}"
		end

	giochannel_struct_set_write_buf (a_structure: POINTER; a_value: POINTER) is
			-- Setter for write_buf field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_write_buf"
		}"
		end

	giochannel_struct_set_partial_write_buf (a_structure: POINTER; a_value: POINTER) is
			-- Setter for partial_write_buf field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_partial_write_buf"
		}"
		end

	giochannel_struct_set_use_buffer (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for use_buffer field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_use_buffer"
		}"
		end

	giochannel_struct_set_do_encode (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for do_encode field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_do_encode"
		}"
		end

	giochannel_struct_set_close_on_unref (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for close_on_unref field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_close_on_unref"
		}"
		end

	giochannel_struct_set_is_readable (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for is_readable field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_is_readable"
		}"
		end

	giochannel_struct_set_is_writeable (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for is_writeable field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_is_writeable"
		}"
		end

	giochannel_struct_set_is_seekable (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for is_seekable field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_is_seekable"
		}"
		end

	giochannel_struct_set_reserved1 (a_structure: POINTER; a_value: POINTER) is
			-- Setter for reserved1 field of GIOCHANNEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_set_reserved1"
		}"
		end

	giochannel_struct_set_reserved2 (a_structure: POINTER; a_value: POINTER) is
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

	giochannel_struct_get_ref_count (a_structure: POINTER): INTEGER_32 is
			-- Query for ref_count field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_ref_count"
		}"
		end

	giochannel_struct_get_funcs (a_structure: POINTER): POINTER is
			-- Query for funcs field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_funcs"
		}"
		end

	giochannel_struct_get_encoding (a_structure: POINTER): POINTER is
			-- Query for encoding field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_encoding"
		}"
		end

	giochannel_struct_get_read_cd (a_structure: POINTER): POINTER is
			-- Query for read_cd field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_read_cd"
		}"
		end

	giochannel_struct_get_write_cd (a_structure: POINTER): POINTER is
			-- Query for write_cd field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_write_cd"
		}"
		end

	giochannel_struct_get_line_term (a_structure: POINTER): POINTER is
			-- Query for line_term field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_line_term"
		}"
		end

	giochannel_struct_get_line_term_len (a_structure: POINTER): NATURAL_32 is
			-- Query for line_term_len field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_line_term_len"
		}"
		end

	giochannel_struct_get_buf_size (a_structure: POINTER): NATURAL_32 is
			-- Query for buf_size field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_buf_size"
		}"
		end

	giochannel_struct_get_read_buf (a_structure: POINTER): POINTER is
			-- Query for read_buf field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_read_buf"
		}"
		end

	giochannel_struct_get_encoded_read_buf (a_structure: POINTER): POINTER is
			-- Query for encoded_read_buf field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_encoded_read_buf"
		}"
		end

	giochannel_struct_get_write_buf (a_structure: POINTER): POINTER is
			-- Query for write_buf field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_write_buf"
		}"
		end

	giochannel_struct_get_partial_write_buf (a_structure: POINTER): POINTER is
			-- Query for partial_write_buf field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_partial_write_buf"
		}"
		end

	giochannel_struct_get_use_buffer (a_structure: POINTER): NATURAL_32 is
			-- Query for use_buffer field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_use_buffer"
		}"
		end

	giochannel_struct_get_do_encode (a_structure: POINTER): NATURAL_32 is
			-- Query for do_encode field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_do_encode"
		}"
		end

	giochannel_struct_get_close_on_unref (a_structure: POINTER): NATURAL_32 is
			-- Query for close_on_unref field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_close_on_unref"
		}"
		end

	giochannel_struct_get_is_readable (a_structure: POINTER): NATURAL_32 is
			-- Query for is_readable field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_is_readable"
		}"
		end

	giochannel_struct_get_is_writeable (a_structure: POINTER): NATURAL_32 is
			-- Query for is_writeable field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_is_writeable"
		}"
		end

	giochannel_struct_get_is_seekable (a_structure: POINTER): NATURAL_32 is
			-- Query for is_seekable field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_is_seekable"
		}"
		end

	giochannel_struct_get_reserved1 (a_structure: POINTER): POINTER is
			-- Query for reserved1 field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_reserved1"
		}"
		end

	giochannel_struct_get_reserved2 (a_structure: POINTER): POINTER is
			-- Query for reserved2 field of GIOCHANNEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "giochannel_struct_get_reserved2"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
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

