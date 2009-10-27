-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_CREATION_INSTRUCTION

inherit
	LIBERTY_INSTRUCTION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	writable: LIBERTY_WRITABLE
	type: LIBERTY_TYPE
	feature_entity: LIBERTY_FEATURE_ENTITY
	feature_arguments: TRAVERSABLE[LIBERTY_EXPRESSION]

feature {}
	make (a_writable: like writable; a_type: like type; a_feature_entity: like feature_entity; a_feature_arguments: like feature_arguments) is
		require
			a_writable /= Void
			a_type /= Void
			a_feature_entity /= Void
			a_feature_arguments /= Void
		do
			writable := a_writable
			type := a_type
			feature_entity := a_feature_entity
			feature_arguments := a_feature_entity
		ensure
			writable = a_writable
			type = a_type
			feature_entity = a_feature_entity
			feature_arguments = a_feature_entity
		end

invariant
	writable /= Void
	type /= Void
	feature_entity /= Void
	feature_arguments /= Void

end
