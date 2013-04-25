-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTRAVERSE_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_traverse_all_low_level)  or else
				(a_value = g_traverse_leafs_low_level)  or else
				(a_value = g_traverse_leaves_low_level)  or else
				(a_value = g_traverse_mask_low_level)  or else
				(a_value = g_traverse_non_leafs_low_level)  or else
				(a_value = g_traverse_non_leaves_low_level) )
		end

feature -- Setters
	default_create,
	set_g_traverse_all is
		do
			value := g_traverse_all_low_level
		end

	set_g_traverse_leafs is
		do
			value := g_traverse_leafs_low_level
		end

	set_g_traverse_leaves is
		do
			value := g_traverse_leaves_low_level
		end

	set_g_traverse_mask is
		do
			value := g_traverse_mask_low_level
		end

	set_g_traverse_non_leafs is
		do
			value := g_traverse_non_leafs_low_level
		end

	set_g_traverse_non_leaves is
		do
			value := g_traverse_non_leaves_low_level
		end

feature -- Queries
	is_g_traverse_all: BOOLEAN is
		do
			Result := (value=g_traverse_all_low_level)
		end

	is_g_traverse_leafs: BOOLEAN is
		do
			Result := (value=g_traverse_leafs_low_level)
		end

	is_g_traverse_leaves: BOOLEAN is
		do
			Result := (value=g_traverse_leaves_low_level)
		end

	is_g_traverse_mask: BOOLEAN is
		do
			Result := (value=g_traverse_mask_low_level)
		end

	is_g_traverse_non_leafs: BOOLEAN is
		do
			Result := (value=g_traverse_non_leafs_low_level)
		end

	is_g_traverse_non_leaves: BOOLEAN is
		do
			Result := (value=g_traverse_non_leaves_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_traverse_all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TRAVERSE_ALL"
 			}"
 		end

	g_traverse_leafs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TRAVERSE_LEAFS"
 			}"
 		end

	g_traverse_leaves_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TRAVERSE_LEAVES"
 			}"
 		end

	g_traverse_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TRAVERSE_MASK"
 			}"
 		end

	g_traverse_non_leafs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TRAVERSE_NON_LEAFS"
 			}"
 		end

	g_traverse_non_leaves_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TRAVERSE_NON_LEAVES"
 			}"
 		end


end -- class GTRAVERSE_FLAGS_ENUM
