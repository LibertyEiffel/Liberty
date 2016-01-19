-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class MEMMODEL_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = acq_rel_low_level)  or else
				(a_value = acquire_low_level)  or else
				(a_value = consume_low_level)  or else
				(a_value = last_low_level)  or else
				(a_value = relaxed_low_level)  or else
				(a_value = release_low_level)  or else
				(a_value = seq_cst_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_acq_rel
               do
                       value := acq_rel_low_level
               end

	set_acquire
               do
                       value := acquire_low_level
               end

	set_consume
               do
                       value := consume_low_level
               end

	set_last
               do
                       value := last_low_level
               end

	set_relaxed
               do
                       value := relaxed_low_level
               end

	set_release
               do
                       value := release_low_level
               end

	set_seq_cst
               do
                       value := seq_cst_low_level
               end

feature {ANY} -- Queries
       is_acq_rel: BOOLEAN
               do
                       Result := (value=acq_rel_low_level)
               end

       is_acquire: BOOLEAN
               do
                       Result := (value=acquire_low_level)
               end

       is_consume: BOOLEAN
               do
                       Result := (value=consume_low_level)
               end

       is_last: BOOLEAN
               do
                       Result := (value=last_low_level)
               end

       is_relaxed: BOOLEAN
               do
                       Result := (value=relaxed_low_level)
               end

       is_release: BOOLEAN
               do
                       Result := (value=release_low_level)
               end

       is_seq_cst: BOOLEAN
               do
                       Result := (value=seq_cst_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     acq_rel_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "MEMMODEL_ACQ_REL"
                       }"
               end

     acquire_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "MEMMODEL_ACQUIRE"
                       }"
               end

     consume_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "MEMMODEL_CONSUME"
                       }"
               end

     last_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "MEMMODEL_LAST"
                       }"
               end

     relaxed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "MEMMODEL_RELAXED"
                       }"
               end

     release_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "MEMMODEL_RELEASE"
                       }"
               end

     seq_cst_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "MEMMODEL_SEQ_CST"
                       }"
               end


end -- class MEMMODEL_ENUM
