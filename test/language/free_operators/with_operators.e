expanded class FREE_OPERATORS
   -- An expanded object full of free operators that actually don't do anything
feature {ANY}
   -- The following commented out features are as far as I
   -- know acceptable free operators but are rejected by the
   -- current version of the compiler

   -- infix "§" (a: INTEGER): BOOLEAN is do stuff; Result := True end
   infix "<-<" (a: INTEGER): BOOLEAN is do stuff; Result := True end
   infix "->" (a: INTEGER): BOOLEAN is do stuff; Result := True end
   infix ">>" (a: INTEGER): BOOLEAN is do stuff; Result := True end
   infix "<<" (a: INTEGER): BOOLEAN is do stuff; Result := True end
feature {}
   stuff is
   do
      std_error.put_line(once "something silly%N")
   end
end
