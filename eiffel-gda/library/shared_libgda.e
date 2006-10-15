indexing
	description: "LIBGDA singelton"
	copyright: "(C) 2006 Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
	details: "This class provides the singleton instance."

deferred class SHARED_LIBGDA

feature {} -- singleton memory
	libgda: LIBGDA is
		once
			create Result.make
		ensure
			blubb: Result /= Void
		end
end
