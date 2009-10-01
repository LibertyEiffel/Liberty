class LIBERTY_FEATURE_DEFINITION

inherit
	LIBERTY_ENTITY

creation {LIBERTY_TYPE_BUILDER}
	as_regular, as_prefix, as_infix

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

	obsolete_message: STRING

	is_obsolete: BOOLEAN is
		do
			Result := obsolete_message /= Void
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
	common_make (a_name: like name; a_clients: like clients; a_frozen: like is_frozen) is
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

	as_regular (a_name: STRING; a_clients: like clients; a_frozen: like is_frozen) is
		require
			a_name /= Void
			a_clients /= Void
		do
			common_make(create {LIBERTY_FEATURE_NAME}.make_regular(a_name), a_clients, a_frozen)
		ensure
			is_regular
			name.is_equal(a_name)
			clients = a_clientd
			is_frozen = a_frozen
		end

	as_prefix (a_name: STRING; a_clients: like clients; a_frozen: like is_frozen) is
		require
			a_name /= Void
			a_clients /= Void
		do
			common_make(create {LIBERTY_FEATURE_NAME}.make_prefix(a_name), a_clients, a_frozen)
		ensure
			is_prefix
			name.is_equal(a_name)
			clients = a_clients
			is_frozen = a_frozen
		end

	as_infix (a_name: STRIGN; a_clients: like clients) is
		require
			a_name /= Void
			a_clients /= Void
		do
			common_make(create {LIBERTY_FEATURE_NAME}.make_infix(a_name), a_clients, a_frozen)
		ensure
			is_infix
			name.is_equal(a_name)
			clients = a_clients
			is_frozen = a_frozen
		end

	set_obsolete (a_obsolete: like obsolete_message) is
		do
			obsolete_message := a_obsolete
		ensure
			a_obsolete /= Void implies is_obsolete
			obsolete_message = a_obsolete
		end

invariant
	name /= Void
	clients /= Void

end
