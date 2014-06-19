-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIOCONDITION_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value & (g_io_err_low_level | 
				g_io_in_low_level | 
				g_io_nval_low_level | 
				g_io_out_low_level | 
				g_io_pri_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_g_io_err
		do
			value := value.bit_or(g_io_err_low_level)
		end

	unset_g_io_err
		do
			value := value.bit_xor(g_io_err_low_level)
		end

	set_g_io_in
		do
			value := value.bit_or(g_io_in_low_level)
		end

	unset_g_io_in
		do
			value := value.bit_xor(g_io_in_low_level)
		end

	set_g_io_nval
		do
			value := value.bit_or(g_io_nval_low_level)
		end

	unset_g_io_nval
		do
			value := value.bit_xor(g_io_nval_low_level)
		end

	set_g_io_out
		do
			value := value.bit_or(g_io_out_low_level)
		end

	unset_g_io_out
		do
			value := value.bit_xor(g_io_out_low_level)
		end

	set_g_io_pri
		do
			value := value.bit_or(g_io_pri_low_level)
		end

	unset_g_io_pri
		do
			value := value.bit_xor(g_io_pri_low_level)
		end

feature {ANY} -- Queries
	is_g_io_err: BOOLEAN
		do
			Result := (value=g_io_err_low_level)
		end

	is_g_io_in: BOOLEAN
		do
			Result := (value=g_io_in_low_level)
		end

	is_g_io_nval: BOOLEAN
		do
			Result := (value=g_io_nval_low_level)
		end

	is_g_io_out: BOOLEAN
		do
			Result := (value=g_io_out_low_level)
		end

	is_g_io_pri: BOOLEAN
		do
			Result := (value=g_io_pri_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_err_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_IO_ERR"
 			}"
 		end

	g_io_in_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_IO_IN"
 			}"
 		end

	g_io_nval_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_IO_NVAL"
 			}"
 		end

	g_io_out_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_IO_OUT"
 			}"
 		end

	g_io_pri_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_IO_PRI"
 			}"
 		end


end -- class GIOCONDITION_ENUM
