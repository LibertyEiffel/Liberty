note
	description: "Integer GParamSpec"
	copyright: "Copyright (c) 2005, Paolo Redaelli"
	license: "LGPL"
	date: "$Date:  $"
	revision: "$ $"

class G_PARAM_SPEC_INTEGER

inherit
	G_PARAM_SPEC
		redefine
			struct_size
		end

create {ANY}
	make, from_external_pointer
	
feature {ANY} -- Creation

	make (a_name,a_nick,a_blurb: STRING;
			a_min,a_max,a_default: INTEGER; some_flags: INTEGER) is
			-- Creates a new G_PARAM_SPEC_BOOLEAN.
			-- `a_name' is the canonical name of the property specified,
			-- `a_nick' is the nick name for the property specified,
			-- `a_blurb' is a description of the property specified.
			--`a_default' is the default value for the property
			--`some_flags' are flags for the property specified
		do
			from_external_pointer (g_param_spec_int
										  (a_name.to_external, a_nick.to_external, a_blurb.to_external,
											a_min, a_max, a_default, some_flags))
		end
	
feature {ANY}
	struct_size: INTEGER is
		external "C use <glib-object.h>"
		alias "sizeof(GParamSpecInt)"
		end
end
	
