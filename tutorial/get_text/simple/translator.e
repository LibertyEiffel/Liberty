class TRANSLATOR

inherit
	GNU_GET_TEXT
		rename
			init_in_current_working_directory as init
		end

creation
	init

feature {ANY}
	text_domain: STRING is "simple_example"

end
