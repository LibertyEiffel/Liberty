-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKRESIZEMODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_resize_immediate_low_level)  or else
				(a_value = gtk_resize_parent_low_level)  or else
				(a_value = gtk_resize_queue_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_resize_immediate is
		do
			value := gtk_resize_immediate_low_level
		end

	set_gtk_resize_parent is
		do
			value := gtk_resize_parent_low_level
		end

	set_gtk_resize_queue is
		do
			value := gtk_resize_queue_low_level
		end

feature {ANY} -- Queries
	is_gtk_resize_immediate: BOOLEAN is
		do
			Result := (value=gtk_resize_immediate_low_level)
		end

	is_gtk_resize_parent: BOOLEAN is
		do
			Result := (value=gtk_resize_parent_low_level)
		end

	is_gtk_resize_queue: BOOLEAN is
		do
			Result := (value=gtk_resize_queue_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_resize_immediate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESIZE_IMMEDIATE"
 			}"
 		end

	gtk_resize_parent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESIZE_PARENT"
 			}"
 		end

	gtk_resize_queue_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESIZE_QUEUE"
 			}"
 		end


end -- class GTKRESIZEMODE_ENUM
