indexing

	description: "Boolean GParamSpec"
	copyright: "Copyright (c) 2005, Paolo Redaelli"
	license: "LGPL"
	date: "$Date:  $"
	revision: "$ $"

class G_PARAM_SPEC_BOOLEAN

inherit

	G_PARAM_SPEC

creation
	make
	
feature -- Creation

	make (a_name,a_nick,a_blurb: STRING; a_default: BOOLEAN; some_flags) is
			-- Creates a new G_PARAM_SPEC_BOOLEAN.
			-- `a_name' is the canonical name of the property specified,
			-- `a_nick' is the nick name for the property specified,
			-- `a_blurb' is a description of the property specified.
			--`a_default' is the default value for the property
			--`some_flags' are flags for the property specified
		do
			make_from_pointer (g_param_spec_boolean(a_name.to_external,
																 a_nick.to_external,
																 a_blurb.to_external,
																 a_default.to_integer,
																 some_flags))
		end
	
feature
	default: BOOLEAN is
		do
			Result := default_gboolean.to_boolean
		end
end
	
