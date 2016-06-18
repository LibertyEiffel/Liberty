-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATOMIC_ORDERING_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = acquire_low_level)  or else
				(a_value = acquire_release_low_level)  or else
				(a_value = monotonic_low_level)  or else
				(a_value = not_atomic_low_level)  or else
				(a_value = release_low_level)  or else
				(a_value = sequentially_consistent_low_level)  or else
				(a_value = unordered_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_acquire
		do
			value := acquire_low_level
		end

	set_acquire_release
		do
			value := acquire_release_low_level
		end

	set_monotonic
		do
			value := monotonic_low_level
		end

	set_not_atomic
		do
			value := not_atomic_low_level
		end

	set_release
		do
			value := release_low_level
		end

	set_sequentially_consistent
		do
			value := sequentially_consistent_low_level
		end

	set_unordered
		do
			value := unordered_low_level
		end

feature {ANY} -- Queries
	is_acquire: BOOLEAN
		do
			Result := (value=acquire_low_level)
		end

	is_acquire_release: BOOLEAN
		do
			Result := (value=acquire_release_low_level)
		end

	is_monotonic: BOOLEAN
		do
			Result := (value=monotonic_low_level)
		end

	is_not_atomic: BOOLEAN
		do
			Result := (value=not_atomic_low_level)
		end

	is_release: BOOLEAN
		do
			Result := (value=release_low_level)
		end

	is_sequentially_consistent: BOOLEAN
		do
			Result := (value=sequentially_consistent_low_level)
		end

	is_unordered: BOOLEAN
		do
			Result := (value=unordered_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	acquire_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Acquire"
 			}"
 		end

	acquire_release_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "AcquireRelease"
 			}"
 		end

	monotonic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Monotonic"
 			}"
 		end

	not_atomic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "NotAtomic"
 			}"
 		end

	release_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Release"
 			}"
 		end

	sequentially_consistent_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "SequentiallyConsistent"
 			}"
 		end

	unordered_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Unordered"
 			}"
 		end


end -- class ATOMIC_ORDERING_ENUM
