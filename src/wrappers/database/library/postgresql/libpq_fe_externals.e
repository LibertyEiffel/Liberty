note
   description:
      "This is a stub to make eiffel tools happy"

deferred class LIBPQ_FE_EXTERNALS

feature {ANY}
   pqconnectdb (Some: POINTER): POINTER
      deferred
      end

   pqfinish (Some: POINTER)
      deferred
      end

   pqreset (Some: POINTER)
      deferred
      end

end -- class LIBPQ_FE_EXTERNALS
