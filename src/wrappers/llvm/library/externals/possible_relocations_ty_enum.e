-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class POSSIBLE_RELOCATIONS_TY_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = global_relocations_low_level)  or else
				(a_value = local_relocation_low_level)  or else
				(a_value = no_relocation_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_global_relocations is
		do
			value := global_relocations_low_level
		end

	set_local_relocation is
		do
			value := local_relocation_low_level
		end

	set_no_relocation is
		do
			value := no_relocation_low_level
		end

feature {ANY} -- Queries
	is_global_relocations: BOOLEAN is
		do
			Result := (value=global_relocations_low_level)
		end

	is_local_relocation: BOOLEAN is
		do
			Result := (value=local_relocation_low_level)
		end

	is_no_relocation: BOOLEAN is
		do
			Result := (value=no_relocation_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	global_relocations_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GlobalRelocations"
 			}"
 		end

	local_relocation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LocalRelocation"
 			}"
 		end

	no_relocation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "NoRelocation"
 			}"
 		end


end -- class POSSIBLE_RELOCATIONS_TY_ENUM
