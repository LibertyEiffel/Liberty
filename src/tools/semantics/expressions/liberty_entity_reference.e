-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_ENTITY_REFERENCE
	-- expressions like "$entity"

inherit
	LIBERTY_EXPRESSION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	entity: LIBERTY_ENTITY
	result_type: LIBERTY_TYPE

	is_result_type_set: BOOLEAN is True

feature {}
	make (type: like result_type; a_entity: like entity) is
		require
			type /= Void -- type is POINTER
			a_entity /= Void
		do
			result_type := type
			entity := a_entity
		ensure
			result_type = type
			entity = a_entity
		end

invariant
	result_type /= Void -- result_type is POINTER
	entity /= Void

end
