class POSTGRESQL_EXAMPLE

creation  make

feature {ANY} 
	make is
		do
			create database.connect ("dbname=test")
		end

	database: POSTGRESQL_DATABASE
end
