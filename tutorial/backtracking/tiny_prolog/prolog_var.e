class PROLOG_VAR
inherit PROLOG_TERM
feature
	type: INTEGER is
		do
			if value = Void then
				Result = type_var
			else
				Result = value.type
			end
		end
	deref: PROLOG_TERM is 
		do
			if value = Void then
				Result := Current
			else
				Result := value
			end	
		end
	value: PROLOG_TERM
end
