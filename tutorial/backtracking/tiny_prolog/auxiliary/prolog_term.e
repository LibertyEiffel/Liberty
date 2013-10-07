deferred class PROLOG_TERM

inherit
   PROLOG_COMMONS

feature {ANY}
   type: INTEGER is
      deferred
      ensure
         Result = type_atom or Result = type_integer or Result = type_float or Result = type_var or Result = type_coumpound
      end

   arity: INTEGER is
      do
      end

end -- class PROLOG_TERM
