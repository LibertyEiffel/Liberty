-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GASK_PASSWORD_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (g_ask_password_anonymous_supported_low_level | 
				g_ask_password_need_password_low_level | 
				g_ask_password_need_username_low_level | 
				g_ask_password_saving_supported_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_g_ask_password_anonymous_supported is
		do
			value := value.bit_or(g_ask_password_anonymous_supported_low_level)
		end

	unset_g_ask_password_anonymous_supported is
		do
			value := value.bit_xor(g_ask_password_anonymous_supported_low_level)
		end

	set_g_ask_password_need_password is
		do
			value := value.bit_or(g_ask_password_need_password_low_level)
		end

	unset_g_ask_password_need_password is
		do
			value := value.bit_xor(g_ask_password_need_password_low_level)
		end

	set_g_ask_password_need_username is
		do
			value := value.bit_or(g_ask_password_need_username_low_level)
		end

	unset_g_ask_password_need_username is
		do
			value := value.bit_xor(g_ask_password_need_username_low_level)
		end

	set_g_ask_password_saving_supported is
		do
			value := value.bit_or(g_ask_password_saving_supported_low_level)
		end

	unset_g_ask_password_saving_supported is
		do
			value := value.bit_xor(g_ask_password_saving_supported_low_level)
		end

feature -- Queries
	is_g_ask_password_anonymous_supported: BOOLEAN is
		do
			Result := (value=g_ask_password_anonymous_supported_low_level)
		end

	is_g_ask_password_need_password: BOOLEAN is
		do
			Result := (value=g_ask_password_need_password_low_level)
		end

	is_g_ask_password_need_username: BOOLEAN is
		do
			Result := (value=g_ask_password_need_username_low_level)
		end

	is_g_ask_password_saving_supported: BOOLEAN is
		do
			Result := (value=g_ask_password_saving_supported_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_ask_password_anonymous_supported_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASK_PASSWORD_ANONYMOUS_SUPPORTED"
 			}"
 		end

	g_ask_password_need_password_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASK_PASSWORD_NEED_PASSWORD"
 			}"
 		end

	g_ask_password_need_username_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASK_PASSWORD_NEED_USERNAME"
 			}"
 		end

	g_ask_password_saving_supported_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASK_PASSWORD_SAVING_SUPPORTED"
 			}"
 		end


end -- class GASK_PASSWORD_FLAGS_ENUM
