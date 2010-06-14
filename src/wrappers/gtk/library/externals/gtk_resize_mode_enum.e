-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_RESIZE_MODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = parent_low_level)  or else
				(a_value = queue_low_level)  or else
				(a_value = immediate_low_level) )
		end

feature -- Setters
	default_create,
	set_parent is
		do
			value := parent_low_level
		end

	set_queue is
		do
			value := queue_low_level
		end

	set_immediate is
		do
			value := immediate_low_level
		end

feature -- Queries
	is_parent: BOOLEAN is
		do
			Result := (value=parent_low_level)
		end

	is_queue: BOOLEAN is
		do
			Result := (value=queue_low_level)
		end

	is_immediate: BOOLEAN is
		do
			Result := (value=immediate_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	parent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESIZE_PARENT"
 			}"
 		end

	queue_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESIZE_QUEUE"
 			}"
 		end

	immediate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESIZE_IMMEDIATE"
 			}"
 		end


end -- class GTK_RESIZE_MODE_ENUM
