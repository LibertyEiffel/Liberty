expanded class AUX_OPERATORS
   -- An expanded object full of free operators that actually don't do anything
feature {ANY}
   infix "+" (a: INTEGER): BOOLEAN is do stuff; Result := True end
   infix "-" (a: INTEGER): BOOLEAN is do stuff; Result := True end
   infix "*" (a: INTEGER): BOOLEAN is do stuff; Result := True end
   infix "/" (a: INTEGER): BOOLEAN is do stuff; Result := True end
   infix "|" (a: INTEGER): BOOLEAN is do stuff; Result := True end
   infix "&" (a: INTEGER): BOOLEAN is do stuff; Result := True end

   prefix "+": BOOLEAN is do Result:=True end
   prefix "-": BOOLEAN is do Result:=False end
   prefix "*": BOOLEAN is do stuff; Result := True end
   prefix "#": BOOLEAN is do Result:=True end

   -- The following commented out features are as far as I
   -- know acceptable free operators but are rejected by the
   -- current version of the compiler

   -- infix "§" (a: INTEGER): BOOLEAN is do stuff; Result := True end
   -- infix "<-<" (a: INTEGER): BOOLEAN is do stuff; Result := True end
   --infix ">>" (a: INTEGER): BOOLEAN is do stuff; Result := True end

feature {}
   stuff is
   do
      std_error.put_line(once "something silly")
      -- is better than print(once "something silly%N")
   end
end
