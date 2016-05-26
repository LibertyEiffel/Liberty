-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GITRANSFER_ENUM

-- Wrapper of enum GITransfer defined in file /usr/include/gobject-introspection-1.0/gitypes.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = container_low_level)  or else
				(a_value = everything_low_level)  or else
				(a_value = nothing_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_container
               do
                       value := container_low_level
               end

	set_everything
               do
                       value := everything_low_level
               end

	set_nothing
               do
                       value := nothing_low_level
               end

feature {ANY} -- Queries
       is_container: BOOLEAN
               do
                       Result := (value=container_low_level)
               end

       is_everything: BOOLEAN
               do
                       Result := (value=everything_low_level)
               end

       is_nothing: BOOLEAN
               do
                       Result := (value=nothing_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     container_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TRANSFER_CONTAINER"
                       }"
               end

     everything_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TRANSFER_EVERYTHING"
                       }"
               end

     nothing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TRANSFER_NOTHING"
                       }"
               end


end -- class GITRANSFER_ENUM
