-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_WMFUNCTION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gdk_func_all_low_level | 
				gdk_func_maximize_low_level | 
				gdk_func_minimize_low_level | 
				gdk_func_move_low_level | 
				gdk_func_resize_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gdk_func_all is
		do
			value := value.bit_or(gdk_func_all_low_level)
		end

	unset_gdk_func_all is
		do
			value := value.bit_xor(gdk_func_all_low_level)
		end

	set_gdk_func_maximize is
		do
			value := value.bit_or(gdk_func_maximize_low_level)
		end

	unset_gdk_func_maximize is
		do
			value := value.bit_xor(gdk_func_maximize_low_level)
		end

	set_gdk_func_minimize is
		do
			value := value.bit_or(gdk_func_minimize_low_level)
		end

	unset_gdk_func_minimize is
		do
			value := value.bit_xor(gdk_func_minimize_low_level)
		end

	set_gdk_func_move is
		do
			value := value.bit_or(gdk_func_move_low_level)
		end

	unset_gdk_func_move is
		do
			value := value.bit_xor(gdk_func_move_low_level)
		end

	set_gdk_func_resize is
		do
			value := value.bit_or(gdk_func_resize_low_level)
		end

	unset_gdk_func_resize is
		do
			value := value.bit_xor(gdk_func_resize_low_level)
		end

feature -- Queries
	is_gdk_func_all: BOOLEAN is
		do
			Result := (value=gdk_func_all_low_level)
		end

	is_gdk_func_maximize: BOOLEAN is
		do
			Result := (value=gdk_func_maximize_low_level)
		end

	is_gdk_func_minimize: BOOLEAN is
		do
			Result := (value=gdk_func_minimize_low_level)
		end

	is_gdk_func_move: BOOLEAN is
		do
			Result := (value=gdk_func_move_low_level)
		end

	is_gdk_func_resize: BOOLEAN is
		do
			Result := (value=gdk_func_resize_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_func_all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_FUNC_ALL"
 			}"
 		end

	gdk_func_maximize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_FUNC_MAXIMIZE"
 			}"
 		end

	gdk_func_minimize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_FUNC_MINIMIZE"
 			}"
 		end

	gdk_func_move_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_FUNC_MOVE"
 			}"
 		end

	gdk_func_resize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_FUNC_RESIZE"
 			}"
 		end


end -- class GDK_WMFUNCTION_ENUM
