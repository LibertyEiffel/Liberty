note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class QUARK_EXAMPLE

create {ANY} make
feature {ANY}
	quark, another, unexisting: G_QUARK
	make is
		do
			create quark.from_string (once "Ciccio")
			create another.from_string (once "Ciccio")
			
			(once "Quark for string `").print_on(std_output)
			quark.to_string.print_on(std_output)
			(once "' is ").print_on(std_output)
			quark.quark.print_on(std_output)
			(once "%N").print_on(std_output)

			(once "Also the different string `").print_on(std_output)
			another.to_string.print_on(std_output)
			(once "' has quark ").print_on(std_output)
			another.quark.print_on(std_output)
			(once "%N").print_on(std_output)

			(once "While string `Bombolo' ").print_on(std_output)
			create unexisting.try_string (once "Bombolo")
			if unexisting.is_valid then
				(once " has a quark! Something's wrong!%N").print_on(std_output)
			else
				(once " doesn't have a quark (correctly)%N").print_on(std_output)
			end
		end
end	
				
