class LIBERTY_FEATURE_DEFINITION

inherit
	LIBERTY_ENTITY

creation {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	name: LIBERTY_FEATURE_NAME
	clients: TRAVERSABLE[LIBERTY_TYPE]
	is_frozen: BOOLEAN
	the_feature: LIBERTY_FEATURE

	is_regular: BOOLEAN is
		do
			Result := name.is_regular
		end

	is_prefix: BOOLEAN is
		do
			Result := name.is_prefix
		end

	is_infix: BOOLEAN is
		do
			Result := name.is_infix
		end

	set_the_feature (a_feature: like the_feature) is
		require
			a_feature /= Void
		do
			the_feature := a_feature
		ensure
			the_feature = a_feature
		end

feature {LIBERTY_TYPE_BUILDER}
	set_name (a_name: like name) is
		require
			a_name /= Void
		do
			name := a_name
		ensure
			name = a_name
		end

	set_clients (a_clients: like clients) is
		require
			a_clients /= Void
		do
			clients := a_clients
		ensure
			clients = a_clients
		end

feature {}
	make (a_name: like name; a_clients: like clients; a_frozen: like is_frozen) is
		require
			a_name /= Void
			a_clients /= Void
		do
			name := a_name
			clients := a_clients
			is_frozen := a_frozen
		ensure
			name = a_name
			clients = a_clients
			is_frozen = a_frozen
		end

invariant
	name /= Void
	clients /= Void

end
