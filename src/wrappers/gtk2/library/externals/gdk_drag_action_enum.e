-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_DRAG_ACTION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gdk_action_ask_low_level | 
				gdk_action_default_low_level | 
				gdk_action_link_low_level | 
				gdk_action_move_low_level | 
				gdk_action_private_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gdk_action_ask is
		do
			value := value.bit_or(gdk_action_ask_low_level)
		end

	unset_gdk_action_ask is
		do
			value := value.bit_xor(gdk_action_ask_low_level)
		end

	set_gdk_action_default is
		do
			value := value.bit_or(gdk_action_default_low_level)
		end

	unset_gdk_action_default is
		do
			value := value.bit_xor(gdk_action_default_low_level)
		end

	set_gdk_action_link is
		do
			value := value.bit_or(gdk_action_link_low_level)
		end

	unset_gdk_action_link is
		do
			value := value.bit_xor(gdk_action_link_low_level)
		end

	set_gdk_action_move is
		do
			value := value.bit_or(gdk_action_move_low_level)
		end

	unset_gdk_action_move is
		do
			value := value.bit_xor(gdk_action_move_low_level)
		end

	set_gdk_action_private is
		do
			value := value.bit_or(gdk_action_private_low_level)
		end

	unset_gdk_action_private is
		do
			value := value.bit_xor(gdk_action_private_low_level)
		end

feature -- Queries
	is_gdk_action_ask: BOOLEAN is
		do
			Result := (value=gdk_action_ask_low_level)
		end

	is_gdk_action_default: BOOLEAN is
		do
			Result := (value=gdk_action_default_low_level)
		end

	is_gdk_action_link: BOOLEAN is
		do
			Result := (value=gdk_action_link_low_level)
		end

	is_gdk_action_move: BOOLEAN is
		do
			Result := (value=gdk_action_move_low_level)
		end

	is_gdk_action_private: BOOLEAN is
		do
			Result := (value=gdk_action_private_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_action_ask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_ACTION_ASK"
 			}"
 		end

	gdk_action_default_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_ACTION_DEFAULT"
 			}"
 		end

	gdk_action_link_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_ACTION_LINK"
 			}"
 		end

	gdk_action_move_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_ACTION_MOVE"
 			}"
 		end

	gdk_action_private_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_ACTION_PRIVATE"
 			}"
 		end


end -- class GDK_DRAG_ACTION_ENUM
