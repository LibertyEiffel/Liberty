deferred class MOVABLE_NODE
	-- A node of a GCC-XML file that represent a symbol that may be wrapped in
	-- a class different by those assigned with default rules.

	-- For example function "memcpy" that the standard require to be defined
	-- into <string.h> may be actually defined into another
	-- implementation-dependent file. Gccxml cannot distinguish those cases.
inherit
	NAMED_NODE
	WRAPPABLE_NODE
feature
	actual: WRAPPED_BY_A_CLASS

	set_class (a_class: WRAPPED_BY_A_CLASS) is-- Set `actual' to `a_class'
	do
		actual:=a_class
	end

	on_file (a_name: STRING) is
		-- Set Current to be wrapped as a part of the file with `a_name'; for example "memcpy" in GNU lib C 2.11 is actually defined in /usr/include/bits/string3.h
	local f: C_FILE; i: ITERATOR[C_FILE]
	do
		check 
			not files.is_empty 
		end
		from i := files.new_iterator_on_items; i.start until i.item.

	end

end -- class MOVABLE_NODE
