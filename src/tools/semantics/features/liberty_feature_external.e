class LIBERTY_FEATURE_EXTERNAL

inherit
	LIBERTY_FEATURE
		rename
			make as make_late_binding
		end

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	external_def: STRING
	alias_def: STRING

feature {}
	make (a_external, a_alias: STRING) is
		require
			a_external /= Void
		do
			make_late_binding
			external_def := a_external
			alias_def := a_alias
		ensure
			external_def = a_external
			alias_def = a_alias
		end

invariant
	external_def /= Void

end
