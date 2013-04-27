-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DICT_FIELD_ATTRIBUTE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (field_auto_increment)).to_boolean
		end


feature {ANY} -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_field_auto_increment is
		do
			value := value.bit_or(field_auto_increment)
		end

	unset_field_auto_increment is
		do
			value := value.bit_xor(field_auto_increment)
		end


feature {ANY} -- Queries
	is_field_auto_increment: BOOLEAN is
		do
			Result := (value &field_auto_increment).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	field_auto_increment: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "FIELD_AUTO_INCREMENT"
		end


end

