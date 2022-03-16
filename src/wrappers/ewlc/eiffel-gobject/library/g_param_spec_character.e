note

	description: "Character GParamSpec"
	copyright: "Copyright (C) 2005-2022: , Paolo Redaelli"
	license: "LGPL"
	date: "$Date:  $"
	revision: "$ $"

class G_PARAM_SPEC_CHARACTER

inherit G_PARAM_SPEC

create {ANY} make
	
feature {ANY} -- Creation

	make (a_name,a_nick,a_blurb: STRING;
			a_min,a_max,a_default: CHARACTER; some_flags: INTEGER)
			-- Creates a new G_PARAM_SPEC_BOOLEAN.
			-- `a_name' is the canonical name of the property specified,
			-- `a_nick' is the nick name for the property specified,
			-- `a_blurb' is a description of the property specified.
			--`a_default' is the default value for the property
			--`some_flags' are flags for the property specified
		do
			from_external_pointer (g_param_spec_char
										  (a_name.to_external, a_nick.to_external, a_blurb.to_external,
											a_min.to_integer_8, a_max.to_integer_8, a_default.to_integer_8,
											some_flags))
		end

end
	
