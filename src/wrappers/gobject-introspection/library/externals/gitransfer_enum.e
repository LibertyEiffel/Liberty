-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GITRANSFER_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = container_low_level)  or else
				(a_value = everything_low_level)  or else
				(a_value = nothing_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_container is
		do
			value := container_low_level
		end

	set_everything is
		do
			value := everything_low_level
		end

	set_nothing is
		do
			value := nothing_low_level
		end

feature {ANY} -- Queries
	is_container: BOOLEAN is
		do
			Result := (value=container_low_level)
		end

	is_everything: BOOLEAN is
		do
			Result := (value=everything_low_level)
		end

	is_nothing: BOOLEAN is
		do
			Result := (value=nothing_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	container_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TRANSFER_CONTAINER"
 			}"
 		end

	everything_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TRANSFER_EVERYTHING"
 			}"
 		end

	nothing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TRANSFER_NOTHING"
 			}"
 		end


end -- class GITRANSFER_ENUM
