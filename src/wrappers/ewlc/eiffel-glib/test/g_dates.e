class G_DATES
inherit 
	G_LIST[G_DATE]
   
create {ANY} make, copy

feature {WRAPPER,WRAPPER_HANDLER} -- Implementation
	wrapper (a_pointer: POINTER): G_DATE is
      do
         if wrappers.fast_has(a_pointer) then
            Result ?= wrappers.at(a_pointer)
         end
         if Result = Void then
            Result := create {G_DATE}.from_external_pointer(a_pointer)
         end
		end
end
