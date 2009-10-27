-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_WRITABLE_FEATURE
--
-- A proxy to the feature itself, which must be an attribute.
--
-- See also LIBERTY_FEATURE_ENTITY
--

inherit
	LIBERTY_WRITABLE

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	name: FIXED_STRING is
		do
			Result := entity.name
		end

	result_type: LIBERTY_TYPE is
		do
			Result := entity.result_type
		end

	is_result_type_set: BOOLEAN is
		do
			Result := entity.is_result_type_set
		end

feature {}
	entity: LIBERTY_FEATURE_ENTITY

	make (a_entity: like entity) is
		require
			a_entity /= Void
		do
			entity := a_entity
		ensure
			entity = a_entity
		end

invariant
	entity /= Void

end
