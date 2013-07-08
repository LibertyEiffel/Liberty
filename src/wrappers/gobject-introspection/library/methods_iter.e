expanded class METHODS_ITER
	-- Expanded iterator over methods of a GI_CLASS
insert COMMON_ITER[GI_FUNCTION_INFO]
feature {ANY}
	start is
		do
		end

	item: GI_FUNCTION_INFO is
		do
			Result:=gi_class.method(i)
		end

end -- class METHODS_ITER


