expanded class REAL_32

insert
	REAL_GENERAL

feature {ANY} -- Conversions:
	to_real_64: REAL_64 is
			-- Explicit conversion to REAL_64.
		do
			Result := Current
		ensure
			Current = Result
		end

	to_real_extended: REAL_EXTENDED is
			-- Explicit conversion to REAL_EXTENDED.
		do
			Result := Current
		ensure
			Current = Result
		end

	to_real_80: REAL_80 is
			-- Explicit conversion to REAL_80.
		do
			Result := Current
		ensure
			Current = Result
		end

	to_real_128: REAL_128 is
			-- Explicit conversion to REAL_128.
		do
			Result := Current
		ensure
			Current = Result
		end

	force_to_integer_64: INTEGER_64 is
		external "built_in"
		end

	force_to_integer_32: INTEGER_32 is
		external "built_in"
		end

	force_to_integer_16: INTEGER_16 is
		external "built_in"
		end

	force_to_natural_64: NATURAL_64 is
		external "built_in"
		end

	force_to_natural_32: NATURAL_32 is
		external "built_in"
		end

	force_to_natural_16: NATURAL_16 is
		external "built_in"
		end

feature {ANY}
	zero: REAL_32 is {REAL_32 0.0}

	one: REAL_32 is {REAL_32 1.0}

	infix "~=" (other: like Current): BOOLEAN is
		do
			Result := (Current - other).abs * ({REAL_32 2.0} ^ (mantissa_bits - 3)) < Current.abs
		end

	hash_code: INTEGER is
		do
			Result := force_to_integer_32
			if Result < 0 then
				Result := -(Result + 1)
			end
		end

	mantissa_bits: INTEGER_8 is 23

	exponent_bits: INTEGER_8 is 8

feature {}
	sprintf (buffer: NATIVE_ARRAY[CHARACTER]; mode: CHARACTER; f: INTEGER; value: REAL_64) is
		external "plug_in"
		alias "{
			location: "${sys}/runtime"
			module_name: "basic_sprintf"
			feature_name: "sprintf_real_64"
			}"
		end

end -- class REAL_32
