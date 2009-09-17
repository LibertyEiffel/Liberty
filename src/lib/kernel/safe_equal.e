expanded class SAFE_EQUAL[E_]
	--
	-- The goal of this class is to share the definition of the feature `safe_equal'.
	-- The feature `safe_equal' compares two arguments of type E_, by calling `is_equal' only if
	-- both arguments have the `same_dynamic_type'.
	--

insert
	ANY

feature {ANY}
	test, safe_equal (e1, e2: E_): BOOLEAN is
			-- In order to avoid run-time type errors, feature `safe_equal' calls `is_equal' only when 
			-- `e1' and `e2' have exactly the same dynamic type.
		local
			e_type: E_
		do
			-- Note: the following implementation may appear complicated, but this is 
			-- automatically optimized by the compiler.
			if e1 = e2 then
				Result := True
			elseif e1 = Void then
			elseif e2 = Void then
			elseif e_type = Void then
				if e1.same_dynamic_type(e2) then
					Result := e1.is_equal(e2)
				end
			end
		end

end -- class SAFE_EQUAL
