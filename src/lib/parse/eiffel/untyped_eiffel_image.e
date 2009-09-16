class UNTYPED_EIFFEL_IMAGE

inherit
	EIFFEL_IMAGE

creation {EIFFEL_GRAMMAR}
	make

feature {}
	make (a_image: like image; a_blanks: like blanks; a_position: like position) is
		require
			a_image /= Void
		do
			image := a_image
			blanks := a_blanks
			position := a_position
		ensure
			image = a_image
			blanks = a_blanks
			position = a_position
		end

end
