-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GIOCONDITION_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (err_low_level | 
				hup_low_level | 
				in_low_level | 
				nval_low_level | 
				out_external_low_level | 
				pri_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_err
               do
                       value := value.bit_or(err_low_level)
               end

	unset_err
               do
                       value := value.bit_xor(err_low_level)
               end

	set_hup
               do
                       value := value.bit_or(hup_low_level)
               end

	unset_hup
               do
                       value := value.bit_xor(hup_low_level)
               end

	set_in
               do
                       value := value.bit_or(in_low_level)
               end

	unset_in
               do
                       value := value.bit_xor(in_low_level)
               end

	set_nval
               do
                       value := value.bit_or(nval_low_level)
               end

	unset_nval
               do
                       value := value.bit_xor(nval_low_level)
               end

	set_out_external
               do
                       value := value.bit_or(out_external_low_level)
               end

	unset_out_external
               do
                       value := value.bit_xor(out_external_low_level)
               end

	set_pri
               do
                       value := value.bit_or(pri_low_level)
               end

	unset_pri
               do
                       value := value.bit_xor(pri_low_level)
               end

feature {ANY} -- Queries
       is_err: BOOLEAN
               do
                       Result := (value=err_low_level)
               end

       is_hup: BOOLEAN
               do
                       Result := (value=hup_low_level)
               end

       is_in: BOOLEAN
               do
                       Result := (value=in_low_level)
               end

       is_nval: BOOLEAN
               do
                       Result := (value=nval_low_level)
               end

       is_out_external: BOOLEAN
               do
                       Result := (value=out_external_low_level)
               end

       is_pri: BOOLEAN
               do
                       Result := (value=pri_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     err_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_ERR"
                       }"
               end

     hup_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_HUP"
                       }"
               end

     in_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_IN"
                       }"
               end

     nval_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_NVAL"
                       }"
               end

     out_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_OUT"
                       }"
               end

     pri_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_PRI"
                       }"
               end


end -- class GIOCONDITION_ENUM
