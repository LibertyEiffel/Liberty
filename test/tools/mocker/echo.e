deferred class ECHO

feature {ANY}
   ping is
      deferred
      end

   echo (something: STRING): STRING is
      require
         something /= Void
      deferred
      ensure
         Result.is_equal(something)
      end

end -- class ECHO
