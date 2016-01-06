-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GTEST_FILE_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = built_low_level)  or else
				(a_value = dist_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_built
               do
                       value := built_low_level
               end

	set_dist
               do
                       value := dist_low_level
               end

feature {ANY} -- Queries
       is_built: BOOLEAN
               do
                       Result := (value=built_low_level)
               end

       is_dist: BOOLEAN
               do
                       Result := (value=dist_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     built_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_BUILT"
                       }"
               end

     dist_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_DIST"
                       }"
               end


end -- class GTEST_FILE_TYPE_ENUM
