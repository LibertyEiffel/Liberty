class SETTINGS 

inherit SINGLETON 

creation default_create

feature -- Queries
	global: BOOLEAN
	verbose: BOOLEAN
	directory: STRING
	are_naturals_used: BOOLEAN

feature -- Setters
	set_verbose (a_value: BOOLEAN) is do verbose := a_value end
	set_global (a_value: BOOLEAN) is do global := a_value end
	set_directory (a_directory: STRING) is do directory := a_directory end
	
	use_naturals is do are_naturals_used:=True end
	use_integers is do are_naturals_used:=False end
end
