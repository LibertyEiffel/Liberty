class LIBERTY_FEATURE_DEFINITION

inherit
	LIBERTY_ENTITY
		redefine
			copy
		end

creation {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	feature_name: LIBERTY_FEATURE_NAME
	clients: TRAVERSABLE[LIBERTY_TYPE]
	is_frozen: BOOLEAN
	the_feature: LIBERTY_FEATURE

	name: FIXED_STRING is
		do
			Result := feature_name.name
		end

	is_regular: BOOLEAN is
		do
			Result := feature_name.is_regular
		end

	is_prefix: BOOLEAN is
		do
			Result := feature_name.is_prefix
		end

	is_infix: BOOLEAN is
		do
			Result := feature_name.is_infix
		end

	result_type: LIBERTY_TYPE is
		do
			Result := the_feature.result_type
		end

	copy (other: like Current) is
		do
			feature_name := other.feature_name
			clients := other.clients.twin
			is_frozen := other.is_frozen
			the_feature := other.the_feature
		end

	is_result_type_set: BOOLEAN is
		do
			Result := the_feature /= Void
		end

feature {LIBERTY_TYPE_BUILDER}
	set_name (a_name: like feature_name) is
		require
			a_name /= Void
		do
			feature_name := a_name
		ensure
			feature_name = a_name
		end

	set_clients (a_clients: like clients) is
		require
			a_clients /= Void
		do
			clients := a_clients
		ensure
			clients = a_clients
		end

	set_the_feature (a_feature: like the_feature) is
		require
			a_feature /= Void
		do
			the_feature := a_feature
		ensure
			the_feature = a_feature
			is_result_type_set
		end

feature {}
	make (a_name: like feature_name; a_clients: like clients; a_frozen: like is_frozen) is
		require
			a_name /= Void
			a_clients /= Void
		do
			feature_name := a_name
			clients := a_clients
			is_frozen := a_frozen
		ensure
			feature_name = a_name
			clients = a_clients
			is_frozen = a_frozen
		end

invariant
	feature_name /= Void
	clients /= Void

end
