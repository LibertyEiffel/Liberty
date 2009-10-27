-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_ASSERTION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	tag: FIXED_STRING
	assertion: LIBERTY_EXPRESSION

feature {}
	make (a_tag: like tag; a_assertion: like assertion) is
		do
			tag := a_tag
			assertion := a_assertion
		ensure
			tag = a_tag
			assertion = a_assertion
		end

end
