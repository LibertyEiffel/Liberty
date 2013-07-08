expanded class PREREQUISITES_ITERATOR
insert ITERATOR[GI_BASE_INFO]

creation {GI_INTERFACE_INFO} default_create

feature {}
	from_interface (an_interface: GI_INTERFACE_INFO) is
	do
		interface:=an_interface
	end

feature {ANY}
	start is
	do
		i:=interface.prerequisites_lower
      end

   is_off: BOOLEAN is
	  do
		  Result := i>interface.prerequisites_upper
      end

   item: GI_BASE_INFO is
	do
		Result:=interface.prerequisite(i)
      end

	  next is do
	  i:=i+1
      end
feature {} -- Implementation
	interface: GI_INTERFACE_INFO
	i: INTEGER
end


