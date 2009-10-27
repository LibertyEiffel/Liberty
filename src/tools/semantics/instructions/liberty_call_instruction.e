-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_CALL_INSTRUCTION

inherit
	LIBERTY_INSTRUCTION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	target: LIBERTY_EXPRESSION
	feature_entity: LIBERTY_FEATURE_ENTITY
	feature_arguments: TRAVERSABLE[LIBERTY_EXPRESSION]

feature {}
	make (a_target: like target; a_feature_entity: like feature_entity; a_feature_arguments: like feature_arguments) is
		require
			a_target /= Void
			a_feature_entity /= Void
			a_feature_arguments /= Void
		do
			target := a_target
			feature_entity := a_feature_entity
			feature_arguments := a_feature_entity
		ensure
			target = a_target
			feature_entity = a_feature_entity
			feature_arguments = a_feature_entity
		end

invariant
	target /= Void
	feature_entity /= Void
	feature_arguments /= Void

end
