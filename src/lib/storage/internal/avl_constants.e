deferred class AVL_CONSTANTS

insert
	ANY
		undefine out_in_tagged_out_memory, copy, is_equal
		end

feature {}
	balanced: INTEGER is 0

	imbalanced_left: INTEGER is -1

	imbalanced_right: INTEGER is 1

end -- class AVL_CONSTANTS
