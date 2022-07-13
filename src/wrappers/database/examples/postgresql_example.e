class POSTGRESQL_EXAMPLE

create {ANY}
   make

feature {ANY}
   make
      do
         create database.connect("dbname=test")
      rescue
         if database/=Void and then database.is_connected then
            print("Postgresql example: database connected but some other error occurred%N")
         else
            print("Postgresql example: can't connect to database 'test'. Please wait for next release of Liberty Eiffel%N")
         end
      end

   database: POSTGRESQL_DATABASE

end -- class POSTGRESQL_EXAMPLE
