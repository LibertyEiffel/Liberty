class LIBERTY_WRITABLE_LOCAL

inherit
	LIBERTY_WRITABLE

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	name: FIXED_STRING is
		do
			Result := the_local.name
		end

	result_type: LIBERTY_TYPE is
		do
			Result := the_local.result_type
		end

	is_result_type_set: BOOLEAN is True

feature {}
	the_local: LIBERTY_LOCAL

	make (a_local: like the_local) is
		require
			a_local /= Void
		do
			the_local := a_local
		ensure
			the_local = local
		end

end
