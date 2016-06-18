-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_PARAM_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
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
	default_create, set_readable
		do
			value := g_param_readable
		end

	set_writable
		do
			value := g_param_writable
		end

	set_construct
		do
			value := g_param_construct
		end

	set_construct_only
		do
			value := g_param_construct_only
		end

	set_lax_validation
		do
			value := g_param_lax_validation
		end

	set_static_name
		do
			value := g_param_static_name
		end

	set_private
		do
			value := g_param_private
		end

	set_static_nick
		do
			value := g_param_static_nick
		end

	set_static_blurb
		do
			value := g_param_static_blurb
		end


feature {ANY} -- Queries
	is_readable: BOOLEAN
		do
			Result := (value=g_param_readable)
		end

	is_writable: BOOLEAN
		do
			Result := (value=g_param_writable)
		end

	is_construct: BOOLEAN
		do
			Result := (value=g_param_construct)
		end

	is_construct_only: BOOLEAN
		do
			Result := (value=g_param_construct_only)
		end

	is_lax_validation: BOOLEAN
		do
			Result := (value=g_param_lax_validation)
		end

	is_static_name: BOOLEAN
		do
			Result := (value=g_param_static_name)
		end

	is_private: BOOLEAN
		do
			Result := (value=g_param_private)
		end

	is_static_nick: BOOLEAN
		do
			Result := (value=g_param_static_nick)
		end

	is_static_blurb: BOOLEAN
		do
			Result := (value=g_param_static_blurb)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_param_readable: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_READABLE"
		end

	g_param_writable: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_WRITABLE"
		end

	g_param_construct: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_CONSTRUCT"
		end

	g_param_construct_only: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_CONSTRUCT_ONLY"
		end

	g_param_lax_validation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_LAX_VALIDATION"
		end

	g_param_static_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_STATIC_NAME"
		end

	g_param_private: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_PRIVATE"
		end

	g_param_static_nick: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_STATIC_NICK"
		end

	g_param_static_blurb: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_PARAM_STATIC_BLURB"
		end


end

