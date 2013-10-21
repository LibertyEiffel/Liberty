expanded class PROLOG_FUNCTOR

insert
   COMPARABLE
   HASHABLE

feature {ANY}
   name: PROLOG_ATOM

   arity: INTEGER

   infix "<" (other: like Current): BOOLEAN is
      do
         Result := name < other.name
         if not Result and not other.name < name then
            Result := arity < other.arity
         end
      end

   hash_code: INTEGER is
      do
         Result := (name.hash_code * arity) & 0x7FFFFFFF
      end

end -- class PROLOG_FUNCTOR
