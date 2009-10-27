-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_PRECURSOR_EXPRESSION

inherit
	LIBERTY_EXPRESSION

insert
	LIBERTY_PRECURSOR

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	result_type: LIBERTY_TYPE is
		do
			Result := the_feature.result_type
		end

	is_result_type_set: BOOLEAN is True

end
