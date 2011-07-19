expanded class UNSIGNED_INT_WRAPPER

external "plug_in"
alias "{
	location: "."
	module_name: "plugin"
	type_name: "unsigned_int"
	default_value: "unsigned_int_default"
	}"

creation {ANY}
	default_create, from_integer_64

feature {ANY}
	as_integer_64: INTEGER_64 is
		do
			Result := to_integer_64(Current)
		end

feature {}
	from_integer_64 (value: INTEGER_64) is
		do
			set_from_integer_64(Current, value)
		end

	to_integer_64 (c: like Current): INTEGER_64 is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "unsigned_int_cast"
			}"
		end

	set_from_integer_64 (c: like Current; value: INTEGER_64) is
			-- This uses a macro to walk around expanded types' 
			-- paas-by-value convention. It only works if c actually 
			-- /is/ Current.
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "unsigned_int_set"
			}"
		end

end
