class G_DATES
inherit 
	G_LIST[G_DATE]
   
creation make, copy

feature {WRAPPER,WRAPPER_HANDLER} -- Implementation
	wrapper (a_pointer: POINTER): G_DATE is
      do
         if cache.fast_has(a_pointer) then
            Result ?= cache.at(a_pointer)
         end
         if Result = Void then
            Result := create {G_DATE}.from_external_pointer(a_pointer)
            cache.put(Result, a_pointer)
         end
		end
   
feature {WRAPPER,WRAPPER_HANDLER}
   cache: HASHED_DICTIONARY [GLOBALLY_CACHED, POINTER] is
      local
         date: G_DATE
      once
         -- TODO: this is a hack
         create date.make
         Result := date.wrappers
      end
end
