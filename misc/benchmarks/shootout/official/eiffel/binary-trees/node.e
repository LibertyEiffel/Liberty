class NODE

create {ANY}
	make

feature {ANY}
	value: INTEGER

	left, right: NODE

	test: INTEGER
		do
			Result := value
			if left /= Void then
				Result := Result + left.test - right.test
			end
		end

	make (v: INTEGER; l, r: NODE)
		do
			value := v
			left := l
			right := r
		end

end -- class NODE
