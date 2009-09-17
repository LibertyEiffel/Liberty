expanded class XML_NAMESPACES
	--
	-- Known namespace actions
	--
feature {}
	namespace_actions: HASHED_DICTIONARY[PROCEDURE[TUPLE[XMLNS_PARSER, UNICODE_STRING]], UNICODE_STRING] is
		once
			create Result.make
		end

feature {ANY}
	register_namespace_action (a_namespace: UNICODE_STRING; a_action: PROCEDURE[TUPLE[XMLNS_PARSER, UNICODE_STRING]]) is
		do
			namespace_actions.put(a_action, a_namespace)
		end

end -- class XML_NAMESPACES
