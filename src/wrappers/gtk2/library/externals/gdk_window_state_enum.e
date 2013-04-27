-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_WINDOW_STATE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gdk_window_state_above_low_level | 
				gdk_window_state_fullscreen_low_level | 
				gdk_window_state_iconified_low_level | 
				gdk_window_state_maximized_low_level | 
				gdk_window_state_sticky_low_level | 
				gdk_window_state_withdrawn_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gdk_window_state_above is
		do
			value := value.bit_or(gdk_window_state_above_low_level)
		end

	unset_gdk_window_state_above is
		do
			value := value.bit_xor(gdk_window_state_above_low_level)
		end

	set_gdk_window_state_fullscreen is
		do
			value := value.bit_or(gdk_window_state_fullscreen_low_level)
		end

	unset_gdk_window_state_fullscreen is
		do
			value := value.bit_xor(gdk_window_state_fullscreen_low_level)
		end

	set_gdk_window_state_iconified is
		do
			value := value.bit_or(gdk_window_state_iconified_low_level)
		end

	unset_gdk_window_state_iconified is
		do
			value := value.bit_xor(gdk_window_state_iconified_low_level)
		end

	set_gdk_window_state_maximized is
		do
			value := value.bit_or(gdk_window_state_maximized_low_level)
		end

	unset_gdk_window_state_maximized is
		do
			value := value.bit_xor(gdk_window_state_maximized_low_level)
		end

	set_gdk_window_state_sticky is
		do
			value := value.bit_or(gdk_window_state_sticky_low_level)
		end

	unset_gdk_window_state_sticky is
		do
			value := value.bit_xor(gdk_window_state_sticky_low_level)
		end

	set_gdk_window_state_withdrawn is
		do
			value := value.bit_or(gdk_window_state_withdrawn_low_level)
		end

	unset_gdk_window_state_withdrawn is
		do
			value := value.bit_xor(gdk_window_state_withdrawn_low_level)
		end

feature -- Queries
	is_gdk_window_state_above: BOOLEAN is
		do
			Result := (value=gdk_window_state_above_low_level)
		end

	is_gdk_window_state_fullscreen: BOOLEAN is
		do
			Result := (value=gdk_window_state_fullscreen_low_level)
		end

	is_gdk_window_state_iconified: BOOLEAN is
		do
			Result := (value=gdk_window_state_iconified_low_level)
		end

	is_gdk_window_state_maximized: BOOLEAN is
		do
			Result := (value=gdk_window_state_maximized_low_level)
		end

	is_gdk_window_state_sticky: BOOLEAN is
		do
			Result := (value=gdk_window_state_sticky_low_level)
		end

	is_gdk_window_state_withdrawn: BOOLEAN is
		do
			Result := (value=gdk_window_state_withdrawn_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_window_state_above_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WINDOW_STATE_ABOVE"
 			}"
 		end

	gdk_window_state_fullscreen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WINDOW_STATE_FULLSCREEN"
 			}"
 		end

	gdk_window_state_iconified_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WINDOW_STATE_ICONIFIED"
 			}"
 		end

	gdk_window_state_maximized_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WINDOW_STATE_MAXIMIZED"
 			}"
 		end

	gdk_window_state_sticky_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WINDOW_STATE_STICKY"
 			}"
 		end

	gdk_window_state_withdrawn_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WINDOW_STATE_WITHDRAWN"
 			}"
 		end


end -- class GDK_WINDOW_STATE_ENUM
