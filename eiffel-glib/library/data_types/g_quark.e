indexing
	description: "Quarks -- a 2-way association between a string and a unique integer identifier."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"
	
expanded class G_QUARK
inherit ANY  redefine is_equal end	
insert G_QUARK_EXTERNALS undefine is_equal end
	
creation
	default_create,
	from_string,
	try_string
	
feature 
	quark: INTEGER_32
			-- Integer representation. TODO: Shall be instead a
			-- NATURAL_32 since in C it's a guint32

	from_string (a_string: STRING) is
			-- Retrieve the G_QUARK identifying `a_string'. If the string
			-- does not currently have an associated G_QUARK, a new
			-- G_Quark is created, using a copy of the string.
		require valid_string: a_string/=Void
		do
			quark:=g_quark_from_string (a_string.to_external)
		ensure valid: is_valid
		end


	to_string: STRING is
			-- The string associated with the Current G_QUARK.
		do
			-- Note: using from_external_copy since g_quark_to_string
			-- returns a `const gchar*' that AFAIK shall not be freed by
			-- Eiffel as it doesn't own it.
			create Result.from_external_copy (g_quark_to_string (quark))
		ensure valid_result: Result/=Void
		end

	try_string (a_string: STRING) is
			-- Retrieves the G_QUARK associated with the given
			-- string. `is_valid' will be false if the string has no
			-- associated G_QUARK. If you want the G_QUARK to be created
			-- if it doesn't already exist, use from_string
		require valid_string: a_string/=Void
		do
			quark:=g_quark_try_string (a_string.to_external)
		end

	is_valid: BOOLEAN is
			-- Is Current a valid G_QUARK, linked to a string?
		do
			Result := (quark/=0)
		end

	is_equal (other: G_QUARK): BOOLEAN is
		do
			Result := (quark = other.quark)
		end
end
