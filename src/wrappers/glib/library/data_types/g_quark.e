indexing
	description: "Quarks a 2-way association between a string and a unique integer identifier."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$REvision:$"
	
expanded class G_QUARK

insert
	ANY
	GQUARK_EXTERNALS
	
create {ANY}
	default_create,
	from_string,
	try_string

feature {ANY}
	quark: NATURAL_32 
	-- The numeric representation of the quark.

	from_string (a_string: STRING) is
			-- Retrieve the G_QUARK identifying `a_string'. If the string
			-- does not currently have an associated G_QUARK, a new
			-- G_Quark is created, using a copy of the string.
		require valid_string: a_string /= Void
		do
			quark := g_quark_from_string (a_string.to_external)
		ensure
			valid: is_valid
		end

	to_string: FIXED_STRING is
			-- The string associated with the Current G_QUARK.
		require
			is_valid
		do
			create Result.from_external (g_quark_to_string (quark))
		ensure
			valid_result: Result /= Void
		end

	try_string (a_string: STRING) is
			-- Retrieves the G_QUARK associated with the given
			-- string. `is_valid' will be false if the string has no
			-- associated G_QUARK. If you want the G_QUARK to be created
			-- if it doesn't already exist, use from_string
		require valid_string: a_string /= Void
		do
			quark := g_quark_try_string (a_string.to_external)
		end

	is_valid: BOOLEAN is
			-- Is Current a valid G_QUARK, linked to a string?
		do
			Result := (quark /= 0.to_natural_32)
		end

	set_quark (a_quark: like quark) is
		do
			quark := a_quark
		ensure
			quark = a_quark
		end

end
