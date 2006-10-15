indexing
	description: "GDA_CONFIG singelton"
	copyright: "(C) 2006 Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
	details: "This class provides the singleton instance."

deferred class SHARED_GDA_CONFIG

feature {} -- singleton memory
	gda_config: GDA_CONFIG is
		once
			create Result.make
		end
end
