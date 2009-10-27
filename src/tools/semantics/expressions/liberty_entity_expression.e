class LIBERTY_ENTITY_EXPRESSION
	-- expressions like "entity"

inherit
	LIBERTY_EXPRESSION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	entity: LIBERTY_ENTITY

	result_type: LIBERTY_TYPE is
		do
			Result := entity.result_type
		end

feature {}
	make (a_entity: like entity) is
		require
			a_entity.result_type /= Void
		do
			entity := a_entity
		ensure
			entity = a_entity
		end

invariant
	entity /= Void

end
