class CLEANUP

inherit DISPOSABLE

create {ANY} make

feature {ANY}
	make(a_cleaner: PROCEDURE[TUPLE]) is
		require
			a_cleaner /= Void
		do
			cleaner := a_cleaner
		end

	dispose is
		do
			cleaner.call([])
		end
feature {}
	cleaner: PROCEDURE[TUPLE]
end
