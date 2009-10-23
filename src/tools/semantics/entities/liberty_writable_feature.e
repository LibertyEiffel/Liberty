class LIBERTY_WRITABLE_FEATURE

inherit
	LIBERTY_WRITABLE

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	name: FIXED_STRING

	result_type: LIBERTY_TYPE is
		do
			Result := the_feature.result_type
		end

	is_result_type_set: BOOLEAN is
		do
			Result := the_feature /= Void
		end

feature {LIBERTY_TYPE_BUILDER}
	set_feature (a_feature: like the_feature) is
		require
			a_feature.result_type /= Void
		do
			the_feature := a_feature
		ensure
			the_feature = a_feature
			is_result_type_set
		end

feature {}
	the_feature: LIBERTY_FEATURE

	make (a_name: like name) is
		require
			a_name /= Void
		do
			name := a_name
		ensure
			name = a_name
		end

end
