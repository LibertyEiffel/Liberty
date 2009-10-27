-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_CALL_EXPRESSION

inherit
	LIBERTY_EXPRESSION

insert
	LIBERTY_CALL

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	result_type: LIBERTY_TYPE is
		do
			Result := entity.result_type
		end

	is_result_type_set: BOOLEAN is
		do
			Result := entity.is_result_type_set
		end

end
