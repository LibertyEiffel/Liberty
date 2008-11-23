class TEST_GLIST00 

inherit EIFFELTEST_TOOLS

creation make 

feature 
	make is
		local other_dates: G_LIST[G_DATE]
		do
			create {G_DATES} dates.make
			dates.add_last(create {G_DATE}.make_dmy(10,7,1976))
			dates.add_last(create {G_DATE}.make_dmy(11,9,2001))
			assert (dates.first = dates.first)
			assert (dates.item(2) = dates.item(2))
			
			create {G_DATES}other_dates.copy(dates)
			assert (other_dates.first = dates.first)
		end

	dates: G_DATES
end
