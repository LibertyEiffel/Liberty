indexing
	description: "Enum GParamFlags -- Through the GParamFlags flag values, certain aspects of parameters can be configured."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class G_PARAM_FLAGS
feature  -- enum
	are_valid_param_flags (some_flags :INTEGER): BOOLEAN is
		do	
			Result:=((some_flags = g_param_readable) or else
						(some_flags = g_param_writable) or else       
						(some_flags = g_param_construct) or else	    
						(some_flags = g_param_construct_only) or else 
						(some_flags = g_param_lax_validation) or else 
						(some_flags = g_param_static_name) or else	 
						(some_flags = g_param_static_nick) or else	 
						(some_flags = g_param_static_blurb))
		end


	g_param_readable: INTEGER is
			-- the parameter is readable
		external "C macro use <glib-object.h>"
		alias "G_PARAM_READABLE"
		end

	g_param_writable: INTEGER is
			-- the parameter is writable
		external "C macro use <glib-object.h>"
		alias "G_PARAM_WRITABLE"
		end

	g_param_construct: INTEGER is
			-- the parameter will be set upon object construction
		external "C macro use <glib-object.h>"
		alias "G_PARAM_CONSTRUCT"
		end

	g_param_construct_only: INTEGER is
			-- the parameter will only be set upon object construction
		external "C macro use <glib-object.h>"
		alias "G_PARAM_CONSTRUCT_ONLY"
		end

	g_param_lax_validation: INTEGER is
			-- upon parameter conversion (see g_param_value_convert())
			-- strict validation is not required
		external "C macro use <glib-object.h>"
		alias "G_PARAM_LAX_VALIDATION"
		end

	g_param_static_name: INTEGER is
			-- the string used as name when constructing the parameter is
			-- guaranteed to remain valid and unmodified for the lifetime
			-- of the parameter. Since 2.8
		external "C macro use <glib-object.h>"
		alias "G_PARAM_STATIC_NAME"
		end

	g_param_static_nick: INTEGER is
			-- the string used as nick when constructing the parameter is
			-- guaranteed to remain valid and unmodified for the lifetime
			-- of the parameter. Since 2.8
		external "C macro use <glib-object.h>"
		alias "G_PARAM_STATIC_NICK"
		end

	g_param_static_blurb: INTEGER is
			-- the string used as blurb when constructing the parameter
			-- is guaranteed to remain valid and unmodified for the
			-- lifetime of the parameter. Since 2.8
		external "C macro use <glib-object.h>"
		alias "G_PARAM_STATIC_BLURB"
		end

	g_param_readwrite: INTEGER is
			-- GParamFlags value alias for G_PARAM_READABLE | G_PARAM_WRITABLE.
		external "C macro use <glib-object.h>"
		alias "G_PARAM_READWRITE"
		end

	g_param_mask: INTEGER is
			-- Mask containing the bits of GParamSpec.flags which are reserved for GLib.
		external "C macro use <glib-object.h>"
		alias "G_PARAM_MASK"
		end
	
	g_param_user_shift: INTEGER is
			-- Minimum shift count to be used for user defined flags, to
			-- be stored in GParamSpec.flags.
		external "C macro use <glib-object.h>"
		alias "G_PARAM_USER_SHIFT"
		end
end
