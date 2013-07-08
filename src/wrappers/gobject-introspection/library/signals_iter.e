expanded class SIGNALS_ITER
	-- An expanded iterator over properties of a GI_CLASS
insert ITERATOR[GI_PROPERTY_INFO]
feature {GI_CLASS}
	set_class (a_class: GI_CLASS) is
		require a_class/=Void
		do
			gi_class:=a_class
		end

feature {ANY}
	start is
		require set: gi_class/=Void
		do
			i:=gi_class.signals_lower
		end
	is_off: BOOLEAN is
		require set: gi_class/=Void
		do
			Result:=i>gi_class.signals_upper
		end

		item: GI_PROPERTY_INFO is 
		require set: gi_class/=Void
	do 
		Result:=gi_class.signal(i)
	end

	next is
		require set: gi_class/=Void
		do
			i:=i+1
		end

feature {GI_CLASS} -- Implementation
	gi_class: GI_CLASS
	i: INTEGER
end -- class SIGNALS_ITER

