-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_PARAM_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_param_readable) or else 
				(a_value = g_param_writable) or else 
				(a_value = g_param_construct) or else 
				(a_value = g_param_construct_only) or else 
				(a_value = g_param_lax_validation) or else 
				(a_value = g_param_static_name) or else 
				(a_value = g_param_private) or else 
				(a_value = g_param_static_nick) or else 
				(a_value = g_param_static_blurb))
		end


feature {ANY} -- Setters
	default_create, set_readable is
		do
			value := g_param_readable
		end

	set_writable is
		do
			value := g_param_writable
		end

	set_construct is
		do
			value := g_param_construct
		end

	set_construct_only is
		do
			value := g_param_construct_only
		end

	set_lax_validation is
		do
			value := g_param_lax_validation
		end

	set_static_name is
		do
			value := g_param_static_name
		end

	set_private is
		do
			value := g_param_private
		end

	set_static_nick is
		do
			value := g_param_static_nick
		end

	set_static_blurb is
		do
			value := g_param_static_blurb
		end


feature {ANY} -- Queries
	is_readable: BOOLEAN is
		do
			Result := (value=g_param_readable)
		end

	is_writable: BOOLEAN is
		do
			Result := (value=g_param_writable)
		end

	is_construct: BOOLEAN is
		do
			Result := (value=g_param_construct)
		end

	is_construct_only: BOOLEAN is
		do
			Result := (value=g_param_construct_only)
		end

	is_lax_validation: BOOLEAN is
		do
			Result := (value=g_param_lax_validation)
		end

	is_static_name: BOOLEAN is
		do
			Result := (value=g_param_static_name)
		end

	is_private: BOOLEAN is
		do
			Result := (value=g_param_private)
		end

	is_static_nick: BOOLEAN is
		do
			Result := (value=g_param_static_nick)
		end

	is_static_blurb: BOOLEAN is
		do
			Result := (value=g_param_static_blurb)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_param_readable: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_READABLE"
		end

	g_param_writable: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_WRITABLE"
		end

	g_param_construct: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_CONSTRUCT"
		end

	g_param_construct_only: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_CONSTRUCT_ONLY"
		end

	g_param_lax_validation: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_LAX_VALIDATION"
		end

	g_param_static_name: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_STATIC_NAME"
		end

	g_param_private: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_PRIVATE"
		end

	g_param_static_nick: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_STATIC_NICK"
		end

	g_param_static_blurb: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_STATIC_BLURB"
		end


end

