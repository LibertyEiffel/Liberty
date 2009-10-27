-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_STRING_MANIFEST

inherit
	LIBERTY_TYPED_MANIFEST[STRING]
		rename
			make as typed_make
		end

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	is_once: BOOLEAN

feature {}
	make (a_type: like result_type; a_manifest: like manifest; a_once: like is_once) is
		require
			a_type /= Void
		do
			typed_make(a_type, a_manifest)
			is_once := a_once
		ensure
			result_type = a_type
			manifest = a_manifest
			is_once = a_once
		end

invariant
	result_type /= Void

end
