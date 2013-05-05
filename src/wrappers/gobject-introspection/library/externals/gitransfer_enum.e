-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GITRANSFER_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gi_transfer_container_low_level)  or else
				(a_value = gi_transfer_everything_low_level)  or else
				(a_value = gi_transfer_nothing_low_level) )
		end

feature -- Setters
	default_create,
	set_gi_transfer_container is
		do
			value := gi_transfer_container_low_level
		end

	set_gi_transfer_everything is
		do
			value := gi_transfer_everything_low_level
		end

	set_gi_transfer_nothing is
		do
			value := gi_transfer_nothing_low_level
		end

feature -- Queries
	is_gi_transfer_container: BOOLEAN is
		do
			Result := (value=gi_transfer_container_low_level)
		end

	is_gi_transfer_everything: BOOLEAN is
		do
			Result := (value=gi_transfer_everything_low_level)
		end

	is_gi_transfer_nothing: BOOLEAN is
		do
			Result := (value=gi_transfer_nothing_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gi_transfer_container_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TRANSFER_CONTAINER"
 			}"
 		end

	gi_transfer_everything_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TRANSFER_EVERYTHING"
 			}"
 		end

	gi_transfer_nothing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TRANSFER_NOTHING"
 			}"
 		end


end -- class GITRANSFER_ENUM
