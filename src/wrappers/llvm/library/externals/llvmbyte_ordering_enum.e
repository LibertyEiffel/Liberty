-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMBYTE_ORDERING_ENUM

insert ENUM

<<<<<<< HEAD
creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = llvmbig_endian_low_level)  or else
				(a_value = llvmlittle_endian_low_level) )
=======
create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = big_endian_low_level)  or else
				(a_value = little_endian_low_level) )
>>>>>>> c5fc6163e0cda7bb1c1dc8df91c46c66ff334c0a
		end

feature {ANY} -- Setters
	default_create,
	set_llvmbig_endian is
		do
			value := llvmbig_endian_low_level
		end

	set_llvmlittle_endian is
		do
			value := llvmlittle_endian_low_level
		end

<<<<<<< HEAD
feature -- Queries
	is_llvmbig_endian: BOOLEAN is
=======
feature {ANY} -- Queries
	big_endian: BOOLEAN is
>>>>>>> c5fc6163e0cda7bb1c1dc8df91c46c66ff334c0a
		do
			Result := (value=llvmbig_endian_low_level)
		end

	is_llvmlittle_endian: BOOLEAN is
		do
			Result := (value=llvmlittle_endian_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvmbig_endian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMBigEndian"
 			}"
 		end

	llvmlittle_endian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMLittleEndian"
 			}"
 		end


end -- class LLVMBYTE_ORDERING_ENUM
