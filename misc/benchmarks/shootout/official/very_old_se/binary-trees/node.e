class NODE

creation {ANY}
	make

feature {ANY}
	value: INTEGER

	left, right: NODE

	test: INTEGER is
		do
			Result := value
			if left /= Void then
				Result := Result + left.test - right.test
			end
		end

	make (v: INTEGER; l, r: NODE) is
		do
			value := v
			left := l
			right := r
		end

end -- class NODE
