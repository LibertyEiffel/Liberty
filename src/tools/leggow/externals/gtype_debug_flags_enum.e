-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GTYPE_DEBUG_FLAGS_ENUM

-- Wrapper of enum GTypeDebugFlags defined in file /usr/include/glib-2.0/gobject/gtype.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = instance_count_low_level)  or else
				(a_value = mask_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = objects_low_level)  or else
				(a_value = signals_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_instance_count
               do
                       value := instance_count_low_level
               end

	set_mask
               do
                       value := mask_low_level
               end

	set_none
               do
                       value := none_low_level
               end

	set_objects
               do
                       value := objects_low_level
               end

	set_signals
               do
                       value := signals_low_level
               end

feature {ANY} -- Queries
       is_instance_count: BOOLEAN
               do
                       Result := (value=instance_count_low_level)
               end

       is_mask: BOOLEAN
               do
                       Result := (value=mask_low_level)
               end

       is_none: BOOLEAN
               do
                       Result := (value=none_low_level)
               end

       is_objects: BOOLEAN
               do
                       Result := (value=objects_low_level)
               end

       is_signals: BOOLEAN
               do
                       Result := (value=signals_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     instance_count_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TYPE_DEBUG_INSTANCE_COUNT"
                       }"
               end

     mask_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TYPE_DEBUG_MASK"
                       }"
               end

     none_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TYPE_DEBUG_NONE"
                       }"
               end

     objects_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TYPE_DEBUG_OBJECTS"
                       }"
               end

     signals_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TYPE_DEBUG_SIGNALS"
                       }"
               end


end -- class GTYPE_DEBUG_FLAGS_ENUM
