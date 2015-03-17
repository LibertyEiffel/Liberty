-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class TCPHDR_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

	tcphdr_struct_set_source (a_structure: POINTER; a_value: NATURAL_16)
			-- Setter for source field of TCPHDR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_set_source"
		}"
		end

	tcphdr_struct_set_dest (a_structure: POINTER; a_value: NATURAL_16)
			-- Setter for dest field of TCPHDR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_set_dest"
		}"
		end

	tcphdr_struct_set_seq (a_structure: POINTER; a_value: NATURAL)
			-- Setter for seq field of TCPHDR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_set_seq"
		}"
		end

	tcphdr_struct_set_ack_seq (a_structure: POINTER; a_value: NATURAL)
			-- Setter for ack_seq field of TCPHDR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_set_ack_seq"
		}"
		end

	tcphdr_struct_set_res1 (a_structure: POINTER; a_value: NATURAL_16)
			-- Setter for res1 field of TCPHDR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_set_res1"
		}"
		end

	tcphdr_struct_set_doff (a_structure: POINTER; a_value: NATURAL_16)
			-- Setter for doff field of TCPHDR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_set_doff"
		}"
		end

	tcphdr_struct_set_fin (a_structure: POINTER; a_value: NATURAL_16)
			-- Setter for fin field of TCPHDR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_set_fin"
		}"
		end

	tcphdr_struct_set_syn (a_structure: POINTER; a_value: NATURAL_16)
			-- Setter for syn field of TCPHDR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_set_syn"
		}"
		end

	tcphdr_struct_set_rst (a_structure: POINTER; a_value: NATURAL_16)
			-- Setter for rst field of TCPHDR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_set_rst"
		}"
		end

	tcphdr_struct_set_psh (a_structure: POINTER; a_value: NATURAL_16)
			-- Setter for psh field of TCPHDR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_set_psh"
		}"
		end

	tcphdr_struct_set_ack (a_structure: POINTER; a_value: NATURAL_16)
			-- Setter for ack field of TCPHDR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_set_ack"
		}"
		end

	tcphdr_struct_set_urg (a_structure: POINTER; a_value: NATURAL_16)
			-- Setter for urg field of TCPHDR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_set_urg"
		}"
		end

	tcphdr_struct_set_res2 (a_structure: POINTER; a_value: NATURAL_16)
			-- Setter for res2 field of TCPHDR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_set_res2"
		}"
		end

	tcphdr_struct_set_window (a_structure: POINTER; a_value: NATURAL_16)
			-- Setter for window field of TCPHDR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_set_window"
		}"
		end

	tcphdr_struct_set_check_field (a_structure: POINTER; a_value: NATURAL_16)
			-- Setter for check field of TCPHDR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_set_check_field"
		}"
		end

	tcphdr_struct_set_urg_ptr (a_structure: POINTER; a_value: NATURAL_16)
			-- Setter for urg_ptr field of TCPHDR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_set_urg_ptr"
		}"
		end

feature {} -- Low-level queries

	tcphdr_struct_get_source (a_structure: POINTER): NATURAL_16
			-- Query for source field of TCPHDR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_get_source"
		}"
		end

	tcphdr_struct_get_dest (a_structure: POINTER): NATURAL_16
			-- Query for dest field of TCPHDR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_get_dest"
		}"
		end

	tcphdr_struct_get_seq (a_structure: POINTER): NATURAL
			-- Query for seq field of TCPHDR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_get_seq"
		}"
		end

	tcphdr_struct_get_ack_seq (a_structure: POINTER): NATURAL
			-- Query for ack_seq field of TCPHDR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_get_ack_seq"
		}"
		end

	tcphdr_struct_get_res1 (a_structure: POINTER): NATURAL_16
			-- Query for res1 field of TCPHDR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_get_res1"
		}"
		end

	tcphdr_struct_get_doff (a_structure: POINTER): NATURAL_16
			-- Query for doff field of TCPHDR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_get_doff"
		}"
		end

	tcphdr_struct_get_fin (a_structure: POINTER): NATURAL_16
			-- Query for fin field of TCPHDR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_get_fin"
		}"
		end

	tcphdr_struct_get_syn (a_structure: POINTER): NATURAL_16
			-- Query for syn field of TCPHDR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_get_syn"
		}"
		end

	tcphdr_struct_get_rst (a_structure: POINTER): NATURAL_16
			-- Query for rst field of TCPHDR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_get_rst"
		}"
		end

	tcphdr_struct_get_psh (a_structure: POINTER): NATURAL_16
			-- Query for psh field of TCPHDR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_get_psh"
		}"
		end

	tcphdr_struct_get_ack (a_structure: POINTER): NATURAL_16
			-- Query for ack field of TCPHDR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_get_ack"
		}"
		end

	tcphdr_struct_get_urg (a_structure: POINTER): NATURAL_16
			-- Query for urg field of TCPHDR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_get_urg"
		}"
		end

	tcphdr_struct_get_res2 (a_structure: POINTER): NATURAL_16
			-- Query for res2 field of TCPHDR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_get_res2"
		}"
		end

	tcphdr_struct_get_window (a_structure: POINTER): NATURAL_16
			-- Query for window field of TCPHDR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_get_window"
		}"
		end

	tcphdr_struct_get_check_field (a_structure: POINTER): NATURAL_16
			-- Query for check field of TCPHDR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_get_check_field"
		}"
		end

	tcphdr_struct_get_urg_ptr (a_structure: POINTER): NATURAL_16
			-- Query for urg_ptr field of TCPHDR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcphdr_struct_get_urg_ptr"
		}"
		end

feature -- Structure size
	struct_size: like size_t
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_tcphdr"
		}"
		end

end -- class TCPHDR_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

