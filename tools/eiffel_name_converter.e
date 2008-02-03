deferred class EIFFEL_NAME_CONVERTER

feature -- Auxiliary features
	eiffel_class_file_name (a_name: STRING): STRING is
			-- `a_name' converted into a proper Eiffel class name
			-- file, i.e. "GTK_BUTTON" is turned into "gtk_button.e"
		do
			Result := eiffel_class_name(a_name).as_lower
			Result.append(once ".e")
		end

	eiffel_class_name (a_name: STRING): STRING is
			-- Translate `a_name' from CamelCase into CAMEL_CASE
		do
			create Result.copy(a_name)
			eiffellizer.substitute_all_in(Result)
			Result.to_upper
		end
	
	eiffellizer: REGULAR_EXPRESSION is
			-- Translate CamelCase into Camel_Case
		local builder: REGULAR_EXPRESSION_BUILDER
		once
			Result := builder.convert_perl_pattern("\B([A-Z])")
			Result.prepare_substitution("_\1")
		end

	is_public (a_name: STRING): BOOLEAN is
			-- Does `a_name' not have underscores '_' prefixed?
		require 
			not_void: a_name/=Void
			meaningful_length: a_name.count>1
		do
			Result := not (a_name@1).is_equal('_')
		end

	adapted_name (a_name: STRING): STRING is
			-- 
		do
			-- TODO: make it general. A valid identifier for an eventual
			-- Eiffel feature with `a_name'. Can be either `a_name'
			-- itself or a new string containing an adapatation. Reserved
			-- words are "escaped"
			if keywords.has(a_name) then Result:=a_name+(once "_external")
			else Result:=a_name
			end
		end
	keywords: ARRAY[STRING] is
		once
			Result:=<<"indexing",
						 "class", "deferred", "expanded", "separate", "end",
						 "inherit", "insert", "creation", "feature",
						 "rename","redefine","undefine","select","export",
						 "require","local","deferred","do","once","ensure","alias","external","attribute",
						 "if", "then", "else", "elseif", "when", "from", "until", "loop",
						 "check", "debug", "invariant", "variant",
						 "rescue", "obsolete"
						 >>
		end

end
