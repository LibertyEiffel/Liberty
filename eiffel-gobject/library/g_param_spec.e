indexing

	description: "GParamSpec, Metadata for parameter specifications"
	long: "[
			 GParamSpec is an object structure that encapsulates the metadata required to specify parameters, such as e.g. GObject properties.

			 Parameter names need to start with a letter (a-z or A-Z). Subsequent characters can be letters, numbers or a '-'. All other characters are replaced by a '-' during construction.
			 ]"
	copyright: "Copyright (c) 2005, Paolo Redaelli"
	license: "LGPL"
	date: "$Date:  $"
	revision: "$ $"

deferred class G_PARAM_SPEC

inherit

	C_STRUCT
	G_PARAM_SPEC_EXTERNALS

feature -- Flags
	is_readable: BOOLEAN is
			-- Is Current parameter readable?
		do
			Result:= flags.bit_test(g_param_readable_bit)
		end
	is_writable: BOOLEAN is
			-- Is Current parameter writable?
		do
			Result:= flags.bit_test(g_param_writable_bit)
		end
	is_set_at_construction: BOOLEAN is
			-- Will the parameter be set upon object construction?
		do
			Result:= flags.bit_test(g_param_construct_bit)
		end
	is_set_only_at_construction: BOOLEAN is
			-- Will the parameter only be set upon object construction?
		do
			Result:= flags.bit_test(g_param_construct_only_bit)
		end
	is_readable: BOOLEAN is
			-- Is strict validation not required upon parameter conversion? (see `convert') 
		do
			Result:= flags.bit_test(g_param_lax_validation_bit)
		end
	is_static_name: BOOLEAN is
			-- Is the string used as name when constructing the parameter
			-- guaranteed to remain valid and unmodified for the lifetime
			-- of the parameter?
		do
			Result:= flags.bit_test(g_param_static_name_bit)
		end
	is_static_blurb: BOOLEAN is
			-- Is the string used as blurb when constructing the parameter
			-- guaranteed to remain valid and unmodified for the lifetime
			-- of the parameter?
		do
			Result:= flags.bit_test(g_param_static_blurb_bit)
		end

	is_readwrite: BOOLEAN is
			-- Is parameter read/write?
		do
			Result := is_readable and is_writable
		end

feature
	set_default (a_value: G_VALUE) is
			-- Sets `a_value' to its default value as specified in Current.
		require valid_value: a_value /= Void
			-- TODO a GValue of correct type for current
		do
			g_param_value_set_default (handle, a_value.handle)
		end

	is_default (a_value: G_VALUE): BOOLEAN is
			-- Does `a_value' contains the default value specified in
			-- Current?
		require valid_value: a_value /= Void
			-- TODO a GValue of correct type for current
		do
			Result:=(g_param_value_defaults(handle,a_value.handle)).to_boolean
		end

	validate (a_value: G_VALUE): BOOLEAN is
			-- Has `a_value' to be changed to comply with the
			-- specifications set out by Current? For example, a
			-- G_PARAM_SPEC_INT might require that integers stored in
			-- value may not be smaller than -42 and not be greater than
			-- +42. If value contains an integer outside of this range,
			-- it is modified accordingly, so the resulting value will
			-- fit into the range -42 .. +42.
		require valid_value: a_value /= Void
			-- TODO a GValue of correct type for current
		do
			Result:=(g_param_value_validate(handle,a_value.handle)).to_boolean
		end

	convert (a_source, a_destination: G_VALUE; strict_validataion: BOOLEAN): BOOLEAN is
			-- Transforms `a_source' into `a_destination' if possible,
			-- and then validates `a_destination', in order for it to
			-- conform to Current. If `strict_validation' is True this
			-- function will only succeed if the transformed
			-- `a_destination' complied to Current without
			-- modifications. True if transformation and validation were
			-- successful, False otherwise and dest_value is left
			-- untouched.
		require -- TODO valid destination of corret type for Current
		do
			Result:=(g_param_value_convert(handle,
													 a_source.handle, a_destination.handle,
													 strict_validation)).to_boolean
		end

	compare (value1,value2: G_VALUE): INTEGER is
			-- Compares value1 with value2 according to Current, and
			-- return -1, 0 or +1, if value1 is found to be less than,
			-- equal to or greater than value2, respectively.
		require -- TODO value1 and 2: a GValue of correct type for pspec
		do
			Result := (g_param_values_cmp (handle,value1.handle,value2.handle))
		end
	

feature -- queries
	name: STRING is
			-- the name of a G_PARAM_SPEC
		do
			create Result.from_external_copy(g_param_spec_get_name(handle))
		end

	nick: STRING is
			-- the nick of a G_PARAM_SPEC
		do
			create Result.from_external_copy(g_param_spec_get_nick(handle))
		end
	
	blurb: STRING is
			-- the blurb of a G_PARAM_SPEC
		do
			create Result.from_external_copy(g_param_spec_get_blurb(handle))
		end

feature -- name validity
	is_a_valid_name (a_string: STRING): BOOLEAN is
			-- Does `a_string' comply with the rules for G_PARAM_SPEC names?
		do
			-- When creating and looking up a GParamSpec, either separator can be used, but they cannot be mixed. Using '-' is considerably more efficient and in fact required when using property names as detail strings for signals.
			not_yet_implemented
		end
end
	
