-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKWINDOWHINTS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gdk_hint_aspect_low_level | 
				gdk_hint_max_size_low_level | 
				gdk_hint_min_size_low_level | 
				gdk_hint_pos_low_level | 
				gdk_hint_resize_inc_low_level | 
				gdk_hint_user_pos_low_level | 
				gdk_hint_user_size_low_level | 
				gdk_hint_win_gravity_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_hint_aspect is
		do
			value := value.bit_or(gdk_hint_aspect_low_level)
		end

	unset_gdk_hint_aspect is
		do
			value := value.bit_xor(gdk_hint_aspect_low_level)
		end

	set_gdk_hint_max_size is
		do
			value := value.bit_or(gdk_hint_max_size_low_level)
		end

	unset_gdk_hint_max_size is
		do
			value := value.bit_xor(gdk_hint_max_size_low_level)
		end

	set_gdk_hint_min_size is
		do
			value := value.bit_or(gdk_hint_min_size_low_level)
		end

	unset_gdk_hint_min_size is
		do
			value := value.bit_xor(gdk_hint_min_size_low_level)
		end

	set_gdk_hint_pos is
		do
			value := value.bit_or(gdk_hint_pos_low_level)
		end

	unset_gdk_hint_pos is
		do
			value := value.bit_xor(gdk_hint_pos_low_level)
		end

	set_gdk_hint_resize_inc is
		do
			value := value.bit_or(gdk_hint_resize_inc_low_level)
		end

	unset_gdk_hint_resize_inc is
		do
			value := value.bit_xor(gdk_hint_resize_inc_low_level)
		end

	set_gdk_hint_user_pos is
		do
			value := value.bit_or(gdk_hint_user_pos_low_level)
		end

	unset_gdk_hint_user_pos is
		do
			value := value.bit_xor(gdk_hint_user_pos_low_level)
		end

	set_gdk_hint_user_size is
		do
			value := value.bit_or(gdk_hint_user_size_low_level)
		end

	unset_gdk_hint_user_size is
		do
			value := value.bit_xor(gdk_hint_user_size_low_level)
		end

	set_gdk_hint_win_gravity is
		do
			value := value.bit_or(gdk_hint_win_gravity_low_level)
		end

	unset_gdk_hint_win_gravity is
		do
			value := value.bit_xor(gdk_hint_win_gravity_low_level)
		end

feature {ANY} -- Queries
	is_gdk_hint_aspect: BOOLEAN is
		do
			Result := (value=gdk_hint_aspect_low_level)
		end

	is_gdk_hint_max_size: BOOLEAN is
		do
			Result := (value=gdk_hint_max_size_low_level)
		end

	is_gdk_hint_min_size: BOOLEAN is
		do
			Result := (value=gdk_hint_min_size_low_level)
		end

	is_gdk_hint_pos: BOOLEAN is
		do
			Result := (value=gdk_hint_pos_low_level)
		end

	is_gdk_hint_resize_inc: BOOLEAN is
		do
			Result := (value=gdk_hint_resize_inc_low_level)
		end

	is_gdk_hint_user_pos: BOOLEAN is
		do
			Result := (value=gdk_hint_user_pos_low_level)
		end

	is_gdk_hint_user_size: BOOLEAN is
		do
			Result := (value=gdk_hint_user_size_low_level)
		end

	is_gdk_hint_win_gravity: BOOLEAN is
		do
			Result := (value=gdk_hint_win_gravity_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_hint_aspect_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_HINT_ASPECT"
 			}"
 		end

	gdk_hint_max_size_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_HINT_MAX_SIZE"
 			}"
 		end

	gdk_hint_min_size_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_HINT_MIN_SIZE"
 			}"
 		end

	gdk_hint_pos_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_HINT_POS"
 			}"
 		end

	gdk_hint_resize_inc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_HINT_RESIZE_INC"
 			}"
 		end

	gdk_hint_user_pos_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_HINT_USER_POS"
 			}"
 		end

	gdk_hint_user_size_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_HINT_USER_SIZE"
 			}"
 		end

	gdk_hint_win_gravity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_HINT_WIN_GRAVITY"
 			}"
 		end


end -- class GDKWINDOWHINTS_ENUM
