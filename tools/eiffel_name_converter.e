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
		local builder: REGULAR_EXPRESSION_BUILDER
		once
			Result := builder.convert_perl_pattern("\B([A-Z])")
			Result.prepare_substitution("_\1")
		end
end
