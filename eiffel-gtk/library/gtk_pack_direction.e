indexing
	description: "Enum GtkPackDirection"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_PACK_DIRECTION
feature  -- enum
	is_valid_direction (a_direction :INTEGER): BOOLEAN is
		do	
			Result:=(True) -- TODO:
		end


-- 	GTK_PACK_DIRECTION_LTR,
-- 	GTK_PACK_DIRECTION_RTL,
-- 	GTK_PACK_DIRECTION_TTB,
-- 	GTK_PACK_DIRECTION_BTT

end
