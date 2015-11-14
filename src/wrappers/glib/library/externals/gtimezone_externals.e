-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTIMEZONE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_time_zone_adjust_time (a_tz: POINTER; a_type: INTEGER; a_time: POINTER): INTEGER 
               -- g_time_zone_adjust_time
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_time_zone_adjust_time"
               }"
               end

	g_time_zone_find_interval (a_tz: POINTER; a_type: INTEGER; a_time: like long): INTEGER 
               -- g_time_zone_find_interval
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_time_zone_find_interval"
               }"
               end

	g_time_zone_get_abbreviation (a_tz: POINTER; an_interval: INTEGER): POINTER 
               -- g_time_zone_get_abbreviation
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_time_zone_get_abbreviation"
               }"
               end

	g_time_zone_get_offset (a_tz: POINTER; an_interval: INTEGER): INTEGER 
               -- g_time_zone_get_offset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_time_zone_get_offset"
               }"
               end

	g_time_zone_is_dst (a_tz: POINTER; an_interval: INTEGER): INTEGER 
               -- g_time_zone_is_dst
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_time_zone_is_dst"
               }"
               end

	g_time_zone_new (an_identifier: POINTER): POINTER 
               -- g_time_zone_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_time_zone_new"
               }"
               end

	g_time_zone_new_local: POINTER 
               -- g_time_zone_new_local
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_time_zone_new_local"
               }"
               end

	g_time_zone_new_utc: POINTER 
               -- g_time_zone_new_utc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_time_zone_new_utc"
               }"
               end

	g_time_zone_ref (a_tz: POINTER): POINTER 
               -- g_time_zone_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_time_zone_ref"
               }"
               end

	g_time_zone_unref (a_tz: POINTER) 
               -- g_time_zone_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_time_zone_unref"
               }"
               end


end -- class GTIMEZONE_EXTERNALS
