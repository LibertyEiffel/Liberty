class SETTINGS
	-- 
inherit
	SINGLETON

creation {ANY}
	default_create

feature {ANY} -- Queries
	global: BOOLEAN

	verbose: BOOLEAN

	directory: STRING

	are_naturals_used: BOOLEAN

	patches_are_appliable: BOOLEAN

feature {ANY} -- Setters
	set_verbose (a_value: BOOLEAN) is
		do
			verbose := a_value
		end

	set_global (a_value: BOOLEAN) is
		do
			global := a_value
		end

	set_directory (a_directory: STRING) is
		do
			directory := a_directory
		end

	use_naturals is
		do
			are_naturals_used := True
		end

	use_integers is
		do
			are_naturals_used := False
		end

	apply_patches is
		do
			patches_are_appliable := True
		end

	do_not_apply_patches is
		do
			patches_are_appliable:=False
		end
end -- class SETTINGS
