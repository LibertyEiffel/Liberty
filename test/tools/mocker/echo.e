deferred class ECHO

feature {ANY}
   ping
      deferred
      end

   echo (something: STRING): STRING
      require
         something /= Void
      deferred
      ensure
         Result.is_equal(something)
      end

end -- class ECHO
