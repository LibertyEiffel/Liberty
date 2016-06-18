class POSTGRESQL_EXAMPLE

create {ANY}  make

feature {ANY} 
	make
		do
			create database.connect ("dbname=test")
		end

	database: POSTGRESQL_DATABASE
end
