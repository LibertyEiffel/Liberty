expanded class COUNT
  -- An expanded counter-like object that can be comfortably compared 
  -- to integers.

insert COUNTER

feature 
	set (an_integer: INTEGER) is
		-- Set `value' to `an_integer'
		do
			value:=an_integer
		end

	inc is 
	do
		increment
	end

	infix "<" (an_integer: INTEGER): BOOLEAN is
		do
			Result := value<an_integer
		end

	infix "<=" (an_integer: INTEGER): BOOLEAN is
		do
			Result := value<=an_integer
		end

	infix ">" (an_integer: INTEGER): BOOLEAN is
		do
			Result := value>an_integer
		end

	infix ">=" (an_integer: INTEGER): BOOLEAN is
		do
			Result := value>=an_integer
		end
end
