class POSTGRESQL_EXAMPLE

creation dummy, make

feature 
	make is
		do
			create database.connect ("dbname=test")
		end

	database: POSTGRESQL_DATABASE
end
