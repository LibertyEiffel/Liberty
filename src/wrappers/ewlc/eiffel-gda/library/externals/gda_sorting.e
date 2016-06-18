-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_SORTING
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_sorting_ascending) or else 
				(a_value = gda_sorting_descending))
		end


feature {ANY} -- Setters
	default_create, set_gda_sorting_ascending
		do
			value := gda_sorting_ascending
		end

	set_gda_sorting_descending
		do
			value := gda_sorting_descending
		end


feature {ANY} -- Queries
	is_gda_sorting_ascending: BOOLEAN
		do
			Result := (value=gda_sorting_ascending)
		end

	is_gda_sorting_descending: BOOLEAN
		do
			Result := (value=gda_sorting_descending)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_sorting_ascending: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SORTING_ASCENDING"
		end

	gda_sorting_descending: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SORTING_DESCENDING"
		end


end

