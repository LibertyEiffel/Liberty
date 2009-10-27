-- Copyright (C) 2009 Cyril ADRIAN
--
deferred class LIBERTY_CALL

feature {ANY}
	target: LIBERTY_EXPRESSION
	entity: LIBERTY_FEATURE_ENTITY
	actuals: TRAVERSABLE[LIBERTY_EXPRESSION]

	is_implicit_current: BOOLEAN is
		do
			Result := target = Void
		end

feature {}
	make (a_target: like target; a_entity: like entity; a_actuals: like actuals) is
		require
			a_target /= Void
			a_entity /= Void
			a_actuals /= Void
		do
			target := a_target
			entity := a_entity
			actuals := a_actuals
		ensure
			target = a_target
			entity = a_entity
			actuals = a_actuals
		end

	implicit_current (a_entity: like entity; a_actuals: like actuals) is
		require
			a_entity /= Void
			a_actuals /= Void
		do
			entity := a_entity
			actuals := a_actuals
		ensure
			is_implicit_current
			entity = a_entity
			actuals = a_actuals
		end

invariant
	entity /= Void
	actuals /= Void

end
