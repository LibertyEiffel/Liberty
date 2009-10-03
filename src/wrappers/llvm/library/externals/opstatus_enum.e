-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class OPSTATUS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = ok_low_level)  or else
				(a_value = divbyzero_low_level)  or else
				(a_value = overflow_low_level)  or else
				(a_value = underflow_low_level)  or else
				(a_value = inexact_low_level) )
		end

feature -- Setters
	default_create,
	set_ok is
		do
			value := ok_low_level
		end

	set_divbyzero is
		do
			value := divbyzero_low_level
		end

	set_overflow is
		do
			value := overflow_low_level
		end

	set_underflow is
		do
			value := underflow_low_level
		end

	set_inexact is
		do
			value := inexact_low_level
		end

feature -- Queries
	is_ok: BOOLEAN is
		do
			Result := (value=ok_low_level)
		end

	is_divbyzero: BOOLEAN is
		do
			Result := (value=divbyzero_low_level)
		end

	is_overflow: BOOLEAN is
		do
			Result := (value=overflow_low_level)
		end

	is_underflow: BOOLEAN is
		do
			Result := (value=underflow_low_level)
		end

	is_inexact: BOOLEAN is
		do
			Result := (value=inexact_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ok_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "opOK"
 			}"
 		end

	divbyzero_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "opDivByZero"
 			}"
 		end

	overflow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "opOverflow"
 			}"
 		end

	underflow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "opUnderflow"
 			}"
 		end

	inexact_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "opInexact"
 			}"
 		end


end -- class OPSTATUS_ENUM
