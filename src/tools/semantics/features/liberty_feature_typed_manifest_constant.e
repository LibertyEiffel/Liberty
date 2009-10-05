class LIBERTY_FEATURE_TYPED_MANIFEST_CONSTANT[E_]

inherit
	LIBERTY_FEATURE_CONSTANT

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	manifest: E_

feature {}
	make (a_type: like result_type; a_manifest: like manifest) is
		require
			a_type /= Void
		do
			result_type := type
			manifest := a_manifest
		ensure
			result_type = a_type
			manifest = a_manifest
		end

invariant
	result_type /= Void

end
